<div align="center">

![MindPaystack Logo](logo.svg)

# MindPaystack

**The Dart-First Paystack SDK**

*Built from the ground up for Dart and Flutter developers*

[![Pub Version](https://img.shields.io/pub/v/mind_paystack.svg?style=flat-square)](https://pub.dev/packages/mind_paystack)
[![Dart SDK Version](https://img.shields.io/badge/Dart-%3E%3D3.5.0-blue.svg?style=flat-square&logo=dart)](https://dart.dev)
[![Flutter](https://img.shields.io/badge/Flutter-Core_Support-02569B.svg?style=flat-square&logo=flutter)](https://flutter.dev)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square)](https://opensource.org/licenses/MIT)
[![Very Good Analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg?style=flat-square)](https://pub.dev/packages/very_good_analysis)

---

**Pure Dart Core** • **Type-Safe** • **Production-Ready** • **Transaction-Focused**

*Unlike generic API wrappers, MindPaystack is architected specifically for the Dart ecosystem*

[**Documentation**](https://mind-paystack-docs.vercel.app/docs) • [**Quick Start**](#quick-start) • [**Examples**](#examples) • [**Contributing**](#contributing)

</div>

## Why MindPaystack?

```dart
// Other SDKs: Dynamic types and unclear errors
final response = await http.post(url, body: data);
final result = json.decode(response.body); // Map<String, dynamic>

// MindPaystack: Strongly typed, clean, and predictable
final transaction = await MindPaystack.instance.transaction.initialize(
  InitializeTransactionOptions(
    email: 'customer@example.com',
    amount: Money.fromCents(50000, Currency.ngn), // Type-safe money handling
  ),
);
// Returns: Resource<TransactionInitialization>
```

### Built for Modern Dart Development

| Feature | MindPaystack | Generic HTTP Client |
|---------|--------------|-------------------|
| **Type Safety** | **Available** - Strongly typed responses | **Missing** - Dynamic `Map<String, dynamic>` |
| **Error Handling** | **Available** - Structured `MindException` hierarchy | **Missing** - Generic HTTP errors |
| **Dependency Injection** | **Available** - Built-in Injectable support | **Missing** - Manual setup required |
| **Testing** | **Available** - Mockable services & interfaces | **Missing** - HTTP mocking complexity |
| **Money/Currency** | **Available** - Dedicated value objects | **Missing** - Raw integers (error-prone) |
| **Dart Conventions** | **Available** - Follows Dart/Flutter patterns | **Missing** - Generic API wrapper |

---

## Quick Start

### Installation

**For Pure Dart projects** (CLI, server, backend):
```bash
dart pub add mind_paystack
```

**For Flutter applications**:
```bash
dart pub add mind_paystack
# Note: mind_paystack_flutter coming soon!
```

### 3-Step Integration

#### Step 1: Initialize the SDK

```dart
import 'package:mind_paystack/mind_paystack.dart';

Future<void> main() async {
  // 🔧 One-time setup
  await MindPaystack.initialize(
    PaystackConfig(
      publicKey: 'pk_test_your_public_key',
      secretKey: 'sk_test_your_secret_key',
      environment: Environment.test,
    ),
  );
  
  // 🚀 Ready to use!
  print('MindPaystack initialized successfully!');
}
```

#### Step 2: Create a Payment

```dart
final sdk = MindPaystack.instance;

try {
  final transaction = await sdk.transaction.initialize(
    InitializeTransactionOptions(
      email: 'customer@example.com',
      amount: Money.fromCents(50000, Currency.ngn), // ₦500.00
      metadata: {'product_id': '12345'},
    ),
  );
  
  // ✅ Type-safe access to all properties
  print('Payment URL: ${transaction.data.authorizationUrl}');
  print('Reference: ${transaction.data.reference}');
  
} on MindException catch (e) {
  // 🛡️ Structured error handling
  print('Payment failed: ${e.message} (${e.code})');
}
```

#### Step 3: Verify Payment

```dart
final verification = await sdk.transaction.verify(
  VerifyTransactionOptions(reference: 'your-transaction-reference'),
);

if (verification.data.status == 'success') {
  print('💰 Payment successful!');
  // Fulfill the order
} else {
  print('❌ Payment failed or pending');
}
```

---

## Examples

<details>
<summary><strong>E-commerce Checkout</strong></summary>

```dart
class CheckoutService {
  static Future<String?> createPayment({
    required String customerEmail,
    required List<CartItem> items,
  }) async {
    final total = items.fold(0, (sum, item) => sum + item.price);
    final sdk = MindPaystack.instance;
    
    try {
      final result = await sdk.transaction.initialize(
        InitializeTransactionOptions(
          email: customerEmail,
          amount: Money.fromCents(total, Currency.ngn),
          metadata: {
            'order_items': items.map((e) => e.toJson()).toList(),
            'customer_id': await getUserId(),
          },
        ),
      );
      
      return result.data.authorizationUrl;
    } on MindException catch (e) {
      _logger.error('Checkout failed', e);
      return null;
    }
  }
}
```

</details>


<details>
<summary><strong>Testing with Mocks</strong></summary>

```dart
class MockTransactionService extends Mock implements ITransactionService {}

void main() {
  group('PaymentService Tests', () {
    late MockTransactionService mockTransaction;
    late PaymentService paymentService;
    
    setUp(() {
      mockTransaction = MockTransactionService();
      // Inject mock via dependency injection
      GetIt.instance.registerSingleton<ITransactionService>(mockTransaction);
      paymentService = PaymentService();
    });
    
    test('should create payment successfully', () async {
      // Arrange
      when(() => mockTransaction.initialize(any()))
          .thenAnswer((_) async => mockTransactionResponse);
      
      // Act
      final result = await paymentService.createPayment(testRequest);
      
      // Assert
      expect(result.isSuccess, true);
      verify(() => mockTransaction.initialize(any())).called(1);
    });
  });
}
```

</details>

---

## What Developers Love About MindPaystack

> *"Finally, a Paystack SDK that feels like it was built by Dart developers, for Dart developers."*  
> **— Flutter Developer**

> *"The type safety and error handling saved us hours of debugging. No more `dynamic` nightmares!"*  
> **— Backend Developer**

> *"Injectable integration made testing our payment flows so much cleaner."*  
> **— QA Engineer**

### Perfect For

| Use Case | Why MindPaystack Excels |
|----------|------------------------|
| **E-commerce Apps** | Type-safe money handling, structured error handling |
| **Fintech Platforms** | Enterprise-grade architecture, comprehensive testing |
| **SaaS Billing** | Transaction management, webhook handling (coming soon) |
| **Banking Apps** | Security-first design, audit trails |
| **Mobile Apps** | Flutter-core support, with UI components coming soon |

---

## Package Ecosystem

| Package | Platform | Status | Features |
|---------|----------|--------|----------|
| [`mind_paystack`](https://pub.dev/packages/mind_paystack) | **Pure Dart** | **Available** | Core SDK, Transaction APIs |
| `mind_paystack_flutter` | **Flutter** | **Coming Soon** | UI widgets, platform integration |

### Platform Support

| Platform | Support Level | Package Required |
|----------|---------------|------------------|
| **Flutter Mobile** | Core Features | `mind_paystack` |
| **Flutter Web** | Core Features | `mind_paystack` |
| **Flutter Desktop** | Core Features | `mind_paystack` |
| **Dart VM (Server)** | Full Support | `mind_paystack` |
| **Dart CLI Tools** | Full Support | `mind_paystack` |

---

## Advanced Features

### Dependency Injection Ready
```dart
@injectable
class PaymentService {
  PaymentService(this._transactionService);
  
  final ITransactionService _transactionService;
  
  Future<PaymentResult> processPayment(PaymentRequest request) async {
    // Fully testable and mockable
  }
}
```

### Type-Safe Money Handling
```dart
// Error-prone raw integers
final amount = 50000; // Is this ₦500 or ₦50,000?

// Clear, type-safe money values
final amount = Money.fromCents(50000, Currency.ngn); // Clearly ₦500.00
final naira = Money.fromNaira(500.00); // Alternative constructor
```

### Structured Error Handling
```dart
try {
  final result = await sdk.transaction.initialize(request);
} on MindException catch (e) {
  switch (e.category) {
    case ErrorCategory.network:
      _handleNetworkError(e);
    case ErrorCategory.validation:
      _showValidationErrors(e.validationErrors);
    case ErrorCategory.paystack:
      _handlePaystackError(e);
  }
}
```

---

## 🗺️ Roadmap

### ✅ Current Features (Available Now)
- **Transaction Management**: Initialize, verify, list transactions
- **Type-Safe Money Handling**: Structured money/currency objects
- **Error Handling**: Comprehensive MindException system
- **Dependency Injection**: Built-in Injectable support
- **Pure Dart Support**: CLI tools, server applications, web

### 🚧 Coming Soon
- **Charge Operations**: Direct card charging and tokenization
- **Payment Channels**: Available payment methods management  
- **Payment Methods**: Customer payment method storage
- **Flutter Package**: UI widgets and platform integration
- **Webhooks**: Event handling and verification
- **Subscriptions**: Recurring billing management

### 🔮 Future Releases
- **Advanced Analytics**: Transaction insights and reporting
- **Multi-tenant Support**: Organization-level configurations
- **Offline Capabilities**: Queue transactions for later processing
- **Enhanced Security**: Additional fraud prevention tools

---

## Documentation

| Resource | Description |
|----------|-------------|
| **[Full Documentation](https://mind-paystack-docs.vercel.app/docs)** | Complete guides and API reference |
| **[Getting Started](https://mind-paystack-docs.vercel.app/docs/getting-started)** | 3-step integration guide |
| **[Architecture Guide](https://mind-paystack-docs.vercel.app/docs/architecture)** | Understanding the SDK design |
| **[Testing Guide](https://mind-paystack-docs.vercel.app/docs/testing)** | Mocking and unit testing |
| **[Configuration](https://mind-paystack-docs.vercel.app/docs/configuration)** | Environment setup and options |

---

## Contributing

We welcome and appreciate contributions from developers of all skill levels! 

### **[Read our Comprehensive Contributing Guide →](https://mind-paystack-docs.vercel.app/docs/support/contributing)**

Our detailed contribution guide covers:

- **Quick Start** - Get up and running in minutes
- **Project Structure** - Understanding the monorepo architecture  
- **Development Workflow** - Step-by-step contribution process
- **Code Standards** - Dart/Flutter style guidelines with examples
- **Testing Guidelines** - TDD approach, mocking, and coverage requirements
- **Pull Request Process** - Templates, checklists, and review process
- **Security Guidelines** - Best practices for handling sensitive data
- **Development Tools** - VS Code settings, Melos commands, Git hooks

### Quick Links

| I Want To... | Action |
|--------------|--------|
| **Report a Bug** | [Open an Issue](https://github.com/Dartmind-OpenSource/mind-paystack/issues/new?template=bug_report.md) |
| **Request a Feature** | [Request Feature](https://github.com/Dartmind-OpenSource/mind-paystack/issues/new?template=feature_request.md) |
| **Ask Questions** | [Start a Discussion](https://github.com/Dartmind-OpenSource/mind-paystack/discussions) |
| **Contribute Code** | [See Contributing Guide](https://mind-paystack-docs.vercel.app/docs/support/contributing) |

### Quick Development Setup

```bash
# 1. Fork and clone the repository
git clone https://github.com/Dartmind-OpenSource/mind-paystack.git
cd mind-paystack

# 2. Install Melos and bootstrap packages
dart pub global activate melos
melos bootstrap

# 3. Verify setup
melos run test && melos run analyze

# You're ready to contribute!
```

**New to open source?** We're here to help! Check out issues labeled [`good first issue`](https://github.com/Dartmind-OpenSource/mind-paystack/issues?q=is%3Aissue+is%3Aopen+label%3A%22good+first+issue%22) for beginner-friendly contributions.

---

## 📄 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

---

<div align="center">

**Made with ❤️ by the Dart community**

[**Star us on GitHub**](https://github.com/Dartmind-OpenSource/mind-paystack) • [**Follow us on Twitter**](https://twitter.com/mind_paystack) • [**Join our Discord**](https://discord.gg/dartmind)

*Building the future of payments in Dart*

</div>
