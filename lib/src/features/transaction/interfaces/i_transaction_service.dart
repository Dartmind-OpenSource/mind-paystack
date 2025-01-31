import 'package:mind_paystack/src/features/transaction/models/authorization_response.dart';
import 'package:mind_paystack/src/features/transaction/models/refund_response.dart';
import 'package:mind_paystack/src/features/transaction/models/transaction.dart';
import 'package:mind_paystack/src/features/transaction/models/transaction_event.dart';
import 'package:mind_paystack/src/features/transaction/models/transaction_response.dart';
import 'package:mind_paystack/src/features/transaction/models/transaction_session.dart';
import 'package:mind_paystack/src/features/transaction/models/transaction_totals.dart';

/// Interface defining the contract for transaction operations
abstract class ITransactionService {
  /// Initialize a transaction
  Future<TransactionResponse> initializeTransaction({
    required int amount,
    required String email,
    required String currency,
    String? callbackUrl,
    String? reference,
    List<String>? channels,
    Map<String, dynamic>? metadata,
    String? subaccount,
    int? transactionCharge,
    String? bearer,
    String? paymentPlan,
    bool? sendEmail = true,
    int? invoiceLimit,
    String? splitCode,
  });

  /// Lists transactions with optional filtering
  Future<List<Transaction>> listTransactions({
    String? customerId,
    String? status,
    String? type,
    DateTime? from,
    DateTime? to,
    int page = 1,
    int perPage = 20,
  });

  /// Retrieves a single transaction by ID or reference
  Future<Transaction> getTransaction(String identifier);

  /// Verifies a transaction
  Future<TransactionResponse> verifyTransaction(String reference);

  /// Initiates a transaction refund
  Future<RefundResponse> initiateRefund({
    required String reference,
    required int amount,
    String? customerNote,
    String? merchantNote,
  });

  /// Retrieves transaction totals/analytics
  Future<TransactionTotals> getTransactionTotals({
    DateTime? from,
    DateTime? to,
    String? status,
  });

  /// Retrieves transaction timeline/history
  Future<List<TransactionEvent>> getTransactionTimeline(String reference);

  /// Exports transactions based on filters
  Future<String> exportTransactions({
    String? status,
    String? currency,
    DateTime? from,
    DateTime? to,
    String? settledBy,
    String? paymentPage,
    String? customerName,
    String format = 'csv',
  });

  /// Retrieves transaction sessions
  Future<List<TransactionSession>> getTransactionSessions(String reference);

  /// Reauthorizes transaction
  Future<TransactionResponse> reauthorizeTransaction({
    required String reference,
    required int amount,
    String? currency,
  });

  /// Checks authorization
  Future<AuthorizationResponse> checkAuthorization({
    required String authorizationCode,
    required String currency,
    required int amount,
    required String email,
  });
}
