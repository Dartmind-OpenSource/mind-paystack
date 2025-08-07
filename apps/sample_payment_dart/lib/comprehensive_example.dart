import 'package:mind_paystack/mind_paystack.dart';
import 'package:mind_paystack/src/config/environment.dart';
import 'package:mind_paystack/src/config/log_level.dart';
import 'package:mind_paystack/src/core/errors/enums/error_category.dart';

/// Comprehensive MindPaystack SDK Example
/// 
/// This example demonstrates all major features of the MindPaystack SDK including:
/// - SDK initialization and configuration
/// - All payment methods (card, bank transfer, USSD, mobile money)
/// - Payment method management
/// - Transaction operations
/// - Payment channel information
/// - Error handling patterns
/// - Best practices and security recommendations
/// 
/// Author: Kelvin Dart
/// Created for: https://github.com/Dartmind-OpenSource/mind-paystack/issues/[issue_number]

Future<void> main() async {
  print('🎯 COMPREHENSIVE MINDPAYSTACK SDK EXAMPLE');
  print('==========================================\n');

  final example = ComprehensiveMindPaystackExample();
  
  try {
    await example.runFullDemonstration();
  } catch (e) {
    print('❌ Demo failed: $e');
    print('\n💡 Common issues:');
    print('   - Check your API keys in the configuration');
    print('   - Ensure you have internet connectivity');
    print('   - Verify your Paystack account is active');
  }
}

class ComprehensiveMindPaystackExample {
  /// Get the singleton instance of MindPaystack
  MindPaystack get mindPaystack => MindPaystack.instance;

  /// Run the complete demonstration of all SDK features
  Future<void> runFullDemonstration() async {
    print('🚀 Starting comprehensive SDK demonstration...\n');
    
    // 1. SDK Initialization
    await _demonstrateSDKInitialization();
    
    // 2. Payment Methods
    await _demonstratePaymentMethods();
    
    // 3. Payment Method Management
    await _demonstratePaymentMethodManagement();
    
    // 4. Transaction Operations
    await _demonstrateTransactionOperations();
    
    // 5. Payment Channels
    await _demonstratePaymentChannels();
    
    // 6. Error Handling
    await _demonstrateErrorHandling();
    
    // 7. Best Practices
    _demonstrateBestPractices();
    
    print('\n✅ Comprehensive demonstration completed!');
    print('📚 Check the inline comments for detailed explanations.');
  }

  /// 1. SDK INITIALIZATION
  /// Demonstrates how to properly initialize the MindPaystack SDK
  Future<void> _demonstrateSDKInitialization() async {
    print('📦 1. SDK INITIALIZATION');
    print('========================\n');
    
    try {
      // Basic initialization with minimal configuration
      print('🔧 Initializing SDK with basic configuration...');
      await MindPaystack.init(PaystackConfig(
        // 🔑 API Keys - NEVER expose these in production code!
        // Use environment variables or secure key management
        publicKey: 'pk_test_3c13f7cf3cccc56231d62a6e4447642294c272ad',
        secretKey: 'sk_test_96c3a5cb05f31ce6c057e7484db651a028ff283f',
        
        // 🌍 Environment Configuration
        environment: Environment.test, // Use Environment.live for production
        
        // 📊 Logging Level
        logLevel: LogLevel.info, // Adjust based on your needs
        
        // 💰 Default Currency
        currency: 'NGN', // Nigerian Naira
        
        // 🌐 Locale
        locale: 'en', // Language preference
        
        // ⏱️ Request Timeout
        timeout: const Duration(seconds: 30),
      ));
      
      print('✅ SDK initialized successfully!');
      print('📋 Configuration:');
      print('   - Environment: ${Environment.test.name}');
      print('   - Currency: NGN');
      print('   - Timeout: 30 seconds');
      print('   - Logging: Info level\n');
      
    } catch (e) {
      print('❌ SDK initialization failed: $e');
      rethrow;
    }
  }

