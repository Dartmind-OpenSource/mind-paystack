import 'package:mind_paystack/src/client/mind_paystack_client.dart';
import 'package:mind_paystack/src/client/mind_paystack_client_impl.dart';
import 'package:mind_paystack/src/config/mind_paystack_config.dart';
import 'package:mind_paystack/src/model/payment_model.dart';

class ChargeApiService {
  // Private constructor
  ChargeApiService._internal({required MindPaystackConfig config})
      : _client = MindPaystackClientImpl(config: config);

  // Singleton instance (null-safe)
  static ChargeApiService? _instance;

  // Factory constructor to return or initialize the singleton instance
  factory ChargeApiService({required MindPaystackConfig config}) {
    _instance ??= ChargeApiService._internal(config: config);
    return _instance!;
  }

  // Internal Paystack client
  final MindPaystackClient _client;

  /// Initiate Charge (Common for both Card and Bank)
  Future<Map<String, dynamic>> initiateCharge({
    CardPaymentRequest? cardDetails,
    BankPaymentRequest? bankDetails,
    required PaymentType type,
  }) async {
    // Choose payment details based on type
    final paymentDetails = switch (type) {
      PaymentType.card => cardDetails?.toJson() ??
          (throw ArgumentError('Card details required for card payment')),
      PaymentType.bank => bankDetails?.toJson() ??
          (throw ArgumentError('Bank details required for bank payment')),
    };

    final response = await _client.post<Map<String, dynamic>>(
      'https://api.paystack.co/charge',
      data: paymentDetails,
    );
    return response;
  }

  /// Charge Using Card
  Future<Map<String, dynamic>> chargeCard({
    required CardPaymentRequest chargeDetails,
  }) async {
    return initiateCharge(
      cardDetails: chargeDetails,
      type: PaymentType.card,
    );
  }

  /// Charge Using Bank
  Future<Map<String, dynamic>> chargeBank({
    required BankPaymentRequest bankDetails,
  }) async {
    return initiateCharge(
      bankDetails: bankDetails,
      type: PaymentType.bank,
    );
  }

  void dispose() {
    // Dispose of any resources or connections here
    _client.cancelRequests();
  }
}
