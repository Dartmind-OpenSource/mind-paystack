// lib/src/core/exceptions.dart

/// Base exception class for Mind Paystack SDK
class PaystackException implements Exception {
  /// Human-readable error message
  final String message;

  /// Error code for programmatic handling
  final String code;

  /// Additional error details
  final Map<String, dynamic>? details;

  PaystackException({
    required this.message,
    required this.code,
    this.details,
  });

  @override
  String toString() => 'PaystackException: $message (Code: $code)';
}