  /// 2. PAYMENT METHODS
  /// Demonstrates all supported payment methods
  Future<void> _demonstratePaymentMethods() async {
    print('💳 2. PAYMENT METHODS');
    print('=====================\n');
    
    // Test customer data
    const testEmail = 'customer@example.com';
    const testAmount = 5000.0; // ₦50.00 (amount in naira)
    final testMetadata = {
      'order_id': 'ORD-${DateTime.now().millisecondsSinceEpoch}',
      'customer_name': 'John Doe',
      'product': 'Premium Subscription',
    };

    // 2.1 Card Payment
    await _demonstrateCardPayment(testEmail, testAmount, testMetadata);
    
    // 2.2 Bank Transfer Payment
    await _demonstrateBankTransferPayment(testEmail, testAmount, testMetadata);
    
    // 2.3 USSD Payment
    await _demonstrateUssdPayment(testEmail, testAmount, testMetadata);
    
    // 2.4 Mobile Money Payment (if available)
    await _demonstrateMobileMoneyPayment(testEmail, testAmount, testMetadata);
  }

  /// 2.1 Card Payment Example
  Future<void> _demonstrateCardPayment(String email, double amount, Map<String, dynamic> metadata) async {
    print('💳 2.1 CARD PAYMENT');
    print('-------------------');
    
    try {
      print('🔄 Processing card payment...');
      
      // Create a card payment charge
      final cardResult = await mindPaystack.paymentChannel.chargeCard(
        // 💳 Test card details (Paystack test cards)
        cardNumber: '4084084084084081', // Successful test card
        cvv: '408',
        expiryMonth: '04',
        expiryYear: '2030',
        
        // 💰 Payment details
        amount: (amount * 100).toInt(), // Convert to kobo (smallest unit)
        email: email,
        currency: 'NGN',
        
        // 📋 Additional data
        metadata: metadata,
      );
      
      print('✅ Card charge initiated successfully!');
      print('📋 Charge Details:');
      print('   - Reference: ${cardResult.reference}');
      print('   - Status: ${cardResult.status}');
      print('   - Amount: ₦${(cardResult.amount ?? 0) / 100}');
      
      // Handle different response statuses
      if (cardResult.status == true) {
        print('🎉 Payment completed immediately!');
      } else if (cardResult.status == false) {
        print('❌ Payment failed: ${cardResult.message}');
      } else {
        print('⏳ Payment requires additional authentication');
        if (cardResult.authorizationUrl != null) {
          print('🔗 Auth URL: ${cardResult.authorizationUrl}');
          print('💡 In a real app, redirect user to this URL');
        }
      }
      
    } catch (e) {
      print('❌ Card payment error: $e');
      print('💡 Common causes: Invalid card details, network issues, API key problems');
    }
    
    print(''); // Empty line for spacing
  }

  /// 2.2 Bank Transfer Payment Example
  Future<void> _demonstrateBankTransferPayment(String email, double amount, Map<String, dynamic> metadata) async {
    print('🏦 2.2 BANK TRANSFER PAYMENT');
    print('-----------------------------');
    
    try {
      print('🔄 Setting up bank transfer...');
      
      final bankTransferResult = await mindPaystack.paymentChannel.chargeBankTransfer(
        amount: (amount * 100).toInt(), // Convert to kobo
        email: email,
        currency: 'NGN',
        
        // ⏱️ Optional: Set expiry time for the transfer
        expiresIn: const Duration(hours: 24),
        
        metadata: metadata,
      );
      
      print('✅ Bank transfer setup successful!');
      print('📋 Transfer Details:');
      print('   - Reference: ${bankTransferResult.reference}');
      print('   - Status: ${bankTransferResult.status}');
      
      // In a real app, you would display the bank account details
      // received in the response for the customer to transfer to
      print('💡 Next steps:');
      print('   1. Display bank account details to customer');
      print('   2. Customer makes transfer to provided account');
      print('   3. Payment is automatically confirmed via webhook');
      print('   4. Verify payment status using the reference');
      
    } catch (e) {
      print('❌ Bank transfer setup error: $e');
      // Note: This might fail due to API endpoint issues identified earlier
      print('⚠️  Known issue: API endpoints may need correction (see PR #25)');
    }
    
    print('');
  }

