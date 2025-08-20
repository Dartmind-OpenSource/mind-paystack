import 'dart:io';

import 'package:dotenv/dotenv.dart';
import 'package:mind_paystack/mind_paystack.dart';

/// A basic checkout example demonstrating MindPaystack SDK usage.
///
/// This class provides simple methods to initialize transactions and verify
/// payments using the MindPaystack SDK. It handles environment variable loading
/// and SDK initialization automatically.
///
/// ## Usage
///
/// ```dart
/// // Create instance (loads from .env automatically)
/// final checkout = await BasicCheckoutExample.create();
///
/// // Start a checkout flow
/// await checkout.startCheckout(
///   email: 'customer@example.com',
///   amountKobo: 50000, // ₦500.00
/// );
///
/// // Verify payment after completion
/// await checkout.verify('transaction_reference');
/// ```
class BasicCheckoutExample {
  /// Creates a new BasicCheckoutExample instance.
  ///
  /// Generally, you should use [BasicCheckoutExample.create] or
  /// [BasicCheckoutExample.fromEnvironment] instead of this constructor.
  const BasicCheckoutExample();

  /// Initializes a transaction and prints the checkout URL.
  ///
  /// This method creates a new transaction with the provided details and
  /// returns a payment URL that customers can use to complete their payment.
  ///
  /// [email] Customer's email address (required)
  /// [amountKobo] Payment amount in kobo (required)
  /// [currency] Payment currency (defaults to 'NGN')
  /// [reference] Transaction reference (auto-generated if not provided)
  ///
  /// Returns the authorization URL for payment completion.
  ///
  /// Throws [MindException] if transaction initialization fails.
  Future<String?> startCheckout({
    required String email,
    required int amountKobo,
    String currency = 'NGN',
    String? reference,
  }) async {
    try {
      final txnReference =
          reference ?? 'txn_${DateTime.now().millisecondsSinceEpoch}';

      stdout.writeln('Initializing transaction...');
      stdout.writeln('Email: $email');
      stdout.writeln('Amount: ₦${(amountKobo / 100).toStringAsFixed(2)}');
      stdout.writeln('Reference: $txnReference');

      final response = await MindPaystack.instance.transaction.initialize(
        InitializeTransactionOptions(
          amount: amountKobo.toString(),
          email: email,
          currency: currency,
          reference: txnReference,
        ),
      );

      if (response.status == true && response.data?.authorizationUrl != null) {
        stdout.writeln('\n✅ Transaction initialized successfully!');
        stdout.writeln('Reference: $txnReference');
        stdout.writeln('Open this URL to complete payment:');
        stdout.writeln('${response.data!.authorizationUrl}\n');
        return response.data!.authorizationUrl;
      } else {
        stderr.writeln('❌ Failed to initialize transaction');
        stderr.writeln('Response: $response');
        return null;
      }
    } on MindException catch (e) {
      stderr.writeln('❌ MindPaystack Error: ${e.message}');
      stderr.writeln('Code: ${e.code}');
      rethrow;
    } catch (e) {
      stderr.writeln('❌ Unexpected error: $e');
      rethrow;
    }
  }

  /// Verifies a transaction after payment completion.
  ///
  /// This method checks the status of a transaction using its reference
  /// and prints the payment status and details.
  ///
  /// [reference] The transaction reference to verify
  ///
  /// Returns true if payment was successful, false otherwise.
  ///
  /// Throws [MindException] if verification fails.
  Future<bool> verify(String reference) async {
    try {
      stdout.writeln('Verifying transaction: $reference...');

      final response = await MindPaystack.instance.transaction.verify(
        reference,
      );

      stdout.writeln('\n📋 Transaction Details:');
      stdout.writeln('Status: ${response.status}');
      stdout.writeln('Reference: $reference');
      stdout.writeln('Message: ${response.message}');

      if (response.data != null) {
        final data = response.data!;
        stdout.writeln('Data: $data');

        // Extract common fields that might be in the data map
        final amount = data.amount;
        final currency = data.currency;
        final status = data.status;
        final gatewayResponse = data.gatewayResponse;
        final customer = data.customer;

        stdout.writeln('Amount: ₦${(amount / 100).toStringAsFixed(2)}');

        stdout.writeln('Currency: $currency');

        if (customer != null) {
          stdout.writeln('Customer Email: ${customer.email}');
        }

        stdout.writeln('Payment Status: $status');

        if (gatewayResponse != null) {
          stdout.writeln('Gateway Response: $gatewayResponse');
        }

        if (status == 'success') {
          stdout.writeln('✅ Payment completed successfully!');
          return true;
        } else {
          stdout.writeln('❌ Payment not successful');
          return false;
        }
      } else {
        stdout.writeln('❌ No transaction data found');
        return false;
      }
    } on MindException catch (e) {
      stderr.writeln('❌ MindPaystack Error: ${e.message}');
      stderr.writeln('Code: ${e.code}');
      rethrow;
    } catch (e) {
      stderr.writeln('❌ Unexpected error during verification: $e');
      rethrow;
    }
  }

