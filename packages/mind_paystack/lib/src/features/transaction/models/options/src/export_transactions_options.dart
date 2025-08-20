import 'package:dart_mappable/dart_mappable.dart';
part 'export_transactions_options.mapper.dart';

@MappableClass()
class ExportTransactionsOptions with ExportTransactionsOptionsMappable {

  const ExportTransactionsOptions({
    this.perPage,
    this.page,
    this.from,
    this.to,
    this.customer,
    this.status,
    this.currency,
    this.amount,
    this.settled,
    this.settlement,
    this.paymentPage,
  });
  final int? perPage;
  final int? page;
  final DateTime? from;
  final DateTime? to;
  final int? customer;
  final String? status;
  final String? currency;
  final int? amount;
  final bool? settled;
  final int? settlement;
  final int? paymentPage;
}
