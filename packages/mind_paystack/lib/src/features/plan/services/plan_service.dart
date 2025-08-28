import 'package:dio/dio.dart';
import 'package:mind_paystack/src/core/errors/models/mind_exception.dart';
import 'package:mind_paystack/src/core/models/resource.dart';
import 'package:mind_paystack/src/features/plan/interfaces/i_plan_service.dart';
import 'package:mind_paystack/src/features/plan/models/models.dart';
import 'package:mind_paystack/src/features/plan/repositories/plan_repository.dart';

/// Service implementation for plan-related business operations with proper
/// exception handling.
///
/// This service provides a high-level interface for plan management operations,
/// implementing business logic validation and error handling on top of the
/// repository layer. It serves as the main entry point for plan operations
/// throughout the application.
///
/// The service delegates to [PlanRepository] for API communication while
/// adding validation, error handling, and business rule enforcement.
///
/// All methods throw [MindException] with proper error codes and messages
/// for consistent error handling across the application.
///
/// Example usage:
/// ```dart
/// final planService = PlanService(planRepository);
///
/// // Create a new plan
/// final createResult = await planService.create(
///   CreatePlanOptions(
///     name: 'Premium Monthly',
///     amount: 500000,
///     interval: 'monthly',
///   ),
/// );
///
/// if (createResult.isSuccess) {
///   print('Plan created: ${createResult.data!.planCode}');
/// }
/// ```
class PlanService implements IPlanService {
  /// Creates a new PlanService instance.
  ///
  /// The [_repository] is used for all data access operations and should be
  /// properly configured with authentication and network settings.
  PlanService(this._repository);

  /// Repository for handling plan data access operations.
  final PlanRepository _repository;

  @override
  Future<Resource<Plan>> create(CreatePlanOptions options) async {
    try {
      // Add business logic validation
      if (options.name.trim().isEmpty) {
        throw MindException.validation(
          message: 'Plan name cannot be empty',
          errors: [],
        );
      }

      if (options.amount <= 0) {
        throw MindException.validation(
          message: 'Plan amount must be greater than zero',
          errors: [],
        );
      }

      return await _repository.create(options);
    } on DioException catch (e) {
      throw MindException.fromDioError(e);
    } catch (e) {
      if (e is MindException) rethrow;

      throw MindException(
        message: 'Failed to create plan',
        code: 'plan_creation_error',
        technicalMessage: e.toString(),
      );
    }
  }

  @override
  Future<Resource<List<Plan>>> list([ListPlansOptions? options]) async {
    try {
      // Add business logic validation
      if (options?.perPage != null && options!.perPage! <= 0) {
        throw MindException.validation(
          message: 'Items per page must be greater than zero',
          errors: [],
        );
      }

      if (options?.page != null && options!.page! <= 0) {
        throw MindException.validation(
          message: 'Page number must be greater than zero',
          errors: [],
        );
      }

      return await _repository.list(options);
    } on DioException catch (e) {
      throw MindException.fromDioError(e);
    } catch (e, s) {
      print(s);
      if (e is MindException) rethrow;

      throw MindException(
        message: 'Failed to list plans',
        code: 'plan_list_error',
        technicalMessage: e.toString(),
      );
    }
  }

  @override
  Future<Resource<Plan>> fetch(String planIdOrCode) async {
    try {
      // Add business logic validation
      if (planIdOrCode.trim().isEmpty) {
        throw MindException.validation(
          message: 'Plan ID or code cannot be empty',
          errors: [],
        );
      }

      return await _repository.fetch(planIdOrCode);
    } on DioException catch (e) {
      throw MindException.fromDioError(e);
    } catch (e) {
      if (e is MindException) rethrow;

      throw MindException(
        message: 'Failed to fetch plan',
        code: 'plan_fetch_error',
        technicalMessage: e.toString(),
      );
    }
  }

  @override
  Future<Resource<Plan>> update(
    String planIdOrCode,
    UpdatePlanOptions options,
  ) async {
    try {
      // Add business logic validation
      if (planIdOrCode.trim().isEmpty) {
        throw MindException.validation(
          message: 'Plan ID or code cannot be empty',
          errors: [],
        );
      }

      if (options.name?.trim().isEmpty ?? false) {
        throw MindException.validation(
          message: 'Plan name cannot be empty',
          errors: [],
        );
      }

      if (options.amount != null && options.amount! <= 0) {
        throw MindException.validation(
          message: 'Plan amount must be greater than zero',
          errors: [],
        );
      }

      return await _repository.update(planIdOrCode, options);
    } on DioException catch (e) {
      throw MindException.fromDioError(e);
    } catch (e) {
      if (e is MindException) rethrow;

      throw MindException(
        message: 'Failed to update plan',
        code: 'plan_update_error',
        technicalMessage: e.toString(),
      );
    }
  }
}
