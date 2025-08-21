import 'package:dart_mappable/dart_mappable.dart';
part 'transaction_initialization.mapper.dart';

/// Contains the result of initializing a new transaction.
/// 
/// This model is returned when a transaction is successfully initialized
/// and contains the necessary URLs and codes needed to proceed with payment.
/// The customer should be redirected to the [authorizationUrl] to complete
/// the payment process.
/// 
/// Example usage:
/// ```dart
/// final initialization = TransactionInitialization(
///   authorizationUrl: 'https://checkout.paystack.com/abc123',
///   accessCode: 'access_code_abc123',
///   reference: 'tx_ref_123456',
/// );
/// 
/// // Redirect customer to authorization URL
/// await launchUrl(Uri.parse(initialization.authorizationUrl));
/// ```
@MappableClass()
class TransactionInitialization with TransactionInitializationMappable {
  /// Creates a new TransactionInitialization instance.
  /// 
  /// All fields ([authorizationUrl], [accessCode], and [reference]) are
  /// required for a complete transaction initialization response.
  const TransactionInitialization({
    required this.authorizationUrl,
    required this.accessCode,
    required this.reference,
  });
  /// URL where the customer should be redirected to complete payment.
  /// 
  /// This URL leads to Paystack's secure checkout page where the customer
  /// can enter their payment details and complete the transaction.
  @MappableField(key: 'authorization_url')
  final String authorizationUrl;
  
  /// Access code for this transaction initialization.
  /// 
  /// This code can be used with Paystack's inline JavaScript library
  /// or mobile SDKs as an alternative to the authorization URL.
  @MappableField(key: 'access_code')
  final String accessCode;
  
  /// Unique reference for the initialized transaction.
  /// 
  /// This reference can be used to verify the transaction status
  /// after the customer completes (or abandons) the payment.
  final String reference;
}
