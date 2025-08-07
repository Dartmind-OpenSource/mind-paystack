# MindPaystack SDK Examples

This directory contains comprehensive examples for using the MindPaystack SDK in Dart applications. These examples address the complete feature set requested in [Issue #XX](link-to-issue).

## 📚 Available Examples

### 1. Basic Example (`sample_payment_dart.dart`)
**Perfect for getting started quickly**

- Simple payment flows
- Card payment demonstration  
- Basic error handling
- Quick start integration

**Run it:**
```bash
dart run bin/sample_payment_dart.dart basic
```

### 2. Comprehensive Example (`comprehensive_example.dart`)
**Complete SDK feature coverage**

- All payment methods (card, bank transfer, USSD, mobile money)
- Payment method management
- Transaction operations (verify, refund, history)
- Payment channel information
- Error handling patterns
- Security best practices
- Production-ready examples

**Run it:**
```bash
dart run bin/sample_payment_dart.dart comprehensive
```

## 🚀 Quick Start

### Prerequisites

1. **Dart SDK** (version 3.5.0 or higher)
2. **Paystack Account** with API keys
3. **Internet connection** for API calls

### Setup

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Dartmind-OpenSource/mind-paystack.git
   cd mind-paystack/apps/sample_payment_dart
   ```

2. **Install dependencies:**
   ```bash
   dart pub get
   ```

3. **Configure API keys:**
   
   **Option A: Environment Variables (Recommended)**
   ```bash
   export PAYSTACK_PUBLIC_KEY="pk_test_your_public_key"
   export PAYSTACK_SECRET_KEY="sk_test_your_secret_key"
   ```
   
   **Option B: Direct Configuration**
   Update the keys in the example files (NOT recommended for production)

4. **Run examples:**
   ```bash
   # Interactive mode - choose which example to run
   dart run
   
   # Or run specific examples
   dart run bin/sample_payment_dart.dart basic
   dart run bin/sample_payment_dart.dart comprehensive
   ```

## 📖 Detailed Feature Coverage

### 1. SDK Initialization

```dart
import 'package:mind_paystack/mind_paystack.dart';

// Initialize with configuration
await MindPaystack.init(PaystackConfig(
  publicKey: 'pk_test_...',
  secretKey: 'sk_test_...',
  environment: Environment.test,
  logLevel: LogLevel.info,
  currency: 'NGN',
  locale: 'en',
  timeout: const Duration(seconds: 30),
));
```

**Key points:**
- Use test keys for development
- Switch to `Environment.live` for production
- Configure appropriate timeout values
- Enable logging for debugging

### 2. Payment Methods

#### Card Payments
```dart
final cardResult = await MindPaystack.instance.paymentChannel.chargeCard(
  cardNumber: '4084084084084081', // Test card
  cvv: '408',
  expiryMonth: '04',
  expiryYear: '2030',
  amount: 5000, // Amount in kobo (₦50.00)
  email: 'customer@example.com',
  currency: 'NGN',
  metadata: {'order_id': 'ORD-123'},
);
```

#### Bank Transfer
```dart
final bankResult = await MindPaystack.instance.paymentChannel.chargeBankTransfer(
  amount: 5000,
  email: 'customer@example.com',
  currency: 'NGN',
  expiresIn: const Duration(hours: 24),
  metadata: {'order_id': 'ORD-123'},
);
```

#### USSD Payments
```dart
final ussdResult = await MindPaystack.instance.paymentChannel.chargeUssd(
  amount: 5000,
  email: 'customer@example.com',
  bankCode: '737', // GTBank
  metadata: {'order_id': 'ORD-123'},
);
```

### 3. Transaction Operations

#### Verify Payment
```dart
final verification = await MindPaystack.instance.transaction.verifyTransaction(
  'transaction_reference'
);

if (verification.status == 'success') {
  // Payment confirmed - safe to deliver goods
  print('Payment successful: ₦${verification.amount / 100}');
}
```

#### Transaction History
```dart
// Example: Fetch customer transaction history
final transactions = await MindPaystack.instance.transaction.listTransactions(
  customerId: 'CUST_123',
  status: 'success',
  from: DateTime.now().subtract(Duration(days: 30)),
  to: DateTime.now(),
);
```

### 4. Payment Method Management

#### List Payment Methods
```dart
final methods = await MindPaystack.instance.paymentMethods.listPaymentMethods(
  customerId: 'CUST_123',
);

for (final method in methods) {
  print('${method.type}: ${method.details}');
}
```

#### Remove Payment Method
```dart
await MindPaystack.instance.paymentMethods.removePaymentMethod(
  methodId: 'METHOD_123',
);
```

### 5. Payment Channels

#### Get Available Banks
```dart
final banks = await MindPaystack.instance.paymentChannel.listBanks();

for (final bank in banks) {
  print('${bank.name} (${bank.code})');
}
```

#### Calculate Fees
```dart
final fees = await MindPaystack.instance.paymentChannel.getChannelFees(
  amount: 5000,
  currency: 'NGN',
);

print('Card fee: ₦${fees.card / 100}');
print('Bank transfer fee: ₦${fees.bankTransfer / 100}');
```

## 🛡️ Security Best Practices

### API Key Management

**✅ DO:**
- Store keys in environment variables
- Use different keys for test/production  
- Rotate keys regularly
- Restrict key permissions when possible

**❌ DON'T:**
- Hardcode keys in source code
- Commit keys to version control
- Share keys in plain text
- Use production keys in development

### Payment Data Handling

**✅ DO:**
- Use HTTPS for all communications
- Validate input on both client and server
- Implement proper session management
- Use webhook verification
- Store minimal payment data

**❌ DON'T:**
- Store card details in your database
- Log sensitive payment information
- Trust client-side validation only
- Skip webhook signature verification

### Error Handling

```dart
try {
  final result = await MindPaystack.instance.paymentChannel.chargeCard(
    // ... payment parameters
  );
  
  // Handle success
  print('Payment successful: ${result.reference}');
  
} catch (e) {
  if (e is MindException) {
    // Handle specific SDK errors
    switch (e.category) {
      case ErrorCategory.validation:
        print('Validation error: ${e.message}');
        break;
      case ErrorCategory.network:
        print('Network error: Check connection');
        break;
      case ErrorCategory.authentication:
        print('Auth error: Check API keys');
        break;
      default:
        print('Payment error: ${e.message}');
    }
  } else {
    // Handle unexpected errors
    print('Unexpected error: $e');
  }
}
```

## 🧪 Testing

### Test Cards

Paystack provides test cards for development:

| Card Number | Description |
|-------------|-------------|
| 4084084084084081 | Successful transaction |
| 4084084084084099 | Failed transaction |
| 4017520000000005 | Requires PIN (3310) |
| 5077030000000001 | Requires OTP |

### Test Bank Codes

| Bank | Code | USSD |
|------|------|------|
| GTBank | 058 | *737# |
| UBA | 033 | *919# |
| Zenith | 057 | *966# |
| Access | 044 | *901# |

### Running Tests

```bash
# Run with test data
dart run bin/sample_payment_dart.dart comprehensive

# The examples use test API keys and test cards by default
# Check the console output for detailed test results
```

## 🔧 Integration Patterns

### 1. Basic Integration
```dart
// Simple payment processing
final result = await processPayment(
  amount: 5000,
  email: 'customer@example.com',
  paymentMethod: 'card',
);
```

### 2. Advanced Integration with Error Handling
```dart
Future<PaymentResult> processPaymentWithRetry({
  required double amount,
  required String email,
  required String paymentMethod,
  int maxRetries = 3,
}) async {
  for (int attempt = 1; attempt <= maxRetries; attempt++) {
    try {
      return await _executePayment(amount, email, paymentMethod);
    } catch (e) {
      if (e is MindException && e.category == ErrorCategory.network) {
        if (attempt < maxRetries) {
          await Future.delayed(Duration(seconds: attempt * 2));
          continue; // Retry
        }
      }
      rethrow; // Don't retry for other errors
    }
  }
  throw Exception('Payment failed after $maxRetries attempts');
}
```

### 3. Webhook Integration
```dart
// Verify webhook signatures for security
bool verifyWebhookSignature(String payload, String signature, String secret) {
  final computedSignature = hmacSha512(payload, secret);
  return computedSignature == signature;
}

// Handle webhook events
void handlePaymentWebhook(Map<String, dynamic> event) {
  switch (event['event']) {
    case 'charge.success':
      handleSuccessfulPayment(event['data']);
      break;
    case 'charge.failed':
      handleFailedPayment(event['data']);
      break;
    default:
      print('Unknown webhook event: ${event['event']}');
  }
}
```

## 📱 Flutter Integration

For Flutter applications, see the Flutter example in:
```
packages/mind_paystack_flutter/example/
```

The Flutter example demonstrates:
- Complete UI flows for all payment methods
- State management during payments
- Error handling with user-friendly messages
- Loading states and animations
- Integration with the Dart SDK

## 🐛 Troubleshooting

### Common Issues

**1. API Key Errors**
```
Error: Authentication failed
Solution: Check your API keys and ensure they're correct
```

**2. Network Errors**
```
Error: Network request failed
Solution: Check internet connection and API endpoint availability
```

**3. Validation Errors**
```
Error: Invalid card number
Solution: Use valid test cards for development
```

**4. Amount Format Issues**
```
Error: Invalid amount
Solution: Ensure amounts are in kobo (multiply naira by 100)
```

### Debug Mode

Enable debug logging for detailed information:
```dart
await MindPaystack.init(PaystackConfig(
  // ... other config
  logLevel: LogLevel.debug, // Enable verbose logging
));
```

### Support

- **Documentation**: [Paystack Docs](https://paystack.com/docs)
- **GitHub Issues**: [Create Issue](https://github.com/Dartmind-OpenSource/mind-paystack/issues)
- **Community**: [Discussions](https://github.com/Dartmind-OpenSource/mind-paystack/discussions)

## 🤝 Contributing

Found a bug or want to improve these examples?

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

See [CONTRIBUTING.md](../../CONTRIBUTING.md) for detailed guidelines.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](../../LICENSE) file for details.

---

**Created by**: Kelvin Dart  
**Purpose**: Comprehensive MindPaystack SDK examples  
**Issue**: [Link to GitHub issue]  
**Last Updated**: August 2025
