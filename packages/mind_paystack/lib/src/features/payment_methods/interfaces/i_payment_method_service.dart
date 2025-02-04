import 'package:mind_paystack/src/features/payment_methods/models/payment_method.dart';

/// Interface defining the contract for payment method operations
abstract class IPaymentMethodService {
  /// Lists all payment methods for a customer
  ///
  /// [email] The customer's email address
  /// [perPage] Number of records per page (default: 50)
  /// [page] Page number (default: 1)
  Future<List<PaymentMethod>> listPaymentMethods({
    required String customerId,
    String? type,
    String? status,
    int page = 1,
    int perPage = 20,
  });

  /// Creates a new payment method for a customer using a token
  ///
  /// [email] The customer's email address
  /// [token] The tokenized payment method details
  Future<PaymentMethod> createPaymentMethod({
    required String customerId,
    required String type,
    required String token,
    Map<String, dynamic>? metadata,
  });

  /// Updates an existing payment method
  ///
  /// [id] The payment method ID
  /// [updates] Map of fields to update
  Future<PaymentMethod> updatePaymentMethod({
    required String id,
    required Map<String, dynamic> updates,
  });

  /// Removes a payment method
  ///
  /// [id] The payment method ID
  Future<void> removePaymentMethod(String id);
}
