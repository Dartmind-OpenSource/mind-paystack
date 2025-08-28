import 'package:mind_paystack/src/core/errors/models/mind_exception.dart';
import 'package:mind_paystack/src/core/models/resource.dart';
import 'package:mind_paystack/src/core/network/http_client.dart';
import 'package:mind_paystack/src/features/plan/models/models.dart';

/// Repository for handling all plan-related API operations.
///
/// This repository provides a comprehensive interface for interacting with
/// Paystack's plan APIs, including creation, listing, fetching, and updating
/// of subscription plans.
///
/// The repository handles HTTP communication with the Paystack API and
/// transforms raw responses into typed model objects wrapped in [Resource]
/// containers for consistent error handling.
///
/// Example usage:
/// ```dart
/// final repository = PlanRepository(httpClient);
///
/// // Create a new plan
/// final createResult = await repository.create(
///   CreatePlanOptions(
///     name: 'Premium Monthly',
///     amount: 500000, // ₦5,000 in kobo
///     interval: 'monthly',
///   ),
/// );
///
/// // List all plans
/// final listResult = await repository.list();
/// ```
class PlanRepository {
  /// Creates a new PlanRepository instance.
  ///
  /// The [_httpClient] is used for all HTTP communication with the
  /// Paystack API and should be properly configured with authentication.
  PlanRepository(this._httpClient);

  /// HTTP client used for API communication.
  final HttpClient _httpClient;

  /// Creates a new subscription plan.
  ///
  /// Sends a POST request to Paystack's plan creation endpoint with the
  /// specified plan details. The plan will be available for creating
  /// subscriptions once successfully created.
  ///
  /// Parameters:
  /// - [options]: Configuration for the new plan including name, amount,
  ///   interval, and other plan details
  ///
  /// Returns:
  /// A Resource containing Plan data with the created plan details including
  /// the generated plan code and ID.
  ///
  /// Throws:
  /// - [MindException] if the request fails, validation fails, or the API
  ///   returns an error response
  ///
  /// API Endpoint: `POST /plan`
  Future<Resource<Plan>> create(CreatePlanOptions options) async {
    final res = await _httpClient.post<Map<String, dynamic>>(
      '/plan',
      data: options.toMap(),
    );
    return Resource.fromMap(
      res.data!,
      PlanMapper.fromMap,
    );
  }

  /// Retrieves a list of subscription plans.
  ///
  /// Sends a GET request to Paystack's plan listing endpoint with optional
  /// filtering and pagination parameters. Returns plans that match the
  /// specified criteria.
  ///
  /// Parameters:
  /// - [options]: Optional filtering and pagination parameters
  ///
  /// Returns:
  /// A Resource containing PlanList with plans and pagination metadata.
  ///
  /// API Endpoint: `GET /plan`
  Future<Resource<List<Plan>>> list([ListPlansOptions? options]) async {
    final queryParams = options?.toMap() ?? <String, dynamic>{};

    final res = await _httpClient.get<Map<String, dynamic>>(
      '/plan',
      queryParameters: queryParams,
    );
    return Resource.fromMapList(
      res.data!,
      (data) => data.map(PlanMapper.fromMap).toList(),
    );
  }

  /// Fetches a specific subscription plan by its ID or plan code.
  ///
  /// Sends a GET request to retrieve detailed information about a specific
  /// plan. This is useful for displaying plan details before subscription
  /// or for administrative purposes.
  ///
  /// Parameters:
  /// - [planIdOrCode]: The plan ID or plan code to fetch
  ///
  /// Returns:
  /// A Resource containing Plan data with the complete plan details.
  ///
  /// API Endpoint: `GET /plan/{id_or_code}`
  Future<Resource<Plan>> fetch(String planIdOrCode) async {
    final res = await _httpClient.get<Map<String, dynamic>>(
      '/plan/$planIdOrCode',
    );
    return Resource.fromMap(
      res.data!,
      PlanMapper.fromMap,
    );
  }

  /// Updates an existing subscription plan.
  ///
  /// Sends a PUT request to Paystack's plan update endpoint with the
  /// updated plan details. Only the provided fields will be updated.
  ///
  /// Parameters:
  /// - [planIdOrCode]: The plan ID or plan code to update
  /// - [options]: The fields to update
  ///
  /// Returns:
  /// A Resource containing Plan data with the updated plan details.
  ///
  /// Note: Some fields like interval may not be updateable depending on
  /// Paystack's API restrictions and existing subscriptions on the plan.
  ///
  /// API Endpoint: `PUT /plan/{id_or_code}`
  Future<Resource<Plan>> update(
    String planIdOrCode,
    UpdatePlanOptions options,
  ) async {
    final res = await _httpClient.put<Map<String, dynamic>>(
      '/plan/$planIdOrCode',
      data: options.toMap(),
    );
    return Resource.fromMap(
      res.data!,
      PlanMapper.fromMap,
    );
  }
}
