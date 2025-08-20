import 'package:dart_mappable/dart_mappable.dart';
part 'timeline_event.mapper.dart';

@MappableClass()
class TimelineEvent with TimelineEventMappable { // keep flexible for undocumented shapes

  const TimelineEvent({
    this.type,
    this.message,
    this.time,
    this.status,
    this.data,
  });
  final String? type;
  final String? message;
  final int? time; // seconds
  final String? status; // sometimes appears in history rows
  final dynamic data;
}
