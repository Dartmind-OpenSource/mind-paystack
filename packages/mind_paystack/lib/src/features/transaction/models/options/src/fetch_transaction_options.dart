import 'package:dart_mappable/dart_mappable.dart';

part 'fetch_transaction_options.mapper.dart';

@MappableClass()
class FetchTransactionOptions with FetchTransactionOptionsMappable {
  final int id;

  const FetchTransactionOptions({required this.id});
}
