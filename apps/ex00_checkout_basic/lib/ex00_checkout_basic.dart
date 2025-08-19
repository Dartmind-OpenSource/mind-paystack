import 'dart:io';

import 'package:dotenv/dotenv.dart';
import 'package:mind_paystack/mind_paystack.dart';

class BasicCheckoutExample {
  final TransactionService transactionService;

  BasicCheckoutExample({required this.transactionService});

  /// Initialize transaction and print the checkout URL
  Future<void> startCheckout({
    required String email,
    required int amountKobo,
    String currency = 'NGN',
  }) async {
    final reference = 'txn_${DateTime.now().millisecondsSinceEpoch}';

    stdout.writeln('Initializing transaction...');
    final tx = await transactionService.initializeTransaction(
      amount: amountKobo,
      email: email,
      currency: currency,
      reference: reference,
    );

    stdout.writeln('Transaction initialized successfully!');
    stdout.writeln('Reference: $reference');
    stdout.writeln('Open this URL to complete payment:');
    stdout.writeln(tx.authorizationUrl);
  }

  /// Verify transaction after payment
  Future<void> verify(String reference) async {
    stdout.writeln('Verifying transaction $reference...');
    final verifyResponse = await transactionService.verifyTransaction(
      reference,
    );
    stdout.writeln('Payment status: ${verifyResponse.status}');
    stdout.writeln('Full response: $verifyResponse');
  }

  /// Factory method to create instance with credentials loaded from .env
  static Future<BasicCheckoutExample> create() async {
    final env = DotEnv(includePlatformEnvironment: true)..load();
    final secretKey = env['PAYSTACK_SECRET_KEY'];
    final publicKey = env['PAYSTACK_PUBLIC_KEY'];
    if (secretKey == null || secretKey.isEmpty) {
      stderr.writeln('Error: PAYSTACK_SECRET_KEY not set in .env');
      exit(1);
    } else if (publicKey == null || publicKey.isEmpty) {
      stderr.writeln('Error: PAYSTACK_PUBLIC_KEY not set in .env');
      exit(1);
    }

    // Here you might pass repository into TransactionService if your SDK requires it
    MindPaystack.init(
      PaystackConfig(publicKey: publicKey, secretKey: secretKey),
    );
    final mindPaystack = MindPaystack.instance;
    return BasicCheckoutExample(transactionService: mindPaystack.transaction);
  }
}
