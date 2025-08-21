import 'package:freezed_annotation/freezed_annotation.dart';

/// Identifies where an error originated in the payment processing stack.
///
/// This enum helps developers understand which layer of the system caused
/// an error, enabling more targeted debugging and appropriate error handling
/// strategies. Each source has different implications for error resolution.
///
/// Example usage:
/// ```dart
/// switch (exception.source) {
///   case ErrorSource.user:
///     // Show user-friendly error message and input correction hints
///     showUserError(exception.userMessage ?? exception.message);
///     break;
///   case ErrorSource.api:
///     // Log for monitoring and potentially retry
///     logger.error('API error: ${exception.message}');
///     break;
///   case ErrorSource.sdk:
///     // Report to SDK maintainers
///     reportSdkBug(exception);
///     break;
/// }
/// ```
enum ErrorSource {
  /// Errors originating from the Paystack API or external services.
  ///
  /// These errors come from the server-side infrastructure and are typically
  /// outside the client application's direct control. May include rate
  /// limiting, service outages, or server-side validation failures.
  /// Examples: HTTP 5xx errors, API rate limits, service maintenance.
  @JsonValue('api')
  api,

  /// Errors originating from the MindPaystack SDK implementation.
  ///
  /// These errors indicate bugs or issues within the SDK code itself,
  /// such as incorrect data processing, configuration errors, or
  /// programming mistakes. Should be reported to SDK maintainers.
  /// Examples: Serialization failures, incorrect API calls, SDK bugs.
  @JsonValue('sdk')
  sdk,

  /// Errors caused by incorrect usage or invalid input from developers.
  ///
  /// These errors occur when the SDK is used incorrectly, such as providing
  /// invalid parameters, missing required configuration, or calling methods
  /// in the wrong sequence. Fixable by correcting the client code.
  /// Examples: Invalid email format, missing API keys, incorrect amounts.
  @JsonValue('user')
  user,

  /// Errors from the underlying system, platform, or environment.
  ///
  /// These errors originate from the runtime environment, operating system,
  /// or platform-specific issues that affect the SDK's operation.
  /// May require system-level fixes or environment changes.
  /// Examples: Network connectivity, file system errors, memory issues.
  @JsonValue('system')
  system
}
