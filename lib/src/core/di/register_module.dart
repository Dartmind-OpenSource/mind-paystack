import 'package:injectable/injectable.dart';
import 'package:mind_paystack/mind_paystack.dart';
import 'package:mind_paystack/src/core/network/http_client.dart';
import 'package:mind_paystack/src/features/charge/repositories/charge_repository.dart';
import 'package:mind_paystack/src/features/charge/services/charge_service.dart';
import 'package:mind_paystack/src/features/payment_methods/repositories/payment_method_repository.dart';
import 'package:mind_paystack/src/features/payment_methods/services/payment_method_service.dart';
import 'package:mind_paystack/src/features/transaction/repositories/transaction_repository.dart';
import 'package:mind_paystack/src/features/transaction/services/transaction_service.dart';

/// Module for registering dependencies and configurations
@module
abstract class RegisterModule {
  @injectable
  HttpClient provideHttpClient(@factoryParam PaystackConfig config) =>
      HttpClient(config);

  @factoryMethod
  PaymentMethodRepository paymentMethodRepository(
    @factoryParam PaystackConfig config,
  ) =>
      PaymentMethodRepository(provideHttpClient(config));

  @factoryMethod
  ChargeRepository chargeRepository(
    @factoryParam PaystackConfig config,
  ) =>
      ChargeRepository(provideHttpClient(config));

  @factoryMethod
  TransactionRepository transactionRepository(
    @factoryParam PaystackConfig config,
  ) =>
      TransactionRepository(provideHttpClient(config));

  @factoryMethod
  PaymentMethodService paymentMethodService(
    @factoryParam PaystackConfig config,
  ) =>
      PaymentMethodService(paymentMethodRepository(config));

  @factoryMethod
  TransactionService transactionService(
    @factoryParam PaystackConfig config,
  ) =>
      TransactionService(transactionRepository(config));

  @factoryMethod
  ChargeService chargeService(
    @factoryParam PaystackConfig config,
  ) =>
      ChargeService(chargeRepository(config));
}
