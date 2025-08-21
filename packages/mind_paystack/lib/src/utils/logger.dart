import 'dart:developer';

import 'package:mind_paystack/src/config/log_level.dart';

/// Signature for custom log handler function
typedef LogHandler = void Function(
  LogLevel level,
  String message, {
  dynamic error,
  StackTrace? stackTrace,
});

/// Logger utility for the Mind SDK
class MPLogger {
  MPLogger._();

  /// Current log level
  static LogLevel _level = LogLevel.info;

  /// Custom log handler
  static LogHandler? _handler;

  /// Timestamp format for log messages
  static String _timestampFormat = 'HH:mm:ss.SSS';

  /// Whether to include timestamp in log messages
  static bool _includeTimestamp = true;

  /// Whether to include log level in log messages
  static bool _includeLogLevel = true;

  /// Sets the current log level
  static void setLogLevel(LogLevel level) {
    _level = level;
    debug('Log level set to: ${level.name}');
  }

  /// Initializes the logger with a custom handler
  static void initialize({
    LogHandler? handler,
    String? timestampFormat,
    bool? includeTimestamp,
    bool? includeLogLevel,
  }) {
    _handler = handler;
    if (timestampFormat != null) _timestampFormat = timestampFormat;
    if (includeTimestamp != null) _includeTimestamp = includeTimestamp;
    if (includeLogLevel != null) _includeLogLevel = includeLogLevel;
  }

  /// Logs a debug message
  static void debug(
    String message, {
    dynamic error,
    StackTrace? stackTrace,
  }) {
    _log(LogLevel.debug, message, error: error, stackTrace: stackTrace);
  }

  /// Logs an info message
  static void info(
    String message, {
    dynamic error,
    StackTrace? stackTrace,
  }) {
    _log(LogLevel.info, message, error: error, stackTrace: stackTrace);
  }

  /// Logs a warning message
  static void warning(
    String message, {
    dynamic error,
    StackTrace? stackTrace,
  }) {
    _log(LogLevel.warning, message, error: error, stackTrace: stackTrace);
  }

  /// Logs an error message
  static void error(
    String message, {
    dynamic error,
    StackTrace? stackTrace,
  }) {
    _log(LogLevel.error, message, error: error, stackTrace: stackTrace);
  }

  /// Internal logging method
  static void _log(
    LogLevel level,
    String message, {
    dynamic error,
    StackTrace? stackTrace,
  }) {
    if (level.index < _level.index) return;

    final timestamp = _includeTimestamp ? _getTimestamp() : null;
    final levelStr = _includeLogLevel ? '[${level.name.toUpperCase()}]' : '';

    final buffer = StringBuffer();

    // Add timestamp if enabled
    if (timestamp != null) {
      buffer.write('$timestamp ');
    }

    // Add log level if enabled
    if (levelStr.isNotEmpty) {
      buffer.write('$levelStr ');
    }

    // Add message
    buffer.write(message);

    // Add error if present
    if (error != null) {
      buffer.write('\nError: $error');
    }

    // Add stack trace if present
    if (stackTrace != null) {
      buffer.write('\nStack trace:\n$stackTrace');
    }

    final logMessage = buffer.toString();

    // Use custom handler if provided, otherwise use print
    if (_handler != null) {
      _handler!(level, logMessage, error: error, stackTrace: stackTrace);
    } else {
      log(logMessage);
    }
  }

  /// Gets formatted timestamp
  static String _getTimestamp() {
    final now = DateTime.now();
    return _formatTimestamp(now);
  }

  /// Formats timestamp according to configured format
  static String _formatTimestamp(DateTime timestamp) {
    final hour = timestamp.hour.toString().padLeft(2, '0');
    final minute = timestamp.minute.toString().padLeft(2, '0');
    final second = timestamp.second.toString().padLeft(2, '0');
    final millisecond = timestamp.millisecond.toString().padLeft(3, '0');

    switch (_timestampFormat) {
      case 'HH:mm:ss':
        return '$hour:$minute:$second';
      case 'HH:mm:ss.SSS':
        return '$hour:$minute:$second.$millisecond';
      default:
        return '$hour:$minute:$second.$millisecond';
    }
  }

  /// Utility method to format a Map as a string
  static String formatMap(Map<String, dynamic> map) {
    return map.entries
        .map((e) => '${e.key}: ${_formatValue(e.value)}')
        .join(', ');
  }

  /// Formats a value for logging
  static String _formatValue(dynamic value) {
    if (value is Map) {
      return '{${formatMap(value as Map<String, dynamic>)}}';
    } else if (value is List) {
      return '[${value.map(_formatValue).join(', ')}]';
    } else if (value is String) {
      return '"$value"';
    } else {
      return value.toString();
    }
  }
}

/// Extension methods for LogLevel enum
extension LogLevelX on LogLevel {
  /// Gets the ANSI color code for this log level
  String get ansiColor {
    switch (this) {
      case LogLevel.debug:
        return '\x1B[37m'; // White
      case LogLevel.info:
        return '\x1B[32m'; // Green
      case LogLevel.warning:
        return '\x1B[33m'; // Yellow
      case LogLevel.error:
        return '\x1B[31m'; // Red
    }
  }

  /// Gets the reset ANSI color code
  static String get resetColor => '\x1B[0m';
}
