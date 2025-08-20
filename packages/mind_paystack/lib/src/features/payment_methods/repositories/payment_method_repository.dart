import 'package:mind_paystack/src/core/errors/models/error_metadata.dart';
import 'package:mind_paystack/src/core/errors/models/mind_exception.dart';

import 'package:mind_paystack/src/core/network/http_client.dart';
import 'package:mind_paystack/src/features/payment_methods/models/payment_method.dart';

/// Repository handling payment method data operations
class PaymentMethodRepository {
  PaymentMethodRepository(this._httpClient);

  final HttpClient _httpClient;

  /// Base endpoint for payment method operations
  static const _baseEndpoint = '/payment-methods';

  /// Lists payment methods for a customer
  ///
  /// [customerId] Unique identifier for the customer
  /// [type] Optional payment method type to filter by
  /// [status] Optional payment method status to filter by
  /// [page] Page number for pagination (starts at 1)
  /// [perPage] Number of records per page
  Future<List<PaymentMethod>> listPaymentMethods({
    required String customerId,
    String? type,
    String? status,
    int page = 1,
    int perPage = 20,
  }) async {
    try {
      final response = await _httpClient.get<Map<String, dynamic>>(
        _baseEndpoint,
        queryParameters: {
          'customer_id': customerId,
          if (type != null) 'type': type,
          if (status != null) 'status': status,
          'page': page.toString(),
          'per_page': perPage.toString(),
        },
      );

      final data = response.data?['data'] as List;
      return data
          .map((json) => PaymentMethod.fromJson(
                json?['data'] as Map<String, dynamic>? ?? {},
              ),)
          .toList();
    } catch (e) {
      throw _handleError(e, 'Failed to list payment methods');
    }
  }

  /// Creates a new payment method for a customer
  ///
  /// [customerId] Unique identifier for the customer
  /// [type] Type of payment method (card, bank_account, ussd)
  /// [token] Token from payment method tokenization
  /// [metadata] Optional additional data
  Future<PaymentMethod> createPaymentMethod({
    required String customerId,
    required String type,
    required String token,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      final response = await _httpClient.post<Map<String, dynamic>>(
        _baseEndpoint,
        data: {
          'customer_id': customerId,
          'type': type,
          'token': token,
          if (metadata != null) 'metadata': metadata,
        },
      );

      return PaymentMethod.fromJson(
        response.data?['data'] as Map<String, dynamic>? ?? {},
      );
    } catch (e) {
      throw _handleError(e, 'Failed to create payment method');
    }
  }

  /// Updates an existing payment method
  ///
  /// [id] Unique identifier for the payment method
  /// [updates] Map of fields to update
  Future<PaymentMethod> updatePaymentMethod({
    required String id,
    required Map<String, dynamic> updates,
  }) async {
    try {
      final response = await _httpClient.put<Map<String, dynamic>>(
        '$_baseEndpoint/$id',
        data: updates,
      );

      return PaymentMethod.fromJson(
        response.data?['data'] as Map<String, dynamic>? ?? {},
      );
    } catch (e) {
      throw _handleError(e, 'Failed to update payment method');
    }
  }

  /// Deletes a payment method
  ///
  /// [id] Unique identifier for the payment method
  Future<void> deletePaymentMethod(String id) async {
    try {
      await _httpClient.delete<Map<String, dynamic>>('$_baseEndpoint/$id');
    } catch (e) {
      throw _handleError(e, 'Failed to delete payment method');
    }
  }

  /// Handles error transformation
  MindException _handleError(dynamic error, String message) {
    if (error is MindException) return error;

    return MindException(
      message: message,
      code: 'payment_method_error',
      technicalMessage: error.toString(),
      metadata: ErrorMetadata(
        timestamp: DateTime.now(),
        originalError: error.toString(),
      ),
    );
  }
}
