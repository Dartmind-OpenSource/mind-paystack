import 'package:mind_paystack/src/client/mind_paystack_client.dart';
import 'package:mind_paystack/src/model/payment_model.dart';

abstract class ChargeApiService {
  ChargeApiService({
    required this.client,
    required this.apiUrl,
  });

  final MindPaystackClient client;
  final String apiUrl;

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

    final response = await client.post<Map<String, dynamic>>(
      '$apiUrl/charge',
      data: paymentDetails,
    );
    return response;
  }

  /// Charge Using Card
  Future<Map<String, dynamic>> chargeCard({
    required CardPaymentRequest chargeDetails,
  }) async {
    return await initiateCharge(
      cardDetails: chargeDetails,
      type:PaymentType.card,
    );
  }

  /// Charge Using Bank
  Future<Map<String, dynamic>> chargeBank({
  required  BankPaymentRequest bankDetails
  }) async {
    return await initiateCharge(
        bankDetails: bankDetails,
        type:PaymentType.bank,
      );
  }
}
