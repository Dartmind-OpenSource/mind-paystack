import 'package:dart_mappable/dart_mappable.dart';
import 'package:mind_paystack/src/features/transaction/models/transaction/src/timeline_event.dart';
part 'timeline_log.mapper.dart';

/// Contains detailed processing information for a transaction.
/// 
/// This model captures the timeline and processing details of a transaction,
/// including authentication attempts, processing time, errors, and a complete
/// history of events that occurred during the transaction lifecycle.
/// 
/// Example usage:
/// ```dart
/// final log = TimelineLog(
///   timeSpent: 5,
///   attempts: 1,
///   success: true,
///   channel: 'card',
///   history: [/* timeline events */],
/// );
/// ```
@MappableClass()
class TimelineLog with TimelineLogMappable {
  /// Creates a new TimelineLog instance.
  /// 
  /// All fields are optional as different transaction types may have
  /// different logging information available.
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
  /// Total time spent processing the transaction (in seconds).
  @MappableField(key: 'time_spent')
  final int? timeSpent;
  
  /// Number of processing attempts made for this transaction.
  final int? attempts;
  
  /// Authentication method or data used for the transaction.
  /// 
  /// Can be a string (e.g., 'pin', 'otp') or a structured object
  /// containing authentication details.
  final dynamic authentication;
  
  /// Number of errors encountered during transaction processing.
  final int? errors;
  
  /// Whether the transaction processing was ultimately successful.
  final bool? success;
  
  /// Whether the transaction was initiated from a mobile device.
  final bool? mobile;
  
  /// Input data provided during transaction processing.
  /// 
  /// This is a flexible field that can contain various types of
  /// input data depending on the transaction type and processing flow.
  final List<dynamic>? input;
  
  /// Payment channel used for this transaction.
  /// 
  /// Examples: 'card', 'bank', 'ussd', 'qr'.
  final String? channel;
  
  /// Chronological list of events that occurred during processing.
  /// 
  /// Contains detailed timeline events showing the step-by-step
  /// processing flow of the transaction.
  final List<TimelineEvent>? history;
}
