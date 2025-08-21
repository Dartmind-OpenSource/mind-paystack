import 'package:freezed_annotation/freezed_annotation.dart';
part 'validation_error.freezed.dart';
part 'validation_error.g.dart';

/// Represents a specific field validation error with detailed context.
///
/// This model provides structured information about validation failures,
/// making it easy to display meaningful error messages to users and
/// implement field-specific error handling in forms and UIs.
///
/// Validation errors are commonly returned by the Paystack API when
/// request parameters don't meet the required format, range, or business
/// rule constraints.
///
/// Example usage:
/// ```dart
/// final validationError = ValidationError(
///   field: 'email',
///   message: 'Invalid email format',
///   type: 'format',
///   actualValue: 'invalid-email',
///   expectedValue: 'user@example.com',
/// );
///
/// // Display in UI
/// if (error.field == 'email') {
///   emailField.showError(error.message);
/// }
/// ```
@freezed
class ValidationError with _$ValidationError {
  /// Creates a new ValidationError with the specified field and validation
  /// details.
  ///
  /// This factory constructor creates an immutable validation error object
  /// that describes a specific field validation failure. All error details
  /// are captured at creation time and cannot be modified afterward.
  ///
  /// Parameters:
  /// - [field]: The name of the field that failed validation (required)
  /// - [message]: Human-readable error description (required)
  /// - [type]: Category of validation failure (required)
  /// - [actualValue]: The invalid value that was provided (optional)
  /// - [expectedValue]: What the field should contain (optional)
  ///
  /// Example:
  /// ```dart
  /// final error = ValidationError(
  ///   field: 'amount',
  ///   message: 'Amount must be at least 100 NGN',
  ///   type: 'range',
  ///   actualValue: 50,
  ///   expectedValue: '>=100',
  /// );
  /// ```
  const factory ValidationError({
    /// Name of the field or parameter that failed validation.
    ///
    /// This corresponds to the API parameter name or form field identifier
    /// that caused the validation error. Used for targeting specific
    /// form fields or parameters for error display.
    /// Examples: 'email', 'amount', 'currency', 'reference'
    required String field,

    /// Human-readable description of the validation error.
    ///
    /// This message can be displayed directly to users or used as a basis
    /// for creating user-friendly error messages. Should clearly explain
    /// what went wrong and potentially how to fix it.
    required String message,

    /// Category or type of validation that failed.
    ///
    /// Provides programmatic identification of the validation rule that
    /// was violated, enabling specific error handling logic.
    /// Examples: 'required', 'format', 'range', 'length', 'pattern'
    required String type,

    /// The actual value that was provided and failed validation.
    ///
    /// Contains the original input that caused the validation error.
    /// Useful for debugging and providing context in error messages.
    /// Can be any type depending on the field being validated.
    dynamic actualValue,

    /// Expected value, format, or pattern for the field.
    ///
    /// Describes what the field should contain or match to pass validation.
    /// May be a specific value, a format example, a range, or a pattern.
    /// Examples: 'user@example.com', '1000-50000', '/^[A-Z]{3}$/'
    dynamic expectedValue,
  }) = _ValidationError;

  /// Creates a ValidationError instance from a JSON object.
  ///
  /// This factory method deserializes a JSON map into a ValidationError object,
  /// typically used when parsing API error responses from Paystack. The JSON
  /// structure should match the ValidationError field names.
  ///
  /// Parameters:
  /// - [json]: A Map containing the validation error data from JSON
  ///
  /// Returns:
  /// A ValidationError instance with data populated from the JSON object.
  ///
  /// Example JSON structure:
  /// ```json
  /// {
  ///   "field": "email",
  ///   "message": "Invalid email format",
  ///   "type": "format",
  ///   "actualValue": "invalid-email",
  ///   "expectedValue": "user@example.com"
  /// }
  /// ```
  ///
  /// Usage:
  /// ```dart
  /// final json = {'field': 'email', 'message': 'Invalid format'};
  /// final error = ValidationError.fromJson(json);
  /// ```
  factory ValidationError.fromJson(Map<String, dynamic> json) =>
      _$ValidationErrorFromJson(json);
}
