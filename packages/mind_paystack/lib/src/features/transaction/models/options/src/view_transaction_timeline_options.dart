import 'package:dart_mappable/dart_mappable.dart';
part 'view_transaction_timeline_options.mapper.dart';

/// Options for viewing a transaction's processing timeline.
/// 
/// This class contains the parameters needed to retrieve detailed
/// timeline information showing the step-by-step processing history
/// of a specific transaction.
/// 
/// Example usage:
/// ```dart
/// final timelineOptions = TransactionTimelineOptions(
///   idOrReference: 'tx_abc123', // or transaction ID
/// );
/// 
/// final timeline = await sdk.transaction.viewTimeline(timelineOptions);
/// print('Processing took ${timeline.log.timeSpent} seconds');
/// ```
@MappableClass()
class TransactionTimelineOptions with TransactionTimelineOptionsMappable {
  /// Creates a new TransactionTimelineOptions instance.
  /// 
  /// The [idOrReference] is required and can be either the transaction ID
  /// (as string) or the transaction reference.
  const TransactionTimelineOptions({required this.idOrReference});
  
  /// Transaction identifier (ID or reference) to view timeline for.
  /// 
  /// Can be either:
  /// - Transaction reference (e.g., 'tx_abc123')
  /// - Transaction ID as string (e.g., '123456789')
  final String idOrReference;
}
