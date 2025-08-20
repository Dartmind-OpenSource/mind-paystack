import 'package:dart_mappable/dart_mappable.dart';
import 'package:mind_paystack/src/features/transaction/models/transaction/src/currency_amount.dart';
part 'transaction_totals.mapper.dart';

@MappableClass()
class TransactionTotals with TransactionTotalsMappable {
  @MappableField(key: 'total_transactions')
  final int? totalTransactions;
  @MappableField(key: 'unique_customers')
  final int? uniqueCustomers;
  @MappableField(key: 'total_volume')
  final int? totalVolume; // subunits
  @MappableField(key: 'total_volume_by_currency')
  final List<CurrencyAmount>? totalVolumeByCurrency;
  @MappableField(key: 'pending_transfers')
  final int? pendingTransfers;
  @MappableField(key: 'pending_transactions')
  final int? pendingTransactions;
  @MappableField(key: 'disabled_transactions')
  final int? disabledTransactions;

  const TransactionTotals({
    this.totalTransactions,
    this.uniqueCustomers,
    this.totalVolume,
    this.totalVolumeByCurrency,
    this.pendingTransfers,
    this.pendingTransactions,
    this.disabledTransactions,
  });
}
