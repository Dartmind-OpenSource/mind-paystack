import 'package:dart_mappable/dart_mappable.dart';
import 'package:mind_paystack/src/features/transaction/models/transaction/src/timeline_event.dart';
part 'timeline_log.mapper.dart';

@MappableClass()
class TimelineLog with TimelineLogMappable {
  @MappableField(key: 'time_spent')
  final int? timeSpent;
  final int? attempts;
  final dynamic authentication; // e.g. "pin", may be string or structured
  final int? errors;
  final bool? success;
  final bool? mobile;
  final List<dynamic>? input; // free-form
  final String? channel; // e.g. card
  final List<TimelineEvent>? history;

  const TimelineLog({
    this.timeSpent,
    this.attempts,
    this.authentication,
    this.errors,
    this.success,
    this.mobile,
    this.input,
    this.channel,
    this.history,
  });
}
