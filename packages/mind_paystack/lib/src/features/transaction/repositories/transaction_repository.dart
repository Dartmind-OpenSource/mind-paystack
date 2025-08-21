import 'package:mind_paystack/src/core/errors/models/mind_exception.dart';
import 'package:mind_paystack/src/core/models/resource.dart';
import 'package:mind_paystack/src/core/network/http_client.dart';
import 'package:mind_paystack/src/features/transaction/models/models.dart';

/// Repository for handling all transaction-related API operations.
///
/// This repository provides a comprehensive interface for interacting with
/// Paystack's transaction APIs, including payment initialization, verification,
/// listing, charging authorizations, and retrieving analytics.
///
/// The repository handles HTTP communication with the Paystack API and
/// transforms raw responses into typed model objects wrapped in [Resource]
/// containers for consistent error handling.
///
/// Example usage:
/// ```dart
/// final repository = TransactionRepository(httpClient);
///
/// // Initialize a new payment
/// final initResult = await repository.initialize(
///   InitializeTransactionOptions(
///     email: 'customer@example.com',
///     amount: '50000', // ₦500.00 in kobo
///   ),
/// );
///
/// // Verify payment after customer completes it
/// final verifyResult = await repository.verify(
///   initResult.data.reference,
/// );
/// ```
class TransactionRepository {
  /// Creates a new TransactionRepository instance.
  ///
  /// The [_httpClient] is used for all HTTP communication with the
  /// Paystack API and should be properly configured with authentication.
  TransactionRepository(this._httpClient);

  /// HTTP client used for API communication.
  final HttpClient _httpClient;

  /// Initializes a new payment transaction.
  ///
  /// Creates a new transaction on Paystack and returns the authorization URL
  /// where customers should be redirected to complete payment. The transaction
  /// must be verified after the customer completes or abandons the payment.
  ///
  /// Parameters:
  /// - [options]: Configuration for the transaction including customer email,
  ///   amount, currency, callback URL, and other payment settings.
  ///
  /// Returns:
  /// A [Resource] containing [TransactionInitialization] with the authorization
  /// URL, access code, and transaction reference.
  ///
  /// Throws:
  /// - [MindException] if the request fails or validation errors occur.
  ///
  /// Example:
  /// ```dart
  /// final result = await repository.initialize(
  ///   InitializeTransactionOptions(
  ///     email: 'customer@example.com',
  ///     amount: '50000', // ₦500.00 in kobo
  ///     currency: 'NGN',
  ///     reference: 'tx_123456',
  ///   ),
  /// );
  ///
  /// if (result.isSuccess) {
  ///   // Redirect customer to result.data.authorizationUrl
  /// }
  /// ```
  Future<Resource<TransactionInitialization>> initialize(
    InitializeTransactionOptions options,
  ) async {
    final res = await _httpClient.post<Map<String, dynamic>>(
      '/transaction/initialize',
      data: options.toMap(),
    );
    return Resource.fromMap(
      res.data!,
      TransactionInitializationMapper.fromMap,
    );
  }

  /// Verifies a transaction's final status and details.
  ///
  /// This method should be called after a customer completes or abandons
  /// a payment to get the final transaction status. Always verify transactions
  /// on your backend before fulfilling orders or granting access.
  ///
  /// Parameters:
  /// - [reference]: The unique transaction reference returned during
  ///   initialization or provided by the customer.
  ///
  /// Returns:
  /// A [Resource] containing the complete [Transaction] object with final
  /// status, amount, customer details, and payment information.
  ///
  /// Throws:
  /// - [MindException] if the transaction reference is invalid or if there's
  ///   a network error.
  ///
  /// Example:
  /// ```dart
  /// final result = await repository.verify('tx_abc123456');
  ///
  /// if (result.isSuccess) {
  ///   final transaction = result.data;
  ///   if (transaction.status == 'success') {
  ///     // Payment successful - fulfill order
  ///     await fulfillOrder(transaction);
  ///   } else {
  ///     // Payment failed or abandoned
  ///     await handleFailedPayment(transaction);
  ///   }
  /// }
  /// ```
  Future<Resource<Transaction>> verify(String reference) async {
    final res = await _httpClient
        .get<Map<String, dynamic>>('/transaction/verify/$reference');
    return Resource.fromMap(
      res.data!,
      TransactionMapper.fromMap,
    );
  }

