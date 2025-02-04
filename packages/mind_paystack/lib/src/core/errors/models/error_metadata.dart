import 'package:freezed_annotation/freezed_annotation.dart';
part 'error_metadata.freezed.dart';
part 'error_metadata.g.dart';

/// Model to represent error metadata
@freezed
class ErrorMetadata with _$ErrorMetadata {
  const factory ErrorMetadata({
    /// Timestamp when the error occurred
    required DateTime timestamp,

    /// Request ID if available
    String? requestId,

    /// HTTP status code if applicable
    int? statusCode,

    /// HTTP method if applicable
    String? httpMethod,

    /// URL that caused the error
    String? url,

    /// Headers associated with the request
    Map<String, List<String>>? headers,

    /// Any additional context about the error
    Map<String, dynamic>? context,

    /// Stack trace as string
    String? stackTrace,

    /// Original error object stringified
    String? originalError,
  }) = _ErrorMetadata;

  factory ErrorMetadata.fromJson(Map<String, dynamic> json) =>
      _$ErrorMetadataFromJson(json);
}
