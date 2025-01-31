import 'dart:math' as math;

/// Configuration for request retry behavior
class RetryPolicy {
  /// Creates a new retry policy
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

  /// Maximum number of retry attempts
  final int maxAttempts;

  /// Initial delay between retries in milliseconds
  final int initialDelayMs;

  /// Maximum delay between retries in milliseconds
  final int maxDelayMs;

  /// Factor to multiply delay by for each attempt
  final double backoffFactor;

  /// Random jitter factor to add to delay (0.0 to 1.0)
  final double jitterFactor;

  /// Whether to retry non-idempotent requests (POST, PATCH)
  final bool retryNonIdempotentRequests;

  /// HTTP status codes that should trigger a retry
  final Set<int> retryableStatusCodes;

  /// Creates a copy of this retry policy with the given values
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

  /// Calculates the delay duration for a given attempt number
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
