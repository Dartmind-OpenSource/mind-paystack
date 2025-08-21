import 'package:mind_paystack/src/core/models/resource.dart';
import 'package:mind_paystack/src/features/transaction/models/models.dart';

/// Interface defining the contract for transaction-related business operations.
///
/// This abstract class defines all the transaction operations that can be
/// performed through the MindPaystack SDK. It serves as a contract that
/// concrete service implementations must fulfill, providing a clean separation
/// between the business logic layer and the data access layer.
///
/// The service provides high-level transaction operations including payment
/// initialization, verification, listing, charging authorizations, analytics,
/// and data export. All methods return Resource objects for consistent
/// error handling and response structure.
///
/// Example implementation usage:
/// ```dart
/// class TransactionService implements ITransactionService {
///   final TransactionRepository _repository;
///   
///   TransactionService(this._repository);
///   
///   @override
///   Future<Resource<TransactionInitialization>> initialize(
///     InitializeTransactionOptions options,
///   ) async {
///     // Business logic and validation here
///     return await _repository.initialize(options);
///   }
/// }
/// ```
abstract class ITransactionService {
  /// Initializes a new payment transaction with Paystack.
  ///
  /// Creates a new transaction on Paystack's servers with the specified
  /// payment details. This is the first step in the payment flow, generating
  /// a payment reference and authorization URL for completing the payment.
  ///
  /// The customer will be redirected to the returned authorization URL to
  /// complete the payment using their preferred payment method.
  ///
  /// Parameters:
  /// - [options]: Configuration for the new transaction including amount,
  ///   email, currency, and other payment details
  ///
  /// Returns:
  /// A Resource containing TransactionInitialization data with authorization
  /// URL, payment reference, and access code for payment completion.
  ///
  /// Throws:
  /// - MindException if validation fails or API request encounters errors
  ///
  /// Example:
  /// ```dart
  /// final options = InitializeTransactionOptions(
  ///   amount: 50000, // 500 NGN in kobo
  ///   email: 'customer@example.com',
  ///   currency: 'NGN',
  ///   reference: 'unique_transaction_ref',
  /// );
  /// 
  /// final result = await transactionService.initialize(options);
  /// if (result.isSuccess) {
  ///   final authUrl = result.data!.authorizationUrl;
  ///   // Redirect customer to authUrl for payment
  /// }
  /// ```
  Future<Resource<TransactionInitialization>> initialize(
    InitializeTransactionOptions options,
  );

  /// Verifies the status and details of a completed transaction.
  ///
  /// Retrieves the current status and complete details of a transaction
  /// using its unique reference. This is typically called after a customer
  /// completes or abandons a payment to confirm the final transaction status.
  ///
  /// This method should be called on payment completion callbacks, webhooks,
  /// or when checking transaction status on app resume.
  ///
  /// Parameters:
  /// - [reference]: Unique transaction reference string used during
  ///   initialization
  ///
  /// Returns:
  /// A Resource containing the complete Transaction object with status,
  /// amount, customer details, and payment information.
  ///
  /// Example:
  /// ```dart
  /// final result = await transactionService.verify('TXN_12345');
  /// if (result.isSuccess) {
  ///   final transaction = result.data!;
  ///   if (transaction.status == 'success') {
  ///     // Payment successful, fulfill order
  ///   } else {
  ///     // Payment failed, handle accordingly
  ///   }
  /// }
  /// ```
  Future<Resource<Transaction>> verify(String reference);

  /// Retrieves a paginated list of transactions with optional filtering.
  ///
  /// Fetches transactions from your Paystack account with support for
  /// pagination, date filtering, status filtering, and other query options.
  /// Useful for building transaction history views, reporting, and analytics.
  ///
  /// Parameters:
  /// - [options]: Filtering and pagination options including date ranges,
  ///   status filters, customer filters, and page size
  ///
  /// Returns:
  /// A Resource containing a List of Transaction objects matching the
  /// specified criteria, along with pagination metadata.
  ///
  /// Example:
  /// ```dart
  /// final options = ListTransactionsOptions(
  ///   status: TransactionStatus.success,
  ///   from: DateTime.now().subtract(Duration(days: 30)),
  ///   to: DateTime.now(),
  ///   perPage: 50,
  /// );
  /// 
  /// final result = await transactionService.list(options);
  /// if (result.isSuccess) {
  ///   final transactions = result.data!;
  ///   // Display transactions in UI
  /// }
  /// ```
  Future<Resource<List<Transaction>>> list(
    ListTransactionsOptions options,
  );

  /// Fetches complete details of a specific transaction by its ID.
  ///
  /// Retrieves full transaction information using the Paystack internal
  /// transaction ID. This provides the same detailed information as verify()
  /// but uses the numeric ID instead of the reference string.
  ///
  /// Useful when you have stored the transaction ID and need to retrieve
  /// updated information or when working with Paystack webhook data.
  ///
  /// Parameters:
  /// - [id]: Paystack's internal numeric transaction ID
  ///
  /// Returns:
  /// A Resource containing the complete Transaction object with all
  /// available details and current status.
  ///
  /// Example:
  /// ```dart
  /// final result = await transactionService.fetch(123456);
  /// if (result.isSuccess) {
  ///   final transaction = result.data!;
  ///   print('Amount: ${transaction.amount}');
  ///   print('Status: ${transaction.status}');
  /// }
  /// ```
  Future<Resource<Transaction>> fetch(int id);

