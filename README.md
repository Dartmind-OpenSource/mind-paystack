# MindPaystack

[![Pub Version](https://img.shields.io/pub/v/mind_paystack.svg)](https://pub.dev/packages/mind_paystack)
[![License](https://img.shields.io/github/license/your-org/mind_paystack.svg)](LICENSE)

**MindPaystack** is a modern, developer-friendly Dart SDK for [Paystack](https://paystack.com).  
Built with **clean architecture**, **dependency injection**, and **extensibility** at its core,  
it provides a strongly-typed, elegant way to integrate Paystack into both **Dart** and **Flutter** apps.

---

## Features

- **Strongly-typed API responses** → no dynamic surprises  
- **Dependency-injection ready** → works with [`injectable`](https://pub.dev/packages/injectable)  
- **Modular services** → swap or extend without rewriting core logic  
- **Unified error handling** via `MindException`  
- **Cross-platform** → pure Dart + Flutter support  

---

## Quick Start

Add the SDK:

```sh
dart pub add mind_paystack
```

For Flutter projects:

```sh
dart pub add mind_paystack_flutter
```

Initialize at app startup:

```dart
import 'package:mind_paystack/mind_paystack.dart';

Future<void> main() async {
  await MindPaystack.init(
    PaystackConfig(
      publicKey: 'pk_test_xxx',
      secretKey: 'sk_test_xxx',
    ),
  );
  // runApp(...)
}
```

---

## Full Documentation

📚 **See the full docs here → [https://docs.mindpaystack.dev](https://mind-paystack-docs.vercel.app/docs)**

- Installation & setup  
- Core concepts and architecture  
- Payments, transactions, and advanced guides  

---

## Contributing

Contributions are welcome!  
Check out the [issues](https://github.com/Dartmind-OpenSource/mind-paystack/issues) or open a PR.

---

## License

[MIT](LICENSE) © Your Name or Org
