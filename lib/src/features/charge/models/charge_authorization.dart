import 'package:freezed_annotation/freezed_annotation.dart';

part 'charge_authorization.freezed.dart';
part 'charge_authorization.g.dart';

/// Represents authorization details for a successful charge
@freezed
class ChargeAuthorization with _$ChargeAuthorization {
  const factory ChargeAuthorization({
    /// Authorization code for subsequent charges
    required String authorizationCode,

    /// Card bin number
    String? bin,

    /// Last 4 digits of the card
    String? last4,

    /// Expiry month
    int? expiryMonth,

    /// Expiry year
    int? expiryYear,

    /// Card brand (visa, mastercard, etc.)
    String? brand,

    /// Card type (debit, credit)
    String? cardType,

    /// Bank name
    String? bank,

    /// Country code
    String? country,

    /// Signature hash
    String? signature,

    /// Account name (for bank accounts)
    String? accountName,

    /// Reusable status
    @Default(false) bool reusable,
  }) = _ChargeAuthorization;

  factory ChargeAuthorization.fromJson(Map<String, dynamic> json) =>
      _$ChargeAuthorizationFromJson(json);
}
