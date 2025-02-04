import 'package:mind_paystack/mind_paystack.dart';

class SamplePaymentDart {
  Future<void> chargeCard() async {
    final mindPaystack = MindPaystack(PaystackConfig(
      publicKey: 'pk_test_3c13f7cf3cccc56231d62a6e4447642294c272ad',
      secretKey: 'sk_test_96c3a5cb05f31ce6c057e7484db651a028ff283f',
    ));
    (await mindPaystack.initialize());
    mindPaystack.paymentChannel.chargeCard(
      cardNumber: '4084084084084081',
      cvv: '408',
      expiryMonth: '04',
      expiryYear: '2025',
      amount: 30000,
      email: 'babalolagbogo@gmail.com',
      currency: 'NGN',
    );
  }
}
