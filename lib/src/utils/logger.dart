import 'package:logger/logger.dart';
import 'package:mind_paystack/src/config/log_level.dart';

class MPLogger {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 5,
      lineLength: 50,
      printTime: true,
    ),
  );

  static late void Function(LogLevel, String) _customLogger;

  static void initialize(void Function(LogLevel, String)? customLogger) {
    if (customLogger != null) {
      _customLogger = customLogger;
    }
  }

  static void debug(String message, [dynamic error, StackTrace? stackTrace]) {
    _log(LogLevel.debug, message, error, stackTrace);
  }

  static void info(String message, [dynamic error, StackTrace? stackTrace]) {
    _log(LogLevel.info, message, error, stackTrace);
  }

  static void warning(String message, [dynamic error, StackTrace? stackTrace]) {
    _log(LogLevel.warning, message, error, stackTrace);
  }

  static void error(String message, [dynamic error, StackTrace? stackTrace]) {
    _log(LogLevel.error, message, error, stackTrace);
  }

  static void _log(
    LogLevel level,
    String message, [
    dynamic error,
    StackTrace? stackTrace,
  ]) {
    // First log to custom logger if available
    try {
      _customLogger.call(level, message);
    } catch (e) {
      _logger.e('Custom logger failed', error: e);
    }

    // Then log to default logger
    switch (level) {
      case LogLevel.debug:
        _logger.d(
          message,
          time: DateTime.now(),
          error: error,
          stackTrace: stackTrace,
        );
      case LogLevel.info:
        _logger.i(
          message,
          time: DateTime.now(),
          error: error,
          stackTrace: stackTrace,
        );
      case LogLevel.warning:
        _logger.w(
          message,
          time: DateTime.now(),
          error: error,
          stackTrace: stackTrace,
        );
      case LogLevel.error:
        _logger.e(
          message,
          time: DateTime.now(),
          error: error,
          stackTrace: stackTrace,
        );
    }
  }

  static void setLogLevel(LogLevel level) {
    Logger.level = _convertLogLevel(level);
  }

  static Level _convertLogLevel(LogLevel level) {
    switch (level) {
      case LogLevel.debug:
        return Level.debug;
      case LogLevel.info:
        return Level.info;
      case LogLevel.warning:
        return Level.warning;
      case LogLevel.error:
        return Level.error;
    }
  }

  // Payment specific logging methods
  static void logPaymentStart(String reference) {
    info('Starting payment process: $reference');
  }

  static void logPaymentSuccess(String reference) {
    info('Payment successful: $reference');
  }

  static void logPaymentError(String reference, dynamic error) {
    error('Payment failed: $reference', error);
  }

  static void logAPIRequest(String endpoint, Map<String, dynamic> data) {
    debug('API Request to $endpoint: $data');
  }

  static void logAPIResponse(String endpoint, Map<String, dynamic> response) {
    debug('API Response from $endpoint: $response');
  }

  static void logAPIError(String endpoint, dynamic error) {
    error('API Error at $endpoint', error);
  }
}
