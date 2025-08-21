import 'package:dart_mappable/dart_mappable.dart';
part 'partial_debit.mapper.dart';

/// Represents a partial debit operation on a transaction.
/// 
/// This model contains information about partial debits, which allow
/// merchants to charge a portion of an authorized amount at a later time.
/// Useful for scenarios like hotel bookings or staged payments.
/// 
/// Example usage:
/// ```dart
/// final partialDebit = PartialDebit(
///   reference: 'pd_abc123',
///   status: 'success',
///   amount: 25000, // ₦250.00 in kobo
///   currency: 'NGN',
/// );
/// ```
@MappableClass()
class PartialDebit with PartialDebitMappable {
  /// Creates a new PartialDebit instance.
  /// 
  /// All fields are required to fully identify and describe
  /// the partial debit operation.
  const PartialDebit({
    required this.reference,
    required this.status,
    required this.amount,
    required this.currency,
  });
  /// Unique reference for this partial debit operation.
  final String reference;
  
  /// Current status of the partial debit.
  /// 
  /// Common values: 'success', 'pending', 'failed'.
  final String status;
  
  /// Amount debited in the smallest currency unit.
  /// 
  /// For example, 25000 kobo = ₦250.00 for NGN.
  final int amount;
  
  /// Currency code for the debited amount.
  /// 
  /// Examples: 'NGN', 'USD', 'GHS'.
  final String currency;
}
