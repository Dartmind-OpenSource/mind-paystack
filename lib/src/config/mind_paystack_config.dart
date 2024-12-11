import 'package:mind_paystack/src/config/environment.dart';
import 'package:mind_paystack/src/config/log_level.dart';
import 'package:mind_paystack/src/config/retry_policy.dart';
import 'package:mind_paystack/src/core/exceptions.dart';
import 'package:mind_paystack/src/ui/theme.dart';
import 'package:mind_paystack/src/utils/logger.dart';

class MindPaystackConfig {

  MindPaystackConfig({
    required this.publicKey,
    Environment environment = Environment.test,
    LogLevel logLevel = LogLevel.info,
    this.retryPolicy = const RetryPolicy(),
    String currency = 'NGN',
    String locale = 'en',
    MPTheme? theme,
    Duration? timeout,
  })  : _environment = environment,
        _logLevel = logLevel,
        _currency = currency,
        _locale = locale,
        _theme = theme,
        timeout = timeout ?? const Duration(seconds: 30) {
    _validateConfig();
    _initializeLogger();
  }

  /// Create config from environment variables
  factory MindPaystackConfig.fromEnvironment() {
    const publicKey = String.fromEnvironment('PAYSTACK_PUBLIC_KEY');
    const environment =
        String.fromEnvironment('PAYSTACK_ENVIRONMENT', defaultValue: 'test');
    const logLevel =
        String.fromEnvironment('PAYSTACK_LOG_LEVEL', defaultValue: 'info');

    return MindPaystackConfig(
      publicKey: publicKey,
      environment: Environment.fromString(environment),
      logLevel: LogLevel.fromString(logLevel),
    );
  }
  /// API public key from Paystack dashboard
  final String publicKey;

  /// Current environment (test, staging, production)
  Environment _environment;

  /// Log level for SDK operations
  LogLevel _logLevel;

  /// Custom retry policy for failed requests
  final RetryPolicy retryPolicy;

  /// Default currency for transactions
  String _currency;

  /// Default locale for UI components
  String _locale;

  /// Custom theme configuration
  MPTheme? _theme;

  /// Custom logger function
  void Function(LogLevel, String)? _logger;

  /// Timeout duration for API requests
  final Duration timeout;

  /// Environment getter
  Environment get environment => _environment;

  /// Log level getter
  LogLevel get logLevel => _logLevel;

  /// Currency getter
  String get currency => _currency;

  /// Locale getter
  String get locale => _locale;

  /// Theme getter
  MPTheme get theme => _theme ?? MPTheme.defaultTheme;

  /// Logger getter
  void Function(LogLevel, String)? get logger => _logger;

  /// Set environment
  set environment(Environment value) {
    _environment = value;
    MPLogger.info('Environment changed to: ${value.name}');
  }

  /// Set log level
  set logLevel(LogLevel value) {
    _logLevel = value;
    MPLogger.setLogLevel(value);
    MPLogger.info('Log level changed to: ${value.name}');
  }

  /// Set currency
  set currency(String value) {
    if (!_isValidCurrency(value)) {
      throw PaystackException(
        message: 'Invalid currency code: $value',
        code: 'invalid_currency',
      );
    }
    _currency = value.toUpperCase();
    MPLogger.info('Currency changed to: $value');
  }

  /// Set locale
  set locale(String value) {
    _locale = value;
    MPLogger.info('Locale changed to: $value');
  }

  /// Set theme
  set theme(MPTheme? value) {
    _theme = value;
    MPLogger.info('Theme updated');
  }

  /// Set logger
  set logger(void Function(LogLevel, String)? value) {
    _logger = value;
    MPLogger.initialize(value);
    MPLogger.info('Custom logger set');
  }

  /// Validate configuration
  void _validateConfig() {
    if (publicKey.isEmpty) {
      throw PaystackException(
        message: 'Public key is required',
        code: 'invalid_config',
      );
    }

    if (!_isValidPublicKey(publicKey)) {
      throw PaystackException(
        message: 'Invalid public key format',
        code: 'invalid_config',
      );
    }

    if (environment.isProduction && publicKey.startsWith('pk_test_')) {
      throw PaystackException(
        message: 'Test public key cannot be used in production environment',
        code: 'invalid_config',
      );
    }
  }

  /// Initialize logger
  void _initializeLogger() {
    MPLogger.setLogLevel(logLevel);
    MPLogger.initialize(logger);
    MPLogger.info('MindPaystack SDK initialized with config: '
        'environment=${environment.name}, '
        'logLevel=${logLevel.name}, '
        'currency=$currency, '
        'locale=$locale');
  }

  /// Check if currency code is valid
  bool _isValidCurrency(String currency) {
    final validCurrencies = ['NGN', 'USD', 'GHS', 'ZAR', 'KES'];
    return validCurrencies.contains(currency.toUpperCase());
  }

  /// Check if public key format is valid
  bool _isValidPublicKey(String key) {
    return key.startsWith('pk_') && key.length > 10;
  }

  /// Copy config with new values
  MindPaystackConfig copyWith({
    String? publicKey,
    Environment? environment,
    LogLevel? logLevel,
    RetryPolicy? retryPolicy,
    String? currency,
    String? locale,
    MPTheme? theme,
    Duration? timeout,
  }) {
    return MindPaystackConfig(
      publicKey: publicKey ?? this.publicKey,
      environment: environment ?? this.environment,
      logLevel: logLevel ?? this.logLevel,
      retryPolicy: retryPolicy ?? this.retryPolicy,
      currency: currency ?? this.currency,
      locale: locale ?? this.locale,
      theme: theme ?? _theme,
      timeout: timeout ?? this.timeout,
    );
  }

  @override
  String toString() {
    return 'MindPaystackConfig('
        'publicKey: ${publicKey.substring(0, 10)}..., '
        'environment: ${environment.name}, '
        'logLevel: ${logLevel.name}, '
        'currency: $currency, '
        'locale: $locale)';
  }
}
