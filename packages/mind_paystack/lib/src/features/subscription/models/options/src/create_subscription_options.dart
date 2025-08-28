import 'package:dart_mappable/dart_mappable.dart';
part 'create_subscription_options.mapper.dart';

/// Options for creating a new subscription.
///
/// This class provides the required and optional parameters for
/// creating a subscription on Paystack. Subscriptions link customers
/// to plans for automatic recurring billing.
///
/// Example usage:
/// ```dart
/// final createOptions = CreateSubscriptionOptions(
///   customer: 'CUS_xyz123',
///   plan: 'PLN_xyz123',
///   authorization: 'AUTH_xyz123',
/// );
/// ```
@MappableClass()
class CreateSubscriptionOptions with CreateSubscriptionOptionsMappable {
  /// Creates a new CreateSubscriptionOptions instance.
  ///
  /// [customer] and [plan] are required parameters.
  /// Either [authorization] or card details must be provided for payment.
  const CreateSubscriptionOptions({
    required this.customer,
    required this.plan,
    this.authorization,
    this.startDate,
    this.quantity,
    this.metadata,
  });

  /// Customer code or email address for the subscription.
  ///
  /// Can be either a customer code (CUS_xyz123) or email address.
  /// If email is provided and customer doesn't exist, a new customer
  /// will be created automatically.
  final String customer;

  /// Plan code for the subscription.
  ///
  /// Must be a valid plan code that exists on your Paystack account.
  /// Example: "basic_monthly", "premium_yearly"
  final String plan;

  /// Authorization code for recurring payments.
  ///
  /// This should be an authorization code from a previous successful
  /// transaction or from a payment method saved by the customer.
  /// Required for automatic billing.
  final String? authorization;

  /// Start date for the subscription.
  ///
  /// If not provided, the subscription will start immediately.
  /// Format: ISO 8601 date string (YYYY-MM-DD)
  @MappableField(key: 'start_date')
  final DateTime? startDate;

  /// Quantity for the subscription.
  ///
  /// Used for usage-based billing or multiple units of the same plan.
  /// Defaults to 1 if not specified.
  final int? quantity;

  /// Additional metadata for the subscription.
  ///
  /// Custom key-value pairs to store additional information about
  /// the subscription. Maximum of 20 key-value pairs.
  final Map<String, dynamic>? metadata;
}
