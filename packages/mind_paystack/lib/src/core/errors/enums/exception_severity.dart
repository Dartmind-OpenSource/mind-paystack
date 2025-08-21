import 'package:freezed_annotation/freezed_annotation.dart';

/// Represents the severity level of an exception in the MindPaystack SDK.
///
/// This enum is used to categorize exceptions based on their impact and
/// urgency, helping developers prioritize error handling and determine
/// appropriate responses.
///
/// Example usage:
/// ```dart
/// if (exception.severity == ExceptionSeverity.fatal) {
///   // Handle critical errors that may crash the application
///   await crashReporting.report(exception);
/// } else if (exception.severity == ExceptionSeverity.warning) {
///   // Log warnings for monitoring but continue execution
///   logger.warn(exception.message);
/// }
/// ```
enum ExceptionSeverity {
  /// Critical errors that may cause application crashes or data loss.
  ///
  /// These errors typically require immediate attention and should trigger
  /// emergency procedures like crash reporting or failsafe mechanisms.
  /// Examples: SDK initialization failures, critical API errors.
  @JsonValue('fatal')
  fatal,

  /// Standard errors that prevent normal operation but don't crash the app.
  ///
  /// These are typical operational errors that should be handled gracefully
  /// and may require user intervention or retry logic.
  /// Examples: Network failures, invalid API responses, authentication errors.
  @JsonValue('error')
  error,

  /// Non-critical issues that don't prevent operation but may indicate
  /// problems.
  ///
  /// These should be logged for monitoring and may require eventual attention
  /// but don't require immediate user action.
  /// Examples: Deprecated API usage, performance warnings, configuration
  /// issues.
  @JsonValue('warning')
  warning,

  /// Informational messages for debugging and monitoring purposes.
  ///
  /// These are not actual errors but provide useful context for development
  /// and troubleshooting. Usually only logged in debug/development builds.
  /// Examples: API rate limiting notices, successful fallback operations.
  @JsonValue('info')
  info
}
