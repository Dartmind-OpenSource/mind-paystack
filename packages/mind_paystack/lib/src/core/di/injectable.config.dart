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
import '../../features/charge/repositories/charge_repository.dart' as _i79;
import '../../features/charge/services/charge_service.dart' as _i208;
import '../../features/payment_channels/repositories/payment_channel_repository.dart'
    as _i173;
import '../../features/payment_channels/services/payment_channel_service.dart'
    as _i775;
import '../../features/payment_methods/repositories/payment_method_repository.dart'
    as _i122;
import '../../features/payment_methods/services/payment_method_service.dart'
    as _i376;
import '../../features/transaction/repositories/transaction_repository.dart'
    as _i954;
import '../../features/transaction/services/transaction_service.dart' as _i894;
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
  gh.factoryParam<_i122.PaymentMethodRepository, _i10.PaystackConfig, dynamic>((
    config,
    _,
  ) =>
      registerModule.paymentMethodRepository(config));
  gh.factoryParam<_i79.ChargeRepository, _i10.PaystackConfig, dynamic>((
    config,
    _,
  ) =>
      registerModule.chargeRepository(config));
  gh.factoryParam<_i954.TransactionRepository, _i10.PaystackConfig, dynamic>((
    config,
    _,
  ) =>
      registerModule.transactionRepository(config));
  gh.factoryParam<_i173.PaymentChannelRepository, _i10.PaystackConfig, dynamic>(
      (
    config,
    _,
  ) =>
          registerModule.paymentChannelRepository(config));
  gh.factoryParam<_i376.PaymentMethodService, _i10.PaystackConfig, dynamic>((
    config,
    _,
  ) =>
      registerModule.paymentMethodService(config));
  gh.factoryParam<_i894.TransactionService, _i10.PaystackConfig, dynamic>((
    config,
    _,
  ) =>
      registerModule.transactionService(config));
  gh.factoryParam<_i208.ChargeService, _i10.PaystackConfig, dynamic>((
    config,
    _,
  ) =>
      registerModule.chargeService(config));
  gh.factoryParam<_i775.PaymentChannelService, _i10.PaystackConfig, dynamic>((
    config,
    _,
  ) =>
      registerModule.paymentChannelService(config));
  return getIt;
}

class _$RegisterModule extends _i291.RegisterModule {}
