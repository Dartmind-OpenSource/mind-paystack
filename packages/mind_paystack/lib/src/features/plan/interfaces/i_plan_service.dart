import 'package:mind_paystack/src/core/models/resource.dart';
import 'package:mind_paystack/src/features/plan/models/models.dart';

/// Interface defining the contract for plan-related business operations.
///
/// This abstract class defines all the plan operations that can be
/// performed through the MindPaystack SDK. It serves as a contract that
/// concrete service implementations must fulfill, providing a clean separation
/// between the business logic layer and the data access layer.
///
/// The service provides high-level plan operations including creation,
/// listing, fetching, and updating of subscription plans. All methods return
/// Resource objects for consistent error handling and response structure.
///
/// Example implementation usage:
/// ```dart
/// class PlanService implements IPlanService {
///   final PlanRepository _repository;
///
///   PlanService(this._repository);
///
///   @override
///   Future<Resource<Plan>> create(CreatePlanOptions options) async {
///     // Business logic and validation here
///     return await _repository.create(options);
///   }
/// }
/// ```
abstract class IPlanService {
  /// Creates a new subscription plan.
  ///
  /// Creates a new plan on Paystack's servers with the specified
  /// billing details. Plans are used to create recurring subscriptions
  /// for customers who want to pay regularly.
  ///
  /// Parameters:
  /// - [options]: Configuration for the new plan including name, amount,
  ///   interval, and other plan details
  ///
  /// Returns:
  /// A Resource containing Plan data with the created plan details.
  ///
  /// Throws:
  /// - MindException if validation fails or API request encounters errors
  ///
  /// Example:
  /// ```dart
  /// final options = CreatePlanOptions(
  ///   name: 'Premium Monthly',
  ///   amount: 500000, // ₦5,000 in kobo
  ///   interval: 'monthly',
  /// );
  ///
  /// final result = await planService.create(options);
  /// if (result.isSuccess) {
  ///   final plan = result.data!;
  ///   print('Plan created: ${plan.planCode}');
  /// }
  /// ```
  Future<Resource<Plan>> create(CreatePlanOptions options);

  /// Retrieves a list of subscription plans.
  ///
  /// Fetches plans from Paystack with optional filtering and pagination.
  /// This is useful for displaying available subscription options to customers
  /// or for administrative plan management.
  ///
  /// Parameters:
  /// - [options]: Optional filtering and pagination parameters
  ///
  /// Returns:
  /// A Resource containing PlanList with plans and pagination metadata.
  ///
  /// Example:
  /// ```dart
  /// final options = ListPlansOptions(
  ///   perPage: 10,
  ///   page: 1,
  ///   status: 'active',
  /// );
  ///
  /// final result = await planService.list(options);
  /// if (result.isSuccess) {
  ///   final plans = result.data!.data;
  ///   for (final plan in plans) {
  ///     print('${plan.name}: ${plan.amount} every ${plan.interval}');
  ///   }
  /// }
  /// ```
  Future<Resource<List<Plan>>> list([ListPlansOptions? options]);

  /// Fetches a specific subscription plan by its ID or plan code.
  ///
  /// Retrieves detailed information about a specific plan. This is useful
  /// for displaying plan details before subscription or for administrative
  /// purposes.
  ///
  /// Parameters:
  /// - [planIdOrCode]: The plan ID or plan code to fetch
  ///
  /// Returns:
  /// A Resource containing Plan data with the complete plan details.
  ///
  /// Example:
  /// ```dart
  /// final result = await planService.fetch('PLN_xyz123');
  /// if (result.isSuccess) {
  ///   final plan = result.data!;
  ///   print('Plan: ${plan.name} - ${plan.amount} ${plan.currency}');
  /// }
  /// ```
  Future<Resource<Plan>> fetch(String planIdOrCode);

  /// Updates an existing subscription plan.
  ///
  /// Updates plan details such as name, amount, or currency. Note that
  /// some fields like interval may not be updateable depending on
  /// Paystack's API restrictions.
  ///
  /// Parameters:
  /// - [planIdOrCode]: The plan ID or plan code to update
  /// - [options]: The fields to update
  ///
  /// Returns:
  /// A Resource containing Plan data with the updated plan details.
  ///
  /// Example:
  /// ```dart
  /// final options = UpdatePlanOptions(
  ///   name: 'Premium Monthly (Updated)',
  ///   amount: 600000, // ₦6,000 in kobo
  /// );
  ///
  /// final result = await planService.update('PLN_xyz123', options);
  /// if (result.isSuccess) {
  ///   final plan = result.data!;
  ///   print('Plan updated: ${plan.name}');
  /// }
  /// ```
  Future<Resource<Plan>> update(String planIdOrCode, UpdatePlanOptions options);
}
