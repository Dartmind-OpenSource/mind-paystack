import 'package:flutter/material.dart' hide Card;
import 'package:mind_paystack/mind_paystack.dart'; // Import your package

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await MindPaystack.initialize(
      publicKey: 'sk_test_96c3a5cb05f31ce6c057e7484db651a028ff283f',
      environment: Environment.test,
      logLevel: LogLevel.info);

  runApp(const MindPaystackExampleApp());
}

class MindPaystackExampleApp extends StatelessWidget {
  const MindPaystackExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MindPaystack Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PaymentHomeScreen(),
    );
  }
}

class PaymentHomeScreen extends StatelessWidget {
  final MindPaystack mindPaystack = MindPaystack();

  PaymentHomeScreen({super.key});

  Future<void> chargeCard(BuildContext context) async {
    try {
      final response = await mindPaystack.chargeCard(
        chargeDetails: CardPaymentRequest(
          card: Card(
              number: '4242424242424242',
              cvv: '123',
              expiryMonth: '01',
              expiryYear: '30'),
          email: 'test@example.com',
          amount: 5000, // Amount in smallest unit (e.g., kobo for NGN)
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
          bank: Bank(accountNumber: '2343906677', code: '1234'),
          email: 'test@example.com',
          amount: 10000, // Amount in smallest unit
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
      appBar: AppBar(
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
