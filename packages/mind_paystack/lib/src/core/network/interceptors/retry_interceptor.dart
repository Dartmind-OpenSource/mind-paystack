import 'package:dio/dio.dart';
import 'package:mind_paystack/src/config/retry_policy.dart';
import 'package:mind_paystack/src/utils/logger.dart';

/// Interceptor that handles request retries based on retry policy
class RetryInterceptor extends Interceptor {
  ///
  RetryInterceptor(this._retryPolicy);

  final RetryPolicy _retryPolicy;
  final _rateLimitRemainingHeader = 'x-ratelimit-remaining';

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    // Store original request time
    options.extra['requestTime'] = DateTime.now().millisecondsSinceEpoch;
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    // Check rate limit
    final remaining = int.tryParse(
      response.headers.value(_rateLimitRemainingHeader) ?? '',
    );

    if (remaining != null && remaining < 10) {
      MPLogger.warning(
        'Rate limit warning: $remaining requests remaining',
      );
    }

    handler.next(response);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final attempt = err.requestOptions.extra['attempt'] as int? ?? 1;

    if (!_shouldRetry(err, attempt)) {
      return handler.next(err);
    }

    try {
      MPLogger.info(
        'Retrying request to ${err.requestOptions.uri} '
        '(Attempt $attempt of ${_retryPolicy.maxAttempts})',
      );

      // Calculate and apply backoff delay
      final delay = _retryPolicy.getDelayForAttempt(attempt);
      await Future<void>.delayed(delay);

      // Create new request options with incremented attempt count
      final options = err.requestOptions;
      options.extra['attempt'] = attempt + 1;

      // Retry the request
      final response = await Dio().fetch(options);
      return handler.resolve(response);
    } on DioException catch (retryError) {
      return handler.next(retryError);
    }
  }

  bool _shouldRetry(DioException error, int attempt) {
    // Check max attempts
    if (attempt >= _retryPolicy.maxAttempts) {
      return false;
    }

    // Check if status code is retriable
    final statusCode = error.response?.statusCode;
    if (statusCode != null &&
        !_retryPolicy.retryableStatusCodes.contains(statusCode)) {
      return false;
    }

    // Check request method
    if (!_retryPolicy.retryNonIdempotentRequests &&
        !_isIdempotentRequest(error.requestOptions.method)) {
      return false;
    }

    // Check if it's a timeout or server error
    return error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        (statusCode != null && statusCode >= 500);
  }

  bool _isIdempotentRequest(String method) {
    return ['GET', 'HEAD', 'PUT', 'DELETE', 'OPTIONS', 'TRACE']
        .contains(method.toUpperCase());
  }
}
