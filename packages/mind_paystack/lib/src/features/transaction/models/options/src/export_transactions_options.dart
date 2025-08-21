import 'package:dart_mappable/dart_mappable.dart';
part 'export_transactions_options.mapper.dart';

/// Options for exporting transaction data to CSV format.
/// 
/// This class provides filtering and pagination options for requesting
/// transaction exports from Paystack. The exported data will be available
/// as a downloadable CSV file.
/// 
/// Example usage:
/// ```dart
/// final exportOptions = ExportTransactionsOptions(
///   from: DateTime(2023, 1, 1),
///   to: DateTime(2023, 12, 31),
///   status: 'success',
///   currency: 'NGN',
///   perPage: 100,
/// );
/// ```
@MappableClass()
class ExportTransactionsOptions with ExportTransactionsOptionsMappable {
  /// Creates a new ExportTransactionsOptions instance.
  /// 
  /// All parameters are optional and can be used to filter the
  /// transactions included in the export.
  const ExportTransactionsOptions({
    this.perPage,
    this.page,
    this.from,
    this.to,
    this.customer,
    this.status,
    this.currency,
    this.amount,
    this.settled,
    this.settlement,
    this.paymentPage,
  });
  /// Number of records to include per page (for pagination).
  final int? perPage;
  
  /// Page number to export (1-based).
  final int? page;
  
  /// Start date for filtering transactions (inclusive).
  final DateTime? from;
  
  /// End date for filtering transactions (inclusive).
  final DateTime? to;
  
  /// Filter by specific customer ID.
  final int? customer;
  
  /// Filter by transaction status.
  /// 
  /// Common values: 'success', 'failed', 'abandoned', 'pending'.
  final String? status;
  
  /// Filter by currency code.
  /// 
  /// Examples: 'NGN', 'USD', 'GHS'.
  final String? currency;
  
  /// Filter by specific transaction amount (in smallest currency unit).
  final int? amount;
  
  /// Filter by settlement status.
  /// 
  /// When true, includes only settled transactions.
  /// When false, includes only unsettled transactions.
  final bool? settled;
  
  /// Filter by specific settlement ID.
  final int? settlement;
  
  /// Filter by specific payment page ID.
  final int? paymentPage;
}
