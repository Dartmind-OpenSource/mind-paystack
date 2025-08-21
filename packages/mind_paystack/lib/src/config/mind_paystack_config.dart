import 'package:injectable/injectable.dart' hide Environment;
import 'package:mind_paystack/src/config/environment.dart';
import 'package:mind_paystack/src/config/log_level.dart';
import 'package:mind_paystack/src/config/retry_policy.dart';
import 'package:mind_paystack/src/core/errors/models/mind_exception.dart';
import 'package:mind_paystack/src/utils/logger.dart';

/// Configuration for the MindPaystack SDK
///
/// This class manages all configuration options for the SDK including
/// environment settings, API keys, logging, retry policies, and more.
class PaystackConfig {
  /// Creates a new PaystackConfig instance with the specified options
  ///
  /// [publicKey] is required and must be a valid Paystack public key
  /// [secretKey] is required for backend operations
  /// [environment] defaults to test environment
  /// [logLevel] controls the verbosity of SDK logs
  /// [retryPolicy] defines how failed requests should be retried
  /// [currency] sets the default currency for transactions (defaults to NGN)
  /// [locale] sets the default locale for UI components
  /// [timeout] sets the default timeout for API requests
  PaystackConfig({
    required this.publicKey,
    required this.secretKey,
    Environment environment = Environment.test,
    LogLevel logLevel = LogLevel.info,
    this.retryPolicy = const RetryPolicy(),
    String currency = 'NGN',
    String locale = 'en',
    // MPTheme? theme,
    Duration? timeout,
  })  : _environment = environment,
        _logLevel = logLevel,
        _currency = currency,
        _locale = locale,
        // _theme = theme,
        timeout = timeout ?? const Duration(seconds: 30) {
    _validateConfig();
    _initializeLogger();
  }

  /// Creates a configuration instance from environment variables
  ///
  /// Looks for the following environment variables:
  /// - PAYSTACK_PUBLIC_KEY
  /// - PAYSTACK_SECRET_KEY
  /// - PAYSTACK_ENVIRONMENT
  /// - PAYSTACK_LOG_LEVEL
  @factoryMethod
  factory PaystackConfig.fromEnvironment() {
    const publicKey = String.fromEnvironment('PAYSTACK_PUBLIC_KEY');
    const secretKey = String.fromEnvironment('PAYSTACK_SECRET_KEY');
    const environment =
        String.fromEnvironment('PAYSTACK_ENVIRONMENT', defaultValue: 'test');
    const logLevel =
        String.fromEnvironment('PAYSTACK_LOG_LEVEL', defaultValue: 'info');

    return PaystackConfig(
      publicKey: publicKey,
      secretKey: secretKey,
      environment: Environment.fromString(environment),
      logLevel: LogLevel.fromString(logLevel),
    );
  }

  /// Public key for Paystack API authentication
  final String publicKey;

  /// Secret key for Paystack API authentication
  final String secretKey;

  Environment _environment;
  LogLevel _logLevel;
  // ignore: public_member_api_docs
  final RetryPolicy retryPolicy;
  String _currency;
  String _locale;
  // MPTheme? _theme;
  LogHandler? _logger;

  ///
  final Duration timeout;

  /// Current environment (test, staging, production)
  Environment get environment => _environment;

  /// Current log level for SDK operations
  LogLevel get logLevel => _logLevel;

  /// Default currency for transactions
  String get currency => _currency;

  /// Default locale for UI components
  String get locale => _locale;

  /// Theme configuration for UI components
  // MPTheme get theme => _theme ?? MPTheme.defaultTheme;

  /// Custom logger function
  LogHandler? get mindLogger => _logger;

  /// Updates the environment setting
  ///
  /// Throws [MindException] if trying to use test keys in production
  set environment(Environment value) {
    _validateEnvironmentKey(value);
    _environment = value;
    MPLogger.info('Environment changed to: ${value.name}');
  }

