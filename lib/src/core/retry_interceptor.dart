// lib/src/core/retry_interceptor.dart

import 'dart:async';
import 'package:dio/dio.dart';
import 'package:mind_paystack/src/config/retry_policy.dart';

class RetryInterceptor extends Interceptor {
  RetryInterceptor({
    required this.dio,
    required this.retryPolicy,
    this.logger,
  });
  final Dio dio;
  final RetryPolicy retryPolicy;
  final void Function(String message)? logger;
  final _pendingRequests = <String, Completer<void>>{};

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final options = err.requestOptions;
    final requestKey = _getRequestKey(options);

    // Check if we should retry
    if (!_shouldRetry(err)) {
      return handler.next(err);
    }

    // Get current attempt from extra data
    final attempt = (options.extra['attempt'] ?? 0) as int;

    if (attempt >= retryPolicy.maxAttempts) {
      _log('Max retry attempts reached for request: ${options.path}');
      return handler.next(err);
    }

    // Check if request is already being retried
    if (_pendingRequests.containsKey(requestKey)) {
      try {
        await _pendingRequests[requestKey]!.future;
        // Previous retry succeeded, let's retry this one too
        return _retry(err, handler, attempt);
      } catch (_) {
        // Previous retry failed, fail this one too
        return handler.next(err);
      }
    }

    return _retry(err, handler, attempt);
  }

  Future<void> _retry(
    DioException err,
    ErrorInterceptorHandler handler,
    int attempt,
  ) async {
    final options = err.requestOptions;
    final requestKey = _getRequestKey(options);
    final completer = Completer<void>();
    _pendingRequests[requestKey] = completer;

    try {
      // Calculate delay for this attempt
      final delay = retryPolicy.getDelayForAttempt(attempt + 1);

      _log(
          'Retrying request to ${options.path} after ${delay.inMilliseconds}ms '
          '(Attempt ${attempt + 1}/${retryPolicy.maxAttempts})');

      // Wait for delay
      await Future.delayed(delay);

      // Create new request options
      final newOptions = Options(
        method: options.method,
        headers: options.headers,
        extra: {
          ...options.extra,
          'attempt': attempt + 1,
        },
      );

      // Make the retry request
      final response = await dio.request<dynamic>(
        options.path,
        data: options.data,
        queryParameters: options.queryParameters,
        options: newOptions,
      );

      completer.complete();
      handler.resolve(response);
    } catch (e) {
      completer.completeError(e);
      handler.next(err);
    } finally {
      _pendingRequests.remove(requestKey);
    }
  }

  bool _shouldRetry(DioException err) {
    // Don't retry if request was cancelled
    if (err.type == DioExceptionType.cancel) {
      return false;
    }

    // Retry on connection errors
    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.sendTimeout) {
      return true;
    }

    // Retry on server errors
    if (err.response != null) {
      return retryPolicy.retryStatusCodes.contains(err.response!.statusCode);
    }

    // Retry on network errors
    return err.type == DioExceptionType.connectionError;
  }

  String _getRequestKey(RequestOptions options) {
    return '${options.method}:${options.path}';
  }

  void _log(String message) {
    logger?.call(message);
  }

  /// Helper method to get retry attempt from options
  static int getCurrentAttempt(RequestOptions options) {
    return (options.extra['attempt'] ?? 0) as int;
  }

  /// Helper method to check if request can be retried
  static bool canRetry(RequestOptions options, RetryPolicy policy) {
    final attempt = getCurrentAttempt(options);
    return attempt < policy.maxAttempts;
  }
}

/// Extension to add retry functionality to Dio
extension RetryDioExtension on Dio {
  void addRetryPolicy(RetryPolicy policy, {void Function(String)? logger}) {
    interceptors.add(
      RetryInterceptor(
        dio: this,
        retryPolicy: policy,
        logger: logger,
      ),
    );
  }
}
