import 'package:dart_mappable/dart_mappable.dart';
part 'charge_authorization_options.mapper.dart';

/// Options for charging a previously authorized card.
/// 
/// This class contains the parameters needed to charge a card using a
/// previously obtained authorization code. This enables recurring payments
/// or subscription charges without requiring customer interaction.
/// 
/// Example usage:
/// ```dart
/// final chargeOptions = ChargeAuthorizationOptions(
///   email: 'customer@example.com',
///   amount: '50000', // ₦500.00 in kobo
///   authorizationCode: 'AUTH_abc123',
///   reference: 'recurring_tx_456',
/// );
/// ```
@MappableClass()
class ChargeAuthorizationOptions with ChargeAuthorizationOptionsMappable {
  /// Creates a new ChargeAuthorizationOptions instance.
  /// 
  /// [email], [amount], and [authorizationCode] are required fields.
  const ChargeAuthorizationOptions({
    required this.email,
    required this.amount,
    required this.authorizationCode,
    this.reference,
    this.currency,
    this.metadata,
    this.channels,
    this.subaccount,
    this.transactionCharge,
    this.bearer,
    this.queue,
  });
  /// Customer's email address for the charge.
  /// 
  /// Must match the email used for the original authorization.
  final String email;
  
  /// Amount to charge in the smallest currency unit (as string).
  /// 
  /// For NGN: amount in kobo (e.g., '50000' for ₦500.00)
  /// For USD: amount in cents (e.g., '1000' for $10.00)
  final String amount;
  
  /// Authorization code from a previous successful transaction.
  /// 
  /// This code allows charging the customer's card without their interaction.
  /// The code must be marked as reusable.
  final String authorizationCode;
  
  /// Unique reference for this charge.
  /// 
  /// If not provided, Paystack will generate one automatically.
  final String? reference;
  
  /// Currency for the charge.
  /// 
  /// Should match the currency of the original authorization.
  /// Examples: 'NGN', 'USD', 'GHS'.
  final String? currency;
  
  /// Additional data to store with the charge.
  final Map<String, dynamic>? metadata;
  
  /// Payment channels to enable for this charge.
  /// 
  /// Usually not needed for authorization-based charges.
  final List<String>? channels;
  
  /// Subaccount to credit with part of the charge.
  final String? subaccount;
  
  /// Additional charge to add (in smallest currency unit).
  final int? transactionCharge;
  
  /// Who bears the transaction charges.
  /// 
  /// Values: 'account' or 'subaccount'.
  final String? bearer;
  
  /// Whether to queue the charge for later processing.
  /// 
  /// Useful for high-volume recurring billing scenarios.
  final bool? queue;
}
