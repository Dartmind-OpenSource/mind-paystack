import 'package:dio/dio.dart';
import 'package:mind_paystack/src/core/errors/enums/error_category.dart';
import 'package:mind_paystack/src/core/errors/enums/error_source.dart';
import 'package:mind_paystack/src/core/errors/models/error_metadata.dart';
import 'package:mind_paystack/src/core/errors/models/mind_exception.dart';

/// Interceptor that transforms Dio errors into MindExceptions
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Handle different error types
    final mindException = _createMindException(err);

    // Reject with transformed error
    handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        error: mindException,
      ),
    );
  }

  MindException _createMindException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return MindException(
          message: 'Request timeout',
          code: 'network_timeout',
          category: ErrorCategory.network,
          isRetriable: true,
          suggestedRetryDelaySeconds: 5,
          metadata: ErrorMetadata(
            timestamp: DateTime.now(),
            httpMethod: error.requestOptions.method,
            url: error.requestOptions.path,
            originalError: error.toString(),
          ),
        );

      case DioExceptionType.badResponse:
        return _handleResponseError(error);

      default:
        return MindException(
          message: 'Network request failed',
          code: 'network_error',
          category: ErrorCategory.network,
          metadata: ErrorMetadata(
            timestamp: DateTime.now(),
            httpMethod: error.requestOptions.method,
            url: error.requestOptions.path,
            originalError: error.toString(),
          ),
        );
    }
  }

  MindException _handleResponseError(DioError error) {
    final response = error.response;
    final statusCode = response?.statusCode;
    final data = response?.data;

    if (data is Map<String, dynamic>) {
      return MindException(
        message: data['message']?.toString() ?? 'Unknown error',
        code: data['code']?.toString() ?? 'api_error',
        category: _getCategoryFromStatus(statusCode),
        source: ErrorSource.api,
        metadata: ErrorMetadata(
          timestamp: DateTime.now(),
          statusCode: statusCode,
          httpMethod: error.requestOptions.method,
          url: error.requestOptions.path,
          headers: response?.headers.map,
          originalError: error.toString(),
        ),
      );
    }

    return MindException(
      message: 'Request failed with status: ${statusCode ?? "unknown"}',
      code: 'http_${statusCode ?? "unknown"}',
      category: _getCategoryFromStatus(statusCode),
      source: ErrorSource.api,
      metadata: ErrorMetadata(
        timestamp: DateTime.now(),
        statusCode: statusCode,
        httpMethod: error.requestOptions.method,
        url: error.requestOptions.path,
        headers: response?.headers.map,
        originalError: error.toString(),
      ),
    );
  }

  ErrorCategory _getCategoryFromStatus(int? statusCode) {
    if (statusCode == null) return ErrorCategory.unknown;

    if (statusCode == 401 || statusCode == 403) {
      return ErrorCategory.authentication;
    }
    if (statusCode == 422) {
      return ErrorCategory.validation;
    }
    if (statusCode >= 500) {
      return ErrorCategory.server;
    }
    return ErrorCategory.unknown;
  }
}
