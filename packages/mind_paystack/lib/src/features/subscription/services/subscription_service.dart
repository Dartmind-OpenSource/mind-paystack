import 'package:dio/dio.dart';
import 'package:mind_paystack/src/core/errors/models/mind_exception.dart';
import 'package:mind_paystack/src/core/models/resource.dart';
import 'package:mind_paystack/src/features/subscription/interfaces/i_subscription_service.dart';
import 'package:mind_paystack/src/features/subscription/models/models.dart';
import 'package:mind_paystack/src/features/subscription/repositories/subscription_repository.dart';

/// Service implementation for subscription-related business operations with proper
/// exception handling.
///
/// This service provides a high-level interface for subscription management operations,
/// implementing business logic validation and error handling on top of the
/// repository layer. It serves as the main entry point for subscription operations
/// throughout the application.
///
/// The service delegates to [SubscriptionRepository] for API communication while
/// adding validation, error handling, and business rule enforcement.
/// 
/// All methods throw [MindException] with proper error codes and messages
/// for consistent error handling across the application.
///
/// Example usage:
/// ```dart
/// final subscriptionService = SubscriptionService(subscriptionRepository);
///
/// // Create a new subscription
/// final createResult = await subscriptionService.create(
///   CreateSubscriptionOptions(
///     customer: 'CUS_xyz123',
///     plan: 'PLN_xyz123',
///     authorization: 'AUTH_xyz123',
///   ),
/// );
///
/// if (createResult.isSuccess) {
///   print('Subscription created: ${createResult.data!.subscriptionCode}');
/// }
/// ```
class SubscriptionService implements ISubscriptionService {
  /// Creates a new SubscriptionService instance.
  ///
  /// The [_repository] is used for all data access operations and should be
  /// properly configured with authentication and network settings.
  SubscriptionService(this._repository);

  /// Repository for handling subscription data access operations.
  final SubscriptionRepository _repository;

  @override
  Future<Resource<Subscription>> create(CreateSubscriptionOptions options) async {
    try {
      // Add business logic validation
      if (options.customer.trim().isEmpty) {
        throw MindException.validation(
          message: 'Customer code or email cannot be empty',
          errors: [],
        );
      }
      
      if (options.plan.trim().isEmpty) {
        throw MindException.validation(
          message: 'Plan code cannot be empty',
          errors: [],
        );
      }
      
      if (options.quantity != null && options.quantity! <= 0) {
        throw MindException.validation(
          message: 'Subscription quantity must be greater than zero',
          errors: [],
        );
      }

      return await _repository.create(options);
    } on DioException catch (e) {
      throw MindException.fromDioError(e);
    } catch (e) {
      if (e is MindException) rethrow;
      
      throw MindException(
        message: 'Failed to create subscription',
        code: 'subscription_creation_error',
        technicalMessage: e.toString(),
      );
    }
  }

  @override
  Future<Resource<List<Subscription>>> list([ListSubscriptionsOptions? options]) async {
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
    } catch (e) {
      if (e is MindException) rethrow;
      
      throw MindException(
        message: 'Failed to list subscriptions',
        code: 'subscription_list_error',
        technicalMessage: e.toString(),
      );
    }
  }

  @override
  Future<Resource<Subscription>> fetch(String subscriptionIdOrCode) async {
    try {
      // Add business logic validation
      if (subscriptionIdOrCode.trim().isEmpty) {
        throw MindException.validation(
          message: 'Subscription ID or code cannot be empty',
          errors: [],
        );
      }

      return await _repository.fetch(subscriptionIdOrCode);
    } on DioException catch (e) {
      throw MindException.fromDioError(e);
    } catch (e) {
      if (e is MindException) rethrow;
      
      throw MindException(
        message: 'Failed to fetch subscription',
        code: 'subscription_fetch_error',
        technicalMessage: e.toString(),
      );
    }
  }

  @override
  Future<Resource<Subscription>> enable(
    String subscriptionIdOrCode,
    [EnableSubscriptionOptions? options]
  ) async {
    try {
      // Add business logic validation
      if (subscriptionIdOrCode.trim().isEmpty) {
        throw MindException.validation(
          message: 'Subscription ID or code cannot be empty',
          errors: [],
        );
      }

      return await _repository.enable(subscriptionIdOrCode, options);
    } on DioException catch (e) {
      throw MindException.fromDioError(e);
    } catch (e) {
      if (e is MindException) rethrow;
      
      throw MindException(
        message: 'Failed to enable subscription',
        code: 'subscription_enable_error',
        technicalMessage: e.toString(),
      );
    }
  }

  @override
  Future<Resource<Subscription>> disable(
    String subscriptionIdOrCode,
    [DisableSubscriptionOptions? options]
  ) async {
    try {
      // Add business logic validation
      if (subscriptionIdOrCode.trim().isEmpty) {
        throw MindException.validation(
          message: 'Subscription ID or code cannot be empty',
          errors: [],
        );
      }

      return await _repository.disable(subscriptionIdOrCode, options);
    } on DioException catch (e) {
      throw MindException.fromDioError(e);
    } catch (e) {
      if (e is MindException) rethrow;
      
      throw MindException(
        message: 'Failed to disable subscription',
        code: 'subscription_disable_error',
        technicalMessage: e.toString(),
      );
    }
  }

  @override
  Future<Resource<SubscriptionLink>> generateUpdateLink(
    String subscriptionIdOrCode
  ) async {
    try {
      // Add business logic validation
      if (subscriptionIdOrCode.trim().isEmpty) {
        throw MindException.validation(
          message: 'Subscription ID or code cannot be empty',
          errors: [],
        );
      }

      return await _repository.generateUpdateLink(subscriptionIdOrCode);
    } on DioException catch (e) {
      throw MindException.fromDioError(e);
    } catch (e) {
      if (e is MindException) rethrow;
      
      throw MindException(
        message: 'Failed to generate subscription update link',
        code: 'subscription_link_error',
        technicalMessage: e.toString(),
      );
    }
  }

  @override
  Future<Resource<Map<String, dynamic>>> sendUpdateLink(
    String subscriptionIdOrCode
  ) async {
    try {
      // Add business logic validation
      if (subscriptionIdOrCode.trim().isEmpty) {
        throw MindException.validation(
          message: 'Subscription ID or code cannot be empty',
          errors: [],
        );
      }

      return await _repository.sendUpdateLink(subscriptionIdOrCode);
    } on DioException catch (e) {
      throw MindException.fromDioError(e);
    } catch (e) {
      if (e is MindException) rethrow;
      
      throw MindException(
        message: 'Failed to send subscription update link',
        code: 'subscription_email_error',
        technicalMessage: e.toString(),
      );
    }
  }
}