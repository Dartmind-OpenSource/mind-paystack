import 'package:mind_paystack/src/client/mind_paystack_client.dart';
import 'package:mind_paystack/src/config/retry_policy.dart';
import 'package:mind_paystack/src/model/bank_model.dart';
import 'package:mind_paystack/src/ui/app_api_endpoints.dart';

abstract class BankPaymentService {
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

class BankPaymentServiceImpl implements BankPaymentService {
  final MindPaystackClient _mindPaystackClient;
  final RetryPolicy _retryPolicy;

  BankPaymentServiceImpl(
      {required RetryPolicy retryPolicy,
      required MindPaystackClient mindPaystackClient})
      : _mindPaystackClient = mindPaystackClient,
        _retryPolicy = retryPolicy;

  @override
  Future<Map<String, dynamic>> initializePayment({
    required String accountNumber,
    required String bankCode,
    required double amount,
    required String currency,
    String? email,
    Map<String, dynamic>? metadata,
  }) async {
    final response = await _mindPaystackClient.post<Map<String, dynamic>>(
      AppApiEndpoints.initializePayment,
      data: {
        'account_number': accountNumber,
        'bank_code': bankCode,
        'amount': amount,
        'currency': currency,
        'email': email,
        'metadata': metadata,
      },
    );
    return response;
  }

  @override
  Future<Map<String, dynamic>> verifyPayment(String paymentReference) async {
    final response = await _mindPaystackClient.get<Map<String, dynamic>>(
        AppApiEndpoints.verifyPayment,
        queryParams: {'paymentReference': paymentReference});
    return response;
  }

  @override
  Future<Map<String, dynamic>> getPaymentStatus(String paymentId) async {
    final response = await _mindPaystackClient.get<Map<String, dynamic>>(
        AppApiEndpoints.getPaymentStatus,
        queryParams: {'paymentId': paymentId});

    return response;
  }

  @override
  Future<List<BankResponse>> fetchBanks() async {
    final response = await _mindPaystackClient.get<Map<String, dynamic>>(
      AppApiEndpoints.getBanks,
    );
    final List<dynamic> transactions = response['data'] as List<dynamic>;
    return transactions
        .map((json) =>
            BankResponse.fromJson(Map<String, dynamic>.from(json as Map)))
        .toList();
  }
}
