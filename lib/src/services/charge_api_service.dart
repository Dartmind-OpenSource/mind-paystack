import 'package:mind_paystack/src/client/mind_paystack_client.dart';

abstract class ChargeApiService {
  ChargeApiService({
    required this.client,
    required this.apiUrl,
  });

  final MindPaystackClient client;
  final String apiUrl;

  /// Initiate Charge (Common for both Card and Bank)
  Future<Map<String, dynamic>> initiateCharge(Map<String, dynamic> chargeDetails) async {
    final response = await client.post<Map<String, dynamic>>(
      '$apiUrl/charge',
      data: chargeDetails,
    );

    return response; // Assuming the `response` is already parsed to a Map.
  }

  /// Charge Using Card
  Future<Map<String, dynamic>> chargeCard({
    required String email,
    required String cardNumber,
    required String cvv,
    required String expiryMonth,
    required String expiryYear,
    required double amount,

  }) async {
    final chargeDetails = {
      "email": email,
      "amount": (amount * 100).toInt(), // Convert amount to kobo
      "card": {
        "number": cardNumber,
        "cvv": cvv,
        "expiry_month": expiryMonth,
        "expiry_year": expiryYear,
      },
    };

    return await initiateCharge(chargeDetails);
  }

  /// Charge Using Bank
  Future<Map<String, dynamic>> chargeBank({
    required String email,
    required String accountNumber,
    required String bankCode,
    required double amount,
  }) async {
    final chargeDetails = {
      "email": email,
      "amount": (amount * 100).toInt(), // Convert amount to kobo
      "bank": {
        "account_number": accountNumber,
        "code": bankCode,
      },
    };

    return await initiateCharge(chargeDetails);
  }
}
