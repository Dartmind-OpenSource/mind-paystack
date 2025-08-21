import 'package:dart_mappable/dart_mappable.dart';
part 'transaction_totals_options.mapper.dart';

/// Options for retrieving transaction totals and analytics.
/// 
/// This class provides filtering options for getting aggregated
/// transaction statistics and totals from Paystack. Useful for
/// generating reports and analytics dashboards.
/// 
/// Example usage:
/// ```dart
/// final totalsOptions = TransactionTotalsOptions(
///   from: DateTime(2023, 1, 1),
///   to: DateTime(2023, 12, 31),
///   perPage: 50,
/// );
/// ```
@MappableClass()
class TransactionTotalsOptions with TransactionTotalsOptionsMappable {
  /// Creates a new TransactionTotalsOptions instance.
  /// 
  /// All parameters are optional and can be used to filter the
  /// time period and pagination for the totals calculation.
  const TransactionTotalsOptions({
    this.perPage,
    this.page,
    this.from,
    this.to,
  });
  /// Number of records to include per page (for pagination).
  final int? perPage;
  
  /// Page number to retrieve (1-based).
  final int? page;
  
  /// Start date for the totals calculation (inclusive).
  /// 
  /// If not specified, totals will include all historical data.
  final DateTime? from;
  
  /// End date for the totals calculation (inclusive).
  /// 
  /// If not specified, totals will include data up to the current date.
  final DateTime? to;
}
