import 'package:dart_mappable/dart_mappable.dart';

part 'fetch_transaction_options.mapper.dart';

/// Options for fetching a specific transaction by its ID.
/// 
/// This class contains the parameters needed to retrieve detailed
/// information about a specific transaction using its unique ID.
/// 
/// Example usage:
/// ```dart
/// final fetchOptions = FetchTransactionOptions(
///   id: 123456789,
/// );
/// 
/// final transaction = await sdk.transaction.fetch(fetchOptions);
/// ```
@MappableClass()
class FetchTransactionOptions with FetchTransactionOptionsMappable {
  /// Creates a new FetchTransactionOptions instance.
  /// 
  /// The [id] is required and must be a valid transaction ID.
  const FetchTransactionOptions({required this.id});
  
  /// Unique ID of the transaction to fetch.
  /// 
  /// This is the numeric ID assigned by Paystack when the transaction
  /// was created, not the transaction reference string.
  final int id;
}
