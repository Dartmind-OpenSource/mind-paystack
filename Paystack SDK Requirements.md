# Mind Paystack Complete Usage Guide

## Table of Contents
- [Basic Setup](#basic-setup)
- [Payment Methods](#payment-methods)
  - [Card Payments](#card-payments)
  - [Bank Transfers](#bank-transfers)
  - [Mobile Money](#mobile-money)
  - [USSD](#ussd)
  - [QR Codes](#qr-codes)
- [Advanced Features](#advanced-features)
- [UI Components](#ui-components)
- [Error Handling](#error-handling)
- [Testing](#testing)

## Basic Setup

```dart
import 'package:mind_paystack/mind_paystack.dart';

void main() async {
  // Initialize SDK with configuration
  await MindPaystack.initialize(
    publicKey: 'pk_test_xxxx',
    environment: PaystackEnvironment.test,
    debug: true,
    logLevel: MPLogLevel.verbose,
    retryConfig: MPRetryConfig(
      maxAttempts: 3,
      backoffFactor: 1.5,
    ),
  );

  // Configure global options
  MindPaystack.instance.configure(
    currency: 'NGN',
    locale: 'en_NG',
    theme: MPTheme(
      primaryColor: Colors.blue,
      secondaryColor: Colors.blueAccent,
      textColor: Colors.black,
      errorColor: Colors.red,
    ),
  );
}
```

## Payment Methods

### Card Payments

```dart
// Basic card payment
final payment = await MindPaystack.createPayment(
  amount: 5000,
  email: 'customer@email.com',
  reference: 'ref_123',
  metadata: {
    'product_id': 'PRD_123',
    'customer_id': 'CUS_123',
  },
);

// Process card with full options
try {
  final cardTransaction = await payment.card()
    .setNumber('4084084084084081')
    .setExpiry('09', '24')
    .setCVV('123')
    .setPin('1234')  // Optional PIN for local cards
    .enableSaveCard(true)  // Save card for future
    .setBillingAddress(MPAddress(
      line1: '123 Main St',
      city: 'Lagos',
      state: 'Lagos',
      country: 'NG',
      postalCode: '100001'
    ))
    .setCustomer(MPCustomer(
      firstName: 'John',
      lastName: 'Doe',
      phone: '+2341234567890'
    ))
    .charge();

  // Handle 3D Secure
  if (cardTransaction.requires3DS) {
    final result = await cardTransaction.complete3DS();
    print('3DS completed: ${result.reference}');
  }

  // Handle OTP
  if (cardTransaction.requiresOTP) {
    final result = await cardTransaction.submitOTP('123456');
    print('OTP verified: ${result.reference}');
  }

} on PaystackException catch (e) {
  print('Error: ${e.message}');
  print('Error code: ${e.code}');
  print('Error details: ${e.details}');
}

// Use saved card
final savedCardTransaction = await payment
  .useSavedCard('AUTH_xyz')
  .charge();
```

### Bank Transfers

```dart
// Generate transfer details
final transfer = await payment.bankTransfer()
  .setBank('057')  // Bank code
  .setAccount('0123456789')
  .setAccountName('John Doe')
  .generate();

print('Account number: ${transfer.accountNumber}');
print('Bank: ${transfer.bankName}');
print('Amount: ${transfer.amount}');

// Listen for transfer completion
transfer.onComplete((reference) {
  print('Transfer completed: $reference');
});

// Check transfer status
final status = await transfer.checkStatus();
```

### Mobile Money

```dart
// Process mobile money payment
final momoPayment = await payment.mobileMoney()
  .setProvider(MobileMoneyProvider.mtn)
  .setPhone('0201234567')
  .setNetwork('MTN')
  .charge();

// Handle USSD prompt
if (momoPayment.requiresUSSD) {
  print('Dial: ${momoPayment.ussdCode}');
}

// Check status
final status = await momoPayment.checkStatus();
```

### USSD

```dart
// Generate USSD code
final ussd = await payment.ussd()
  .setBank('057')
  .generate();

print('Dial: ${ussd.code}');
print('Reference: ${ussd.reference}');

// Monitor status
ussd.onStatus((status) {
  if (status == USSDStatus.completed) {
    print('Payment completed');
  }
});
```

### QR Codes

```dart
// Generate QR code
final qr = await payment.qrCode()
  .setType(QRType.dynamic)
  .generate();

// Get QR code image
final qrImage = await qr.getImage(
  size: 300,
  logo: true,
);

// Monitor scan
qr.onScan((status) {
  print('QR code scanned');
});
```

## Advanced Features

### Split Payments

```dart
final splitPayment = await payment
  .setSplitConfig(MPSplitConfig(
    subaccounts: [
      MPSubaccount(
        code: 'SUB_123',
        percentage: 20,
      ),
      MPSubaccount(
        code: 'SUB_456',
        percentage: 30,
      ),
    ],
    bearCharges: true,
  ))
  .charge();
```

### Subscriptions

```dart
// Create plan
final plan = await MindPaystack.createPlan(
  name: 'Monthly Plan',
  amount: 5000,
  interval: 'monthly',
);

// Create subscription
final subscription = await MindPaystack.createSubscription(
  customer: 'CUS_123',
  plan: plan.code,
  startDate: DateTime.now().add(Duration(days: 7)),
);

// Cancel subscription
await subscription.cancel(
  reason: 'Customer request',
);
```

### Background Processing

```dart
// Enable background processing
final backgroundPayment = await payment
  .setBackgroundMode(true)
  .setRetryStrategy(MPRetryStrategy.exponential)
  .setMaxRetries(5)
  .charge();

// Get status updates
backgroundPayment.onStatusUpdate((status) {
  print('Payment status: $status');
});
```

### Offline Support

```dart
// Enable offline mode
final offlinePayment = await payment
  .setOfflineMode(true)
  .setPendingExpiry(Duration(hours: 24))
  .charge();

// Sync when online
await MindPaystack.syncOfflineTransactions();
```

## UI Components

### Custom Payment Form

```dart
class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MindPaystackProvider(
      child: Scaffold(
        body: Column(
          children: [
            // Card input
            MPCardInput(
              onCardComplete: (card) {
                print('Card valid: ${card.isValid}');
              },
              style: MPInputStyle(
                borderRadius: 8,
                borderColor: Colors.grey,
                errorColor: Colors.red,
              ),
            ),

            // Card Scanner
            MPCardScanner(
              onScanComplete: (card) {
                print('Card scanned: ${card.last4}');
              },
            ),

            // Bank selector
            MPBankSelector(
              onBankSelected: (bank) {
                print('Selected bank: ${bank.name}');
              },
            ),

            // Payment button
            MPPaymentButton(
              text: 'Pay Now',
              loading: false,
              onPressed: () async {
                final result = await payment.charge();
                // Handle result
              },
            ),

            // Transaction status
            MPTransactionStatus(
              reference: 'ref_123',
              onComplete: (status) {
                print('Transaction completed');
              },
            ),
          ],
        ),
      ),
    );
  }
}
```

### Theming

```dart
MPThemeData(
  colors: MPColors(
    primary: Colors.blue,
    secondary: Colors.blueAccent,
    success: Colors.green,
    error: Colors.red,
    background: Colors.white,
  ),
  typography: MPTypography(
    heading: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    body: TextStyle(
      fontSize: 16,
    ),
  ),
  shapes: MPShapes(
    borderRadius: 8,
    elevation: 2,
  ),
)
```

## Error Handling

```dart
try {
  final result = await payment.charge();
} on PaystackCardError catch (e) {
  // Handle card-specific errors
  print('Card error: ${e.message}');
} on PaystackNetworkError catch (e) {
  // Handle network errors
  print('Network error: ${e.message}');
} on PaystackValidationError catch (e) {
  // Handle validation errors
  print('Validation error: ${e.fields}');
} on PaystackAuthError catch (e) {
  // Handle authentication errors
  print('Auth error: ${e.message}');
} on PaystackException catch (e) {
  // Handle all other errors
  print('Error: ${e.message}');
}
```

## Testing

```dart
// Enable test mode
MindPaystack.initialize(
  environment: PaystackEnvironment.test,
);

// Test card payment
final testPayment = await payment
  .setTestMode(true)
  .setTestCard(MPTestCard.visa)
  .setTestScenario(MPTestScenario.successWithOTP)
  .charge();

// Test scenarios
payment.setTestScenario(MPTestScenario.cardDeclined);
payment.setTestScenario(MPTestScenario.insufficientFunds);
payment.setTestScenario(MPTestScenario.networkError);

// Test webhooks
final webhook = await MindPaystack.createWebhook(
  url: 'https://example.com/webhook',
  events: ['charge.success', 'charge.failure'],
  secret: 'whsec_xxx',
);

// Verify webhook
final isValid = MindPaystack.verifyWebhook(
  signature: 'xxx',
  payload: jsonString,
);
```

## Best Practices

```dart
// 1. Always initialize the SDK first
await MindPaystack.initialize();

// 2. Use proper error handling
try {
  await payment.charge();
} catch (e) {
  handleError(e);
}

// 3. Implement proper status checking
payment.onStatus((status) {
  persistStatus(status);
  updateUI(status);
});

// 4. Clean up resources
@override
void dispose() {
  payment.dispose();
  super.dispose();
}

// 5. Implement proper logging
MindPaystack.instance.setLogger((level, message) {
  logToService(level, message);
});

// 6. Handle configuration changes
@override
void didChangeAppLifecycleState(AppLifecycleState state) {
  if (state == AppLifecycleState.resumed) {
    MindPaystack.instance.refreshConfiguration();
  }
}
```

This comprehensive guide covers most use cases and features of the Mind Paystack SDK. Each section can be expanded with more specific examples and edge cases as needed. Would you like me to elaborate on any particular section or add more examples?