  /// Updates the log level
  set logLevel(LogLevel value) {
    _logLevel = value;
    MPLogger.setLogLevel(value);
    MPLogger.info('Log level changed to: ${value.name}');
  }

  /// Updates the default currency
  ///
  /// Throws [MindException] if currency is not supported
  set currency(String value) {
    if (!_isValidCurrency(value)) {
      throw MindException(
        message: 'Invalid currency code: $value',
        code: 'invalid_currency',
      );
    }
    _currency = value.toUpperCase();
    MPLogger.info('Currency changed to: $value');
  }

  /// Updates the locale setting
  set locale(String value) {
    _locale = value;
    MPLogger.info('Locale changed to: $value');
  }

  /// Updates the theme configuration
  // set theme(MPTheme? value) {
  //   _theme = value;
  //   MPLogger.info('Theme updated');
  // }

  /// Sets a custom logger function
  // ignore: avoid_setters_without_getters
  set logger(LogHandler value) {
    _logger = value;
    MPLogger.initialize(handler: value);
    MPLogger.info('Custom logger set');
  }

  /// Validates the current configuration
  void _validateConfig() {
    if (publicKey.isEmpty || secretKey.isEmpty) {
      throw const MindException(
        message: 'Both public and secret keys are required',
        code: 'invalid_config',
      );
    }

    if (!_isValidPublicKey(publicKey)) {
      throw const MindException(
        message: 'Invalid public key format',
        code: 'invalid_config',
      );
    }

    if (!_isValidSecretKey(secretKey)) {
      throw const MindException(
        message: 'Invalid secret key format',
        code: 'invalid_config',
      );
    }

    _validateEnvironmentKey(_environment);
  }

  /// Validates environment and key combination
  void _validateEnvironmentKey(Environment env) {
    if (env.isProduction) {
      if (publicKey.startsWith('pk_test_') ||
          secretKey.startsWith('sk_test_')) {
        throw const MindException(
          message: 'Test keys cannot be used in production environment',
          code: 'invalid_config',
        );
      }
    }
  }

  /// Initializes the logger with current settings
  void _initializeLogger() {
    MPLogger.setLogLevel(logLevel);
    MPLogger.initialize(handler: mindLogger);
    MPLogger.info('MindPaystack SDK initialized with config: '
        'environment=${environment.name}, '
        'logLevel=${logLevel.name}, '
        'currency=$currency, '
        'locale=$locale');
  }

  /// Checks if a currency code is supported
  bool _isValidCurrency(String currency) {
    const validCurrencies = {'NGN', 'USD', 'GHS', 'ZAR', 'KES'};
    return validCurrencies.contains(currency.toUpperCase());
  }

  /// Validates public key format
  bool _isValidPublicKey(String key) {
    return key.startsWith('pk_') && key.length > 10;
  }

  /// Validates secret key format
  bool _isValidSecretKey(String key) {
    return key.startsWith('sk_') && key.length > 10;
  }

  /// Creates a copy of this configuration with optional new values
  PaystackConfig copyWith({
    String? publicKey,
    String? secretKey,
    Environment? environment,
    LogLevel? logLevel,
    RetryPolicy? retryPolicy,
    String? currency,
    String? locale,
    // MPTheme? theme,
    Duration? timeout,
  }) {
    return PaystackConfig(
      publicKey: publicKey ?? this.publicKey,
      secretKey: secretKey ?? this.secretKey,
      environment: environment ?? this.environment,
      logLevel: logLevel ?? this.logLevel,
      retryPolicy: retryPolicy ?? this.retryPolicy,
      currency: currency ?? this.currency,
      locale: locale ?? this.locale,
      // theme: theme ?? _theme,
      timeout: timeout ?? this.timeout,
    );
  }

  @override
  String toString() {
    return 'PaystackConfig('
        'publicKey: ${publicKey.substring(0, 10)}..., '
        'secretKey: ${secretKey.substring(0, 10)}..., '
        'environment: ${environment.name}, '
        'logLevel: ${logLevel.name}, '
        'currency: $currency, '
        'locale: $locale)';
  }
}
