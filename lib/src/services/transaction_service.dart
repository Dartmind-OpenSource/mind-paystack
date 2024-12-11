import 'package:mind_paystack/src/client/mind_paystack_client.dart';
import 'package:mind_paystack/src/config/retry_policy.dart';
import 'package:mind_paystack/src/ui/app_api_endpoints.dart';

abstract class TransactionService {
  Future<Map<String, dynamic>> verifyTransaction(String transactionReference);

  Future<Map<String, dynamic>> getTransactionStatus(String transactionId);
}

class TransactionServiceImpl implements TransactionService {
  TransactionServiceImpl({
    required RetryPolicy retryPolicy,
    required MindPaystackClient mindPaystackClient,
  })  : _mindPaystackClient = mindPaystackClient,
        _retryPolicy = retryPolicy;
  final MindPaystackClient _mindPaystackClient;
  final RetryPolicy _retryPolicy;

  @override
  Future<Map<String, dynamic>> getTransactionStatus(
    String transactionId,
  ) async {
    final response = await _mindPaystackClient.get<Map<String, dynamic>>(
      AppApiEndpoints.getTransactionStatus,
      queryParams: {'transactionId': transactionId},
    );

    return response;
  }

  @override
  Future<Map<String, dynamic>> verifyTransaction(
    String transactionReference,
  ) async {
    final response = await _mindPaystackClient.get<Map<String, dynamic>>(
      AppApiEndpoints.verifyTransaction,
      queryParams: {'transactionReference': transactionReference},
    );
    return response;
  }
}
