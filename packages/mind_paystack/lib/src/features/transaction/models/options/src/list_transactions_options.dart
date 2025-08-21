import 'package:dart_mappable/dart_mappable.dart';
part 'list_transactions_options.mapper.dart';

/// Options for listing and filtering transactions.
/// 
/// This class provides various filtering and pagination options for
/// retrieving transaction lists from Paystack. All parameters are optional
/// and can be combined to create specific queries.
/// 
/// Example usage:
/// ```dart
/// final listOptions = ListTransactionsOptions(
///   status: 'success',
///   from: DateTime(2023, 1, 1),
///   to: DateTime(2023, 12, 31),
///   perPage: 50,
///   page: 1,
/// );
/// ```
@MappableClass()
class ListTransactionsOptions with ListTransactionsOptionsMappable {
  /// Creates a new ListTransactionsOptions instance.
  /// 
  /// All parameters are optional and can be used to filter and
  /// paginate the transaction list.
  const ListTransactionsOptions({
    this.perPage,
    this.page,
    this.customer,
    this.terminalId,
    this.status,
    this.from,
    this.to,
    this.amount,
  });
  /// Number of transactions to return per page.
  /// 
  /// Default is typically 50, maximum is usually 100.
  final int? perPage;
  
  /// Page number to retrieve (1-based).
  final int? page;
  
  /// Filter by specific customer ID.
  final int? customer;
  
  /// Filter by specific terminal ID for POS transactions.
  final String? terminalId;
  
  /// Filter by transaction status.
  /// 
  /// Common values: 'success', 'failed', 'abandoned', 'pending'.
  final String? status;
  
  /// Start date for filtering transactions (inclusive).
  final DateTime? from;
  
  /// End date for filtering transactions (inclusive).
  final DateTime? to;
  
  /// Filter by specific transaction amount (in smallest currency unit).
  /// 
  /// For example: 50000 kobo for ₦500.00 transactions.
  final int? amount;
}
