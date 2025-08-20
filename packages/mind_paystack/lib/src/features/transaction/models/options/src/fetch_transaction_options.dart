import 'package:dart_mappable/dart_mappable.dart';

part 'fetch_transaction_options.mapper.dart';

@MappableClass()
class FetchTransactionOptions with FetchTransactionOptionsMappable {

  const FetchTransactionOptions({required this.id});
  final int id;
}
