# Mind Paystack

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)
[![License: MIT][license_badge]][license_link]

A Dart-first Paystack SDK focused on transaction management with type-safe operations.

## Features ✨

- **Transaction Management**: Initialize, verify, and list Paystack transactions
- **Type-Safe Money Handling**: Built-in Money and Currency value objects
- **Structured Error Handling**: Comprehensive MindException system
- **Dependency Injection**: Injectable support for testing and modularity
- **Pure Dart**: Works with CLI tools, servers, and Dart web applications

## Installation 💻

**❗ In order to start using Mind Paystack you must have the [Dart SDK][dart_install_link] installed on your machine.**

Install via `dart pub add`:

```sh
dart pub add mind_paystack
```

## Quick Start 🚀

```dart
import 'package:mind_paystack/mind_paystack.dart';

Future<void> main() async {
  // Initialize the SDK
  await MindPaystack.initialize(
    PaystackConfig(
      publicKey: 'pk_test_your_public_key',
      secretKey: 'sk_test_your_secret_key',
      environment: Environment.test,
    ),
  );

  // Create a transaction
  final sdk = MindPaystack.instance;
  final transaction = await sdk.transaction.initialize(
    InitializeTransactionOptions(
      email: 'customer@example.com',
      amount: Money.fromCents(50000, Currency.ngn), // ₦500.00
    ),
  );

  print('Payment URL: ${transaction.data.authorizationUrl}');
}
```

## Coming Soon 🚧

- **Charge Operations**: Direct card charging and authorization
- **Payment Channels**: Available payment methods
- **Flutter Integration**: UI widgets and platform-specific features

## Documentation 📚

For complete documentation and examples, visit the [main repository](https://github.com/Dartmind-OpenSource/mind-paystack).

---

## Running Tests 🧪

To run all unit tests:

```sh
dart pub global activate coverage 1.2.0
dart test --coverage=coverage
dart pub global run coverage:format_coverage --lcov --in=coverage --out=coverage/lcov.info
```

[dart_install_link]: https://dart.dev/get-dart
[github_actions_link]: https://docs.github.com/en/actions/learn-github-actions
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[logo_black]: https://raw.githubusercontent.com/VGVentures/very_good_brand/main/styles/README/vgv_logo_black.png#gh-light-mode-only
[logo_white]: https://raw.githubusercontent.com/VGVentures/very_good_brand/main/styles/README/vgv_logo_white.png#gh-dark-mode-only
[mason_link]: https://github.com/felangel/mason
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_coverage_link]: https://github.com/marketplace/actions/very-good-coverage
[very_good_ventures_link]: https://verygood.ventures
[very_good_ventures_link_light]: https://verygood.ventures#gh-light-mode-only
[very_good_ventures_link_dark]: https://verygood.ventures#gh-dark-mode-only
[very_good_workflows_link]: https://github.com/VeryGoodOpenSource/very_good_workflows
