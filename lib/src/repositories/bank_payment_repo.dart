import 'package:mind_paystack/src/core/exceptions.dart';
import 'package:mind_paystack/src/model/bank_model.dart';
import 'package:mind_paystack/src/services/bank_payment_service.dart';

abstract class BankPaymentRepository {
  Future<Map<String, dynamic>> initializePayment({
    required String accountNumber,
    required String bankCode,
    required double amount,
    required String currency,
    String? email,
    Map<String, dynamic>? metadata,
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
    required String accountNumber,
    required String bankCode,
    required double amount,
    required String currency,
    String? email,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      return await _bankPaymentService.initializePayment(
        accountNumber: accountNumber,
        bankCode: bankCode,
        amount: amount,
        currency: currency,
        email: email,
        metadata: metadata,
      );
    } catch (e) {
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
      throw PaystackException(
        message: 'Failed to verify payment',
        code: 'error occurred $e' ,
      );
    }
  }

  @override
  Future<Map<String, dynamic>> getPaymentStatus(String paymentId) async {
    try {
      return await _bankPaymentService.getPaymentStatus(paymentId);
    } catch (e) {
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
      throw PaystackException(
        message: 'Failed to get fetch banks',
        code: 'error occurred $e',
      );
    }
  }
}