  /// 2.3 USSD Payment Example
  Future<void> _demonstrateUssdPayment(String email, double amount, Map<String, dynamic> metadata) async {
    print('📱 2.3 USSD PAYMENT');
    print('-------------------');
    
    // Available USSD bank codes
    final usdBanks = {
      '737': 'GTBank',
      '919': 'UBA', 
      '822': 'Sterling Bank',
      '966': 'Zenith Bank',
    };
    
    print('📋 Available USSD Banks:');
    usdBanks.forEach((code, name) {
      print('   - $name: *$code#');
    });
    
    try {
      print('\n🔄 Setting up USSD payment (using GTBank as example)...');
      
      final ussdResult = await mindPaystack.paymentChannel.chargeUssd(
        amount: (amount * 100).toInt(),
        email: email,
        bankCode: '737', // GTBank
        metadata: metadata,
      );
      
      print('✅ USSD charge setup successful!');
      print('📋 USSD Details:');
      print('   - Reference: ${ussdResult.reference}');
      print('   - Status: ${ussdResult.status}');
      
      // In a real app, you would show the USSD code to dial
      print('💡 Customer instructions:');
      print('   1. Dial the provided USSD code on your phone');
      print('   2. Follow the prompts to authorize payment');
      print('   3. Payment confirmation via webhook');
      
    } catch (e) {
      print('❌ USSD payment error: $e');
      print('⚠️  Known issue: API endpoints may need correction (see PR #25)');
    }
    
    print('');
  }

  /// 2.4 Mobile Money Payment Example
  Future<void> _demonstrateMobileMoneyPayment(String email, double amount, Map<String, dynamic> metadata) async {
    print('📲 2.4 MOBILE MONEY PAYMENT');
    print('---------------------------');
    
    // Available mobile money providers (Ghana)
    final providers = {
      'mtn': 'MTN Mobile Money',
      'vod': 'Vodafone Cash',
      'tgo': 'Airtel/Tigo Cash',
    };
    
    print('📋 Available Providers (Ghana):');
    providers.forEach((code, name) {
      print('   - $name: $code');
    });
    
    try {
      print('\n🔄 Setting up mobile money payment (MTN example)...');
      
      // Note: This is an example - actual implementation may vary
      // based on the SDK's mobile money support
      print('💡 Mobile money integration example:');
      print('   - Provider: MTN Mobile Money');
      print('   - Currency: GHS (Ghana Cedis)');
      print('   - Phone: +233XXXXXXXXX');
      
      print('⚠️  Mobile money implementation depends on SDK support');
      print('   Check SDK documentation for current mobile money methods');
      
    } catch (e) {
      print('❌ Mobile money error: $e');
    }
    
    print('');
  }

  /// 3. PAYMENT METHOD MANAGEMENT
  /// Demonstrates how to manage customer payment methods
  Future<void> _demonstratePaymentMethodManagement() async {
    print('🔧 3. PAYMENT METHOD MANAGEMENT');
    print('===============================\n');
    
    const customerId = 'CUST_test_123456789';
    
    try {
      print('📋 3.1 LISTING PAYMENT METHODS');
      print('------------------------------');
      
      // List existing payment methods for a customer
      print('🔄 Fetching payment methods for customer: $customerId');
      
      try {
        final paymentMethods = await mindPaystack.paymentMethods.listPaymentMethods(
          customerId: customerId,
        );
        
        print('✅ Found ${paymentMethods.length} payment methods:');
        for (int i = 0; i < paymentMethods.length; i++) {
          final method = paymentMethods[i];
          print('   ${i + 1}. ${method.type}: ${method.channel} (${method.last4 ?? 'N/A'})');
        }
        
        if (paymentMethods.isEmpty) {
          print('📝 No payment methods found for this customer');
          print('💡 In a real app, prompt user to add a payment method');
        }
        
      } catch (e) {
        print('❌ Failed to fetch payment methods: $e');
        print('💡 This might be expected if the customer doesn\'t exist');
      }
      
      print('\n📝 3.2 ADDING PAYMENT METHODS');
      print('-----------------------------');
      
      print('💡 Payment methods are typically added during successful payments');
      print('   - Card payments: Automatically saved if successful');
      print('   - Bank accounts: Saved for future transfers');
      print('   - Mobile money: Provider-dependent');
      
      print('\n🗑️ 3.3 REMOVING PAYMENT METHODS');
      print('-------------------------------');
      
      print('💡 Example: Remove a saved card');
      print('   - Use the payment method ID from the list above');
      print('   - Call removePaymentMethod(methodId)');
      print('   - Handle success/error responses appropriately');
      
    } catch (e) {
      print('❌ Payment method management error: $e');
    }
    
    print('');
  }

