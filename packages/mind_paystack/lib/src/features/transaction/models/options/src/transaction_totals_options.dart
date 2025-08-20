import 'package:dart_mappable/dart_mappable.dart';
part 'transaction_totals_options.mapper.dart';

@MappableClass()
class TransactionTotalsOptions with TransactionTotalsOptionsMappable {
  final int? perPage;
  final int? page;
  final DateTime? from;
  final DateTime? to;

  const TransactionTotalsOptions({
    this.perPage,
    this.page,
    this.from,
    this.to,
  });
}
