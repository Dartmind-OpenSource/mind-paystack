import 'package:dart_mappable/dart_mappable.dart';

part 'card.mapper.dart';

/// Represents card details for payment processing.
///
/// This model contains the card information required to process a payment
/// charge. It includes all necessary card details like number, expiry,
/// CVV, and additional metadata for payment processing.
///
/// The card details are used when creating charges with card payments
/// and should be collected securely from the customer.
///
/// Example usage:
/// ```dart
/// final card = Card(
///   number: '4084084084084081', // Test card number
///   cvv: '123',
///   expiryMonth: '12',
///   expiryYear: '2025',
///   pin: '1234', // For debit cards requiring PIN
/// );
/// ```
///
/// Security considerations:
/// - Card details should be transmitted securely (HTTPS)
/// - PCI DSS compliance is required when handling card data
/// - Consider using Paystack's tokenization for sensitive data
@Deprecated('Card functionality is deprecated due to PCI DSS compliance '
    'requirements and will be removed in a future version')
@MappableClass()
class Card with CardMappable {
  /// Creates a new Card instance with the required payment details.
  @Deprecated('Card constructor is deprecated due to PCI DSS compliance '
      'requirements and will be removed in a future version')
  ///
  /// Parameters:
  /// - [number]: Complete card number (PAN)
  /// - [cvv]: Card verification value (3-4 digits)
  /// - [expiryMonth]: Card expiry month (MM format)
  /// - [expiryYear]: Card expiry year (YYYY format)
  /// - [pin]: PIN for debit cards (optional)
  const Card({
    required this.number,
    required this.cvv,
    required this.expiryMonth,
    required this.expiryYear,
    this.pin,
  });

  /// The complete card number (Primary Account Number).
  ///
  /// This should be the full card number as printed on the card,
  /// typically 13-19 digits. Common formats:
  /// - Visa: 16 digits starting with 4
  /// - Mastercard: 16 digits starting with 5
  /// - American Express: 15 digits starting with 3
  /// - Verve: 16-19 digits starting with 5061, 5078, 6500
  ///
  /// Example: '4084084084084081' (test card)
  final String number;

  /// Card Verification Value (CVV/CVC/CID).
  ///
  /// The security code printed on the card:
  /// - Visa/Mastercard: 3 digits on the back
  /// - American Express: 4 digits on the front
  ///
  /// Example: '123' or '1234'
  final String cvv;

  /// Card expiry month in MM format.
  ///
  /// The month when the card expires, expressed as a 2-digit string.
  /// Examples: '01' for January, '12' for December
  @MappableField(key: 'expiry_month')
  final String expiryMonth;

  /// Card expiry year in YYYY format.
  ///
  /// The year when the card expires, expressed as a 4-digit string.
  /// Example: '2025', '2028'
  @MappableField(key: 'expiry_year')
  final String expiryYear;

  /// PIN for debit cards that require PIN authorization.
  ///
  /// This is typically a 4-digit PIN used for debit card transactions.
  /// Not required for all card types, but necessary for cards that
  /// require PIN verification during the payment process.
  ///
  /// Example: '1234'
  final String? pin;

  /// Gets the last 4 digits of the card number for display purposes.
  ///
  /// This is safe to display in UI and logs as it doesn't compromise
  /// card security while still providing card identification.
  String get last4 =>
      number.length >= 4 ? number.substring(number.length - 4) : number;

