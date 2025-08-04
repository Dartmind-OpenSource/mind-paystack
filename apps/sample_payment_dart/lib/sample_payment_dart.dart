import 'package:mind_paystack/mind_paystack.dart';
import 'package:mind_paystack/src/features/charge/models/charge_response.dart';
import 'package:mind_paystack/src/features/transaction/models/transaction_response.dart';

/// Main entry point for the sample Paystack application
Future<void> main() async {
  print('===== MIND PAYSTACK PAYMENT DEMO =====');

  // Create an instance of our payment handler
  final paymentHandler = SamplePaymentDart();

  try {
    // Initialize the SDK
    await paymentHandler.initialize();

    // Show interactive menu
    await _showInteractiveMenu(paymentHandler);
  } catch (e) {
    print('Error during initialization: $e');
    print(
        'Make sure your API keys are correct and you have internet connectivity.');
  }
}

/// Interactive menu to demonstrate different payment scenarios
Future<void> _showInteractiveMenu(SamplePaymentDart paymentHandler) async {
  print('\nDEMONSTRATION OPTIONS:');
  print('1. Run complete card payment flow with verification');
  print('2. Process bank transfer payment');
  print('3. Process USSD payment');
  print('4. Test payment verification only');
  print('5. Run multiple payment methods in sequence');

  // In a real app, you would get user input
  // For this demo, we'll just run option 1 automatically

  print('\nRunning option 1: Complete card payment flow...\n');
  await paymentHandler.runCompletePaymentFlow();

  print('\nDemonstrating additional payment methods...\n');
  await _demonstrateAdditionalPaymentMethods(paymentHandler);

  print('\n===== DEMO COMPLETED =====');
  print('For a real application, you would integrate these payment methods');
  print('into your user interface and handle responses appropriately.');
}

/// Demonstrates additional payment methods beyond the basic card flow
Future<void> _demonstrateAdditionalPaymentMethods(
    SamplePaymentDart paymentHandler) async {
  // Example customer data
  const email = 'customer@example.com';
  const amount = 500.0; // ₦500
  final metadata = {
    'product_id': 'PROD-12345',
    'customer_id': 'CUST-6789',
    'source': 'mobile_app'
  };

  print('PROCESSING BANK TRANSFER PAYMENT:');
  try {
    final bankTransferResult = await paymentHandler.processBankTransfer(
      amount: amount,
      email: email,
      expiresIn: const Duration(hours: 24),
      metadata: metadata,
    );

    print('Bank transfer initiated successfully');
    print('Reference: ${bankTransferResult.reference}');
    print(
        'Payment instructions: ${bankTransferResult.authorizationUrl ?? "Check your email for payment instructions"}');
  } catch (e) {
    print('Bank transfer failed: $e');
  }

  print('\nPROCESSING USSD PAYMENT:');
  try {
    // Example for different payment methods using the unified method
    final ussdResult = await paymentHandler.processPaymentByMethod(
      paymentMethod: 'ussd',
      amount: amount,
      email: email,
      metadata: metadata,
    );

    print('USSD payment initiated successfully');
    print('Reference: ${ussdResult.reference}');
    print(
        'USSD Instructions: ${ussdResult.message ?? "Check your phone for USSD prompt"}');
  } catch (e) {
    print('USSD payment failed: $e');
  }

  print('\nDEMONSTRATING ERROR HANDLING:');
  try {
    // Deliberately cause an error with invalid card details
    await paymentHandler.processCardPayment(
      cardNumber: '1111111111111111', // Invalid card number
      cvv: '123',
      expiryMonth: '01',
      expiryYear: '2030',
      amount: amount,
      email: email,
    );
  } catch (e) {
    print('Expected error with invalid card: $e');
    print(
        'In a real application, you would display a user-friendly error message');
    print(
        'and prompt the user to correct their details or try a different payment method.');
  }

  print('\nDEMONSTRATING PAYMENT VERIFICATION:');
  try {
    // For demo purposes, we'll use a fake reference
    // In a real application, you'd use a reference from a successful payment
    const fakeReference = 'demo_ref_123456789';
    print('Attempting to verify payment with reference: $fakeReference');
    print(
        '(This is expected to fail since it\'s not a real transaction reference)');

    await paymentHandler.verifyPayment(fakeReference);
  } catch (e) {
    print('Verification failed as expected: $e');
  }
}

class SamplePaymentDart {
  /// This class demonstrates how to use the MindPaystack SDK for payment processing
  /// It provides examples for card payments, bank transfers, and verification

  /// Get the singleton instance of MindPaystack
  MindPaystack get mindPaystack => MindPaystack.instance;

  /// Initialize the Paystack SDK with configuration
  Future<void> initialize() async {
    // Initialize the SDK
    await MindPaystack.init(PaystackConfig(
      publicKey: 'pk_test_3c13f7cf3cccc56231d62a6e4447642294c272ad',
      secretKey: 'sk_test_96c3a5cb05f31ce6c057e7484db651a028ff283f',
    ));

    print('Paystack SDK initialized successfully');
  }

