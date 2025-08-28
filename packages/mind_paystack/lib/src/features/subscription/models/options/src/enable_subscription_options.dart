import 'package:dart_mappable/dart_mappable.dart';
part 'enable_subscription_options.mapper.dart';

/// Options for enabling a subscription.
///
/// This class provides optional parameters for enabling a previously
/// disabled subscription. The subscription will resume billing according
/// to its plan schedule.
///
/// Example usage:
/// ```dart
/// final enableOptions = EnableSubscriptionOptions(
///   token: 'email_token_from_subscription',
/// );
/// ```
@MappableClass()
class EnableSubscriptionOptions with EnableSubscriptionOptionsMappable {
  /// Creates a new EnableSubscriptionOptions instance.
  const EnableSubscriptionOptions({
    this.token,
  });

  /// Email token for subscription management operations.
  /// 
  /// This token is typically sent to the customer's email when they
  /// request to enable/disable their subscription. It provides additional
  /// security for subscription management operations.
  final String? token;
}