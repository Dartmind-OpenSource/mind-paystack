import 'package:mind_paystack/src/features/transaction/interfaces/i_transaction_service.dart';
import 'package:mind_paystack/src/features/transaction/models/authorization_response.dart';
import 'package:mind_paystack/src/features/transaction/models/refund_response.dart';
import 'package:mind_paystack/src/features/transaction/models/transaction.dart';
import 'package:mind_paystack/src/features/transaction/models/transaction_event.dart';
import 'package:mind_paystack/src/features/transaction/models/transaction_response.dart';
import 'package:mind_paystack/src/features/transaction/models/transaction_session.dart';
import 'package:mind_paystack/src/features/transaction/models/transaction_totals.dart';
import 'package:mind_paystack/src/features/transaction/repositories/transaction_repository.dart';
import 'package:mind_paystack/src/utils/logger.dart';

class TransactionService implements ITransactionService {
  TransactionService(this._repository);

  final TransactionRepository _repository;

  @override
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
  }) async {
    try {
      MPLogger.info('Initializing transaction for: $email');
      return await _repository.initializeTransaction(
        amount: amount,
        email: email,
        currency: currency,
        callbackUrl: callbackUrl,
        reference: reference,
        channels: channels,
        metadata: metadata,
        subaccount: subaccount,
        transactionCharge: transactionCharge,
        bearer: bearer,
        paymentPlan: paymentPlan,
        sendEmail: sendEmail,
        invoiceLimit: invoiceLimit,
        splitCode: splitCode,
      );
    } catch (e) {
      MPLogger.error('Failed to initialize transaction', error: e);
      rethrow;
    }
  }

  @override
  Future<List<Transaction>> listTransactions({
    String? customerId,
    String? status,
    String? type,
    DateTime? from,
    DateTime? to,
    int page = 1,
    int perPage = 20,
  }) async {
    try {
      MPLogger.info('Listing transactions');
      return await _repository.listTransactions(
        customerId: customerId,
        status: status,
        type: type,
        from: from,
        to: to,
        page: page,
        perPage: perPage,
      );
    } catch (e) {
      MPLogger.error('Failed to list transactions', error: e);
      rethrow;
    }
  }

  @override
  Future<Transaction> getTransaction(String identifier) async {
    try {
      MPLogger.info('Getting transaction: $identifier');
      return await _repository.getTransaction(identifier);
    } catch (e) {
      MPLogger.error('Failed to get transaction', error: e);
      rethrow;
    }
  }

  @override
  Future<TransactionResponse> verifyTransaction(String reference) async {
    try {
      MPLogger.info('Verifying transaction: $reference');
      return await _repository.verifyTransaction(reference);
    } catch (e) {
      MPLogger.error('Failed to verify transaction', error: e);
      rethrow;
    }
  }

  @override
  Future<RefundResponse> initiateRefund({
    required String reference,
    required int amount,
    String? customerNote,
    String? merchantNote,
  }) async {
    try {
      MPLogger.info('Initiating refund for: $reference');
      return await _repository.initiateRefund(
        reference: reference,
        amount: amount,
        customerNote: customerNote,
        merchantNote: merchantNote,
      );
    } catch (e) {
      MPLogger.error('Failed to initiate refund', error: e);
      rethrow;
    }
  }

  @override
  Future<TransactionTotals> getTransactionTotals({
    DateTime? from,
    DateTime? to,
    String? status,
  }) async {
    try {
      MPLogger.info('Getting transaction totals');
      return await _repository.getTransactionTotals(
        from: from,
        to: to,
        status: status,
      );
    } catch (e) {
      MPLogger.error('Failed to get transaction totals', error: e);
      rethrow;
    }
  }

  @override
  Future<List<TransactionEvent>> getTransactionTimeline(
      String reference) async {
    try {
      MPLogger.info('Getting transaction timeline: $reference');
      return await _repository.getTransactionTimeline(reference);
    } catch (e) {
      MPLogger.error('Failed to get transaction timeline', error: e);
      rethrow;
    }
  }

  @override
  Future<String> exportTransactions({
    String? status,
    String? currency,
    DateTime? from,
    DateTime? to,
    String? settledBy,
    String? paymentPage,
    String? customerName,
    String format = 'csv',
  }) async {
    try {
      MPLogger.info('Exporting transactions');
      return await _repository.exportTransactions(
        status: status,
        currency: currency,
        from: from,
        to: to,
        settledBy: settledBy,
        paymentPage: paymentPage,
        customerName: customerName,
        format: format,
      );
    } catch (e) {
      MPLogger.error('Failed to export transactions', error: e);
      rethrow;
    }
  }

  @override
  Future<List<TransactionSession>> getTransactionSessions(
    String reference,
  ) async {
    try {
      MPLogger.info('Getting transaction sessions: $reference');
      return await _repository.getTransactionSessions(reference);
    } catch (e) {
      MPLogger.error('Failed to get transaction sessions', error: e);
      rethrow;
    }
  }

  @override
  Future<TransactionResponse> reauthorizeTransaction({
    required String reference,
    required int amount,
    String? currency,
  }) async {
    try {
      MPLogger.info('Reauthorizing transaction: $reference');
      return await _repository.reauthorizeTransaction(
        reference: reference,
        amount: amount,
        currency: currency,
      );
    } catch (e) {
      MPLogger.error('Failed to reauthorize transaction', error: e);
      rethrow;
    }
  }

  @override
  Future<AuthorizationResponse> checkAuthorization({
    required String authorizationCode,
    required String currency,
    required int amount,
    required String email,
  }) async {
    try {
      MPLogger.info('Checking authorization for: $email');
      return await _repository.checkAuthorization(
        authorizationCode: authorizationCode,
        currency: currency,
        amount: amount,
        email: email,
      );
    } catch (e) {
      MPLogger.error('Failed to check authorization', error: e);
      rethrow;
    }
  }
}
