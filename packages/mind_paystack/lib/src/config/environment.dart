/// Defines the different environments for Paystack API integration.
///
/// This enum manages environment-specific configuration including API
/// endpoints, headers, and validation rules. Each environment has different
/// purposes:
/// - Test: For development and testing with test keys
/// - Staging: For pre-production testing (if available)
/// - Production: For live transactions with real money
///
/// Example usage:
/// ```dart
/// final config = PaystackConfig(
///   environment: Environment.test, // Use test environment
///   publicKey: 'pk_test_your_key',
///   secretKey: 'sk_test_your_key',
/// );
///
/// // Check environment
/// if (config.environment.isProduction) {
///   // Handle production-specific logic
/// }
///
/// // Get appropriate base URL
/// final apiUrl = config.environment.baseUrl;
/// ```
enum Environment {
  /// Test environment for development and testing.
  ///
  /// Uses sandbox endpoints and test keys. Transactions are simulated
  /// and no real money is processed. Safe for development and testing.
  test,

  /// Staging environment for pre-production testing.
  ///
  /// Used for final testing before production deployment.
  /// May have similar behavior to production but with test data.
  staging,

  /// Production environment for live transactions.
  ///
  /// Uses live Paystack endpoints and processes real money.
  /// Requires production API keys and proper security measures.
  production;

  /// Checks if this is the test environment.
  ///
  /// Returns true for the test environment, useful for conditional
  /// logic based on environment type.
  bool get isTest => this == Environment.test;

  /// Checks if this is the staging environment.
  bool get isStaging => this == Environment.staging;

  /// Checks if this is the production environment.
  ///
  /// Returns true for production, useful for enabling production-specific
  /// features like enhanced security, monitoring, or different error handling.
  bool get isProduction => this == Environment.production;

  /// Gets the base URL for the Paystack API based on the environment.
  ///
  /// Returns the appropriate API endpoint URL:
  /// - Test: https://api.paystack.test (sandbox)
  /// - Staging: https://api.paystack.staging (if available)
  /// - Production: https://api.paystack.co (live)
  String get baseUrl {
    switch (this) {
      case Environment.test:
        return 'https://api.paystack.test';
      case Environment.staging:
        return 'https://api.paystack.staging';
      case Environment.production:
        return 'https://api.paystack.co';
    }
  }

  /// Creates an Environment from a string representation.
  ///
  /// Parses string values like 'test', 'staging', or 'production'
  /// and returns the corresponding Environment enum value.
  /// Defaults to test environment if the string is not recognized.
  ///
  /// Parameters:
  /// - [value]: String representation of the environment
  ///
  /// Returns:
  /// The corresponding Environment enum value, or Environment.test if invalid.
  ///
  /// Example:
  /// ```dart
  /// final env = Environment.fromString('production'); // Environment.production
  /// final fallback = Environment.fromString('invalid'); // Environment.test
  /// ```
  static Environment fromString(String value) {
    return Environment.values.firstWhere(
      (env) => env.toString().split('.').last == value.toLowerCase(),
      orElse: () => Environment.test,
    );
  }

  /// Gets the default HTTP headers for API requests in this environment.
  ///
  /// Returns a map of headers that should be included with API requests.
  /// Includes standard headers like Content-Type and Accept, plus
  /// environment-specific headers for identification and debugging.
  ///
  /// Returns:
  /// A map of header key-value pairs for HTTP requests.
  ///
  /// Example:
  /// ```dart
  /// final headers = Environment.test.headers;
  /// // Contains: {'Accept': 'application/json', 'Content-Type': 'application/json', 'X-Environment': 'test'}
  /// ```
  Map<String, String> get headers {
    final headers = <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };

    if (isTest) {
      headers['X-Environment'] = 'test';
    }

    return headers;
  }
}
