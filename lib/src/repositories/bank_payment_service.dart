import 'package:mind_paystack/src/client/mind_paystack_client.dart';

import '../config/retry_policy.dart';

class BankPaymentService {
  final MindPaystackClient mindPaystackClient;
  final RetryPolicy _retryPolicy;

  BankPaymentService(this.mindPaystackClient, this._retryPolicy);

  /// Initialize a bank payment
  Future<Map<String, dynamic>> initializePayment({
    required String accountNumber,
    required String bankCode,
    required double amount,
    required String currency,
    String? email,
    Map<String, dynamic>? metadata,
  }) async {
    return await _retryPolicy.retry(() async {
      final response = await mindPaystackClient.post(
        'https://api.example.com/payments/initialize',
        data: {
          'account_number': accountNumber,
          'bank_code': bankCode,
          'amount': amount,
          'currency': currency,
          'email': email,
          'metadata': metadata,
        },
      );
      return _parseResponse(response);
    });
  }

  /// Verify a payment by its reference
  Future<Map<String, dynamic>> verifyPayment(String paymentReference) async {
    return await _retryPolicy.retry(() async {
      final response = await mindPaystackClient.get(
        'https://api.example.com/payments/verify/$paymentReference',
      );
      return _parseResponse(response);
    });
  }

  /// Get payment status
  Future<String> getPaymentStatus(String paymentId) async {
    return await _retryPolicy.retry(() async {
      final response = await mindPaystackClient.get(
        'https://api.example.com/payments/status/$paymentId',
      );
      final data = _parseResponse(response);
      return data['status'] ?? 'unknown';
    });
  }

  /// Fetch supported banks
  Future<List<Map<String, String>>> fetchBanks() async {
    return await _retryPolicy.retry(() async {
      final response = await mindPaystackClient.get(
        'https://api.example.com/banks',
      );
      final data = _parseResponse(response);
      return List<Map<String, String>>.from(data['banks'] ?? []);
    });
  }

  /// Resolve a bank account to confirm details
  Future<Map<String, dynamic>> resolveBankAccount({
    required String accountNumber,
    required String bankCode,
  }) async {
    return await _retryPolicy.retry(() async {
      final response = await mindPaystackClient.get(
        'https://api.example.com/banks/resolve',
        body: {'account_number': accountNumber, 'bank_code': bankCode},
      );
      return _parseResponse(response);
    });
  }

  /// Parse and handle the HTTP response
  dynamic _parseResponse(dynamic response) {
    try {
      return response is String ? json.decode(response) : response;
    } catch (e) {
      throw Exception('Failed to parse response: $e');
    }
  }
}
