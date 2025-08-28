import 'package:dart_mappable/dart_mappable.dart';
part 'disable_subscription_options.mapper.dart';

/// Options for disabling a subscription.
///
/// This class provides optional parameters for disabling an active
/// subscription. The subscription will stop billing but historical
/// data remains available.
///
/// Example usage:
/// ```dart
/// final disableOptions = DisableSubscriptionOptions(
///   token: 'email_token_from_subscription',
/// );
/// ```
@MappableClass()
class DisableSubscriptionOptions with DisableSubscriptionOptionsMappable {
  /// Creates a new DisableSubscriptionOptions instance.
  const DisableSubscriptionOptions({
    this.token,
  });

  /// Email token for subscription management operations.
  /// 
  /// This token is typically sent to the customer's email when they
  /// request to enable/disable their subscription. It provides additional
  /// security for subscription management operations.
  final String? token;
}