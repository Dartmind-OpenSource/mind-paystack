import 'package:mind_paystack/src/core/models/src/card.dart';
import 'package:mind_paystack/src/features/charge/models/options/src/create_charge_options.dart';

/// Validation result for charge operations.
///
/// Contains validation status and detailed error information that can
/// be used to provide specific feedback to users or developers.
class ChargeValidationResult {
  /// Creates a new validation result.
  const ChargeValidationResult({
    required this.isValid,
    this.errors = const [],
    this.warnings = const [],
  });

  /// Whether the validation passed.
  final bool isValid;

  /// List of validation errors that must be fixed.
  final List<String> errors;

  /// List of validation warnings (non-blocking issues).
  final List<String> warnings;

  /// Whether there are any warnings.
  bool get hasWarnings => warnings.isNotEmpty;

  /// Whether there are any errors.
  bool get hasErrors => errors.isNotEmpty;

  /// Gets all issues (errors and warnings) combined.
  List<String> get allIssues => [...errors, ...warnings];
}

/// Comprehensive validators for charge operations.
///
/// This class provides validation methods for various aspects of charge
/// processing, including payment options, authentication data, and
/// business rules. It helps ensure data quality and provides clear
/// feedback for invalid inputs.
///
/// Key features:
/// - Comprehensive charge options validation
/// - Authentication data validation
/// - Business rule validation
/// - Localized error messages
/// - Warning detection for non-critical issues
///
/// Example usage:
/// ```dart
/// final validator = ChargeValidators();
///
/// final result = validator.validateCreateChargeOptions(options);
/// if (!result.isValid) {
///   print('Validation errors:');
///   for (final error in result.errors) {
///     print('- $error');
///   }
/// }
/// ```
class ChargeValidators {
  /// Creates a new charge validators instance.
  const ChargeValidators();

  /// Validates CreateChargeOptions for charge creation.
  ///
  /// Performs comprehensive validation of all charge creation parameters,
  /// including required fields, format validation, business rules, and
  /// payment method specific validation.
  ///
  /// Parameters:
  /// - [options]: The charge options to validate
  ///
  /// Returns:
  /// A validation result with detailed error and warning information
  ///
  /// Example:
  /// ```dart
  /// final result = validator.validateCreateChargeOptions(
  ///   CreateChargeOptions(
  ///     email: 'customer@example.com',
  ///     amount: '50000',
  ///     authorizationCode: 'AUTH_abc123',
  ///   ),
  /// );
  ///
  /// if (result.isValid) {
  ///   // Proceed with charge creation
  /// } else {
  ///   // Handle validation errors
  ///   showValidationErrors(result.errors);
  /// }
  /// ```
  ChargeValidationResult validateCreateChargeOptions(
      CreateChargeOptions options) {
    final errors = <String>[];
    final warnings = <String>[];

    // Email validation
    if (options.email.isEmpty) {
      errors.add('Email address is required');
    } else if (!_isValidEmail(options.email)) {
      errors.add('Email address format is invalid');
    }

    // Amount validation
    if (options.amount.isEmpty) {
      errors.add('Amount is required');
    } else {
      final amountValue = int.tryParse(options.amount);
      if (amountValue == null) {
        errors.add('Amount must be a valid number');
      } else if (amountValue <= 0) {
        errors.add('Amount must be greater than zero');
      } else if (amountValue < 100) {
        warnings.add('Amount is very low (less than 1 unit of currency)');
      } else if (amountValue > 1000000000) {
        warnings.add('Amount is very high - ensure this is correct');
      }
    }

    // Payment method validation
    final paymentMethodCount = _countPaymentMethods(options);
    if (paymentMethodCount == 0) {
      errors.add('At least one payment method must be specified');
    } else if (paymentMethodCount > 1) {
      errors.add('Only one payment method should be specified per charge');
    }

    // Card validation (if present)
    if (options.card != null) {
      final cardResult = validateCard(options.card!);
      errors.addAll(cardResult.errors);
      warnings.addAll(cardResult.warnings);
    }

    // Mobile money validation (if present)
    if (options.mobileMoney != null) {
      final mobileMoneyResult = _validateMobileMoney(options.mobileMoney);
      errors.addAll(mobileMoneyResult.errors);
      warnings.addAll(mobileMoneyResult.warnings);
    }

    // Bank account validation (if present)
    if (options.bank != null) {
      final bankResult = _validateBankDetails(options.bank);
      errors.addAll(bankResult.errors);
      warnings.addAll(bankResult.warnings);
    }

    // Reference validation (if present)
    if (options.reference != null && options.reference!.isNotEmpty) {
      if (options.reference!.length > 100) {
        errors.add('Transaction reference is too long (max 100 characters)');
      }
      if (!RegExp(r'^[a-zA-Z0-9_-]+$').hasMatch(options.reference!)) {
        warnings.add(
            'Transaction reference contains special characters that may cause issues');
      }
    }

    // Split payment validation
    if (options.splitCode != null && options.subaccount != null) {
      warnings.add(
          'Both split code and subaccount specified - split code will take precedence');
    }

    return ChargeValidationResult(
      isValid: errors.isEmpty,
      errors: errors,
      warnings: warnings,
    );
  }

