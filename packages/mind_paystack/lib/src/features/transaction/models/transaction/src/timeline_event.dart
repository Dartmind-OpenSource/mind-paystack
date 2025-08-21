import 'package:dart_mappable/dart_mappable.dart';
part 'timeline_event.mapper.dart';

/// Represents a single event in a transaction's processing timeline.
/// 
/// This model captures individual steps or events that occur during
/// transaction processing, including event type, timestamp, status, and
/// associated data. The structure is kept flexible to accommodate
/// various event types from Paystack's processing pipeline.
/// 
/// Example usage:
/// ```dart
/// final event = TimelineEvent(
///   type: 'input',
///   message: 'Waiting for customer input',
///   time: 1234567890,
///   status: 'pending',
/// );
/// ```
@MappableClass()
class TimelineEvent with TimelineEventMappable {
  /// Creates a new TimelineEvent instance.
  /// 
  /// All fields are optional to accommodate the flexible nature
  /// of different event types in the transaction timeline.
  const TimelineEvent({
    this.type,
    this.message,
    this.time,
    this.status,
    this.data,
  });
  /// Type of timeline event.
  /// 
  /// Examples: 'input', 'authenticate', 'process', 'complete'.
  final String? type;
  
  /// Human-readable message describing the event.
  final String? message;
  
  /// Timestamp when the event occurred (in seconds since epoch).
  final int? time;
  
  /// Status of the event or transaction at this point in time.
  /// 
  /// Examples: 'pending', 'success', 'failed', 'processing'.
  final String? status;
  
  /// Additional data associated with this event.
  /// 
  /// The structure and content of this field varies depending on the
  /// event type and can contain any relevant event-specific information.
  final dynamic data;
}
