import 'package:dart_mappable/dart_mappable.dart';
part 'list_transactions_options.mapper.dart';

@MappableClass()
class ListTransactionsOptions with ListTransactionsOptionsMappable {

  const ListTransactionsOptions({
    this.perPage,
    this.page,
    this.customer,
    this.terminalId,
    this.status,
    this.from,
    this.to,
    this.amount,
  });
  final int? perPage;
  final int? page;
  final int? customer;
  final String? terminalId;
  final String? status;
  final DateTime? from;
  final DateTime? to;
  final int? amount;
}