  /// Creates a BasicCheckoutExample instance with SDK initialized from .env file.
  ///
  /// This method loads environment variables from a .env file and initializes
  /// the MindPaystack SDK with the provided credentials.
  ///
  /// Expected .env variables:
  /// - PAYSTACK_PUBLIC_KEY: Your Paystack public key
  /// - PAYSTACK_SECRET_KEY: Your Paystack secret key
  /// - PAYSTACK_ENVIRONMENT: (optional) 'test' or 'production'
  /// - PAYSTACK_LOG_LEVEL: (optional) 'debug', 'info', 'warning', 'error'
  ///
  /// Returns a configured BasicCheckoutExample instance.
  ///
  /// Throws [MindException] if required environment variables are missing
  /// or SDK initialization fails.
  static Future<BasicCheckoutExample> create() async {
    try {
      final env = DotEnv(includePlatformEnvironment: true)..load();
      final secretKey = env['PAYSTACK_SECRET_KEY'];
      final publicKey = env['PAYSTACK_PUBLIC_KEY'];

      if (secretKey == null || secretKey.isEmpty) {
        stderr.writeln('❌ Error: PAYSTACK_SECRET_KEY not set in .env file');
        exit(1);
      }

      if (publicKey == null || publicKey.isEmpty) {
        stderr.writeln('❌ Error: PAYSTACK_PUBLIC_KEY not set in .env file');
        exit(1);
      }

      stdout.writeln('🔧 Initializing MindPaystack SDK...');

      await MindPaystack.initialize(
        PaystackConfig(
          publicKey: publicKey,
          secretKey: secretKey,
          environment: Environment.fromString(
            env['PAYSTACK_ENVIRONMENT'] ?? 'test',
          ),
          logLevel: LogLevel.fromString(env['PAYSTACK_LOG_LEVEL'] ?? 'info'),
        ),
      );

      stdout.writeln('✅ SDK initialized successfully!');
      return const BasicCheckoutExample();
    } on MindException catch (e) {
      stderr.writeln('❌ Failed to initialize SDK: ${e.message}');
      stderr.writeln('Code: ${e.code}');
      exit(1);
    } catch (e) {
      stderr.writeln('❌ Unexpected error during initialization: $e');
      exit(1);
    }
  }

  /// Creates a BasicCheckoutExample instance using environment variables.
  ///
  /// This is a convenience method that uses the SDK's built-in environment
  /// variable loading. It looks for the same variables as [create] but
  /// uses the SDK's fromEnvironment method for initialization.
  ///
  /// Returns a configured BasicCheckoutExample instance.
  ///
  /// Throws [MindException] if required environment variables are missing
  /// or SDK initialization fails.
  static Future<BasicCheckoutExample> fromEnvironment() async {
    try {
      stdout.writeln('🔧 Initializing MindPaystack SDK from environment...');

      await MindPaystack.fromEnvironment();

      stdout.writeln('✅ SDK initialized successfully!');
      return const BasicCheckoutExample();
    } on MindException catch (e) {
      stderr.writeln('❌ Failed to initialize SDK: ${e.message}');
      stderr.writeln('Code: ${e.code}');
      exit(1);
    } catch (e) {
      stderr.writeln('❌ Unexpected error during initialization: $e');
      exit(1);
    }
  }

  /// Creates a BasicCheckoutExample with custom configuration.
  ///
  /// This method allows you to provide a custom PaystackConfig directly
  /// instead of loading from environment variables.
  ///
  /// [config] The PaystackConfig to use for SDK initialization
  ///
  /// Returns a configured BasicCheckoutExample instance.
  static Future<BasicCheckoutExample> withConfig(PaystackConfig config) async {
    try {
      stdout.writeln('🔧 Initializing MindPaystack SDK with custom config...');

      await MindPaystack.initialize(config);

      stdout.writeln('✅ SDK initialized successfully!');
      return const BasicCheckoutExample();
    } on MindException catch (e) {
      stderr.writeln('❌ Failed to initialize SDK: ${e.message}');
      stderr.writeln('Code: ${e.code}');
      exit(1);
    } catch (e) {
      stderr.writeln('❌ Unexpected error during initialization: $e');
      exit(1);
    }
  }
}
