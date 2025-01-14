import 'package:mind_paystack/src/core/exceptions.dart';
import 'package:mind_paystack/src/model/bank_model.dart';
import 'package:mind_paystack/src/services/bank_payment_service.dart';
import 'package:mind_paystack/src/utils/logger.dart';

abstract class BankPaymentRepository {
  Future<Map<String, dynamic>> initializePayment({
    required PaymentInitializationRequest request,
  });

  Future<Map<String, dynamic>> verifyPayment(String paymentReference);

  Future<Map<String, dynamic>> getPaymentStatus(String paymentId);

  Future<List<BankResponse>> fetchBanks();
}

class BankPaymentRepositoryImpl implements BankPaymentRepository {
  BankPaymentRepositoryImpl({
    required BankPaymentService bankPaymentService,
  }) : _bankPaymentService = bankPaymentService;

  final BankPaymentService _bankPaymentService;

  @override
  Future<Map<String, dynamic>> initializePayment({
    required PaymentInitializationRequest request,
  }) async {
    try {
      return await _bankPaymentService.initializePayment(
        accountNumber: request.accountNumber,
        bankCode: request.bankCode,
        amount: request.amount,
        currency: request.currency,
        email: request.email,
      );
    } catch (e) {
      MPLogger.error(
        'Failed to initialize transaction status',
      );
      throw PaystackException(
        message: 'Failed to initialize transaction status',
        code: 'error occurred $e',
      );
    }
  }

  @override
  Future<Map<String, dynamic>> verifyPayment(String paymentReference) async {
    try {
      return await _bankPaymentService.verifyPayment(paymentReference);
    } catch (e) {
      MPLogger.error(
        'Failed to verify payment',
      );
      throw PaystackException(
        message: 'Failed to verify payment',
        code: 'error occurred $e',
      );
    }
  }

  @override
  Future<Map<String, dynamic>> getPaymentStatus(String paymentId) async {
    try {
      return await _bankPaymentService.getPaymentStatus(paymentId);
    } catch (e) {
      MPLogger.error(
        'Failed to get payment status',
      );
      throw PaystackException(
        message: 'Failed to get payment status',
        code: 'error occurred $e',
      );
    }
  }

  @override
  Future<List<BankResponse>> fetchBanks() async {
    try {
      return await _bankPaymentService.fetchBanks();
    } catch (e) {
      MPLogger.error(
        'Failed to get fetch bank',
      );
      throw PaystackException(
        message: 'Failed to get fetch banks',
        code: 'error occurred $e',
      );
    }
  }
}

