import 'package:mind_paystack/src/core/models/resource.dart';
import 'package:mind_paystack/src/features/subscription/models/models.dart';

/// Interface defining the contract for subscription-related business operations.
///
/// This abstract class defines all the subscription operations that can be
/// performed through the MindPaystack SDK. It serves as a contract that
/// concrete service implementations must fulfill, providing a clean separation
/// between the business logic layer and the data access layer.
///
/// The service provides high-level subscription operations including creation,
/// listing, fetching, enabling, disabling, and managing subscription updates.
/// All methods return Resource objects for consistent error handling and 
/// response structure.
///
/// Example implementation usage:
/// ```dart
/// class SubscriptionService implements ISubscriptionService {
///   final SubscriptionRepository _repository;
///   
///   SubscriptionService(this._repository);
///   
///   @override
///   Future<Resource<Subscription>> create(
///     CreateSubscriptionOptions options,
///   ) async {
///     // Business logic and validation here
///     return await _repository.create(options);
///   }
/// }
/// ```
abstract class ISubscriptionService {
  /// Creates a new subscription.
  ///
  /// Creates a subscription on Paystack's servers with the specified
  /// customer, plan, and other subscription details. The subscription
  /// will be set up for recurring billing according to the plan's settings.
  ///
  /// Parameters:
  /// - [options]: Configuration for the new subscription including customer,
  ///   plan, authorization token, and other subscription details
  ///
  /// Returns:
  /// A Resource containing Subscription data with the created subscription details.
  ///
  /// Throws:
  /// - MindException if validation fails or API request encounters errors
  ///
  /// Example:
  /// ```dart
  /// final options = CreateSubscriptionOptions(
  ///   customer: 'customer_code_or_email',
  ///   plan: 'plan_code',
  ///   authorization: 'authorization_code',
  /// );
  /// 
  /// final result = await subscriptionService.create(options);
  /// if (result.isSuccess) {
  ///   final subscription = result.data!;
  ///   print('Subscription created: ${subscription.subscriptionCode}');
  /// }
  /// ```
  Future<Resource<Subscription>> create(CreateSubscriptionOptions options);

  /// Retrieves a list of subscriptions.
  ///
  /// Fetches subscriptions from Paystack with optional filtering and pagination.
  /// This is useful for displaying customer subscriptions or for administrative
  /// subscription management.
  ///
  /// Parameters:
  /// - [options]: Optional filtering and pagination parameters
  ///
  /// Returns:
  /// A Resource containing List<Subscription> with subscriptions data.
  ///
  /// Example:
  /// ```dart
  /// final options = ListSubscriptionsOptions(
  ///   perPage: 10,
  ///   page: 1,
  ///   customer: 'customer_code',
  ///   plan: 'plan_code',
  /// );
  /// 
  /// final result = await subscriptionService.list(options);
  /// if (result.isSuccess) {
  ///   final subscriptions = result.data!;
  ///   for (final sub in subscriptions) {
  ///     print('${sub.customer.email}: ${sub.plan.name}');
  ///   }
  /// }
  /// ```
  Future<Resource<List<Subscription>>> list([ListSubscriptionsOptions? options]);

  /// Fetches a specific subscription by its ID or subscription code.
  ///
  /// Retrieves detailed information about a specific subscription. This is useful
  /// for displaying subscription details to customers or for administrative
  /// purposes.
  ///
  /// Parameters:
  /// - [subscriptionIdOrCode]: The subscription ID or subscription code to fetch
  ///
  /// Returns:
  /// A Resource containing Subscription data with the complete subscription details.
  ///
  /// Example:
  /// ```dart
  /// final result = await subscriptionService.fetch('SUB_xyz123');
  /// if (result.isSuccess) {
  ///   final subscription = result.data!;
  ///   print('Status: ${subscription.status}');
  ///   print('Next payment: ${subscription.nextPaymentDate}');
  /// }
  /// ```
  Future<Resource<Subscription>> fetch(String subscriptionIdOrCode);

  /// Enables a subscription.
  ///
  /// Reactivates a previously disabled subscription. The subscription will
  /// resume billing according to its plan schedule.
  ///
  /// Parameters:
  /// - [subscriptionIdOrCode]: The subscription ID or code to enable
  /// - [options]: Optional parameters for enabling the subscription
  ///
  /// Returns:
  /// A Resource containing Subscription data with the updated subscription details.
  ///
  /// Example:
  /// ```dart
  /// final result = await subscriptionService.enable(
  ///   'SUB_xyz123',
  ///   EnableSubscriptionOptions(token: 'token_from_email'),
  /// );
  /// if (result.isSuccess) {
  ///   print('Subscription enabled successfully');
  /// }
  /// ```
  Future<Resource<Subscription>> enable(
    String subscriptionIdOrCode,
    [EnableSubscriptionOptions? options]
  );

  /// Disables a subscription.
  ///
  /// Deactivates an active subscription. The subscription will stop billing
  /// but historical data remains available.
  ///
  /// Parameters:
  /// - [subscriptionIdOrCode]: The subscription ID or code to disable
  /// - [options]: Optional parameters for disabling the subscription
  ///
  /// Returns:
  /// A Resource containing Subscription data with the updated subscription details.
  ///
  /// Example:
  /// ```dart
  /// final result = await subscriptionService.disable(
  ///   'SUB_xyz123',
  ///   DisableSubscriptionOptions(token: 'token_from_email'),
  /// );
  /// if (result.isSuccess) {
  ///   print('Subscription disabled successfully');
  /// }
  /// ```
  Future<Resource<Subscription>> disable(
    String subscriptionIdOrCode,
    [DisableSubscriptionOptions? options]
  );

  /// Generates an update subscription link.
  ///
  /// Creates a secure link that customers can use to update their subscription
  /// details such as card information or billing address.
  ///
  /// Parameters:
  /// - [subscriptionIdOrCode]: The subscription ID or code
  ///
  /// Returns:
  /// A Resource containing SubscriptionLink data with the update link.
  ///
  /// Example:
  /// ```dart
  /// final result = await subscriptionService.generateUpdateLink('SUB_xyz123');
  /// if (result.isSuccess) {
  ///   final link = result.data!;
  ///   print('Update link: ${link.link}');
  /// }
  /// ```
  Future<Resource<SubscriptionLink>> generateUpdateLink(
    String subscriptionIdOrCode
  );

  /// Sends an update subscription link to the customer.
  ///
  /// Sends an email to the customer with a secure link to update their
  /// subscription details.
  ///
  /// Parameters:
  /// - [subscriptionIdOrCode]: The subscription ID or code
  ///
  /// Returns:
  /// A Resource containing success/failure status.
  ///
  /// Example:
  /// ```dart
  /// final result = await subscriptionService.sendUpdateLink('SUB_xyz123');
  /// if (result.isSuccess) {
  ///   print('Update link sent to customer email');
  /// }
  /// ```
  Future<Resource<Map<String, dynamic>>> sendUpdateLink(
    String subscriptionIdOrCode
  );
}