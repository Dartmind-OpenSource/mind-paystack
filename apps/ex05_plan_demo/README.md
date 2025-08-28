# Plan Management Demo

A comprehensive example demonstrating subscription plan management using the MindPaystack SDK.

## Features Demonstrated

- **Create Plan**: Create new subscription plans with various billing intervals
- **List Plans**: Retrieve and display all available subscription plans
- **Fetch Plan**: Get detailed information about a specific plan
- **Update Plan**: Modify existing plan details like name and amount

## Setup

1. **Environment Variables** (Recommended):
   ```bash
   export PAYSTACK_PUBLIC_KEY=pk_test_your_public_key
   export PAYSTACK_SECRET_KEY=sk_test_your_secret_key
   ```

2. **Install Dependencies**:
   ```bash
   dart pub get
   ```

## Usage

### Interactive Mode
Run the demo with an interactive menu:
```bash
dart run bin/ex05_plan_demo.dart
```

### Complete Demo
Run an automated demonstration of all features:
```bash
dart run bin/ex05_plan_demo.dart --complete
```

## Example Plan Operations

### Creating a Plan
```dart
final createResult = await sdk.plan.create(
  CreatePlanOptions(
    name: 'Premium Monthly',
    amount: 500000, // ₦5,000 in kobo
    interval: 'monthly',
    planCode: 'premium_monthly',
    description: 'Premium features with monthly billing',
    currency: 'NGN',
  ),
);
```

### Listing Plans
```dart
final listResult = await sdk.plan.list(
  ListPlansOptions(
    perPage: 10,
    page: 1,
    status: 'active',
  ),
);
```

### Fetching a Specific Plan
```dart
final fetchResult = await sdk.plan.fetch('premium_monthly');
```

### Updating a Plan
```dart
final updateResult = await sdk.plan.update(
  'premium_monthly',
  UpdatePlanOptions(
    name: 'Premium Monthly (Updated)',
    amount: 600000, // ₦6,000 in kobo
  ),
);
```

## Plan Properties

- **name**: Human-readable plan name
- **amount**: Billing amount in kobo (smallest currency unit)
- **interval**: Billing frequency (`daily`, `weekly`, `monthly`, `biannually`, `annually`)
- **planCode**: Unique identifier for the plan
- **description**: Optional plan description
- **currency**: Plan currency (defaults to NGN)
- **invoiceLimit**: Maximum number of invoices (optional)
- **sendInvoices**: Whether to send email invoices
- **sendSms**: Whether to send SMS notifications

## Error Handling

The demo includes comprehensive error handling for common scenarios:
- Network connectivity issues
- Invalid API credentials  
- Missing required parameters
- Plan not found errors
- Validation failures

## Next Steps

After running this demo, you can:
1. Create plans for your subscription tiers
2. Use these plans in subscription creation
3. Implement plan selection in your UI
4. Set up subscription management workflows