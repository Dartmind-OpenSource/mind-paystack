import 'dart:io';

import 'package:ex00_checkout_basic/ex00_checkout_basic.dart';

/// MindPaystack Basic Checkout Example CLI
///
/// This command-line tool demonstrates how to use the MindPaystack SDK
/// to initialize transactions and verify payments.
///
/// ## Usage
///
/// ```bash
/// dart run ex00_checkout_basic
/// dart run ex00_checkout_basic --help
/// dart run ex00_checkout_basic --from-env
/// ```
///
/// ## Environment Variables
///
/// The following environment variables are required:
/// - PAYSTACK_PUBLIC_KEY: Your Paystack public key
/// - PAYSTACK_SECRET_KEY: Your Paystack secret key
/// - PAYSTACK_ENVIRONMENT: (optional) 'test' or 'production'
/// - PAYSTACK_LOG_LEVEL: (optional) 'debug', 'info', 'warning', 'error'

void main(List<String> args) async {
  try {
    // Handle help flag
    if (args.contains('--help') || args.contains('-h')) {
      _printHelp();
      exit(0);
    }

    stdout.writeln('🚀 MindPaystack Basic Checkout Example');
    stdout.writeln('=' * 45);

    // Initialize SDK based on arguments
    late BasicCheckoutExample example;
    if (args.contains('--from-env')) {
      stdout.writeln('📋 Using SDK environment variable initialization...');
      example = await BasicCheckoutExample.fromEnvironment();
    } else {
      stdout.writeln('📋 Using .env file initialization...');
      example = await BasicCheckoutExample.create();
    }

    // Get customer email
    final email = _getEmail(args);

    // Get amount
    final amountKobo = _getAmount(args);

    stdout.writeln('\n💳 Transaction Details:');
    stdout.writeln('   Email: $email');
    stdout.writeln('   Amount: ₦${(amountKobo / 100).toStringAsFixed(2)}');
    stdout.writeln('');

    // Start checkout
    final authUrl = await example.startCheckout(
      email: email,
      amountKobo: amountKobo,
    );

    if (authUrl != null) {
      stdout.writeln('🔗 Payment URL generated successfully!');

      // Optional verification
      final shouldVerify = _promptForVerification();
      if (shouldVerify) {
        final reference = _getVerificationReference();
        if (reference != null) {
          await example.verify(reference);
        }
      }
    } else {
      stderr.writeln('❌ Failed to generate payment URL');
      exit(1);
    }

    stdout.writeln('\n✅ Example completed successfully!');
  } catch (e) {
    stderr.writeln('\n❌ Error: $e');
    exit(1);
  }
}

/// Gets customer email from arguments or prompts user
String _getEmail(List<String> args) {
  // Check for --email flag
  final emailIndex = args.indexOf('--email');
  if (emailIndex != -1 && emailIndex + 1 < args.length) {
    final email = args[emailIndex + 1];
    if (_isValidEmail(email)) {
      return email;
    } else {
      stderr.writeln('❌ Invalid email format: $email');
      exit(1);
    }
  }

  // Prompt user for email
  stdout.writeln('📧 Enter customer email:');
  final email = stdin.readLineSync();

  if (email == null || email.isEmpty) {
    stderr.writeln('❌ Email is required');
    exit(1);
  }

  if (!_isValidEmail(email)) {
    stderr.writeln('❌ Invalid email format: $email');
    exit(1);
  }

  return email;
}

/// Gets amount from arguments or prompts user
int _getAmount(List<String> args) {
  // Check for --amount flag
  final amountIndex = args.indexOf('--amount');
  if (amountIndex != -1 && amountIndex + 1 < args.length) {
    final amountStr = args[amountIndex + 1];
    final amount = double.tryParse(amountStr);
    if (amount != null && amount > 0) {
      return (amount * 100).round(); // Convert to kobo
    } else {
      stderr.writeln('❌ Invalid amount: $amountStr');
      exit(1);
    }
  }

  // Prompt user for amount
  stdout.writeln('💰 Enter amount in Naira (e.g., 100.50):');
  final amountInput = stdin.readLineSync();

  if (amountInput == null || amountInput.isEmpty) {
    stderr.writeln('❌ Amount is required');
    exit(1);
  }

  final amountNaira = double.tryParse(amountInput);
  if (amountNaira == null || amountNaira <= 0) {
    stderr.writeln('❌ Invalid amount: $amountInput');
    exit(1);
  }

  return (amountNaira * 100).round(); // Convert to kobo
}

/// Prompts user if they want to verify a payment
bool _promptForVerification() {
  stdout.writeln('\n🔍 Would you like to verify a payment? (y/N):');
  final response = stdin.readLineSync()?.toLowerCase().trim();
  return response == 'y' || response == 'yes';
}

/// Gets transaction reference for verification
String? _getVerificationReference() {
  stdout.writeln('📝 Enter transaction reference to verify:');
  final reference = stdin.readLineSync();

  if (reference == null || reference.isEmpty) {
    stdout.writeln('⏭️  Skipping verification');
    return null;
  }

  return reference;
}

/// Basic email validation
bool _isValidEmail(String email) {
  return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
}

/// Prints help information
void _printHelp() {
  stdout.writeln('''
🚀 MindPaystack Basic Checkout Example

A command-line tool demonstrating MindPaystack SDK usage for transaction
initialization and payment verification.

USAGE:
    dart run ex00_checkout_basic [OPTIONS]

OPTIONS:
    --help, -h              Show this help message
    --from-env              Use SDK environment variable initialization
    --email <EMAIL>         Customer email address
    --amount <AMOUNT>       Payment amount in Naira (e.g., 100.50)

EXAMPLES:
    # Interactive mode with .env file
    dart run ex00_checkout_basic

    # Interactive mode with environment variables
    dart run ex00_checkout_basic --from-env

    # Non-interactive mode
    dart run ex00_checkout_basic --email customer@example.com --amount 500

ENVIRONMENT VARIABLES:
    PAYSTACK_PUBLIC_KEY     Your Paystack public key (required)
    PAYSTACK_SECRET_KEY     Your Paystack secret key (required)
    PAYSTACK_ENVIRONMENT    Environment: 'test' or 'production' (optional)
    PAYSTACK_LOG_LEVEL      Log level: 'debug', 'info', 'warning', 'error' (optional)

For more information, visit: https://github.com/your-repo/mind-paystack
''');
}