  /// Validates card details for payment processing.
  ///
  /// Performs thorough validation of card information including number
  /// format, CVV, expiry date, and additional security checks.
  ///
  /// Parameters:
  /// - [card]: The card details to validate
  ///
  /// Returns:
  /// A validation result with card-specific error information
  ///
  /// Example:
  /// ```dart
  /// final result = validator.validateCard(
  ///   Card(
  ///     number: '4084084084084081',
  ///     cvv: '123',
  ///     expiryMonth: '12',
  ///     expiryYear: '2025',
  ///   ),
  /// );
  /// ```
  ChargeValidationResult validateCard(Card card) {
    final errors = <String>[];
    final warnings = <String>[];

    // Use the card's built-in validation
    if (!card.isValidNumber) {
      errors.add('Card number is invalid');
    }

    if (!card.isValidCvv) {
      errors.add('CVV is invalid');
    }

    if (!card.isNotExpired) {
      errors.add('Card has expired');
    }

    // Additional business rule validations
    if (card.expiryMonth.isEmpty || card.expiryYear.isEmpty) {
      errors.add('Card expiry date is required');
    }

    // Check if card expires soon (within 3 months)
    try {
      final expiryYear = int.parse(card.expiryYear);
      final expiryMonth = int.parse(card.expiryMonth);
      final expiryDate = DateTime(
        expiryYear < 100 ? 2000 + expiryYear : expiryYear,
        expiryMonth,
      );
      final threeMonthsFromNow = DateTime.now().add(const Duration(days: 90));

      if (expiryDate.isBefore(threeMonthsFromNow) &&
          expiryDate.isAfter(DateTime.now())) {
        warnings.add(
            'Card expires soon - customer may want to use a different card');
      }
    } catch (e) {
      // Expiry date parsing failed - will be caught by other validations
    }

    return ChargeValidationResult(
      isValid: errors.isEmpty,
      errors: errors,
      warnings: warnings,
    );
  }

  /// Validates PIN format for authentication.
  ///
  /// Ensures PIN meets security and format requirements.
  ///
  /// Parameters:
  /// - [pin]: The PIN to validate
  ///
  /// Returns:
  /// A validation result for the PIN
  ///
  /// Example:
  /// ```dart
  /// final result = validator.validatePin('1234');
  /// if (!result.isValid) {
  ///   showError('PIN validation failed: ${result.errors.first}');
  /// }
  /// ```
  ChargeValidationResult validatePin(String pin) {
    final errors = <String>[];
    final warnings = <String>[];

    if (pin.isEmpty) {
      errors.add('PIN is required');
    } else {
      if (pin.length != 4) {
        errors.add('PIN must be exactly 4 digits');
      }

      if (!RegExp(r'^\d+$').hasMatch(pin)) {
        errors.add('PIN must contain only digits');
      }

      // Security warnings
      if (RegExp(r'^(\d)\1{3}$').hasMatch(pin)) {
        warnings.add(
            'PIN contains repeated digits - consider using a different PIN');
      }

      if (['1234', '0000', '1111', '2222', '3333'].contains(pin)) {
        warnings.add('PIN is commonly used - consider using a more secure PIN');
      }
    }

    return ChargeValidationResult(
      isValid: errors.isEmpty,
      errors: errors,
      warnings: warnings,
    );
  }

  /// Validates OTP format for authentication.
  ///
  /// Ensures OTP meets format requirements for submission.
  ///
  /// Parameters:
  /// - [otp]: The OTP to validate
  ///
  /// Returns:
  /// A validation result for the OTP
  ///
  /// Example:
  /// ```dart
  /// final result = validator.validateOtp('123456');
  /// ```
  ChargeValidationResult validateOtp(String otp) {
    final errors = <String>[];
    final warnings = <String>[];

    if (otp.isEmpty) {
      errors.add('OTP is required');
    } else {
      if (otp.length < 4 || otp.length > 8) {
        errors.add('OTP must be between 4 and 8 digits');
      }

      if (!RegExp(r'^\d+$').hasMatch(otp)) {
        errors.add('OTP must contain only digits');
      }
    }

    return ChargeValidationResult(
      isValid: errors.isEmpty,
      errors: errors,
      warnings: warnings,
    );
  }

  /// Validates phone number format for authentication.
  ///
  /// Ensures phone number is in the correct international format.
  ///
  /// Parameters:
  /// - [phone]: The phone number to validate
  ///
  /// Returns:
  /// A validation result for the phone number
  ///
  /// Example:
  /// ```dart
  /// final result = validator.validatePhone('+2348012345678');
  /// ```
  ChargeValidationResult validatePhone(String phone) {
    final errors = <String>[];
    final warnings = <String>[];

    if (phone.isEmpty) {
      errors.add('Phone number is required');
    } else {
      if (!phone.startsWith('+')) {
        errors
            .add('Phone number must be in international format (start with +)');
      } else {
        final digits = phone.substring(1);
        if (!RegExp(r'^\d+$').hasMatch(digits)) {
          errors.add('Phone number must contain only digits after the + sign');
        } else if (digits.length < 10 || digits.length > 15) {
          errors.add('Phone number must be between 10 and 15 digits');
        }
      }
    }

    return ChargeValidationResult(
      isValid: errors.isEmpty,
      errors: errors,
      warnings: warnings,
    );
  }

