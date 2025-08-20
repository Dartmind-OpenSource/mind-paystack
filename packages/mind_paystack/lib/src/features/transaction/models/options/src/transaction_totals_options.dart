import 'package:dart_mappable/dart_mappable.dart';
part 'transaction_totals_options.mapper.dart';

@MappableClass()
class TransactionTotalsOptions with TransactionTotalsOptionsMappable {

  const TransactionTotalsOptions({
    this.perPage,
    this.page,
    this.from,
    this.to,
  });
  final int? perPage;
  final int? page;
  final DateTime? from;
  final DateTime? to;
}