  /// Retrieves a paginated list of transactions with optional filtering.
  ///
  /// Fetches transactions from your Paystack account with support for
  /// filtering by status, date range, customer, and other criteria.
  /// Results are paginated and can be sorted by various fields.
  ///
  /// Parameters:
  /// - [options]: Optional filtering and pagination settings. If null,
  ///   returns the first page with default settings.
  ///
  /// Returns:
  /// A [Resource] containing [TransactionList] with an array of transactions
  /// and optional pagination metadata.
  ///
  /// Throws:
  /// - [MindException] if there's a network error or invalid filter parameters.
  ///
  /// Example:
  /// ```dart
  /// // Get successful transactions from last month
  /// final result = await repository.list(
  ///   options: ListTransactionsOptions(
  ///     status: 'success',
  ///     from: DateTime(2023, 12, 1),
  ///     to: DateTime(2023, 12, 31),
  ///     perPage: 50,
  ///   ),
  /// );
  ///
  /// if (result.isSuccess) {
  ///   for (final transaction in result.data.data) {
  ///     print('Transaction: ${transaction.reference}');
  ///   }
  /// }
  /// ```
  Future<Resource<TransactionList>> list({
    ListTransactionsOptions? options,
  }) async {
    final res = await _httpClient.get<Map<String, dynamic>>(
      '/transaction',
      queryParameters: options?.toMap(),
    );
    return Resource.fromMap(
      res.data!,
      TransactionListMapper.fromMap,
    );
  }

  /// Fetches detailed information about a specific transaction by ID.
  ///
  /// Retrieves complete transaction details using the transaction's unique
  /// numeric ID. This is different from verification which uses the transaction
  /// reference string.
  ///
  /// Parameters:
  /// - [id]: The unique numeric ID of the transaction to fetch.
  ///
  /// Returns:
  /// A [Resource] containing the complete [Transaction] object with all
  /// available details.
  ///
  /// Throws:
  /// - [MindException] if the transaction ID is invalid or not found.
  ///
  /// Example:
  /// ```dart
  /// final result = await repository.fetch('123456789');
  ///
  /// if (result.isSuccess) {
  ///   final transaction = result.data;
  ///   print('Amount: ${transaction.amount}');
  ///   print('Status: ${transaction.status}');
  ///   print('Customer: ${transaction.customer?.email}');
  /// }
  /// ```
  Future<Resource<Transaction>> fetch(String id) async {
    final res = await _httpClient.get<Map<String, dynamic>>('/transaction/$id');
    return Resource.fromMap(
      res.data!,
      TransactionMapper.fromMap,
    );
  }

  /// Charges a customer's card using a previously obtained authorization.
  ///
  /// This method enables recurring payments or subscription billing by
  /// charging a card without requiring customer interaction. The authorization
  /// code must have been obtained from a previous successful transaction
  /// and marked as reusable.
  ///
  /// Parameters:
  /// - [options]: Configuration for the charge including authorization code,
  ///   amount, email, and other payment settings. Required for the operation.
  ///
  /// Returns:
  /// A [Resource] containing the resulting [Transaction] object with charge
  /// details and status.
  ///
  /// Throws:
  /// - [MindException] if the authorization code is invalid, expired, or
  ///   if there's insufficient authorization amount remaining.
  ///
  /// Example:
  /// ```dart
  /// final result = await repository.chargeAuthorization(
  ///   options: ChargeAuthorizationOptions(
  ///     email: 'customer@example.com',
  ///     amount: '25000', // ₦250.00 in kobo
  ///     authorizationCode: 'AUTH_abc123',
  ///     reference: 'subscription_payment_456',
  ///   ),
  /// );
  ///
  /// if (result.isSuccess) {
  ///   final transaction = result.data;
  ///   if (transaction.status == 'success') {
  ///     // Recurring payment successful
  ///     await updateSubscriptionStatus();
  ///   }
  /// }
  /// ```
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

  /// Retrieves the detailed processing timeline for a transaction.
  ///
  /// Fetches a chronological log of events that occurred during transaction
  /// processing, including authentication steps, gateway responses, and
  /// processing times. Useful for debugging payment issues and understanding
  /// transaction flow.
  ///
  /// Parameters:
  /// - [idOrReference]: Either the transaction ID (as string) or the
  ///   transaction reference to get timeline for.
  ///
  /// Returns:
  /// A [Resource] containing [TransactionTimeline] with detailed event
  /// history and processing metadata.
  ///
  /// Throws:
  /// - [MindException] if the transaction identifier is invalid or not found.
  ///
  /// Example:
  /// ```dart
  /// final result = await repository.timeline('tx_abc123');
  ///
  /// if (result.isSuccess) {
  ///   final timeline = result.data;
  ///   print('Processing time: ${timeline.log.timeSpent} seconds');
  ///   print('Attempts: ${timeline.log.attempts}');
  ///
  ///   for (final event in timeline.log.history ?? []) {
  ///     print('${event.type}: ${event.message}');
  ///   }
  /// }
  /// ```
  Future<Resource<TransactionTimeline>> timeline(String idOrReference) async {
    final res = await _httpClient
        .get<Map<String, dynamic>>('/transaction/timeline/$idOrReference');
    return Resource.fromMap(
      res.data!,
      TransactionTimelineMapper.fromMap,
    );
  }

