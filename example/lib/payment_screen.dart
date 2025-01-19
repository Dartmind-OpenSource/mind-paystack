import 'package:flutter/material.dart' hide Card;
import 'package:mind_paystack/mind_paystack.dart';

class PaymentHomeScreen extends StatelessWidget {
  final MindPaystack mindPaystack = MindPaystack();

  PaymentHomeScreen({super.key});

  Future<void> chargeCard(BuildContext context) async {
    try {
      final response = await mindPaystack.chargeCard(
        chargeDetails: CardPaymentRequest(
          card: Card(
              number: '4084084084084081',
              cvv: '408',
              expiryMonth: '01',
              expiryYear: '26'),
          email: 'test@example.com',
          amount: 5000,
        ),
      );

      _showDialog(context, 'Payment Successful', response.toString());
    } catch (e) {
      _showDialog(context, 'Payment Failed', e.toString());
    }
  }

  Future<void> chargeBank(BuildContext context) async {
    try {
      final response = await mindPaystack.chargeBank(
        bankDetails: BankPaymentRequest(
          bank: Bank(accountNumber: '0000000000', code: '123456'),
          email: 'test@example.com',
          amount: 10000,
        ),
      );

      _showDialog(context, 'Payment Successful', response.toString());
    } catch (e) {
      _showDialog(context, 'Payment Failed', e.toString());
    }
  }

  void _showDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('MindPaystack Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => chargeCard(context),
              child: const Text('Charge Card'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => chargeBank(context),
              child: const Text('Charge Bank'),
            ),
          ],
        ),
      ),
    );
  }
}
