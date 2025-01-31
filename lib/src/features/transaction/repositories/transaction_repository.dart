import 'package:mind_paystack/mind_paystack.dart';
import 'package:mind_paystack/src/core/errors/models/error_metadata.dart';
import 'package:mind_paystack/src/core/network/http_client.dart';
import 'package:mind_paystack/src/features/transaction/models/authorization_response.dart';
import 'package:mind_paystack/src/features/transaction/models/refund_response.dart';
import 'package:mind_paystack/src/features/transaction/models/transaction.dart';
import 'package:mind_paystack/src/features/transaction/models/transaction_event.dart';
import 'package:mind_paystack/src/features/transaction/models/transaction_response.dart';
import 'package:mind_paystack/src/features/transaction/models/transaction_session.dart';
import 'package:mind_paystack/src/features/transaction/models/transaction_totals.dart';
import 'package:mind_paystack/src/utils/logger.dart';

/// Repository handling transaction operations
class TransactionRepository {
  TransactionRepository(this._httpClient);

  final HttpClient _httpClient;
  static const _baseEndpoint = '/transaction';

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
  }) async {
    try {
      final response = await _httpClient.post<Map<String, dynamic>>(
        '$_baseEndpoint/initialize',
        data: {
          'amount': amount,
          'email': email,
          'currency': currency,
          if (callbackUrl != null) 'callback_url': callbackUrl,
          if (reference != null) 'reference': reference,
          if (channels != null) 'channels': channels,
          if (metadata != null) 'metadata': metadata,
          if (subaccount != null) 'subaccount': subaccount,
          if (transactionCharge != null)
            'transaction_charge': transactionCharge,
          if (bearer != null) 'bearer': bearer,
          if (paymentPlan != null) 'payment_plan': paymentPlan,
          if (sendEmail != null) 'send_email': sendEmail,
          if (invoiceLimit != null) 'invoice_limit': invoiceLimit,
          if (splitCode != null) 'split_code': splitCode,
        },
      );
      print(response.data);
      return TransactionResponse.fromJson(
        response.data ?? {},
      );
    } catch (e, s) {
      print(
        'TransactionRepository:initializeTransaction:response: $e $s',
      );
      throw _handleError(e, 'Failed to initialize transaction');
    }
  }

  /// Lists transactions
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
      final response = await _httpClient.get<Map<String, dynamic>>(
        _baseEndpoint,
        queryParameters: {
          if (customerId != null) 'customer_id': customerId,
          if (status != null) 'status': status,
          if (type != null) 'type': type,
          if (from != null) 'from': from.toIso8601String(),
          if (to != null) 'to': to.toIso8601String(),
          'page': page.toString(),
          'per_page': perPage.toString(),
        },
      );

      final data = response.data?['data'] as List;
      return data
          .map((json) => Transaction.fromJson(
                json as Map<String, dynamic>? ?? {},
              ))
          .toList();
    } catch (e) {
      throw _handleError(e, 'Failed to list transactions');
    }
  }

  /// Get single transaction
  Future<Transaction> getTransaction(String identifier) async {
    try {
      final response = await _httpClient.get<Map<String, dynamic>>(
        '$_baseEndpoint/$identifier',
      );

      return Transaction.fromJson(
        response.data?['data'] as Map<String, dynamic>? ?? {},
      );
    } catch (e) {
      throw _handleError(e, 'Failed to get transaction');
    }
  }

  /// Verify transaction
  Future<TransactionResponse> verifyTransaction(String reference) async {
    try {
      final response = await _httpClient.get<Map<String, dynamic>>(
        '$_baseEndpoint/verify/$reference',
      );

      return TransactionResponse.fromJson(
        response.data?['data'] as Map<String, dynamic>? ?? {},
      );
    } catch (e) {
      throw _handleError(e, 'Failed to verify transaction');
    }
  }

  /// Initiate refund
  Future<RefundResponse> initiateRefund({
    required String reference,
    required int amount,
    String? customerNote,
    String? merchantNote,
  }) async {
    try {
      final response = await _httpClient.post<Map<String, dynamic>>(
        '$_baseEndpoint/$reference/refund',
        data: {
          'amount': amount,
          if (customerNote != null) 'customer_note': customerNote,
          if (merchantNote != null) 'merchant_note': merchantNote,
        },
      );

      return RefundResponse.fromJson(
        response.data?['data'] as Map<String, dynamic>? ?? {},
      );
    } catch (e) {
      throw _handleError(e, 'Failed to initiate refund');
    }
  }

  /// Get transaction totals
  Future<TransactionTotals> getTransactionTotals({
    DateTime? from,
    DateTime? to,
    String? status,
  }) async {
    try {
      final response = await _httpClient.get<Map<String, dynamic>>(
        '$_baseEndpoint/totals',
        queryParameters: {
          if (from != null) 'from': from.toIso8601String(),
          if (to != null) 'to': to.toIso8601String(),
          if (status != null) 'status': status,
        },
      );

      return TransactionTotals.fromJson(
        response.data?['data'] as Map<String, dynamic>? ?? {},
      );
    } catch (e) {
      throw _handleError(e, 'Failed to get transaction totals');
    }
  }

  /// Get transaction timeline
  Future<List<TransactionEvent>> getTransactionTimeline(
      String reference) async {
    try {
      final response = await _httpClient.get<Map<String, dynamic>>(
        '$_baseEndpoint/$reference/timeline',
      );

      final data = response.data?['data'] as List;
      return data
          .map((json) => TransactionEvent.fromJson(
                json as Map<String, dynamic>? ?? {},
              ))
          .toList();
    } catch (e) {
      throw _handleError(e, 'Failed to get transaction timeline');
    }
  }

  /// Export transactions
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
      final response = await _httpClient.get<String>(
        '$_baseEndpoint/export',
        queryParameters: {
          if (status != null) 'status': status,
          if (currency != null) 'currency': currency,
          if (from != null) 'from': from.toIso8601String(),
          if (to != null) 'to': to.toIso8601String(),
          if (settledBy != null) 'settled_by': settledBy,
          if (paymentPage != null) 'payment_page': paymentPage,
          if (customerName != null) 'customer': customerName,
          'format': format,
        },
      );

      return response.data ?? '';
    } catch (e) {
      throw _handleError(e, 'Failed to export transactions');
    }
  }

  /// Get transaction sessions
  Future<List<TransactionSession>> getTransactionSessions(
      String reference) async {
    try {
      final response = await _httpClient.get<Map<String, dynamic>>(
        '$_baseEndpoint/$reference/sessions',
      );

      final data = response.data?['data'] as List;
      return data
          .map((json) => TransactionSession.fromJson(
                json as Map<String, dynamic>? ?? {},
              ))
          .toList();
    } catch (e) {
      throw _handleError(e, 'Failed to get transaction sessions');
    }
  }

  /// Reauthorize transaction
  Future<TransactionResponse> reauthorizeTransaction({
    required String reference,
    required int amount,
    String? currency,
  }) async {
    try {
      final response = await _httpClient.post<Map<String, dynamic>>(
        '$_baseEndpoint/$reference/reauthorize',
        data: {
          'amount': amount,
          if (currency != null) 'currency': currency,
        },
      );

      return TransactionResponse.fromJson(
        response.data?['data'] as Map<String, dynamic>? ?? {},
      );
    } catch (e) {
      throw _handleError(e, 'Failed to reauthorize transaction');
    }
  }

  /// Check authorization
  Future<AuthorizationResponse> checkAuthorization({
    required String authorizationCode,
    required String currency,
    required int amount,
    required String email,
  }) async {
    try {
      final response = await _httpClient.post<Map<String, dynamic>>(
        '$_baseEndpoint/check_authorization',
        data: {
          'authorization_code': authorizationCode,
          'currency': currency,
          'amount': amount,
          'email': email,
        },
      );

      return AuthorizationResponse.fromJson(
        response.data?['data'] as Map<String, dynamic>? ?? {},
      );
    } catch (e) {
      throw _handleError(e, 'Failed to check authorization');
    }
  }

  MindException _handleError(dynamic error, String message) {
    if (error is MindException) return error;

    return MindException(
      message: message,
      code: 'transaction_error',
      technicalMessage: error.toString(),
      metadata: ErrorMetadata(
        timestamp: DateTime.now(),
        originalError: error.toString(),
      ),
    );
  }
}
