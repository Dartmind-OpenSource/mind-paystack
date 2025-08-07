import 'package:example/screens/home_screen.dart';
import 'package:example/screens/payment/bank_transfer_screen.dart';
import 'package:example/screens/payment/card_payment_screen.dart';
import 'package:example/screens/payment/payment_success_screen.dart';
import 'package:example/screens/payment/payment_method_screen.dart';
import 'package:example/screens/payment/ussd_payment_screen.dart';
import 'package:example/screens/transaction_history_screen.dart';
import 'package:example/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mind_paystack_flutter/mind_paystack_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Initialize the MindPaystack SDK
  await MindPaystack.init(
    PaystackConfig(
      publicKey: 'pk_test_3c13f7cf3cccc56231d62a6e4447642294c272ad',
      secretKey: 'sk_test_96c3a5cb05f31ce6c057e7484db651a028ff283f',
    ),
  );

  runApp(const PaystackApp());
}

class PaystackApp extends StatelessWidget {
  const PaystackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paystack Payment Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/payment-methods': (context) => const PaymentMethodScreen(),
        '/card-payment': (context) => const CardPaymentScreen(),
        '/bank-transfer': (context) => const BankTransferScreen(),
        '/ussd-payment': (context) => const UssdPaymentScreen(),
        '/payment-success': (context) => const PaymentSuccessScreen(),
        '/transaction-history': (context) => const TransactionHistoryScreen(),
      },
    );
  }
}
