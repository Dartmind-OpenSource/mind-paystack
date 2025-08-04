import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:mind_paystack/src/core/di/injectable.config.dart';

final GetIt _getIt = GetIt.instance;

/// Configures dependencies for the application
@InjectableInit(
  preferRelativeImports: true,
  asExtension: false,
  throwOnMissingDependencies: true,
)
Future<GetIt> configureDependencies({
  String? environment,
}) async {
  return init(_getIt, environment: environment);
}

// void initializePaystack(PaystackConfig config) {
//   resolveWithParameter<HttpClient, PaystackConfig>(parameter: config);
//   resolveWithParameter<PaymentMethodRepository, PaystackConfig>(
//     parameter: config,
//   );
//   resolveWithParameter<PaymentMethodService, PaystackConfig>(
//     parameter: config,
//   );
// }

/// Resolves a dependency of type [T]
T resolve<T extends Object>() => _getIt<T>();

/// Resolves a dependency of type [T] with parameter of type [TP]
T resolveWithParameter<T extends Object, TP>({TP? parameter}) =>
    _getIt<T>(param1: parameter);

/// Configures dependencies for testing environment
GetIt configureTestDependencies() {
  _getIt.reset();
  configureDependencies(
    environment: Environment.test,
  );
  _getIt.allowReassignment = true;
  return _getIt;
}
