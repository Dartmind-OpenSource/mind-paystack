import 'package:freezed_annotation/freezed_annotation.dart';
part 'validation_error.freezed.dart';
part 'validation_error.g.dart';

/// Model to represent validation errors
@freezed
class ValidationError with _$ValidationError {
  const factory ValidationError({
    /// Field that failed validation
    required String field,

    /// Validation error message
    required String message,

    /// Type of validation that failed
    required String type,

    /// Actual value that failed validation
    dynamic actualValue,

    /// Expected value or pattern
    dynamic expectedValue,
  }) = _ValidationError;

  factory ValidationError.fromJson(Map<String, dynamic> json) =>
      _$ValidationErrorFromJson(json);
}
