import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_method.freezed.dart';
part 'payment_method.g.dart';

/// Represents a payment method in the Paystack system
@freezed
class PaymentMethod with _$PaymentMethod {
  const factory PaymentMethod({
    /// Unique identifier for the payment method
    required String id,

    /// Type of payment method (card, bank_account, ussd, etc.)
    required String type,

    /// Channel of the payment method (e.g., visa, mastercard, gtbank)
    required String channel,

    /// Email of the customer associated with this payment method
    required String email,

    /// Creation timestamp
    required DateTime createdAt, /// Last update timestamp
    required DateTime updatedAt, /// Currency of the payment method
    @Default('NGN') String currency,

    /// Bank code (if applicable)
    String? bankCode,

    /// Last 4 digits (for cards)
    String? last4,

    /// Expiry month (for cards)
    int? expiryMonth,

    /// Expiry year (for cards)
    int? expiryYear,

    /// Account name (for bank accounts)
    String? accountName,

    /// Account number (for bank accounts)
    String? accountNumber,

    /// Bank name (for bank accounts)
    String? bankName,

    /// Card brand (visa, mastercard, etc.)
    String? cardBrand,

    /// Card type (debit, credit)
    String? cardType,

    /// Whether this payment method is reusable
    @Default(false) bool reusable,

    /// Country code of the payment method
    @Default('NG') String country,

    /// Signature hash for the payment method
    String? signature,
  }) = _PaymentMethod;

  factory PaymentMethod.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodFromJson(json);
}
