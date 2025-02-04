import 'package:mind_paystack/src/features/payment_methods/interfaces/i_payment_method_service.dart';
import 'package:mind_paystack/src/features/payment_methods/models/payment_method.dart';
import 'package:mind_paystack/src/features/payment_methods/repositories/payment_method_repository.dart';

import 'package:mind_paystack/src/utils/logger.dart';

/// Service implementation for payment method operations
class PaymentMethodService implements IPaymentMethodService {
  /// Creates a new PaymentMethodService instance
  PaymentMethodService(this._repository);

  final PaymentMethodRepository _repository;

  @override
  Future<List<PaymentMethod>> listPaymentMethods({
    required String customerId,
    String? type,
    String? status,
    int page = 1,
    int perPage = 20,
  }) async {
    try {
      MPLogger.info('Listing payment methods for email: $customerId');
      return await _repository.listPaymentMethods(
        perPage: perPage,
        page: page,
        customerId: customerId,
      );
    } catch (e) {
      MPLogger.error(
        'Failed to list payment methods ',
        error: e,
      );
      rethrow;
    }
  }

  @override
  Future<PaymentMethod> createPaymentMethod({
    required String customerId,
    required String type,
    required String token,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      MPLogger.info('Creating payment method for customerId: $customerId');
      return await _repository.createPaymentMethod(
        customerId: customerId,
        type: type,
        metadata: metadata,
        token: token,
      );
    } catch (e) {
      MPLogger.error('Failed to create payment method', error: e);
      rethrow;
    }
  }

  @override
  Future<PaymentMethod> updatePaymentMethod({
    required String id,
    required Map<String, dynamic> updates,
  }) async {
    try {
      MPLogger.info('Updating payment method: $id');
      return await _repository.updatePaymentMethod(
        id: id,
        updates: updates,
      );
    } catch (e) {
      MPLogger.error('Failed to update payment method', error: e);
      rethrow;
    }
  }

  @override
  Future<void> removePaymentMethod(String id) async {
    try {
      MPLogger.info('Removing payment method: $id');
      await _repository.deletePaymentMethod(id);
    } catch (e) {
      MPLogger.error('Failed to remove payment method', error: e);
      rethrow;
    }
  }
}
