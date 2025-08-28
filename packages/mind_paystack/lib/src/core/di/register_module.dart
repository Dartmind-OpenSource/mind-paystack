import 'package:injectable/injectable.dart';
import 'package:mind_paystack/mind_paystack.dart';
import 'package:mind_paystack/src/core/network/http_client.dart';
import 'package:mind_paystack/src/features/charge/repositories/charge_repository.dart';
import 'package:mind_paystack/src/features/charge/services/charge_service.dart';
import 'package:mind_paystack/src/features/plan/repositories/plan_repository.dart';
import 'package:mind_paystack/src/features/plan/services/plan_service.dart';
import 'package:mind_paystack/src/features/subscription/repositories/subscription_repository.dart';
import 'package:mind_paystack/src/features/subscription/services/subscription_service.dart';
import 'package:mind_paystack/src/features/transaction/repositories/transaction_repository.dart';
import 'package:mind_paystack/src/features/transaction/services/transaction_service.dart';

/// Dependency injection module for the MindPaystack SDK.
///
/// This module defines how to create and configure all the core dependencies
/// used throughout the SDK, including HTTP clients, repositories, and services.
/// It uses the Injectable package to provide automatic dependency injection
/// with factory methods that receive the PaystackConfig as a parameter.
///
/// The module follows a hierarchical dependency structure where:
/// 1. HttpClient is the base dependency that handles all network requests
/// 2. Repositories use HttpClient to make API calls and handle data mapping
/// 3. Services (future) will use repositories to provide business logic
///
/// All factory methods receive a PaystackConfig parameter which contains
/// the necessary configuration (API keys, environment, retry policies, etc.)
/// to properly initialize the dependencies.
///
/// Example usage:
/// ```dart
/// // This is handled automatically by get_it/injectable
/// final config = PaystackConfig(
///   publicKey: 'pk_test_your_key',
///   secretKey: 'sk_test_your_key',
/// );
///
/// // Dependencies are resolved automatically
/// final transactionRepo = getIt<TransactionRepository>(param1: config);
/// ```
@module
abstract class RegisterModule {
  /// Provides an HttpClient instance configured with the given PaystackConfig.
  ///
  /// The HttpClient is the core networking component that handles all HTTP
  /// requests to the Paystack API. It's configured with the environment-
  /// specific base URL, authentication headers, timeout settings, and retry
  /// policies from the provided config.
  ///
  /// This is marked as @injectable rather than @factoryMethod because it's
  /// a direct dependency that other services use, not a high-level service
  /// that would be injected into user code.
  ///
  /// Parameters:
  /// - [config]: PaystackConfig containing API keys, environment, and settings
  ///
  /// Returns:
  /// A configured HttpClient instance ready for API communication.
  @injectable
  HttpClient provideHttpClient(@factoryParam PaystackConfig config) =>
      HttpClient(config);

  /// Provides a TransactionRepository instance for transaction-related
  /// operations.
  ///
  /// The TransactionRepository handles all transaction-related API interactions
  /// including initializing payments, verifying transactions, listing
  /// transactions, charging authorizations, and retrieving transaction
  /// analytics.
  ///
  /// This factory method automatically creates an HttpClient with the provided
  /// configuration and injects it into the repository, ensuring all network
  /// requests are properly configured.
  ///
  /// Parameters:
  /// - [config]: PaystackConfig containing API keys and environment settings
  ///
  /// Returns:
  /// A TransactionRepository instance configured for the given environment.
  ///
  /// Example:
  /// ```dart
  /// final config = PaystackConfig(
  ///   publicKey: 'pk_test_your_key',
  ///   secretKey: 'sk_test_your_key',
  ///   environment: Environment.test,
  /// );
  ///
  /// final transactionRepo = getIt<TransactionRepository>(param1: config);
  /// final result = await transactionRepo.initialize(options);
  /// ```
  @factoryMethod
  TransactionRepository transactionRepository(
    @factoryParam PaystackConfig config,
  ) =>
      TransactionRepository(provideHttpClient(config));

  /// Provides a ChargeRepository instance for charge-related operations.
  ///
  /// The ChargeRepository handles all charge-related API interactions
  /// including creating charges, submitting authentication data (PIN, OTP,
  /// phone, birthday, address), and checking pending charge status.
  ///
  /// This factory method automatically creates an HttpClient with the provided
  /// configuration and injects it into the repository, ensuring all network
  /// requests are properly configured.
  ///
  /// Parameters:
  /// - [config]: PaystackConfig containing API keys and environment settings
  ///
  /// Returns:
  /// A ChargeRepository instance configured for the given environment.
  ///
  /// Example:
  /// ```dart
  /// final config = PaystackConfig(
  ///   publicKey: 'pk_test_your_key',
  ///   secretKey: 'sk_test_your_key',
  ///   environment: Environment.test,
  /// );
  ///
  /// final chargeRepo = getIt<ChargeRepository>(param1: config);
  /// final result = await chargeRepo.createCharge(options);
  /// ```
  @factoryMethod
  ChargeRepository chargeRepository(
    @factoryParam PaystackConfig config,
  ) =>
      ChargeRepository(provideHttpClient(config));

  /// Provides a TransactionService instance for transaction business logic.
  ///
  /// The TransactionService provides high-level transaction operations with
  /// proper validation, error handling, and business logic. It uses the
  /// TransactionRepository for data access operations.
  ///
  /// Parameters:
  /// - [config]: PaystackConfig containing API keys and environment settings
  ///
  /// Returns:
  /// A TransactionService instance with injected repository dependency.
  @factoryMethod
  TransactionService transactionService(
    @factoryParam PaystackConfig config,
  ) =>
      TransactionService(transactionRepository(config));

