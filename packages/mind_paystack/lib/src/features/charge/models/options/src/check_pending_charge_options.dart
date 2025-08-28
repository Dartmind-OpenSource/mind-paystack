import 'package:dart_mappable/dart_mappable.dart';
part 'check_pending_charge_options.mapper.dart';

/// Options for checking the status of a pending charge transaction.
///
/// This class provides the necessary information to query the current
/// status of a charge that may still be processing or awaiting additional
/// authentication steps. It's commonly used to poll transaction status
/// after initiating a charge that requires async processing.
///
/// The charge status check is typically used in scenarios where:
/// - A charge was initiated but requires additional verification
/// - The client needs to monitor transaction progress
/// - Confirming final payment status after authentication flows
///
/// Example usage:
/// ```dart
/// final options = CheckPendingChargeOptions(
///   reference: 'TXN_123456789',
/// );
/// 
/// final status = await paystackClient.checkPendingCharge(options);
/// ```
@MappableClass()
class CheckPendingChargeOptions with CheckPendingChargeOptionsMappable {
  /// Creates options for checking a pending charge transaction status.
  ///
  /// Parameters:
  /// - [reference]: Unique transaction reference from the original charge
  const CheckPendingChargeOptions({
    required this.reference,
  });

  /// Unique reference identifier for the transaction to check.
  ///
  /// This is the same reference used when the original charge was created.
  /// It serves as the primary identifier to retrieve the current status
  /// and details of the pending transaction.
  final String reference;
}
