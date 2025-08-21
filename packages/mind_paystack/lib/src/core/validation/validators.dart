import 'package:mind_paystack/src/core/validation/validation_result.dart';

/// Abstract base class for all validators.
///
/// Validators implement a single method that takes a value of type T
/// and returns a ValidationResult indicating success or failure.
///
/// ## Creating Custom Validators
///
/// ```dart
/// class PasswordValidator implements Validator<String> {
///   @override
///   ValidationResult validate(String password) {
///     if (password.length < 8) {
// ignore: lines_longer_than_80_chars
///       return ValidationResult.failure('Password must be at least 8 characters');
///     }
///     return ValidationResult.success();
///   }
/// }
/// ```
sealed class Validator<T> {
  /// Validates the given value and returns a validation result.
  ///
  /// [value] The value to validate
  ///
  /// Returns [ValidationResult.success] if validation passes,
  /// [ValidationResult.failure] with an error message if it fails.
  ValidationResult validate(T value);
}

/// Validates email addresses according to a basic email format.
///
/// This validator checks for:
/// - Non-empty email
/// - Basic email format (contains @ and domain)
/// - Reasonable length limits
///
/// Example:
/// ```dart
/// final validator = EmailValidator();
/// final result = validator.validate('user@example.com');
/// ```
class EmailValidator implements Validator<String> {
  /// Creates an email validator with optional custom requirements.
  ///
  /// [maxLength] Maximum allowed length for email (default: 254)
  /// [allowEmpty] Whether to allow empty emails (default: false)
  const EmailValidator({
    this.maxLength = 254,
    this.allowEmpty = false,
  });

  /// Maximum allowed email length
  final int maxLength;

  /// Whether empty emails are allowed
  final bool allowEmpty;

  /// Regular expression for basic email validation
  static final RegExp _emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  @override
  ValidationResult validate(String email) {
    // Check if empty
    if (email.isEmpty) {
      return allowEmpty
          ? const ValidationResult.success()
          : const ValidationResult.failure('Email is required');
    }

    // Check length
    if (email.length > maxLength) {
      return ValidationResult.failure(
        'Email must not exceed $maxLength characters',
      );
    }

    // Check format
    if (!_emailRegex.hasMatch(email)) {
      return const ValidationResult.failure(
        'Please enter a valid email address',
      );
    }

    return const ValidationResult.success();
  }
}

/// Validates monetary amounts with configurable constraints.
///
/// This validator can check for:
/// - Minimum and maximum amounts
/// - Currency-specific rules
/// - Positive amounts only
///
/// Example:
/// ```dart
/// final validator = AmountValidator(
///   minAmount: Money.fromMajor(1.0, Currency.ngn),
///   maxAmount: Money.fromMajor(1000000.0, Currency.ngn),
/// );
/// ```
class AmountValidator implements Validator<String> {
  /// Creates an amount validator with optional constraints.
  ///
  /// [minAmountKobo] Minimum amount in kobo/cents (default: 100)
  /// [maxAmountKobo] Maximum amount in kobo/cents (optional)
  /// [currency] Expected currency code (optional)
  /// [allowZero] Whether zero amounts are allowed (default: false)
  const AmountValidator({
    this.minAmountKobo = 100, // ₦1.00 minimum
    this.maxAmountKobo,
    this.currency,
    this.allowZero = false,
  });

  /// Minimum amount in subunits (kobo/cents)
  final int minAmountKobo;

  /// Maximum amount in subunits (kobo/cents)
  final int? maxAmountKobo;

  /// Expected currency code
  final String? currency;

  /// Whether zero amounts are allowed
  final bool allowZero;

  @override
  ValidationResult validate(String amountString) {
    // Check if empty
    if (amountString.isEmpty) {
      return const ValidationResult.failure('Amount is required');
    }

    // Parse amount
    final amount = int.tryParse(amountString);
    if (amount == null) {
      return const ValidationResult.failure('Amount must be a valid number');
    }

    // Check for zero
    if (amount == 0 && !allowZero) {
      return const ValidationResult.failure('Amount must be greater than zero');
    }

    // Check for negative
    if (amount < 0) {
      return const ValidationResult.failure('Amount cannot be negative');
    }

    // Check minimum
    if (amount < minAmountKobo) {
      final minMajor = minAmountKobo / 100;
      return ValidationResult.failure(
        'Amount must be at least ${_formatAmount(minMajor)}',
      );
    }

    // Check maximum
    if (maxAmountKobo != null && amount > maxAmountKobo!) {
      final maxMajor = maxAmountKobo! / 100;
      return ValidationResult.failure(
        'Amount cannot exceed ${_formatAmount(maxMajor)}',
      );
    }

    return const ValidationResult.success();
  }

  String _formatAmount(double amount) {
    if (currency != null) {
      final symbol = _getCurrencySymbol(currency!);
      return '$symbol${amount.toStringAsFixed(2)}';
    }
    return amount.toStringAsFixed(2);
  }

  String _getCurrencySymbol(String currencyCode) {
    switch (currencyCode.toUpperCase()) {
      case 'NGN':
        return '₦';
      case 'USD':
        return r'$';
      case 'GHS':
        return 'GH₵';
      case 'ZAR':
        return 'R';
      case 'KES':
        return 'KSh';
      default:
        return currencyCode;
    }
  }
}

