import 'package:dart_mappable/dart_mappable.dart';
import 'package:mind_paystack/src/features/transaction/models/transaction/src/timeline_log.dart';
part 'transaction_timeline.mapper.dart';

/// Contains the complete timeline information for a specific transaction.
/// 
/// This model provides detailed processing history and timeline data
/// for a transaction, identified by either its ID or reference.
/// The timeline shows the step-by-step processing flow.
/// 
/// Example usage:
/// ```dart
/// final timeline = TransactionTimeline(
///   idOrReference: 'tx_abc123',
///   log: TimelineLog(
///     timeSpent: 5,
///     attempts: 1,
///     success: true,
///     history: [/* timeline events */],
///   ),
/// );
/// 
/// // Analyze the transaction processing
/// print('Transaction ${timeline.idOrReference} took '
///       '${timeline.log.timeSpent} seconds');
/// ```
@MappableClass()
class TransactionTimeline with TransactionTimelineMappable {
  /// Creates a new TransactionTimeline instance.
  /// 
  /// Both [idOrReference] and [log] are required to provide complete
  /// timeline information for the transaction.
  const TransactionTimeline({
    required this.idOrReference,
    required this.log,
  });
  /// Transaction identifier (either ID or reference) for this timeline.
  /// 
  /// This can be either the numeric transaction ID or the
  /// transaction reference string used to identify the transaction.
  final String idOrReference;
  
  /// Detailed timeline and processing log for this transaction.
  /// 
  /// Contains comprehensive information about the transaction's
  /// processing history, including timing, attempts, and event history.
  final TimelineLog log;
}
