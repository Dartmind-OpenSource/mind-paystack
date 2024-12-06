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

/// Card-specific payment errors
class PaystackCardException extends PaystackException {
  PaystackCardException({
    required String message,
    required String code,
    Map<String, dynamic>? details,
  }) : super(
          message: message,
          code: 'card_error_$code',
          details: details,
        );

  /// Factory constructor for declined card
  factory PaystackCardException.declined({String? reason}) {
    return PaystackCardException(
      message: reason ?? 'Card was declined',
      code: 'declined',
      details: {'reason': reason},
    );
  }

  /// Factory constructor for invalid card
  factory PaystackCardException.invalid({String? field}) {
    return PaystackCardException(
      message: 'Invalid card ${field ?? 'details'}',
      code: 'invalid',
      details: {'field': field},
    );
  }

  /// Factory constructor for expired card
  factory PaystackCardException.expired() {
    return PaystackCardException(
      message: 'Card has expired',
      code: 'expired',
    );
  }

  /// Factory constructor for insufficient funds
  factory PaystackCardException.insufficientFunds() {
    return PaystackCardException(
      message: 'Insufficient funds',
      code: 'insufficient_funds',
    );
  }
}

/// Network-related errors
class PaystackNetworkException extends PaystackException {
  PaystackNetworkException({
    required String message,
    required String code,
    Map<String, dynamic>? details,
  }) : super(
          message: message,
          code: 'network_error_$code',
          details: details,
        );

  /// Factory constructor for timeout
  factory PaystackNetworkException.timeout() {
    return PaystackNetworkException(
      message: 'Request timed out',
      code: 'timeout',
    );
  }

  /// Factory constructor for no internet
  factory PaystackNetworkException.noInternet() {
    return PaystackNetworkException(
      message: 'No internet connection',
      code: 'no_internet',
    );
  }
}

/// Authentication errors
class PaystackAuthException extends PaystackException {
  PaystackAuthException({
    required String message,
    required String code,
    Map<String, dynamic>? details,
  }) : super(
          message: message,
          code: 'auth_error_$code',
          details: details,
        );

  /// Factory constructor for invalid key
  factory PaystackAuthException.invalidKey() {
    return PaystackAuthException(
      message: 'Invalid API key provided',
      code: 'invalid_key',
    );
  }

  /// Factory constructor for expired key
  factory PaystackAuthException.expiredKey() {
    return PaystackAuthException(
      message: 'API key has expired',
      code: 'expired_key',
    );
  }
}

/// Validation errors
class PaystackValidationException extends PaystackException {
  /// List of validation errors by field
  final Map<String, List<String>> fieldErrors;

  PaystackValidationException({
    required String message,
    required this.fieldErrors,
    Map<String, dynamic>? details,
  }) : super(
          message: message,
          code: 'validation_error',
          details: {
            ...?details,
            'fieldErrors': fieldErrors,
          },
        );

  /// Get errors for a specific field
  List<String> getFieldErrors(String field) {
    return fieldErrors[field] ?? [];
  }

  /// Check if a specific field has errors
  bool hasFieldError(String field) {
    return fieldErrors.containsKey(field);
  }
}

/// Transaction-specific errors
class PaystackTransactionException extends PaystackException {
  PaystackTransactionException({
    required String message,
    required String code,
    Map<String, dynamic>? details,
  }) : super(
          message: message,
          code: 'transaction_error_$code',
          details: details,
        );

  /// Factory constructor for duplicate transaction
  factory PaystackTransactionException.duplicate({String? reference}) {
    return PaystackTransactionException(
      message: 'Duplicate transaction detected',
      code: 'duplicate',
      details: {'reference': reference},
    );
  }

  /// Factory constructor for failed transaction
  factory PaystackTransactionException.failed({
    String? reason,
    String? reference,
  }) {
    return PaystackTransactionException(
      message: reason ?? 'Transaction failed',
      code: 'failed',
      details: {
        'reason': reason,
        'reference': reference,
      },
    );
  }
}

/// Helper extension for error handling
extension PaystackExceptionHelper on PaystackException {
  /// Check if error is of a specific type
  bool isErrorType(String type) {
    return code.startsWith('${type}_error');
  }

  /// Get a user-friendly error message
  String get friendlyMessage {
    if (this is PaystackCardException) {
      return 'There was an issue with your card. ${message.toLowerCase()}';
    } else if (this is PaystackNetworkException) {
      return 'Connection error. Please check your internet and try again.';
    } else if (this is PaystackAuthException) {
      return 'Authentication failed. Please contact support.';
    } else if (this is PaystackValidationException) {
      return 'Please check your input and try again.';
    } else {
      return message;
    }
  }

  /// Get error metadata for logging
  Map<String, dynamic> get metadata {
    return {
      'code': code,
      'message': message,
      'type': runtimeType.toString(),
      ...?details,
    };
  }
}