  /// Charges a previously authorized payment method.
  ///
  /// Processes a new payment using a stored authorization from a previous
  /// successful transaction. This enables recurring payments, subscription
  /// billing, and one-click payments without requiring the customer to
  /// re-enter payment details.
  ///
  /// The authorization code is obtained from previous successful transactions
  /// and represents the customer's consent to charge their payment method.
  ///
  /// Parameters:
  /// - [authorizationCode]: Authorization code from a previous successful
  ///   transaction
  /// - [amount]: Payment amount in the smallest currency unit (kobo for NGN)
  /// - [email]: Customer's email address (must match the original
  ///   authorization)
  ///
  /// Returns:
  /// A Resource containing the Transaction result of the authorization charge.
  ///
  /// Example:
  /// ```dart
  /// final result = await transactionService.chargeAuthorization(
  ///   authorizationCode: 'AUTH_pmx3mgawyd',
  ///   amount: 25000, // 250 NGN in kobo
  ///   email: 'customer@example.com',
  /// );
  /// 
  /// if (result.isSuccess && result.data!.status == 'success') {
  ///   // Recurring payment successful
  /// }
  /// ```
  Future<Resource<Transaction>> chargeAuthorization({
    required String authorizationCode,
    required int amount,
    required String email,
  });

  /// Retrieves the timeline of events for a specific transaction.
  ///
  /// Fetches a chronological history of all events and status changes
  /// for a transaction. This includes authorization attempts, payment
  /// processing steps, success/failure events, and any manual updates.
  ///
  /// Useful for debugging payment issues, providing detailed transaction
  /// history to customers, and understanding the payment flow.
  ///
  /// Parameters:
  /// - [idOrReference]: Either the transaction ID (numeric) or reference
  ///   string to identify the transaction
  ///
  /// Returns:
  /// A Resource containing TransactionTimeline with chronological event
  /// history and status changes.
  ///
  /// Example:
  /// ```dart
  /// final result = await transactionService.timeline('TXN_12345');
  /// if (result.isSuccess) {
  ///   final timeline = result.data!;
  ///   for (final event in timeline.history) {
  ///     print('${event.time}: ${event.type} - ${event.message}');
  ///   }
  /// }
  /// ```
  Future<Resource<TransactionTimeline>> timeline(String idOrReference);

  /// Retrieves aggregated transaction statistics and totals.
  ///
  /// Fetches summary statistics including total transaction volume,
  /// successful payment counts, failed transaction counts, and other
  /// aggregated metrics for your account.
  ///
  /// This data is useful for dashboard analytics, reporting, and business
  /// intelligence. The totals typically include data across all time or
  /// recent periods depending on Paystack's API behavior.
  ///
  /// Returns:
  /// A Resource containing TransactionTotals with aggregated statistics
  /// and volume metrics.
  ///
  /// Example:
  /// ```dart
  /// final result = await transactionService.totals();
  /// if (result.isSuccess) {
  ///   final totals = result.data!;
  ///   print('Total volume: ${totals.totalVolume}');
  ///   print('Successful transactions: ${totals.totalTransactions}');
  /// }
  /// ```
  Future<Resource<TransactionTotals>> totals();

  /// Exports transaction data in various formats for external analysis.
  ///
  /// Generates downloadable exports of transaction data with customizable
  /// date ranges, filtering options, and output formats. The export is
  /// typically generated asynchronously and made available for download
  /// via URL or email notification.
  ///
  /// Useful for accounting, reporting, reconciliation, and data analysis
  /// workflows that require transaction data in external systems.
  ///
  /// Parameters:
  /// - [options]: Export configuration including date range, format,
  ///   filtering criteria, and delivery options
  ///
  /// Returns:
  /// A Resource containing TransactionExport details with export status,
  /// download URL, or delivery information.
  ///
  /// Example:
  /// ```dart
  /// final options = ExportTransactionsOptions(
  ///   from: DateTime(2024, 1, 1),
  ///   to: DateTime(2024, 12, 31),
  ///   settled: true,
  ///   format: 'csv',
  /// );
  /// 
  /// final result = await transactionService.export(options);
  /// if (result.isSuccess) {
  ///   final export = result.data!;
  ///   // Monitor export status or download when ready
  /// }
  /// ```
  Future<Resource<TransactionExport>> export(
    ExportTransactionsOptions options,
  );

  /// Performs a partial debit on a previously authorized payment method.
  ///
  /// Charges a specific amount against an existing authorization, typically
  /// used for partial payments, installments, or variable billing scenarios.
  /// This allows charging different amounts against the same authorization
  /// code over time.
  ///
  /// The partial debit maintains the relationship with the original
  /// authorization while creating a new transaction for the specified amount.
  ///
  /// Parameters:
  /// - [options]: Partial debit configuration including authorization code,
  ///   amount, currency, and other payment details
  ///
  /// Returns:
  /// A Resource containing PartialDebit result with transaction details
  /// and charge status.
  ///
  /// Example:
  /// ```dart
  /// final options = PartialDebitOptions(
  ///   authorizationCode: 'AUTH_pmx3mgawyd',
  ///   amount: 15000, // 150 NGN in kobo
  ///   currency: 'NGN',
  ///   email: 'customer@example.com',
  /// );
  /// 
  /// final result = await transactionService.partialDebit(options);
  /// if (result.isSuccess) {
  ///   // Partial debit successful
  /// }
  /// ```
  Future<Resource<PartialDebit>> partialDebit(
    PartialDebitOptions options,
  );
}