  /// Gets the card type based on the card number pattern.
  ///
  /// Returns a string indicating the probable card type based on
  /// the card number's prefix patterns. This is useful for UI
  /// display and validation.
  ///
  /// Common return values:
  /// - 'visa': Visa cards
  /// - 'mastercard': Mastercard
  /// - 'american_express': American Express
  /// - 'verve': Verve cards (Nigeria)
  /// - 'unknown': Unrecognized pattern
  String get cardType {
    if (number.isEmpty) return 'unknown';

    // Remove any spaces or dashes
    final cleanNumber = number.replaceAll(RegExp(r'[\s-]'), '');

    // Visa: starts with 4
    if (RegExp('^4').hasMatch(cleanNumber)) {
      return 'visa';
    }

    // Mastercard: starts with 5[1-5] or 2[2-7]
    if (RegExp('^5[1-5]|^2[2-7]').hasMatch(cleanNumber)) {
      return 'mastercard';
    }

    // American Express: starts with 34 or 37
    if (RegExp('^3[47]').hasMatch(cleanNumber)) {
      return 'american_express';
    }

    // Verve: starts with 5061, 5078, 6500, or 507
    if (RegExp('^5061|^5078|^6500|^507').hasMatch(cleanNumber)) {
      return 'verve';
    }

    // Discover: starts with 6011, 65, or 644-649
    if (RegExp('^6011|^65|^64[4-9]').hasMatch(cleanNumber)) {
      return 'discover';
    }

    return 'unknown';
  }

  /// Validates the card number using Luhn algorithm.
  ///
  /// The Luhn algorithm is used to validate credit card numbers
  /// and catch simple errors in card number entry. This provides
  /// basic validation before sending to payment processor.
  ///
  /// Returns `true` if the card number passes Luhn validation,
  /// `false` otherwise.
  bool get isValidNumber {
    if (number.isEmpty) return false;

    // Remove any spaces or dashes
    final cleanNumber = number.replaceAll(RegExp(r'[\s-]'), '');

    // Check if all characters are digits
    if (!RegExp(r'^\d+$').hasMatch(cleanNumber)) return false;

    // Check length (most cards are 13-19 digits)
    if (cleanNumber.length < 13 || cleanNumber.length > 19) return false;

    // Luhn algorithm
    var sum = 0;
    var alternate = false;

    for (var i = cleanNumber.length - 1; i >= 0; i--) {
      var digit = int.parse(cleanNumber[i]);

      if (alternate) {
        digit *= 2;
        if (digit > 9) {
          digit = (digit % 10) + 1;
        }
      }

      sum += digit;
      alternate = !alternate;
    }

    return (sum % 10) == 0;
  }

  /// Validates that the card expiry date is in the future.
  ///
  /// Checks if the card expiry date (month/year) is after the current
  /// date. This helps catch expired cards before sending to the
  /// payment processor.
  ///
  /// Returns `true` if the card expires in the future, `false` if
  /// the card is expired or has invalid date format.
  bool get isNotExpired {
    try {
      final month = int.parse(expiryMonth);
      final year = int.parse(expiryYear);

      if (month < 1 || month > 12) return false;

      final now = DateTime.now();
      final expiryDate =
          DateTime(year, month + 1); // First day of month after expiry

      return expiryDate.isAfter(now);
    } catch (e) {
      return false; // Invalid date format
    }
  }

  /// Validates the CVV format based on card type.
  ///
  /// Different card types have different CVV lengths:
  /// - Visa/Mastercard/Verve: 3 digits
  /// - American Express: 4 digits
  ///
  /// Returns `true` if CVV format is valid for the detected card type.
  bool get isValidCvv {
    if (cvv.isEmpty) return false;

    // Check if all characters are digits
    if (!RegExp(r'^\d+$').hasMatch(cvv)) return false;

    switch (cardType) {
      case 'american_express':
        return cvv.length == 4;
      case 'visa':
      case 'mastercard':
      case 'verve':
      case 'discover':
        return cvv.length == 3;
      default:
        return cvv.length == 3 || cvv.length == 4;
    }
  }

  /// Comprehensive card validation.
  ///
  /// Validates all card details including number, expiry date, and CVV.
  /// This is a convenience method that runs all validation checks.
  ///
  /// Returns `true` if all card details are valid, `false` otherwise.
  bool get isValid {
    return isValidNumber && isNotExpired && isValidCvv;
  }
}
