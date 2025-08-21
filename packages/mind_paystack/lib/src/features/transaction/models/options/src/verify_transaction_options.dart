import 'package:dart_mappable/dart_mappable.dart';
part 'verify_transaction_options.mapper.dart';

/// Options for verifying a transaction's status and details.
/// 
/// This class contains the parameters needed to verify a transaction
/// after a customer has completed or abandoned a payment attempt.
/// Verification should be done on your backend to confirm payment status.
/// 
/// Example usage:
/// ```dart
/// final verifyOptions = VerifyTransactionOptions(
///   reference: 'tx_abc123456',
/// );
/// 
/// final result = await sdk.transaction.verify(verifyOptions);
/// if (result.data.status == 'success') {
///   // Payment was successful
/// }
/// ```
@MappableClass()
class VerifyTransactionOptions with VerifyTransactionOptionsMappable {
  /// Creates a new VerifyTransactionOptions instance.
  /// 
  /// The [reference] is required and must match the reference of the
  /// transaction to be verified.
  const VerifyTransactionOptions({required this.reference});
  
  /// Transaction reference to verify.
  /// 
  /// This should be the same reference used when initializing the transaction
  /// or the reference returned from the initialization response.
  final String reference;
}