  /// Provides a ChargeService instance for charge business logic.
  ///
  /// The ChargeService provides high-level charge operations with proper
  /// validation, error handling, and business logic. It uses the
  /// ChargeRepository for data access operations.
  ///
  /// This service handles the complete charge flow including payment creation,
  /// authentication steps (PIN, OTP, phone verification, etc.), and status
  /// monitoring.
  ///
  /// Parameters:
  /// - [config]: PaystackConfig containing API keys and environment settings
  ///
  /// Returns:
  /// A ChargeService instance with injected repository dependency.
  ///
  /// Example:
  /// ```dart
  /// final config = PaystackConfig(
  ///   publicKey: 'pk_test_your_key',
  ///   secretKey: 'sk_test_your_key',
  /// );
  ///
  /// final chargeService = getIt<ChargeService>(param1: config);
  /// final result = await chargeService.createCharge(options);
  /// ```
  @factoryMethod
  ChargeService chargeService(
    @factoryParam PaystackConfig config,
  ) =>
      ChargeService(chargeRepository(config));

  /// Provides a PlanRepository instance for plan-related operations.
  ///
  /// The PlanRepository handles all plan-related API interactions
  /// including creating subscription plans, listing plans, fetching
  /// specific plans, and updating existing plans.
  ///
  /// This factory method automatically creates an HttpClient with the provided
  /// configuration and injects it into the repository, ensuring all network
  /// requests are properly configured.
  ///
  /// Parameters:
  /// - [config]: PaystackConfig containing API keys and environment settings
  ///
  /// Returns:
  /// A PlanRepository instance configured for the given environment.
  ///
  /// Example:
  /// ```dart
  /// final config = PaystackConfig(
  ///   publicKey: 'pk_test_your_key',
  ///   secretKey: 'sk_test_your_key',
  ///   environment: Environment.test,
  /// );
  ///
  /// final planRepo = getIt<PlanRepository>(param1: config);
  /// final result = await planRepo.create(options);
  /// ```
  @factoryMethod
  PlanRepository planRepository(
    @factoryParam PaystackConfig config,
  ) =>
      PlanRepository(provideHttpClient(config));

  /// Provides a PlanService instance for plan business logic.
  ///
  /// The PlanService provides high-level plan operations with proper
  /// validation, error handling, and business logic. It uses the
  /// PlanRepository for data access operations.
  ///
  /// This service handles subscription plan management including creation,
  /// listing, fetching, and updating plans in your application.
  ///
  /// Parameters:
  /// - [config]: PaystackConfig containing API keys and environment settings
  ///
  /// Returns:
  /// A PlanService instance with injected repository dependency.
  ///
  /// Example:
  /// ```dart
  /// final config = PaystackConfig(
  ///   publicKey: 'pk_test_your_key',
  ///   secretKey: 'sk_test_your_key',
  /// );
  ///
  /// final planService = getIt<PlanService>(param1: config);
  /// final result = await planService.create(options);
  /// ```
  @factoryMethod
  PlanService planService(
    @factoryParam PaystackConfig config,
  ) =>
      PlanService(planRepository(config));

  /// Provides a SubscriptionRepository instance for subscription-related operations.
  ///
  /// The SubscriptionRepository handles all subscription-related API interactions
  /// including creating subscriptions, listing subscriptions, fetching specific
  /// subscriptions, enabling/disabling subscriptions, and managing update links.
  ///
  /// This factory method automatically creates an HttpClient with the provided
  /// configuration and injects it into the repository, ensuring all network
  /// requests are properly configured.
  ///
  /// Parameters:
  /// - [config]: PaystackConfig containing API keys and environment settings
  ///
  /// Returns:
  /// A SubscriptionRepository instance configured for the given environment.
  ///
  /// Example:
  /// ```dart
  /// final config = PaystackConfig(
  ///   publicKey: 'pk_test_your_key',
  ///   secretKey: 'sk_test_your_key',
  ///   environment: Environment.test,
  /// );
  ///
  /// final subscriptionRepo = getIt<SubscriptionRepository>(param1: config);
  /// final result = await subscriptionRepo.create(options);
  /// ```
  @factoryMethod
  SubscriptionRepository subscriptionRepository(
    @factoryParam PaystackConfig config,
  ) =>
      SubscriptionRepository(provideHttpClient(config));

  /// Provides a SubscriptionService instance for subscription business logic.
  ///
  /// The SubscriptionService provides high-level subscription operations with proper
  /// validation, error handling, and business logic. It uses the
  /// SubscriptionRepository for data access operations.
  ///
  /// This service handles subscription lifecycle management including creation,
  /// listing, fetching, status management (enable/disable), and customer
  /// update link generation.
  ///
  /// Parameters:
  /// - [config]: PaystackConfig containing API keys and environment settings
  ///
  /// Returns:
  /// A SubscriptionService instance with injected repository dependency.
  ///
  /// Example:
  /// ```dart
  /// final config = PaystackConfig(
  ///   publicKey: 'pk_test_your_key',
  ///   secretKey: 'sk_test_your_key',
  /// );
  ///
  /// final subscriptionService = getIt<SubscriptionService>(param1: config);
  /// final result = await subscriptionService.create(options);
  /// ```
  @factoryMethod
  SubscriptionService subscriptionService(
    @factoryParam PaystackConfig config,
  ) =>
      SubscriptionService(subscriptionRepository(config));
}