  /// 4. TRANSACTION OPERATIONS
  /// Demonstrates transaction management features
  Future<void> _demonstrateTransactionOperations() async {
    print('📊 4. TRANSACTION OPERATIONS');
    print('============================\n');
    
    // Example transaction reference (would come from a real payment)
    const testReference = 'test_ref_${1234567890}';
    
    print('🔍 4.1 TRANSACTION VERIFICATION');
    print('-------------------------------');
    
    try {
      print('🔄 Verifying transaction: $testReference');
      
      final verification = await mindPaystack.transaction.verifyTransaction(testReference);
      
      print('✅ Verification completed!');
      print('📋 Transaction Details:');
      print('   - Reference: ${verification.reference}');
      print('   - Status: ${verification.status}');
      print('   - Message: ${verification.message}');
      
      // Handle different verification statuses
      if (verification.status == true) {
        print('🎉 Transaction was successful!');
        print('💡 Safe to deliver goods/services');
      } else if (verification.status == false) {
        print('❌ Transaction failed');
        print('💡 Do not deliver goods/services');
      } else {
        print('⏳ Transaction is still processing');
        print('💡 Wait and check again later');
      }
      
    } catch (e) {
      print('❌ Transaction verification failed: $e');
      print('💡 Expected for demo reference - use real transaction reference');
    }
    
    print('\n📜 4.2 TRANSACTION HISTORY');
    print('-------------------------');
    
    try {
      print('🔄 Fetching transaction history...');
      
      // Note: Actual method name may vary based on SDK implementation
      print('💡 Example transaction history query:');
      print('   - Filter by date range');
      print('   - Filter by status (success, failed, pending)');
      print('   - Filter by customer');
      print('   - Pagination support');
      
      print('📋 Sample transaction list format:');
      print('   1. REF123 - ₦50.00 - Success - 2024-01-15');
      print('   2. REF124 - ₦25.00 - Failed  - 2024-01-14');
      print('   3. REF125 - ₦75.00 - Pending - 2024-01-13');
      
    } catch (e) {
      print('❌ Transaction history error: $e');
    }
    
    print('\n💸 4.3 REFUND OPERATIONS');
    print('------------------------');
    
    try {
      print('💡 Refund example for transaction: $testReference');
      
      // Example refund operation
      print('🔄 Processing refund...');
      print('📋 Refund parameters:');
      print('   - Transaction reference: $testReference');
      print('   - Refund amount: ₦25.00 (partial refund)');
      print('   - Reason: Customer request');
      
      // Note: Actual refund method implementation
      print('⚠️  Refund implementation depends on SDK method availability');
      print('💡 Typical refund flow:');
      print('   1. Verify original transaction was successful');
      print('   2. Check refund eligibility (timeframe, amount)');
      print('   3. Process refund request');
      print('   4. Handle refund response');
      print('   5. Update local records');
      
    } catch (e) {
      print('❌ Refund operation error: $e');
    }
    
    print('');
  }

  /// 5. PAYMENT CHANNELS
  /// Demonstrates payment channel information retrieval
  Future<void> _demonstratePaymentChannels() async {
    print('🏦 5. PAYMENT CHANNELS');
    print('======================\n');
    
    print('🏦 5.1 AVAILABLE BANKS');
    print('---------------------');
    
    try {
      print('🔄 Fetching available banks...');
      
      final banks = await mindPaystack.paymentChannel.listBanks();
      
      print('✅ Found ${banks.length} available banks:');
      
      // Display first 10 banks as example
      final displayBanks = banks.take(10).toList();
      for (int i = 0; i < displayBanks.length; i++) {
        final bank = displayBanks[i];
        print('   ${i + 1}. ${bank.name} (${bank.code})');
      }
      
      if (banks.length > 10) {
        print('   ... and ${banks.length - 10} more banks');
      }
      
      print('\n💡 Use bank codes for:');
      print('   - USSD payments');
      print('   - Bank account verification');
      print('   - Direct bank transfers');
      
    } catch (e) {
      print('❌ Failed to fetch banks: $e');
    }
    
    print('\n💰 5.2 PAYMENT CHANNEL FEES');
    print('---------------------------');
    
    try {
      print('🔄 Fetching channel fees...');
      
      // Example amounts for fee calculation
      final testAmounts = [1000, 5000, 10000, 50000]; // In kobo
      
      print('📋 Fee structure examples:');
      for (final amount in testAmounts) {
        print('   Amount: ₦${amount / 100}');
        
        try {
          final fees = await mindPaystack.paymentChannel.getChannelFees(
            amount: amount,
            currency: 'NGN',
            channel: 'card', // Specify the channel
          );
          
          print('     - Channel: ${fees.channel}');
          print('     - Fee: ₦${fees.amount / 100}');
          print('     - Percentage: ${fees.percentage}%');
          if (fees.cap != null) {
            print('     - Cap: ₦${fees.cap! / 100}');
          }
          
        } catch (e) {
          print('     - Error fetching fees: $e');
        }
      }
      
      print('\n💡 Use fee information to:');
      print('   - Display costs to customers');
      print('   - Choose optimal payment method');
      print('   - Calculate total charges');
      
    } catch (e) {
      print('❌ Failed to fetch channel fees: $e');
    }
    
    print('');
  }

