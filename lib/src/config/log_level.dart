enum LogLevel {
  debug,
  info,
  warning,
  error;

  bool get isDebug => this == LogLevel.debug;
  bool get isInfo => this == LogLevel.info;
  bool get isWarning => this == LogLevel.warning;
  bool get isError => this == LogLevel.error;

  static LogLevel fromString(String value) {
    return LogLevel.values.firstWhere(
      (level) => level.toString().split('.').last == value.toLowerCase(),
      orElse: () => LogLevel.info,
    );
  }

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

  bool canLog(LogLevel minimumLevel) {
    return priority >= minimumLevel.priority;
  }
}
