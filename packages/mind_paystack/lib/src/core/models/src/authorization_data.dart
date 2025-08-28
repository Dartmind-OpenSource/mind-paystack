import 'package:dart_mappable/dart_mappable.dart';
part 'authorization_data.mapper.dart';

/// Contains authorization details for card transactions.
///
/// This model stores information about card authorizations that can be used
/// for recurring payments or future transactions. It includes card details,
/// authorization codes, and reusability flags.
///
/// Example usage:
/// ```dart
/// final authData = AuthorizationData(
///   authorizationCode: 'AUTH_abc123',
///   last4: '1234',
///   expMonth: '12',
///   expYear: '2025',
///   cardType: 'visa',
///   reusable: true,
/// );
/// ```
@MappableClass()
class AuthorizationData with AuthorizationDataMappable {
  /// Creates a new AuthorizationData instance.
  ///
  /// The [authorizationCode] is required and represents the unique
  /// authorization token for this card authorization.
  const AuthorizationData({
    required this.authorizationCode,
    this.bin,
    this.last4,
    this.expMonth,
    this.expYear,
    this.channel,
    this.cardType,
    this.bank,
    this.countryCode,
    this.brand,
    this.signature,
    this.reusable,
    this.accountName,
  });

  /// Unique authorization code for this card authorization.
  ///
  /// This code can be used for recurring charges or future transactions
  /// when [reusable] is true.
  @MappableField(key: 'authorization_code')
  final String authorizationCode;

  /// Bank Identification Number (first 6 digits of the card).
  final String? bin;

  /// Last 4 digits of the card number for identification.
  final String? last4;

  /// Card expiry month (MM format).
  @MappableField(key: 'exp_month')
  final String? expMonth;

  /// Card expiry year (YYYY format).
  @MappableField(key: 'exp_year')
  final String? expYear;

  /// Payment channel used for this authorization.
  ///
  /// Common value: `'card'` for card payments.
  final String? channel;

  /// Type of card used for the transaction.
  ///
  /// Examples: `'visa'`, `'mastercard'`, `'verve'`.
  @MappableField(key: 'card_type')
  final String? cardType;

  /// Name of the issuing bank.
  final String? bank;

  /// Country code where the card was issued.
  ///
  /// Uses ISO 3166-1 alpha-2 codes (e.g., 'NG', 'US', 'GB').
  @MappableField(key: 'country_code')
  final String? countryCode;

  /// Card brand identifier.
  ///
  /// Examples: `'visa'`, `'mastercard'`, `'american express'`.
  final String? brand;

  /// Digital signature for this authorization.
  final String? signature;

  /// Whether this authorization can be used for future transactions.
  ///
  /// When `true`, the [authorizationCode] can be used for recurring charges.
  final bool? reusable;

  /// Account name associated with the card.
  @MappableField(key: 'account_name')
  final String? accountName;
}
