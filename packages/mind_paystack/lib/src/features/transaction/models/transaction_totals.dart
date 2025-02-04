import 'package:freezed_annotation/freezed_annotation.dart';
part 'transaction_totals.freezed.dart';
part 'transaction_totals.g.dart';

@freezed
class TransactionTotals with _$TransactionTotals {
  const factory TransactionTotals({
    required int totalTransactions,
    required int uniqueCustomers,
    required int totalVolume,
    required int totalSuccessful,
    required int totalFailed,
    required int pendingTransfers,
    required Map<String, int> volumeByChannel,
    required Map<String, int> volumeByCurrency,
  }) = _TransactionTotals;

  factory TransactionTotals.fromJson(Map<String, dynamic> json) =>
      _$TransactionTotalsFromJson(json);
}
