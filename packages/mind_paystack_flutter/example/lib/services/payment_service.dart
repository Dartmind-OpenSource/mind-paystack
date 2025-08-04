import 'dart:math';
import 'package:example/models/transaction.dart';
import 'package:mind_paystack_flutter/mind_paystack_flutter.dart';
import 'package:mind_paystack/src/features/charge/models/charge_response.dart';
import 'package:mind_paystack/src/features/transaction/models/transaction_response.dart';

class PaymentService {
  static final PaymentService _instance = PaymentService._internal();

  factory PaymentService() => _instance;

  PaymentService._internal();

  // Maintain a list of transactions
  final List<Transaction> _transactions = [];

  // Get all transactions
  List<Transaction> get transactions => List.unmodifiable(_transactions);

  // Process card payment
  Future<ChargeResponse> processCardPayment({
    required String cardNumber,
    required String cvv,
    required String expiryMonth,
    required String expiryYear,
    required double amount,
    required String email,
    String? currency,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      final result = await MindPaystack.instance.paymentChannel.chargeCard(
        cardNumber: cardNumber,
        cvv: cvv,
        expiryMonth: expiryMonth,
        expiryYear: expiryYear,
        amount:
            (amount * 100).toInt(), // Convert to kobo (smallest currency unit)
        email: email,
        currency: currency ?? 'NGN',
        metadata: metadata,
      );

      // Save transaction to history
      _addTransactionToHistory(
        reference: result.reference?.toString() ?? 'unknown',
        amount: amount,
        email: email,
        status: result.status?.toString() ?? 'pending',
        paymentMethod: 'card',
        metadata: metadata,
      );

      return result;
    } catch (e) {
      rethrow;
    }
  }

  // Process bank transfer payment
  Future<ChargeResponse> processBankTransfer({
    required double amount,
    required String email,
    String? currency,
    Duration? expiresIn,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      final result =
          await MindPaystack.instance.paymentChannel.chargeBankTransfer(
        amount: (amount * 100).toInt(),
        email: email,
        currency: currency ?? 'NGN',
        expiresIn: expiresIn,
        metadata: metadata,
      );

      // Save transaction to history
      _addTransactionToHistory(
        reference: result.reference?.toString() ?? 'unknown',
        amount: amount,
        email: email,
        status: result.status?.toString() ?? 'pending',
        paymentMethod: 'bank_transfer',
        metadata: metadata,
      );

      return result;
    } catch (e) {
      rethrow;
    }
  }

  // Process USSD payment
  Future<ChargeResponse> processUssdPayment({
    required double amount,
    required String email,
    required String bankCode,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      final result = await MindPaystack.instance.paymentChannel.chargeUssd(
        amount: (amount * 100).toInt(),
        email: email,
        bankCode: bankCode,
        metadata: metadata,
      );

      // Save transaction to history
      _addTransactionToHistory(
        reference: result.reference?.toString() ?? 'unknown',
        amount: amount,
        email: email,
        status: result.status?.toString() ?? 'pending',
        paymentMethod: 'ussd',
        metadata: metadata,
      );

      return result;
    } catch (e) {
      rethrow;
    }
  }

  // Verify a payment transaction
  Future<TransactionResponse> verifyPayment(String reference) async {
    try {
      final result =
          await MindPaystack.instance.transaction.verifyTransaction(reference);

      // Update transaction status in history
      _updateTransactionStatus(
          reference, result.status?.toString() ?? 'unknown');

      return result;
    } catch (e) {
      rethrow;
    }
  }

  // Add a transaction to history
  void _addTransactionToHistory({
    required String reference,
    required double amount,
    required String email,
    required String status,
    required String paymentMethod,
    Map<String, dynamic>? metadata,
  }) {
    final transaction = Transaction(
      id: _generateTransactionId(),
      reference: reference,
      amount: amount,
      email: email,
      status: status,
      paymentMethod: paymentMethod,
      dateTime: DateTime.now(),
      metadata: metadata,
    );

    _transactions.add(transaction);
  }

  // Update transaction status
  void _updateTransactionStatus(String reference, String status) {
    final index = _transactions.indexWhere((t) => t.reference == reference);
    if (index != -1) {
      final transaction = _transactions[index];
      final updatedTransaction = Transaction(
        id: transaction.id,
        reference: transaction.reference,
        amount: transaction.amount,
        email: transaction.email,
        status: status,
        paymentMethod: transaction.paymentMethod,
        dateTime: transaction.dateTime,
        metadata: transaction.metadata,
      );

      _transactions[index] = updatedTransaction;
    }
  }

  // Generate a unique transaction ID
  String _generateTransactionId() {
    final random = Random();
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final id = List.generate(16, (index) => chars[random.nextInt(chars.length)])
        .join();
    return 'trx_$id';
  }
}
