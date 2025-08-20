import 'package:dart_mappable/dart_mappable.dart';
import 'package:mind_paystack/src/features/transaction/models/transaction/src/pagination_meta.dart';
import 'package:mind_paystack/src/features/transaction/models/transaction/src/transaction.dart';

part 'transaction_list.mapper.dart';

@MappableClass()
class TransactionList with TransactionListMappable {

  const TransactionList({
    required this.data,
    this.meta,
  });
  final List<Transaction> data;
  final PaginationMeta? meta;
}
