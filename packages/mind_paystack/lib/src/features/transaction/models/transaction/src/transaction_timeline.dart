import 'package:dart_mappable/dart_mappable.dart';
import 'package:mind_paystack/src/features/transaction/models/transaction/src/timeline_log.dart';
part 'transaction_timeline.mapper.dart';

@MappableClass()
class TransactionTimeline with TransactionTimelineMappable {
  final String idOrReference;
  final TimelineLog log;

  const TransactionTimeline({
    required this.idOrReference,
    required this.log,
  });
}
