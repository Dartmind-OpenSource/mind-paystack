import 'package:mind_paystack/src/core/models/resource.dart';
import 'package:mind_paystack/src/core/network/http_client.dart';
import 'package:mind_paystack/src/features/subscription/models/models.dart';

/// Repository for handling all subscription-related API operations.
///
/// This repository provides a comprehensive interface for interacting with
/// Paystack's subscription APIs, including creation, listing, fetching,
/// enabling, disabling, and managing subscription update links.
///
/// The repository handles HTTP communication with the Paystack API and
/// transforms raw responses into typed model objects wrapped in [Resource]
/// containers for consistent error handling.
///
/// Example usage:
/// ```dart
/// final repository = SubscriptionRepository(httpClient);
///
/// // Create a new subscription
/// final createResult = await repository.create(
///   CreateSubscriptionOptions(
///     customer: 'CUS_xyz123',
///     plan: 'PLN_xyz123',
///     authorization: 'AUTH_xyz123',
///   ),
/// );
///
/// // List all subscriptions
/// final listResult = await repository.list();
/// ```
class SubscriptionRepository {
  /// Creates a new SubscriptionRepository instance.
  ///
  /// The [_httpClient] is used for all HTTP communication with the
  /// Paystack API and should be properly configured with authentication.
  SubscriptionRepository(this._httpClient);

  /// HTTP client used for API communication.
  final HttpClient _httpClient;

  /// Creates a new subscription.
  ///
  /// Sends a POST request to Paystack's subscription creation endpoint with the
  /// specified subscription details. Links a customer to a plan for recurring billing.
  ///
  /// Parameters:
  /// - [options]: Configuration for the new subscription including customer,
  ///   plan, authorization, and other subscription details
  ///
  /// Returns:
  /// A Resource containing Subscription data with the created subscription details.
  ///
  /// API Endpoint: `POST /subscription`
  Future<Resource<Subscription>> create(CreateSubscriptionOptions options) async {
    final res = await _httpClient.post<Map<String, dynamic>>(
      '/subscription',
      data: options.toMap(),
    );
    return Resource.fromMap(
      res.data!,
      SubscriptionMapper.fromMap,
    );
  }

  /// Retrieves a list of subscriptions.
  ///
  /// Sends a GET request to Paystack's subscription listing endpoint with optional
  /// filtering and pagination parameters. Returns subscriptions that match the
  /// specified criteria.
  ///
  /// Parameters:
  /// - [options]: Optional filtering and pagination parameters
  ///
  /// Returns:
  /// A Resource containing List<Subscription> with subscriptions data.
  ///
  /// API Endpoint: `GET /subscription`
  Future<Resource<List<Subscription>>> list([ListSubscriptionsOptions? options]) async {
    final queryParams = options?.toMap() ?? <String, dynamic>{};

    final res = await _httpClient.get<Map<String, dynamic>>(
      '/subscription',
      queryParameters: queryParams,
    );
    return Resource.fromMapList(
      res.data!,
      (data) => data.map(SubscriptionMapper.fromMap).toList(),
    );
  }

  /// Fetches a specific subscription by its ID or subscription code.
  ///
  /// Sends a GET request to retrieve detailed information about a specific
  /// subscription. This is useful for displaying subscription details to
  /// customers or for administrative purposes.
  ///
  /// Parameters:
  /// - [subscriptionIdOrCode]: The subscription ID or subscription code to fetch
  ///
  /// Returns:
  /// A Resource containing Subscription data with the complete subscription details.
  ///
  /// API Endpoint: `GET /subscription/{id_or_code}`
  Future<Resource<Subscription>> fetch(String subscriptionIdOrCode) async {
    final res = await _httpClient.get<Map<String, dynamic>>(
      '/subscription/$subscriptionIdOrCode',
    );
    return Resource.fromMap(
      res.data!,
      SubscriptionMapper.fromMap,
    );
  }

  /// Enables a subscription.
  ///
  /// Sends a POST request to Paystack's subscription enable endpoint.
  /// Reactivates a previously disabled subscription for resumed billing.
  ///
  /// Parameters:
  /// - [subscriptionIdOrCode]: The subscription ID or code to enable
  /// - [options]: Optional parameters for enabling the subscription
  ///
  /// Returns:
  /// A Resource containing Subscription data with the updated subscription details.
  ///
  /// API Endpoint: `POST /subscription/enable`
  Future<Resource<Subscription>> enable(
    String subscriptionIdOrCode,
    [EnableSubscriptionOptions? options]
  ) async {
    final data = <String, dynamic>{
      'code': subscriptionIdOrCode,
      if (options?.token != null) 'token': options!.token,
    };

    final res = await _httpClient.post<Map<String, dynamic>>(
      '/subscription/enable',
      data: data,
    );
    return Resource.fromMap(
      res.data!,
      SubscriptionMapper.fromMap,
    );
  }

  /// Disables a subscription.
  ///
  /// Sends a POST request to Paystack's subscription disable endpoint.
  /// Deactivates an active subscription to stop billing.
  ///
  /// Parameters:
  /// - [subscriptionIdOrCode]: The subscription ID or code to disable
  /// - [options]: Optional parameters for disabling the subscription
  ///
  /// Returns:
  /// A Resource containing Subscription data with the updated subscription details.
  ///
  /// API Endpoint: `POST /subscription/disable`
  Future<Resource<Subscription>> disable(
    String subscriptionIdOrCode,
    [DisableSubscriptionOptions? options]
  ) async {
    final data = <String, dynamic>{
      'code': subscriptionIdOrCode,
      if (options?.token != null) 'token': options!.token,
    };

    final res = await _httpClient.post<Map<String, dynamic>>(
      '/subscription/disable',
      data: data,
    );
    return Resource.fromMap(
      res.data!,
      SubscriptionMapper.fromMap,
    );
  }

  /// Generates an update subscription link.
  ///
  /// Sends a GET request to generate a secure link that customers can use
  /// to update their subscription details such as card information.
  ///
  /// Parameters:
  /// - [subscriptionIdOrCode]: The subscription ID or code
  ///
  /// Returns:
  /// A Resource containing SubscriptionLink data with the update link.
  ///
  /// API Endpoint: `GET /subscription/{id_or_code}/manage/link`
  Future<Resource<SubscriptionLink>> generateUpdateLink(
    String subscriptionIdOrCode
  ) async {
    final res = await _httpClient.get<Map<String, dynamic>>(
      '/subscription/$subscriptionIdOrCode/manage/link',
    );
    return Resource.fromMap(
      res.data!,
      SubscriptionLinkMapper.fromMap,
    );
  }

  /// Sends an update subscription link to the customer.
  ///
  /// Sends a POST request to email the customer a secure link to update
  /// their subscription details.
  ///
  /// Parameters:
  /// - [subscriptionIdOrCode]: The subscription ID or code
  ///
  /// Returns:
  /// A Resource containing success/failure status.
  ///
  /// API Endpoint: `POST /subscription/{id_or_code}/manage/email`
  Future<Resource<Map<String, dynamic>>> sendUpdateLink(
    String subscriptionIdOrCode
  ) async {
    final res = await _httpClient.post<Map<String, dynamic>>(
      '/subscription/$subscriptionIdOrCode/manage/email',
    );
    return Resource.fromMap(
      res.data!,
      (data) => data,
    );
  }
}