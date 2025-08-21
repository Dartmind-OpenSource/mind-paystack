/// Defines logging levels for the MindPaystack SDK.
/// 
/// This enum controls the verbosity of SDK logging, allowing developers
/// to filter log messages based on their importance and relevance.
/// Higher levels include all messages from lower levels.
/// 
/// Logging levels in order of verbosity (lowest to highest):
/// - Debug: Detailed diagnostic information for development
/// - Info: General informational messages about SDK operations
/// - Warning: Potentially problematic situations that don't stop execution
/// - Error: Error conditions that may affect functionality
/// 
/// Example usage:
/// ```dart
/// final config = PaystackConfig(
///   logLevel: LogLevel.info, // Only show info, warning, and error messages
///   // other config...
/// );
/// 
/// // Check if debug logging is enabled
/// if (config.logLevel.canLog(LogLevel.debug)) {
///   MPLogger.debug('Detailed debug information');
/// }
/// ```
enum LogLevel {
  /// Detailed diagnostic information for development and debugging.
  /// 
  /// Includes verbose information about internal SDK operations,
  /// API request/response details, and detailed execution flow.
  /// Should typically only be used during development.
  debug,
  
  /// General informational messages about SDK operations.
  /// 
  /// Includes messages about successful operations, configuration changes,
  /// and normal SDK lifecycle events. Suitable for production monitoring.
  info,
  
  /// Potentially problematic situations that don't prevent operation.
  /// 
  /// Includes deprecated API usage, performance warnings, configuration
  /// issues, and recoverable errors. Should be monitored in production.
  warning,
  
  /// Error conditions that may affect SDK functionality.
  /// 
  /// Includes API errors, authentication failures, network problems,
  /// and other issues that prevent normal operation. Always logged.
  error;

  /// Checks if this is the debug level.
  bool get isDebug => this == LogLevel.debug;
  
  /// Checks if this is the info level.
  bool get isInfo => this == LogLevel.info;
  
  /// Checks if this is the warning level.
  bool get isWarning => this == LogLevel.warning;
  
  /// Checks if this is the error level.
  bool get isError => this == LogLevel.error;

  /// Creates a LogLevel from a string representation.
  /// 
  /// Parses string values like 'debug', 'info', 'warning', or 'error'
  /// and returns the corresponding LogLevel enum value.
  /// Defaults to info level if the string is not recognized.
  /// 
  /// Parameters:
  /// - [value]: String representation of the log level
  /// 
  /// Returns:
  /// The corresponding LogLevel enum value, or LogLevel.info if invalid.
  /// 
  /// Example:
  /// ```dart
  /// final level = LogLevel.fromString('debug'); // LogLevel.debug
  /// final fallback = LogLevel.fromString('invalid'); // LogLevel.info
  /// ```
  static LogLevel fromString(String value) {
    return LogLevel.values.firstWhere(
      (level) => level.toString().split('.').last == value.toLowerCase(),
      orElse: () => LogLevel.info,
    );
  }

  /// Gets the human-readable display name for this log level.
  /// 
  /// Returns a capitalized string representation suitable for
  /// display in user interfaces, configuration screens, or log output.
  /// 
  /// Example:
  /// ```dart
  /// print(LogLevel.debug.displayName); // 'Debug'
  /// print(LogLevel.error.displayName); // 'Error'
  /// ```
  String get displayName {
    switch (this) {
      case LogLevel.debug:
        return 'Debug';
      case LogLevel.info:
        return 'Info';
      case LogLevel.warning:
        return 'Warning';
      case LogLevel.error:
        return 'Error';
    }
  }

  /// Gets the numeric priority of this log level.
  /// 
  /// Lower numbers indicate more verbose logging:
  /// - Debug: 0 (most verbose)
  /// - Info: 1
  /// - Warning: 2
  /// - Error: 3 (least verbose)
  /// 
  /// Used internally for log level comparisons.
  int get priority {
    switch (this) {
      case LogLevel.debug:
        return 0;
      case LogLevel.info:
        return 1;
      case LogLevel.warning:
        return 2;
      case LogLevel.error:
        return 3;
    }
  }

  /// Determines if a message at this level should be logged.
  /// 
  /// Compares this log level's priority with the minimum required level.
  /// Returns true if this level's priority is equal to or higher than
  /// the minimum level's priority.
  /// 
  /// Parameters:
  /// - [minimumLevel]: The minimum log level required for logging
  /// 
  /// Returns:
  /// true if messages at this level should be logged, false otherwise.
  /// 
  /// Example:
  /// ```dart
  /// final currentLevel = LogLevel.warning;
  /// print(currentLevel.canLog(LogLevel.info)); // true (warning >= info)
  /// print(currentLevel.canLog(LogLevel.error)); // false (warning < error)
  /// ```
  bool canLog(LogLevel minimumLevel) {
    return priority >= minimumLevel.priority;
  }
}