  /// Validates birthday format for authentication.
  ///
  /// Ensures birthday is in the correct format and represents a valid date.
  ///
  /// Parameters:
  /// - [birthday]: The birthday to validate (YYYY-MM-DD format)
  ///
  /// Returns:
  /// A validation result for the birthday
  ///
  /// Example:
  /// ```dart
  /// final result = validator.validateBirthday('1990-05-15');
  /// ```
  ChargeValidationResult validateBirthday(String birthday) {
    final errors = <String>[];
    final warnings = <String>[];

    if (birthday.isEmpty) {
      errors.add('Birthday is required');
    } else {
      if (!RegExp(r'^\d{4}-\d{2}-\d{2}$').hasMatch(birthday)) {
        errors.add('Birthday must be in YYYY-MM-DD format');
      } else {
        try {
          final date = DateTime.parse(birthday);
          final now = DateTime.now();

          if (date.isAfter(now)) {
            errors.add('Birthday cannot be in the future');
          } else {
            final age = now.year - date.year;
            if (age > 150) {
              errors.add('Birthday indicates impossible age');
            } else if (age < 13) {
              warnings.add('Customer appears to be under 13 years old');
            }
          }
        } catch (e) {
          errors.add('Birthday is not a valid date');
        }
      }
    }

    return ChargeValidationResult(
      isValid: errors.isEmpty,
      errors: errors,
      warnings: warnings,
    );
  }

  /// Validates address information for verification.
  ///
  /// Ensures all required address fields are present and properly formatted.
  ///
  /// Parameters:
  /// - [address]: Street address
  /// - [city]: City name
  /// - [state]: State or province
  /// - [zipcode]: ZIP or postal code
  ///
  /// Returns:
  /// A validation result for the address
  ///
  /// Example:
  /// ```dart
  /// final result = validator.validateAddress(
  ///   '123 Main Street',
  ///   'Lagos',
  ///   'Lagos',
  ///   '100001',
  /// );
  /// ```
  ChargeValidationResult validateAddress(
    String address,
    String city,
    String state,
    String zipcode,
  ) {
    final errors = <String>[];
    final warnings = <String>[];

    if (address.trim().isEmpty) {
      errors.add('Street address is required');
    } else if (address.trim().length < 5) {
      warnings.add('Street address seems too short');
    }

    if (city.trim().isEmpty) {
      errors.add('City is required');
    } else if (city.trim().length < 2) {
      errors.add('City name is too short');
    }

    if (state.trim().isEmpty) {
      errors.add('State is required');
    } else if (state.trim().length < 2) {
      errors.add('State name is too short');
    }

    if (zipcode.trim().isEmpty) {
      errors.add('ZIP/Postal code is required');
    } else {
      // Basic ZIP code format validation
      if (!RegExp(r'^[A-Z0-9\s-]{3,12}$', caseSensitive: false)
          .hasMatch(zipcode.trim())) {
        warnings.add('ZIP/Postal code format may be invalid');
      }
    }

    return ChargeValidationResult(
      isValid: errors.isEmpty,
      errors: errors,
      warnings: warnings,
    );
  }

  /// Validates email address format.
  bool _isValidEmail(String email) {
    return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(email);
  }

  /// Counts the number of payment methods specified in options.
  int _countPaymentMethods(CreateChargeOptions options) {
    var count = 0;
    if (options.card != null) count++;
    if (options.authorizationCode != null &&
        options.authorizationCode!.isNotEmpty) count++;
    if (options.bank != null) count++;
    if (options.bankTransfer != null) count++;
    if (options.ussd != null) count++;
    if (options.mobileMoney != null) count++;
    if (options.qr != null) count++;
    return count;
  }

  /// Validates mobile money details.
  ChargeValidationResult _validateMobileMoney(dynamic mobileMoney) {
    final errors = <String>[];
    final warnings = <String>[];

    // This is a placeholder - actual implementation would depend on the MobileMoney class structure
    // Add specific validation based on provider, phone number format, etc.

    return ChargeValidationResult(
      isValid: errors.isEmpty,
      errors: errors,
      warnings: warnings,
    );
  }

  /// Validates bank account details.
  ChargeValidationResult _validateBankDetails(dynamic bank) {
    final errors = <String>[];
    final warnings = <String>[];

    // This is a placeholder - actual implementation would depend on the
    // BankDetails class structure
    // Add specific validation for account number format, bank code, etc.

    return ChargeValidationResult(
      isValid: errors.isEmpty,
      errors: errors,
      warnings: warnings,
    );
  }
}
