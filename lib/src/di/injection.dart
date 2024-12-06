// lib/src/di/injection.dart
import 'package:get_it/get_it.dart';
import 'package:mind_paystack/src/config/mind_paystack_config.dart';
import 'package:mind_paystack/src/core/client.dart';
import 'package:mind_paystack/src/core/client_impl.dart';
import 'package:mind_paystack/src/interfaces/services/authentication_service.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  // Core
  getIt.registerSingleton<MindPaystackConfig>(
    MindPaystackConfig.fromEnvironment(),
  );

  /// HTTP Client
  getIt.registerSingleton<MindPaystackClient>(
    MindPaystackClientImpl(config: getIt()),
  );

  // Services
  getIt.registerFactory<IAuthenticationService>(
    () => AuthenticationService(client: getIt(), repository: getIt()),
  );

  // getIt.registerFactory<ITransactionService>(
  //   () => TransactionService(
  //     client: getIt(),
  //     repository: getIt(),
  //   ),
  // );

  // // Repositories
  // getIt.registerLazySingleton<ITransactionRepository>(
  //   () => TransactionRepository(
  //     localDataSource: getIt(),
  //     remoteDataSource: getIt(),
  //   ),
  // );

  // getIt.registerLazySingleton<ICustomerRepository>(
  //   () => CustomerRepository(
  //     localDataSource: getIt(),
  //     remoteDataSource: getIt(),
  //   ),
  // );

  // Payment Methods
  // getIt.registerFactory<ICardPayment>(
  //   () => CardPaymentService(
  //     client: getIt(),
  //     authService: getIt(),
  //   ),
  // );
}