  /// 6. ERROR HANDLING
  /// Demonstrates comprehensive error handling patterns
  Future<void> _demonstrateErrorHandling() async {
    print('⚠️ 6. ERROR HANDLING PATTERNS');
    print('==============================\n');
    
    print('🔍 6.1 MINDEXCEPTION HANDLING');
    print('-----------------------------');
    
    try {
      // Deliberately cause different types of errors
      print('🧪 Testing invalid card payment...');
      
      await mindPaystack.paymentChannel.chargeCard(
        cardNumber: '1111111111111111', // Invalid card
        cvv: '000',
        expiryMonth: '01',
        expiryYear: '2020', // Expired
        amount: 5000,
        email: 'invalid-email', // Invalid email format
      );
      
    } catch (e) {
      if (e is MindException) {
        print('✅ Caught MindException:');
        print('   - Message: ${e.message}');
        print('   - Code: ${e.code}');
        print('   - Category: ${e.category}');
        print('   - Severity: ${e.severity}');
        print('   - Source: ${e.source}');
        
        // Handle different error categories
        switch (e.category) {
          case ErrorCategory.validation:
            print('💡 Validation Error: Check input parameters');
            break;
          case ErrorCategory.network:
            print('💡 Network Error: Check internet connection');
            break;
          case ErrorCategory.authentication:
            print('💡 Auth Error: Check API keys');
            break;
          case ErrorCategory.business:
            print('💡 Business Error: Check payment rules');
            break;
          default:
            print('💡 Other Error: ${e.category}');
        }
        
        // User-friendly error messages
        print('\n📱 User-friendly message suggestions:');
        switch (e.code) {
          case 'invalid_card':
            print('   "Please check your card details and try again"');
            break;
          case 'expired_card':
            print('   "Your card has expired. Please use a different card"');
            break;
          case 'insufficient_funds':
            print('   "Insufficient funds. Please try a different payment method"');
            break;
          case 'network_error':
            print('   "Connection error. Please check your internet and try again"');
            break;
          default:
            print('   "Payment could not be processed. Please try again"');
        }
        
      } else {
        print('❌ Other exception: $e');
        print('💡 Always wrap unknown exceptions in user-friendly messages');
      }
    }
    
    print('\n🔄 6.2 RETRY PATTERNS');
    print('--------------------');
    
    print('💡 Recommended retry strategies:');
    print('   - Network errors: Exponential backoff (3-5 attempts)');
    print('   - Validation errors: Don\'t retry, fix input');
    print('   - Rate limits: Wait and retry with longer delays');
    print('   - Server errors: Linear retry with reasonable limits');
    
    print('\n📊 6.3 ERROR LOGGING');
    print('-------------------');
    
    print('💡 What to log for debugging:');
    print('   - Request parameters (sanitized - no sensitive data)');
    print('   - Response codes and messages');
    print('   - Timestamp and user context');
    print('   - Stack traces for unexpected errors');
    
    print('⚠️  Security considerations:');
    print('   - Never log card numbers, CVVs, or PINs');
    print('   - Mask sensitive data (card: ****1234)');
    print('   - Use secure log storage');
    print('   - Implement log retention policies');
    
    print('');
  }

