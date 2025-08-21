import 'package:dart_mappable/dart_mappable.dart';
import 'package:mind_paystack/src/features/transaction/models/transaction/src/currency_amount.dart';
part 'transaction_totals.mapper.dart';

/// Contains aggregated statistics and totals for transactions.
/// 
/// This model provides summary information about transaction volumes,
/// customer counts, and various transaction states. Used for analytics
/// and reporting purposes to give merchants insight into their payment data.
/// 
/// Example usage:
/// ```dart
/// final totals = TransactionTotals(
///   totalTransactions: 1500,
///   uniqueCustomers: 890,
///   totalVolume: 75000000, // ₦750,000.00 in kobo
///   pendingTransactions: 25,
/// );
/// 
/// // Display analytics
/// print('Processed ${totals.totalTransactions} transactions');
/// print('From ${totals.uniqueCustomers} unique customers');
/// ```
@MappableClass()
class TransactionTotals with TransactionTotalsMappable {
  /// Creates a new TransactionTotals instance.
  /// 
  /// All fields are optional as different API endpoints may provide
  /// different levels of statistical information.
  const TransactionTotals({
    this.totalTransactions,
    this.uniqueCustomers,
    this.totalVolume,
    this.totalVolumeByCurrency,
    this.pendingTransfers,
    this.pendingTransactions,
    this.disabledTransactions,
  });
  /// Total number of transactions processed.
  @MappableField(key: 'total_transactions')
  final int? totalTransactions;
  
  /// Number of unique customers who made transactions.
  @MappableField(key: 'unique_customers')
  final int? uniqueCustomers;
  
  /// Total transaction volume in the smallest currency unit.
  /// 
  /// Represents the sum of all transaction amounts processed.
  /// For multi-currency accounts, this may be in the primary currency.
  @MappableField(key: 'total_volume')
  final int? totalVolume;
  
  /// Total transaction volume broken down by currency.
  /// 
  /// Provides currency-specific volume totals when dealing with
  /// multiple currencies in the same account.
  @MappableField(key: 'total_volume_by_currency')
  final List<CurrencyAmount>? totalVolumeByCurrency;
  
  /// Number of transfers that are currently pending.
  @MappableField(key: 'pending_transfers')
  final int? pendingTransfers;
  
  /// Number of transactions that are currently pending completion.
  @MappableField(key: 'pending_transactions')
  final int? pendingTransactions;
  
  /// Number of transactions that have been disabled or blocked.
  @MappableField(key: 'disabled_transactions')
  final int? disabledTransactions;
}
