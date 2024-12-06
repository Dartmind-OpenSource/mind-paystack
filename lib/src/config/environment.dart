enum Environment {
  test,
  staging,
  production;

  bool get isTest => this == Environment.test;
  bool get isStaging => this == Environment.staging;
  bool get isProduction => this == Environment.production;

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

  static Environment fromString(String value) {
    return Environment.values.firstWhere(
      (env) => env.toString().split('.').last == value.toLowerCase(),
      orElse: () => Environment.test,
    );
  }

  Map<String, String> get headers {
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };

    if (isTest) {
      headers['X-Environment'] = 'test';
    }

    return headers;
  }
}
