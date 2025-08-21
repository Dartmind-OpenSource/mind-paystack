import 'dart:math' as math;

/// Defines retry behavior for failed HTTP requests in the SDK.
///
/// This class configures how the SDK should handle failed API requests,
/// including which errors to retry, how many attempts to make, and how
/// long to wait between attempts. Uses exponential backoff with jitter
/// to avoid overwhelming servers.
///
/// The retry policy helps improve reliability by automatically retrying
/// transient failures like network timeouts, rate limiting, and server errors.
///
/// Example usage:
/// ```dart
/// // Custom retry policy for high-reliability scenarios
/// final aggressiveRetry = RetryPolicy(
///   maxAttempts: 5,
///   initialDelayMs: 500,
///   maxDelayMs: 60000,
///   backoffFactor: 2.5,
/// );
///
/// final config = PaystackConfig(
///   retryPolicy: aggressiveRetry,
///   // other config...
/// );
///
/// // Conservative retry for production
/// final conservativeRetry = RetryPolicy(
///   maxAttempts: 2,
///   initialDelayMs: 2000,
///   retryNonIdempotentRequests: false,
/// );
/// ```
class RetryPolicy {
  /// Creates a new retry policy with the specified configuration.
  ///
  /// All parameters are optional and have sensible defaults for most use cases.
  /// The default configuration provides a balance between reliability and
  /// performance, with 3 attempts and exponential backoff.
  const RetryPolicy({
    this.maxAttempts = 3,
    this.initialDelayMs = 1000,
    this.maxDelayMs = 30000,
    this.backoffFactor = 2.0,
    this.jitterFactor = 0.2,
    this.retryNonIdempotentRequests = false,
    this.retryableStatusCodes = const {
      408, // Request Timeout
      429, // Too Many Requests
      500, // Internal Server Error
      502, // Bad Gateway
      503, // Service Unavailable
      504, // Gateway Timeout
    },
  });

  /// Maximum number of retry attempts (including the initial attempt).
  ///
  /// For example, maxAttempts = 3 means one initial attempt plus 2 retries.
  /// Setting this to 1 disables retries. Higher values increase reliability
  /// but may cause longer delays for consistently failing requests.
  final int maxAttempts;

  /// Initial delay between retries in milliseconds.
  ///
  /// This is the base delay for the first retry attempt. Subsequent delays
  /// are calculated using exponential backoff based on this initial value.
  /// Typical values range from 100ms to 2000ms.
  final int initialDelayMs;

  /// Maximum delay between retries in milliseconds.
  ///
  /// This caps the exponential backoff to prevent extremely long delays.
  /// Even with high backoff factors, delays will not exceed this value.
  /// Helps ensure reasonable maximum wait times.
  final int maxDelayMs;

  /// Multiplier for exponential backoff delay calculation.
  ///
  /// Each retry delay is calculated as:
  /// initialDelay * (backoffFactor ^ attempt).
  ///
  /// Values greater than 1.0 create exponential backoff, while 1.0 creates
  /// constant delays. Typical values are between 1.5 and 3.0.
  final double backoffFactor;

  /// Random jitter factor to add variance to retry delays (0.0 to 1.0).
  ///
  /// Jitter helps prevent the "thundering herd" problem when many clients
  /// retry simultaneously. The actual jitter ranges from -jitterFactor to
  /// +jitterFactor as a percentage of the calculated delay.
  final double jitterFactor;

  /// Whether to retry non-idempotent requests (POST, PUT, PATCH).
  ///
  /// Idempotent requests (GET, DELETE) are generally safe to retry, but
  /// non-idempotent requests might cause duplicate operations. Enable this
  /// cautiously and only when you can handle potential duplicates.
  final bool retryNonIdempotentRequests;

  /// HTTP status codes that should trigger a retry attempt.
  ///
  /// Contains status codes for transient failures that are likely to succeed
  /// on retry. Does not include client errors (4xx) except for specific cases
  /// like rate limiting (429) that benefit from retry with backoff.
  final Set<int> retryableStatusCodes;

  /// Creates a copy of this retry policy with optionally updated values.
  ///
  /// Allows creating modified versions of existing retry policies without
  /// changing the original. Useful for creating environment-specific or
  /// operation-specific retry configurations.
  ///
  /// Example:
  /// ```dart
  /// final basePolicy = RetryPolicy();
  /// final aggressivePolicy = basePolicy.copyWith(
  ///   maxAttempts: 5,
  ///   initialDelayMs: 500,
  /// );
  /// ```
  RetryPolicy copyWith({
    int? maxAttempts,
    int? initialDelayMs,
    int? maxDelayMs,
    double? backoffFactor,
    double? jitterFactor,
    bool? retryNonIdempotentRequests,
    Set<int>? retryableStatusCodes,
  }) {
    return RetryPolicy(
      maxAttempts: maxAttempts ?? this.maxAttempts,
      initialDelayMs: initialDelayMs ?? this.initialDelayMs,
      maxDelayMs: maxDelayMs ?? this.maxDelayMs,
      backoffFactor: backoffFactor ?? this.backoffFactor,
      jitterFactor: jitterFactor ?? this.jitterFactor,
      retryNonIdempotentRequests:
          retryNonIdempotentRequests ?? this.retryNonIdempotentRequests,
      retryableStatusCodes: retryableStatusCodes ?? this.retryableStatusCodes,
    );
  }

  /// Calculates the delay duration for a specific retry attempt.
  ///
  /// Implements exponential backoff with jitter to determine how long to wait
  /// before the next retry attempt. The calculation considers the base delay,
  /// backoff factor, maximum delay cap, and random jitter.
  ///
  /// Parameters:
  /// - [attempt]: The attempt number (1-based, where 1 is the first retry)
  ///
  /// Returns:
  /// Duration to wait before the next retry attempt. Returns Duration.zero
  /// for attempt numbers <= 0.
  ///
  /// Example:
  /// ```dart
  /// final policy = RetryPolicy(initialDelayMs: 1000, backoffFactor: 2.0);
  /// print(policy.getDelayForAttempt(1)); // ~1000ms
  /// print(policy.getDelayForAttempt(2)); // ~2000ms
  /// print(policy.getDelayForAttempt(3)); // ~4000ms
  /// ```
  Duration getDelayForAttempt(int attempt) {
    if (attempt <= 0) return Duration.zero;

    // Calculate base delay with exponential backoff
    final baseDelay = initialDelayMs * math.pow(backoffFactor, attempt - 1);

    // Apply max delay limit
    final cappedDelay = math.min(baseDelay, maxDelayMs.toDouble());

    // Add random jitter
    final jitter =
        cappedDelay * jitterFactor * (math.Random().nextDouble() * 2 - 1);
    final finalDelay = cappedDelay + jitter;

    return Duration(milliseconds: finalDelay.round());
  }

  @override
  String toString() {
    return 'RetryPolicy('
        'maxAttempts: $maxAttempts, '
        'initialDelay: ${initialDelayMs}ms, '
        'maxDelay: ${maxDelayMs}ms, '
        'backoffFactor: $backoffFactor, '
        'jitterFactor: $jitterFactor)';
  }
}