/// Validates transaction references for uniqueness and format.
///
/// This validator ensures that transaction references:
/// - Are not empty (unless optional)
/// - Follow the expected format
/// - Are within length limits
/// - Contain only allowed characters
///
/// Example:
/// ```dart
/// final validator = ReferenceValidator();
/// final result = validator.validate('txn_123456789');
/// ```
class ReferenceValidator implements Validator<String?> {
  /// Creates a reference validator with optional custom rules.
  ///
  /// [isRequired] Whether a reference is required (default: false)
  /// [minLength] Minimum reference length (default: 3)
  /// [maxLength] Maximum reference length (default: 100)
  /// [allowedPattern] Pattern for allowed characters
  const ReferenceValidator({
    this.isRequired = false,
    this.minLength = 3,
    this.maxLength = 100,
    this.allowedPattern,
  });

  /// Whether a reference is required
  final bool isRequired;

  /// Minimum reference length
  final int minLength;

  /// Maximum reference length
  final int maxLength;

  /// Pattern for allowed characters
  final RegExp? allowedPattern;

  /// Default pattern for transaction references
  static final RegExp _defaultPattern = RegExp(r'^[a-zA-Z0-9_-]+$');

  @override
  ValidationResult validate(String? reference) {
    // Check if required
    if (reference == null || reference.isEmpty) {
      return isRequired
          ? const ValidationResult.failure('Transaction reference is required')
          : const ValidationResult.success();
    }

    // Check length
    if (reference.length < minLength) {
      return ValidationResult.failure(
        'Reference must be at least $minLength characters',
      );
    }

    if (reference.length > maxLength) {
      return ValidationResult.failure(
        'Reference must not exceed $maxLength characters',
      );
    }

    // Check format
    final pattern = allowedPattern ?? _defaultPattern;
    if (!pattern.hasMatch(reference)) {
      return const ValidationResult.failure(
        'Reference can only contain letters, numbers, hyphens, and underscores',
      );
    }

    return const ValidationResult.success();
  }
}

/// Validates callback URLs for proper format and security.
///
/// This validator ensures that callback URLs:
/// - Are valid URLs when provided
/// - Use HTTPS for security (configurable)
/// - Are not too long
/// - Point to allowed domains (if specified)
///
/// Example:
/// ```dart
/// final validator = CallbackUrlValidator(requireHttps: true);
/// final result = validator.validate('https://example.com/callback');
/// ```
class CallbackUrlValidator implements Validator<String?> {
  /// Creates a callback URL validator with security options.
  ///
  /// [isRequired] Whether a callback URL is required (default: false)
  /// [requireHttps] Whether HTTPS is required (default: true)
  /// [maxLength] Maximum URL length (default: 2048)
  /// [allowedDomains] List of allowed domains (optional)
  const CallbackUrlValidator({
    this.isRequired = false,
    this.requireHttps = true,
    this.maxLength = 2048,
    this.allowedDomains,
  });

  /// Whether a callback URL is required
  final bool isRequired;

  /// Whether HTTPS is required
  final bool requireHttps;

  /// Maximum URL length
  final int maxLength;

  /// List of allowed domains
  final List<String>? allowedDomains;

  @override
  ValidationResult validate(String? url) {
    // Check if required
    if (url == null || url.isEmpty) {
      return isRequired
          ? const ValidationResult.failure('Callback URL is required')
          : const ValidationResult.success();
    }

    // Check length
    if (url.length > maxLength) {
      return ValidationResult.failure(
        'URL must not exceed $maxLength characters',
      );
    }

    // Parse URL
    final Uri? uri;
    try {
      uri = Uri.parse(url);
    } catch (e) {
      return const ValidationResult.failure('Please enter a valid URL');
    }

    // Check scheme
    if (uri.scheme.isEmpty) {
      return const ValidationResult.failure(
        'URL must include a protocol (http/https)',
      );
    }

    if (requireHttps && uri.scheme.toLowerCase() != 'https') {
      return const ValidationResult.failure(
        'Callback URL must use HTTPS for security',
      );
    }

    if (!['http', 'https'].contains(uri.scheme.toLowerCase())) {
      return const ValidationResult.failure(
        'URL must use HTTP or HTTPS protocol',
      );
    }

    // Check host
    if (uri.host.isEmpty) {
      return const ValidationResult.failure('URL must include a valid domain');
    }

    // Check allowed domains
    if (allowedDomains != null && !allowedDomains!.contains(uri.host)) {
      return ValidationResult.failure(
        'Domain ${uri.host} is not allowed for callback URLs',
      );
    }

    return const ValidationResult.success();
  }
}

/// Validator for combining multiple validators into a single validation chain.
///
/// This allows you to run multiple validation rules on the same value
/// and collect all validation errors.
///
/// Example:
/// ```dart
/// final validator = CompositeValidator([
///   EmailValidator(),
///   LengthValidator(maxLength: 100),
/// ]);
/// ```
class CompositeValidator<T> implements Validator<T> {
  /// Creates a composite validator from a list of validators.
  ///
  /// [validators] List of validators to run
  /// [stopOnFirstFailure] Whether to stop after the
  /// first failure (default: false)
  const CompositeValidator(
    this.validators, {
    this.stopOnFirstFailure = false,
  });

  /// List of validators to run
  final List<Validator<T>> validators;

  /// Whether to stop after the first failure
  final bool stopOnFirstFailure;

  @override
  ValidationResult validate(T value) {
    final errors = <String>[];

    for (final validator in validators) {
      final result = validator.validate(value);
      if (result.isFailure) {
        errors.add(result.errorMessage!);
        if (stopOnFirstFailure) {
          return ValidationResult.failure(errors.first);
        }
      }
    }

    if (errors.isEmpty) {
      return const ValidationResult.success();
    }

    return ValidationResult.failure(errors.join('; '));
  }
}
