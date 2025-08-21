# Mind Paystack

[![Pub Version](https://img.shields.io/pub/v/mind_paystack.svg)](https://pub.dev/packages/mind_paystack)
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

The Dart-first Paystack SDK focused on transaction management with type-safe operations.

## Documentation 📚

For complete documentation, installation guide, examples, and API reference, visit:

- **[Full Documentation](https://mind-paystack-docs.vercel.app/docs)**
- **[Main Repository](https://github.com/Dartmind-OpenSource/mind-paystack)**

## Quick Installation

```bash
dart pub add mind_paystack
```

## Quick Example

```dart
import 'package:mind_paystack/mind_paystack.dart';

await MindPaystack.initialize(PaystackConfig(
  publicKey: 'pk_test_your_key',
  secretKey: 'sk_test_your_key',
  environment: Environment.test,
));

final transaction = await MindPaystack.instance.transaction.initialize(
  InitializeTransactionOptions(
    email: 'customer@example.com',
    amount: Money.fromCents(50000, Currency.ngn),
  ),
);
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
