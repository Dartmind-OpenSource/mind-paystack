import 'package:mind_paystack/src/core/models/resource.dart';
import 'package:mind_paystack/src/core/network/http_client.dart';
import 'package:mind_paystack/src/features/transaction/models/models.dart';

class TransactionRepository {
  TransactionRepository(this._httpClient);

  final HttpClient _httpClient;

  /// Initialize a transaction
  Future<Resource<TransactionInitialization>> initialize(
    InitializeTransactionOptions options,
  ) async {
    final res = await _httpClient.post<Map<String, dynamic>>(
        '/transaction/initialize',
        data: options.toMap(),);
    return Resource.fromMap(
      res.data!,
      TransactionInitializationMapper.fromMap,
    );
  }

  /// Verify a transaction by reference
  Future<Resource<Transaction>> verify(String reference) async {
    final res = await _httpClient
        .get<Map<String, dynamic>>('/transaction/verify/$reference');
    return Resource.fromMap(
      res.data!,
      TransactionMapper.fromMap,
    );
  }

  /// List transactions with optional filters
  Future<Resource<TransactionList>> list({
    ListTransactionsOptions? options,
  }) async {
    final res = await _httpClient.get<Map<String, dynamic>>('/transaction',
        queryParameters: options?.toMap(),);
    return Resource.fromMap(
      res.data!,
      TransactionListMapper.fromMap,
    );
  }

  /// Fetch a single transaction by ID
  Future<Resource<Transaction>> fetch(String id) async {
    final res = await _httpClient.get<Map<String, dynamic>>('/transaction/$id');
    return Resource.fromMap(
      res.data!,
      TransactionMapper.fromMap,
    );
  }

  /// Charge an existing authorization (reuse card)
  Future<Resource<Transaction>> chargeAuthorization({
    ChargeAuthorizationOptions? options,
  }) async {
    final res = await _httpClient.post<Map<String, dynamic>>(
      '/transaction/charge_authorization',
      data: options?.toMap(),
    );
    return Resource.fromMap(
      res.data!,
      TransactionMapper.fromMap,
    );
  }

  /// View a transaction's event timeline
  Future<Resource<TransactionTimeline>> timeline(String idOrReference) async {
    final res = await _httpClient
        .get<Map<String, dynamic>>('/transaction/timeline/$idOrReference');
    return Resource.fromMap(
      res.data!,
      TransactionTimelineMapper.fromMap,
    );
  }

  /// Get transaction totals
  Future<Resource<TransactionTotals>> totals() async {
    final res =
        await _httpClient.get<Map<String, dynamic>>('/transaction/totals');
    return Resource.fromMap(
      res.data!,
      TransactionTotalsMapper.fromMap,
    );
  }

  /// Export transactions with filters
  Future<Resource<TransactionExport>> export({
    ExportTransactionsOptions? options,
  }) async {
    final res = await _httpClient.get<Map<String, dynamic>>(
      '/transaction/export',
      queryParameters: options?.toMap(),
    );
    return Resource.fromMap(
      res.data!,
      TransactionExportMapper.fromMap,
    );
  }

  /// Perform a partial debit (charge only part of authorization)
  Future<Resource<PartialDebit>> partialDebit(
    PartialDebitOptions options,
  ) async {
    final res = await _httpClient.post<Map<String, dynamic>>(
        '/transaction/partial_debit',
        data: options.toMap(),);
    return Resource.fromMap(
      res.data!,
      PartialDebitMapper.fromMap,
    );
  }
}
