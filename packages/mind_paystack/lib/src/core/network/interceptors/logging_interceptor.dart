import 'package:dio/dio.dart';
import 'package:mind_paystack/src/config/log_level.dart';
import 'package:mind_paystack/src/utils/logger.dart';

/// Interceptor that handles request and response logging
class LoggingInterceptor extends Interceptor {
  LoggingInterceptor(this._logLevel);

  final LogLevel _logLevel;
  static const _maxBodyLength = 1000;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    if (_logLevel.index >= LogLevel.debug.index) {
      final timestamp = DateTime.now().toIso8601String();
      MPLogger.debug('-> ${options.method} ${options.uri} [$timestamp]');
      _logHeaders(options.headers, '->');
      _logBody(options.data, '->');
    }
    handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    if (_logLevel.index >= LogLevel.debug.index) {
      final requestTime = response.requestOptions.extra['requestTime'] as int?;
      final duration = requestTime != null
          ? DateTime.now().millisecondsSinceEpoch - requestTime
          : null;

      MPLogger.debug(
        '<- ${response.statusCode} ${response.requestOptions.uri}'
        '${duration != null ? ' (${duration}ms)' : ''}',
      );
      _logHeaders(response.headers.map, '<-');
      _logBody(response.data, '<-');
    }
    handler.next(response);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    if (_logLevel.index >= LogLevel.error.index) {
      final requestTime = err.requestOptions.extra['requestTime'] as int?;
      final duration = requestTime != null
          ? DateTime.now().millisecondsSinceEpoch - requestTime
          : null;

      MPLogger.error(
        '!! ${err.response?.statusCode ?? 'ERROR'} ${err.requestOptions.uri}'
        '${duration != null ? ' (${duration}ms)' : ''}\n'
        'Error: ${err.message}',
      );

      if (err.response != null) {
        _logHeaders(err.response?.headers.map, '!!');
        _logBody(err.response?.data, '!!');
      }
    }
    handler.next(err);
  }

  void _logHeaders(Map<String, dynamic>? headers, String prefix) {
    if (headers?.isNotEmpty ?? false) {
      MPLogger.debug('$prefix Headers:');
      headers!.forEach((key, value) {
        if (key.toLowerCase() != 'authorization') {
          MPLogger.debug('$prefix   $key: $value');
        } else {
          MPLogger.debug('$prefix   $key: [REDACTED]');
        }
      });
    }
  }

  void _logBody(dynamic data, String prefix) {
    if (data != null) {
      String message;

      if (data is Map || data is List) {
        message = data.toString();
      } else {
        message = data.toString();
      }

      if (message.length > _maxBodyLength) {
        message = '${message.substring(0, _maxBodyLength)}... (truncated)';
      }

      MPLogger.debug('$prefix Body: $message');
    }
  }
}
