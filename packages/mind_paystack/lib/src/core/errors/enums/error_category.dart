import 'package:freezed_annotation/freezed_annotation.dart';

/// Categorizes errors by their underlying cause or domain.
///
/// This enum helps developers understand the nature of errors and implement
/// appropriate handling strategies. Each category represents a different
/// aspect of the payment processing pipeline that could fail.
///
/// Example usage:
/// ```dart
/// switch (exception.category) {
///   case ErrorCategory.network:
///     // Retry with exponential backoff
///     await retryWithBackoff(() => apiCall());
///     break;
///   case ErrorCategory.validation:
///     // Show validation errors to user
///     showValidationErrors(exception.validationErrors);
///     break;
///   case ErrorCategory.authentication:
///     // Redirect to login or refresh tokens
///     await refreshAuthentication();
///     break;
/// }
/// ```
enum ErrorCategory {
  /// Network-related errors including connectivity and communication issues.
  ///
  /// These errors occur when there are problems with internet connectivity,
  /// DNS resolution, timeouts, or other network infrastructure issues.
  /// Usually retryable with appropriate backoff strategies.
  /// Examples: Connection timeouts, DNS failures, proxy errors.
  @JsonValue('network')
  network,

  /// Authentication and authorization failures.
  ///
  /// These errors occur when API keys are invalid, expired, or lack sufficient
  /// permissions for the requested operation. May require token refresh or
  /// re-authentication.
  /// Examples: Invalid API keys, expired tokens, insufficient permissions.
  @JsonValue('authentication')
  authentication,

  /// Input validation errors where provided data doesn't meet requirements.
  ///
  /// These errors occur when request parameters, amounts, or other input
  /// data fail validation checks. Usually fixable by correcting the input.
  /// Examples: Invalid email format, negative amounts, missing required fields.
  @JsonValue('validation')
  validation,

  /// Business logic errors related to payment processing rules.
  ///
  /// These errors occur when requests violate business rules or payment
  /// processing constraints, even with valid input data.
  /// Examples: Insufficient balance, duplicate transactions, unsupported
  /// currency.
  @JsonValue('business')
  business,

  /// Server-side errors from the Paystack API or SDK infrastructure.
  ///
  /// These errors indicate problems on the server side that are typically
  /// outside the client's control and may require retry or support contact.
  /// Examples: Internal server errors, database failures, service unavailable.
  @JsonValue('server')
  server,

  /// Errors that don't fit into other categories or have unknown causes.
  ///
  /// This is a fallback category for unexpected errors or those that haven't
  /// been properly classified. Should be investigated and potentially
  /// recategorized.
  @JsonValue('unknown')
  unknown
}
