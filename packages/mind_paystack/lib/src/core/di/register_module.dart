import 'package:injectable/injectable.dart';
import 'package:mind_paystack/mind_paystack.dart';
import 'package:mind_paystack/src/core/network/http_client.dart';
import 'package:mind_paystack/src/features/transaction/repositories/transaction_repository.dart';

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
}
