import 'package:freezed_annotation/freezed_annotation.dart';
part 'error_metadata.freezed.dart';
part 'error_metadata.g.dart';

/// Contains detailed metadata about an error for debugging and monitoring.
///
/// This model captures comprehensive information about the context in which
/// an error occurred, including request details, timing information, and
/// technical data that can help with debugging and error analysis.
///
/// The metadata is particularly useful for:
/// - Debugging complex payment processing issues
/// - Correlating errors with specific API requests
/// - Analyzing error patterns and trends
/// - Providing support teams with detailed error context
///
/// Example usage:
/// ```dart
/// final metadata = ErrorMetadata(
///   timestamp: DateTime.now(),
///   requestId: 'req_abc123',
///   statusCode: 400,
///   httpMethod: 'POST',
///   url: 'https://api.paystack.co/transaction/initialize',
///   context: {'userId': '12345', 'amount': '50000'},
/// );
/// ```
@freezed
class ErrorMetadata with _$ErrorMetadata {
  ///
  const factory ErrorMetadata({
    /// Timestamp when the error occurred.
    ///
    /// This precise timestamp helps with error correlation, debugging
    /// time-sensitive issues, and analyzing error patterns over time.
    required DateTime timestamp,

    /// Unique identifier for the API request that caused the error.
    ///
    /// This ID can be used to correlate errors with server logs,
    /// track requests across distributed systems, and provide
    /// better support when contacting Paystack.
    String? requestId,

    /// HTTP status code returned by the API (if applicable).
    ///
    /// Provides quick identification of error types:
    /// - 4xx: Client errors (invalid request, authentication, etc.)
    /// - 5xx: Server errors (internal server error, service unavailable)
    int? statusCode,

    /// HTTP method used for the request that failed.
    ///
    /// Examples: 'GET', 'POST', 'PUT', 'DELETE'
    /// Useful for understanding the type of operation that failed.
    String? httpMethod,

    /// Full URL of the API endpoint that caused the error.
    ///
    /// Helps identify which specific API endpoint had issues
    /// and can be used for targeted error handling or monitoring.
    String? url,

    /// HTTP headers that were sent with the failed request.
    ///
    /// May contain authentication headers, content-type,
    /// user-agent, and other metadata. Useful for debugging
    /// API communication issues.
    Map<String, List<String>>? headers,

    /// Additional contextual information about the error.
    ///
    /// This flexible field can contain any relevant data such as:
    /// - User ID or session information
    /// - Transaction amounts or references
    /// - Feature flags or configuration state
    /// - Custom debugging information
    Map<String, dynamic>? context,

    /// Stack trace showing the code path that led to the error.
    ///
    /// Provides detailed information about where the error occurred
    /// in the codebase, useful for debugging and fixing issues.
    /// Usually only populated in development/debug builds.
    String? stackTrace,

    /// String representation of the original error object.
    ///
    /// Contains the raw error data before it was processed into
    /// a MindException. Useful for preserving all original error
    /// information for detailed analysis.
    String? originalError,
  }) = _ErrorMetadata;

  ///
  factory ErrorMetadata.fromJson(Map<String, dynamic> json) =>
      _$ErrorMetadataFromJson(json);
}
