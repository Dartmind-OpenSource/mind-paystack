// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../../mind_paystack.dart' as _i10;
import '../../features/transaction/repositories/transaction_repository.dart'
    as _i954;
import '../network/http_client.dart' as _i1069;
import 'register_module.dart' as _i291;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.factoryParam<_i1069.HttpClient, _i10.PaystackConfig, dynamic>((
    config,
    _,
  ) =>
      registerModule.provideHttpClient(config));
  gh.factoryParam<_i954.TransactionRepository, _i10.PaystackConfig, dynamic>((
    config,
    _,
  ) =>
      registerModule.transactionRepository(config));
  return getIt;
}

class _$RegisterModule extends _i291.RegisterModule {}
