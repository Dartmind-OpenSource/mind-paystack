import 'package:dart_mappable/dart_mappable.dart';
import 'package:mind_paystack/src/core/models/src/pagination_meta.dart';
import 'package:mind_paystack/src/features/transaction/models/transaction/src/transaction.dart';

part 'transaction_list.mapper.dart';

/// Contains a paginated list of transactions.
///
/// This model is returned by list transaction endpoints and includes
/// the transaction data along with optional pagination metadata.
/// The [data] field contains the actual transactions, while [meta]
/// provides pagination information when available.
///
/// Example usage:
/// ```dart
/// final transactionList = TransactionList(
///   data: [transaction1, transaction2, transaction3],
///   meta: PaginationMeta(
///     total: 150,
///     page: 1,
///     perPage: 20,
///   ),
/// );
///
/// // Access transactions
/// for (final transaction in transactionList.data) {
///   print('Transaction: ${transaction.reference}');
/// }
/// ```
@MappableClass()
class TransactionList with TransactionListMappable {
  /// Creates a new TransactionList instance.
  ///
  /// The [data] field is required and contains the list of transactions.
  /// The [meta] field is optional and provides pagination information.
  const TransactionList({
    required this.data,
    this.meta,
  });

  /// List of transactions in this page/response.
  final List<Transaction> data;

  /// Pagination metadata for this transaction list.
  ///
  /// Contains information about total records, current page,
  /// and page count when the API response includes pagination data.
  final PaginationMeta? meta;
}
