import 'package:mind_paystack/src/core/exceptions.dart';
import 'package:mind_paystack/src/services/transaction_service.dart';
import 'package:mind_paystack/src/utils/logger.dart';

abstract class TransactionRepository {
  Future<Map<String, dynamic>> verifyTransaction(String transactionReference);

  Future<Map<String, dynamic>> getTransactionStatus(String transactionId);
}

class TransactionRepositoryImpl implements TransactionRepository {
  TransactionRepositoryImpl({
    required TransactionService transactionService,
  }) : _transactionService = transactionService;

  final TransactionService _transactionService;

  @override
  Future<Map<String, dynamic>> getTransactionStatus(
    String transactionId,
  ) async {
    try {
      return await _transactionService.getTransactionStatus(transactionId);
    } catch (e) {
      MPLogger.error('Failed to save auth data', e);
      throw PaystackException(
        message: 'Failed to get transaction status',
        code: 'error occurred',
      );
    }
  }

  @override
  Future<Map<String, dynamic>> verifyTransaction(
    String transactionReference,
  ) async {
    try {
      return await _transactionService.verifyTransaction(transactionReference);
    } catch (e) {
      MPLogger.error('Failed to save auth data', e);
      throw PaystackException(
        message: 'Failed to verify transaction ',
        code: 'error occurred',
      );
    }
  }
}
