import 'package:dart_mappable/dart_mappable.dart';
part 'partial_debit_options.mapper.dart';

/// Options for performing a partial debit on an authorized transaction.
/// 
/// This class contains the parameters needed to charge a portion of a
/// previously authorized amount. Useful for scenarios like hotel bookings
/// where an initial authorization is made and then charged in parts.
/// 
/// Example usage:
/// ```dart
/// final partialDebitOptions = PartialDebitOptions(
///   authorizationCode: 'AUTH_abc123',
///   currency: 'NGN',
///   amount: '25000', // ₦250.00 in kobo
///   email: 'customer@example.com',
/// );
/// ```
@MappableClass()
class PartialDebitOptions with PartialDebitOptionsMappable {
  /// Creates a new PartialDebitOptions instance.
  /// 
  /// All fields except [reference] and [atLeast] are required.
  const PartialDebitOptions({
    required this.authorizationCode,
    required this.currency,
    required this.amount,
    required this.email,
    this.reference,
    this.atLeast,
  });
  /// Authorization code from the original transaction.
  /// 
  /// This must be a valid authorization code that supports partial debits.
  final String authorizationCode;
  
  /// Currency for the partial debit.
  /// 
  /// Must match the currency of the original authorization.
  /// Examples: 'NGN', 'USD', 'GHS'.
  final String currency;
  
  /// Amount to debit in the smallest currency unit (as string).
  /// 
  /// For NGN: amount in kobo (e.g., '25000' for ₦250.00)
  /// Must not exceed the remaining authorized amount.
  final String amount;
  
  /// Customer's email address.
  /// 
  /// Must match the email from the original authorization.
  final String email;
  
  /// Unique reference for this partial debit.
  /// 
  /// If not provided, Paystack will generate one automatically.
  final String? reference;
  
  /// Minimum amount that must be available for the debit to proceed.
  /// 
  /// If the remaining authorized amount is less than this value,
  /// the partial debit will fail.
  final String? atLeast;
}
