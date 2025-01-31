import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mind_paystack/src/core/errors/enums/error_category.dart';
import 'package:mind_paystack/src/core/errors/enums/error_source.dart';
import 'package:mind_paystack/src/core/errors/enums/exception_severity.dart';
import 'package:mind_paystack/src/core/errors/models/error_metadata.dart';
import 'package:mind_paystack/src/core/errors/models/validation_error.dart';

part 'mind_exception.freezed.dart';
part 'mind_exception.g.dart';

/// Main exception class for the Mind SDK
@freezed
class MindException with _$MindException implements Exception {
  const factory MindException({
    /// Main error message
    required String message,

    /// Unique error code
    required String code,

    /// Error category
    @Default(ErrorCategory.unknown) ErrorCategory category,

    /// Error severity
    @Default(ExceptionSeverity.error) ExceptionSeverity severity,

    /// Source of the error
    @Default(ErrorSource.sdk) ErrorSource source,

    /// Technical description for developers
    String? technicalMessage,

    /// User-friendly message that can be shown to end users
    String? userMessage,

    /// Suggested resolution steps
    List<String>? resolutionSteps,

    /// Related documentation URL
    String? documentationUrl,

    /// Support contact information
    String? supportContact,

    /// List of validation errors if applicable
    List<ValidationError>? validationErrors,

    /// Additional error metadata
    ErrorMetadata? metadata,

    /// Whether the error is retriable
    @Default(false) bool isRetriable,

    /// Suggested retry delay in seconds
    int? suggestedRetryDelaySeconds,
  }) = _MindException;
  const MindException._();

  factory MindException.fromJson(Map<String, dynamic> json) =>
      _$MindExceptionFromJson(json);

  /// Creates an exception from a DioError
  factory MindException.fromDioError(DioError error) {
    final response = error.response;
    final data = response?.data;

    // Try to parse Paystack error format
    if (data != null && data is Map<String, dynamic>) {
      return MindException(
        message: data['message']?.toString() ?? 'Unknown API error',
        code: 'api_error',
        category: ErrorCategory.network,
        source: ErrorSource.api,
        technicalMessage: error.message,
        metadata: ErrorMetadata(
          timestamp: DateTime.now(),
          requestId: response?.headers.value('x-request-id'),
          statusCode: response?.statusCode,
          httpMethod: error.requestOptions.method,
          url: error.requestOptions.path,
          headers: response?.headers.map,
          originalError: error.toString(),
          stackTrace: error.stackTrace?.toString(),
        ),
        isRetriable: _isRetriableHttpStatus(response?.statusCode),
        suggestedRetryDelaySeconds: _getSuggestedRetryDelay(response),
      );
    }

    // Handle network errors
    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        error.type == DioExceptionType.receiveTimeout) {
      return MindException(
        message: 'Network timeout error',
        code: 'network_timeout',
        category: ErrorCategory.network,
        source: ErrorSource.system,
        technicalMessage: error.message,
        isRetriable: true,
        suggestedRetryDelaySeconds: 5,
        metadata: ErrorMetadata(
          timestamp: DateTime.now(),
          originalError: error.toString(),
          stackTrace: error.stackTrace?.toString(),
        ),
      );
    }

    // Default error
    return MindException(
      message: 'Network request failed',
      code: 'network_error',
      category: ErrorCategory.network,
      source: ErrorSource.system,
      technicalMessage: error.message,
      metadata: ErrorMetadata(
        timestamp: DateTime.now(),
        originalError: error.toString(),
        stackTrace: error.stackTrace?.toString(),
      ),
    );
  }

  /// Creates a validation exception
  factory MindException.validation({
    required String message,
    required List<ValidationError> errors,
  }) {
    return MindException(
      message: message,
      code: 'validation_error',
      category: ErrorCategory.validation,
      source: ErrorSource.user,
      validationErrors: errors,
      metadata: ErrorMetadata(
        timestamp: DateTime.now(),
      ),
    );
  }

  /// Creates an authentication exception
  factory MindException.authentication({
    required String message,
    String? technicalMessage,
  }) {
    return MindException(
      message: message,
      code: 'authentication_error',
      category: ErrorCategory.authentication,
      source: ErrorSource.api,
      technicalMessage: technicalMessage,
      metadata: ErrorMetadata(
        timestamp: DateTime.now(),
      ),
    );
  }

  /// Creates a server error exception
  factory MindException.server({
    required String message,
    String? technicalMessage,
  }) {
    return MindException(
      message: message,
      code: 'server_error',
      category: ErrorCategory.server,
      source: ErrorSource.api,
      severity: ExceptionSeverity.fatal,
      technicalMessage: technicalMessage,
      isRetriable: true,
      suggestedRetryDelaySeconds: 30,
      metadata: ErrorMetadata(
        timestamp: DateTime.now(),
      ),
    );
  }

  /// Whether this exception represents a network error
  bool get isNetworkError => category == ErrorCategory.network;

  /// Whether this exception represents an authentication error
  bool get isAuthenticationError => category == ErrorCategory.authentication;

  /// Whether this exception represents a validation error
  bool get isValidationError => category == ErrorCategory.validation;

  /// Whether this exception represents a server error
  bool get isServerError => category == ErrorCategory.server;

  /// Whether this is a fatal error
  bool get isFatal => severity == ExceptionSeverity.fatal;

  /// Gets a user-friendly message that can be displayed
  String get displayMessage => userMessage ?? message;

  /// Gets the error message with technical details if available
  String get detailedMessage {
    if (technicalMessage != null) {
      return '$message\nTechnical details: $technicalMessage';
    }
    return message;
  }

  static bool _isRetriableHttpStatus(int? statusCode) {
    if (statusCode == null) return false;
    return statusCode == 408 || // Request Timeout
        statusCode == 429 || // Too Many Requests
        statusCode >= 500; // Server Errors
  }

  static int? _getSuggestedRetryDelay(Response? response) {
    if (response == null) return null;

    // Check Retry-After header
    final retryAfter = response.headers.value('retry-after');
    if (retryAfter != null) {
      return int.tryParse(retryAfter);
    }

    // Default delays based on status code
    switch (response.statusCode) {
      case 429: // Rate limit
        return 60;
      case 503: // Service unavailable
        return 30;
      default:
        return null;
    }
  }
}
