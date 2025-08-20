import 'package:flutter/material.dart';

import 'checkout_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(const CheckoutFlutterApp());
}

class CheckoutFlutterApp extends StatelessWidget {
  const CheckoutFlutterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MindPaystack Flutter Checkout',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CheckoutPage(),
    );
  }
}
