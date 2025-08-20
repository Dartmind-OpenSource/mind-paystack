import 'package:dart_mappable/dart_mappable.dart';
part 'view_transaction_timeline_options.mapper.dart';

@MappableClass()
class TransactionTimelineOptions with TransactionTimelineOptionsMappable {

  const TransactionTimelineOptions({required this.idOrReference});
  final String idOrReference;
}
