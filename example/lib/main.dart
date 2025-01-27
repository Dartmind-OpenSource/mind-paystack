import 'package:example/payment_screen.dart';
import 'package:flutter/material.dart' hide Card;
import 'package:mind_paystack/mind_paystack.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await MindPaystack.initialize(
      publicKey: 'pk_test_96c3a5cb05f31ce6c057e7484db651a028ff283f',
      //   'pk_test_d4539ca980b232ecaeb0e3ada75a584d5d66e04c',
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