  /// 7. BEST PRACTICES
  /// Security and implementation recommendations
  void _demonstrateBestPractices() {
    print('🛡️ 7. SECURITY & BEST PRACTICES');
    print('================================\n');
    
    print('🔐 7.1 API KEY MANAGEMENT');
    print('-------------------------');
    print('✅ DO:');
    print('   - Store keys in environment variables');
    print('   - Use different keys for test/production');
    print('   - Rotate keys regularly');
    print('   - Restrict key permissions when possible');
    print('   - Monitor key usage');
    
    print('\n❌ DON\'T:');
    print('   - Hardcode keys in source code');
    print('   - Commit keys to version control');
    print('   - Share keys in plain text');
    print('   - Use production keys in development');
    print('   - Log or expose keys in error messages');
    
    print('\n💳 7.2 PAYMENT DATA HANDLING');
    print('----------------------------');
    print('✅ DO:');
    print('   - Use HTTPS for all communications');
    print('   - Validate input on both client and server');
    print('   - Implement proper session management');
    print('   - Use webhook verification');
    print('   - Store minimal payment data');
    
    print('\n❌ DON\'T:');
    print('   - Store card details in your database');
    print('   - Log sensitive payment information');
    print('   - Trust client-side validation only');
    print('   - Skip webhook signature verification');
    print('   - Expose internal transaction IDs');
    
    print('\n🔄 7.3 TRANSACTION VERIFICATION');
    print('------------------------------');
    print('✅ Best practices:');
    print('   - Always verify payments server-side');
    print('   - Use webhooks for real-time updates');
    print('   - Implement idempotency for safety');
    print('   - Handle duplicate verification gracefully');
    print('   - Log all verification attempts');
    
    print('\n🚨 7.4 ERROR HANDLING');
    print('--------------------');
    print('✅ Best practices:');
    print('   - Provide clear, actionable error messages');
    print('   - Implement graceful degradation');
    print('   - Use exponential backoff for retries');
    print('   - Monitor error rates and patterns');
    print('   - Have fallback payment options');
    
    print('\n🏗️ 7.5 INTEGRATION ARCHITECTURE');
    print('-------------------------------');
    print('✅ Recommended patterns:');
    print('   - Use dependency injection for testability');
    print('   - Implement circuit breakers for resilience');
    print('   - Cache non-sensitive data appropriately');
    print('   - Use async/await for non-blocking operations');
    print('   - Implement proper timeout handling');
    
    print('\n📱 7.6 MOBILE CONSIDERATIONS');
    print('---------------------------');
    print('✅ Mobile best practices:');
    print('   - Handle network connectivity changes');
    print('   - Implement offline payment queuing');
    print('   - Use secure storage for temporary data');
    print('   - Optimize for battery usage');
    print('   - Provide clear payment status feedback');
    
    print('\n🔍 7.7 TESTING STRATEGIES');
    print('------------------------');
    print('✅ Testing recommendations:');
    print('   - Use Paystack test cards for development');
    print('   - Test all error scenarios');
    print('   - Verify webhook handling');
    print('   - Test payment flow interruptions');
    print('   - Validate currency and amount handling');
    
    print('\n📚 7.8 DOCUMENTATION');
    print('-------------------');
    print('✅ Documentation tips:');
    print('   - Document all payment flows');
    print('   - Include error code explanations');
    print('   - Provide integration examples');
    print('   - Maintain API change logs');
    print('   - Include troubleshooting guides');
    
    print('\n🎯 CONCLUSION');
    print('=============');
    print('This comprehensive example covers all major aspects of the MindPaystack SDK.');
    print('For more information, visit:');
    print('- Paystack Documentation: https://paystack.com/docs');
    print('- MindPaystack GitHub: https://github.com/Dartmind-OpenSource/mind-paystack');
    print('- Issues and Support: https://github.com/Dartmind-OpenSource/mind-paystack/issues');
    
    print('\n🤝 Contributing:');
    print('Found a bug or want to improve this example?');
    print('Contributions are welcome! Please check the CONTRIBUTING.md file.');
  }
}

/// Example configuration class showing environment-specific settings
class PaystackEnvironmentConfig {
  static PaystackConfig development() {
    return PaystackConfig(
      publicKey: 'pk_test_YOUR_TEST_PUBLIC_KEY',
      secretKey: 'sk_test_YOUR_TEST_SECRET_KEY',
      environment: Environment.test,
      logLevel: LogLevel.debug, // Verbose logging for development
      timeout: const Duration(seconds: 30),
    );
  }
  
  static PaystackConfig production() {
    return PaystackConfig(
      publicKey: 'pk_live_YOUR_LIVE_PUBLIC_KEY',
      secretKey: 'sk_live_YOUR_LIVE_SECRET_KEY',
      environment: Environment.production, // Use 'production' not 'live'
      logLevel: LogLevel.error, // Minimal logging for production
      timeout: const Duration(seconds: 60), // Longer timeout for production
    );
  }
}