  /// Retrieves aggregated transaction statistics and totals.
  ///
  /// Fetches summary analytics including total transaction volume, count,
  /// unique customers, and various transaction states. Useful for generating
  /// dashboards and financial reports.
  ///
  /// Returns:
  /// A [Resource] containing [TransactionTotals] with aggregated statistics
  /// across all transactions in the account.
  ///
  /// Throws:
  /// - [MindException] if there's a network error or access is denied.
  ///
  /// Example:
  /// ```dart
  /// final result = await repository.totals();
  ///
  /// if (result.isSuccess) {
  ///   final totals = result.data;
  ///   print('Total transactions: ${totals.totalTransactions}');
  ///   print('Unique customers: ${totals.uniqueCustomers}');
  ///   print('Total volume: ${totals.totalVolume} kobo');
  ///   print('Pending transactions: ${totals.pendingTransactions}');
  /// }
  /// ```
  Future<Resource<TransactionTotals>> totals() async {
    final res =
        await _httpClient.get<Map<String, dynamic>>('/transaction/totals');
    return Resource.fromMap(
      res.data!,
      TransactionTotalsMapper.fromMap,
    );
  }

  /// Exports transaction data to a downloadable CSV file.
  ///
  /// Generates a CSV file containing transaction data based on the provided
  /// filters. The export is processed asynchronously and returns a download
  /// URL that expires after a certain time period.
  ///
  /// Parameters:
  /// - [options]: Optional filtering options to specify which transactions
  ///   to include in the export. If null, exports all transactions.
  ///
  /// Returns:
  /// A [Resource] containing [TransactionExport] with the download URL
  /// and expiration time for the CSV file.
  ///
  /// Throws:
  /// - [MindException] if there's an error generating the export or if
  ///   the filter parameters are invalid.
  ///
  /// Example:
  /// ```dart
  /// final result = await repository.export(
  ///   options: ExportTransactionsOptions(
  ///     from: DateTime(2023, 1, 1),
  ///     to: DateTime(2023, 12, 31),
  ///     status: 'success',
  ///     currency: 'NGN',
  ///   ),
  /// );
  ///
  /// if (result.isSuccess) {
  ///   final exportInfo = result.data;
  ///   print('Download URL: ${exportInfo.path}');
  ///   print('Expires: ${exportInfo.expiresAt}');
  ///
  ///   // Download the CSV file before it expires
  ///   await downloadFile(exportInfo.path);
  /// }
  /// ```
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

  /// Performs a partial debit on a previously authorized transaction.
  ///
  /// Charges a portion of an existing authorization, useful for scenarios
  /// like hotel bookings where an initial authorization is made for a larger
  /// amount and then charged in parts as services are consumed.
  ///
  /// Parameters:
  /// - [options]: Configuration for the partial debit including authorization
  ///   code, amount, currency, and customer email. All fields are required
  ///   except for reference and minimum amount validation.
  ///
  /// Returns:
  /// A [Resource] containing [PartialDebit] with details about the partial
  /// charge including reference, status, and amount debited.
  ///
  /// Throws:
  /// - [MindException] if the authorization code is invalid, if there's
  ///   insufficient authorization remaining, or if the amount exceeds
  ///   the available authorization.
  ///
  /// Example:
  /// ```dart
  /// final result = await repository.partialDebit(
  ///   PartialDebitOptions(
  ///     authorizationCode: 'AUTH_abc123',
  ///     currency: 'NGN',
  ///     amount: '15000', // ₦150.00 in kobo
  ///     email: 'customer@example.com',
  ///     reference: 'hotel_charge_1',
  ///   ),
  /// );
  ///
  /// if (result.isSuccess) {
  ///   final debit = result.data;
  ///   if (debit.status == 'success') {
  ///     // Partial charge successful
  ///     await updateBilling(debit.amount);
  ///   }
  /// }
  /// ```
  Future<Resource<PartialDebit>> partialDebit(
    PartialDebitOptions options,
  ) async {
    final res = await _httpClient.post<Map<String, dynamic>>(
      '/transaction/partial_debit',
      data: options.toMap(),
    );
    return Resource.fromMap(
      res.data!,
      PartialDebitMapper.fromMap,
    );
  }
}
