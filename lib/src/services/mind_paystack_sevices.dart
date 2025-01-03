import 'package:mind_paystack/src/model/payment_model.dart';
import 'package:mind_paystack/src/services/bank_payment_service.dart';
import 'package:mind_paystack/src/services/charge_api_service.dart';
import 'package:mind_paystack/src/services/transaction_service.dart';

class MindPaystackServices {
  final BankPaymentService? bankPaymentService;
  final ChargeApiService? chargeApiService;
  final TransactionService? transactionService;

  MindPaystackServices({
    this.bankPaymentService,
    this.chargeApiService,
    this.transactionService,
  });

  // Bank Payment Methods
  Future<Map<String, dynamic>> initializeBankPayment({
    required String accountNumber,
    required String bankCode,
    required double amount,
    required String currency,
    String? email,
    Map<String, dynamic>? metadata,
  }) {
    return bankPaymentService!.initializePayment(
      accountNumber: accountNumber,
      bankCode: bankCode,
      amount: amount,
      currency: currency,
      email: email,
      metadata: metadata,
    );
  }

  Future<Map<String, dynamic>> verifyBankPayment(String paymentReference) {
    return bankPaymentService!.verifyPayment(paymentReference);
  }

  Future<Map<String, dynamic>> getBankPaymentStatus(String paymentId) {
    return bankPaymentService!.getPaymentStatus(paymentId);
  }

  Future<List<dynamic>> fetchAvailableBanks() {
    return bankPaymentService!.fetchBanks();
  }

  // Card Payment Methods
  Future<Map<String, dynamic>> chargeCard({
    required CardPaymentRequest cardDetails,
  }) {
    return chargeApiService!.chargeCard(chargeDetails: cardDetails);
  }

  // Bank Charge Methods
  Future<Map<String, dynamic>> chargeBank({
    required BankPaymentRequest bankDetails,
  }) {
    return chargeApiService!.chargeBank(bankDetails: bankDetails);
  }

  // Transaction Methods
  Future<Map<String, dynamic>> verifyTransaction(String transactionReference) {
    return transactionService!.verifyTransaction(transactionReference);
  }

  Future<Map<String, dynamic>> getTransactionStatus(String transactionId) {
    return transactionService!.getTransactionStatus(transactionId);
  }
}