  /// Process a card payment
  Future<ChargeResponse> processCardPayment({
    required String cardNumber,
    required String cvv,
    required String expiryMonth,
    required String expiryYear,
    required double amount,
    required String email,
    String? currency,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      // Ensure SDK is initialized
      if (!mindPaystack.isInitialized) {
        await initialize();
      }

      // Process card payment
      final result = await mindPaystack.paymentChannel.chargeCard(
        cardNumber: cardNumber,
        cvv: cvv,
        expiryMonth: expiryMonth,
        expiryYear: expiryYear,
        amount:
            (amount * 100).toInt(), // Convert to kobo (smallest currency unit)
        email: email,
        currency: currency ?? 'NGN',
        metadata: metadata,
      );

      print('Payment initiated: ${result.reference}');
      return result;
    } catch (e) {
      print('Payment processing error: $e');
      rethrow;
    }
  }

  /// Process a bank transfer payment
  Future<ChargeResponse> processBankTransfer({
    required double amount,
    required String email,
    String? currency,
    Duration? expiresIn,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      // Ensure SDK is initialized
      if (!mindPaystack.isInitialized) {
        await initialize();
      }

      final result = await mindPaystack.paymentChannel.chargeBankTransfer(
        amount: (amount * 100).toInt(),
        email: email,
        currency: currency ?? 'NGN',
        expiresIn: expiresIn,
        metadata: metadata,
      );

      print('Bank transfer initiated: ${result.reference}');
      return result;
    } catch (e) {
      print('Bank transfer error: $e');
      rethrow;
    }
  }

  /// Verify a payment transaction
  Future<TransactionResponse> verifyPayment(String reference) async {
    try {
      // Ensure SDK is initialized
      if (!mindPaystack.isInitialized) {
        await initialize();
      }

      final result =
          await mindPaystack.transaction.verifyTransaction(reference);

      if (result.status == 'success') {
        print('Payment verified successfully');
      } else {
        print('Payment verification status: ${result.status}');
      }

      return result;
    } catch (e) {
      print('Payment verification error: $e');
      rethrow;
    }
  }

  /// A complete payment flow example
  Future<void> runCompletePaymentFlow() async {
    try {
      // 1. Initialize the SDK
      await initialize();

      // 2. Process a card payment
      final paymentResult = await processCardPayment(
          cardNumber: '4084084084084081', // Test card
          cvv: '408',
          expiryMonth: '04',
          expiryYear: '2025',
          amount: 300.00, // ₦300
          email: 'customer@example.com',
          metadata: {
            'custom_fields': [
              {
                'display_name': 'Order ID',
                'variable_name': 'order_id',
                'value': 'ORD-123456',
              },
              {
                'display_name': 'Customer Name',
                'variable_name': 'customer_name',
                'value': 'John Doe',
              }
            ]
          });

      // 3. Handle authentication if needed
      if (paymentResult.status == 'pending') {
        print('Payment requires authentication.');
        print('Auth URL: ${paymentResult.authorizationUrl}');

        // In a real app, you'd redirect the user to the authorizationUrl
        // After auth, Paystack would call your callback URL

        // For demo purposes, we'll just wait a bit and verify
        await Future.delayed(const Duration(seconds: 3));
      }

      // 4. Verify the payment - ensure reference is not null
      final reference = paymentResult.reference;
      if (reference == null || reference.isEmpty) {
        throw Exception('Payment reference is missing or empty');
      }

      final verificationResult = await verifyPayment(reference);

      if (verificationResult.status == 'success') {
        // 5. Handle successful payment
        print('Payment completed successfully!');
        print('Transaction Reference: ${verificationResult.reference}');

        // In a real app, you would:
        // - Update order status in your database
        // - Send confirmation email to customer
        // - Update inventory
        // - etc.
      } else {
        // 6. Handle failed payment
        print('Payment failed: ${verificationResult.message}');

        // In a real app, you would:
        // - Notify the customer
        // - Log the failure
        // - Offer alternative payment methods
      }
    } catch (e) {
      print('Error during payment flow: $e');
      // Handle exception appropriately
    }
  }

  /// Example of processing different payment methods based on user selection
  Future<ChargeResponse> processPaymentByMethod({
    required String paymentMethod,
    required double amount,
    required String email,
    Map<String, dynamic>? metadata,
  }) async {
    // Ensure SDK is initialized
    if (!mindPaystack.isInitialized) {
      await initialize();
    }

    switch (paymentMethod.toLowerCase()) {
      case 'card':
        return await processCardPayment(
          cardNumber: '4084084084084081',
          cvv: '408',
          expiryMonth: '04',
          expiryYear: '2025',
          amount: amount,
          email: email,
          metadata: metadata,
        );

      case 'bank_transfer':
        return await processBankTransfer(
          amount: amount,
          email: email,
          expiresIn: const Duration(hours: 24),
          metadata: metadata,
        );

      case 'ussd':
        return await mindPaystack.paymentChannel.chargeUssd(
          amount: (amount * 100).toInt(),
          email: email,
          bankCode: '057', // GTBank code
          metadata: metadata,
        );

      // Uncomment this when you have the proper QR implementation
      /*
      case 'qr':
        return await mindPaystack.paymentChannel.chargeQr(
          amount: (amount * 100).toInt(),
          email: email,
          provider: 'paystack',
          metadata: metadata,
        );
      */

      default:
        throw Exception('Unsupported payment method: $paymentMethod');
    }
  }
}
