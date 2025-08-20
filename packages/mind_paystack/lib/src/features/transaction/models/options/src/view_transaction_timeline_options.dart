import 'package:dart_mappable/dart_mappable.dart';
part 'view_transaction_timeline_options.mapper.dart';

@MappableClass()
class TransactionTimelineOptions with TransactionTimelineOptionsMappable {
  final String idOrReference;

  const TransactionTimelineOptions({required this.idOrReference});
}
