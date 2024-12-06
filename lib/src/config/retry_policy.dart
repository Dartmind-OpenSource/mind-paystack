// lib/src/config/retry_policy.dart
import 'dart:math';

class RetryPolicy {
  /// Maximum number of retry attempts
  final int maxAttempts;

  /// Base delay between retries in milliseconds
  final int baseDelay;

  /// Maximum delay between retries in milliseconds
  final int maxDelay;

  /// Factor to multiply delay by after each retry attempt
  final double backoffFactor;

  /// Set of status codes that should trigger a retry
  final Set<int> retryStatusCodes;

  const RetryPolicy({
    this.maxAttempts = 3,
    this.baseDelay = 1000,
    this.maxDelay = 10000,
    this.backoffFactor = 2.0,
    Set<int>? retryStatusCodes,
  }) : retryStatusCodes = retryStatusCodes ?? const {408, 500, 502, 503, 504};

  /// Calculate delay for a specific attempt
  Duration getDelayForAttempt(int attempt) {
    if (attempt <= 0) return Duration.zero;

    final exponentialDelay = baseDelay * pow(backoffFactor, attempt - 1);
    final boundedDelay = min(exponentialDelay, maxDelay.toDouble());

    return Duration(milliseconds: boundedDelay.round());
  }

  /// Should retry based on status code and attempt number
  bool shouldRetry(int statusCode, int attempt) {
    return attempt < maxAttempts && retryStatusCodes.contains(statusCode);
  }

  /// Create a policy for testing with shorter delays
  factory RetryPolicy.testing() {
    return const RetryPolicy(
      maxAttempts: 2,
      baseDelay: 100,
      maxDelay: 1000,
      backoffFactor: 1.5,
    );
  }

  RetryPolicy copyWith({
    int? maxAttempts,
    int? baseDelay,
    int? maxDelay,
    double? backoffFactor,
    Set<int>? retryStatusCodes,
  }) {
    return RetryPolicy(
      maxAttempts: maxAttempts ?? this.maxAttempts,
      baseDelay: baseDelay ?? this.baseDelay,
      maxDelay: maxDelay ?? this.maxDelay,
      backoffFactor: backoffFactor ?? this.backoffFactor,
      retryStatusCodes: retryStatusCodes ?? this.retryStatusCodes,
    );
  }
}
