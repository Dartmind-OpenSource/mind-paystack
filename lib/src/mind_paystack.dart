import 'package:mind_paystack/src/client/mind_paystack_client_impl.dart';
import 'package:mind_paystack/src/config/environment.dart';
import 'package:mind_paystack/src/config/log_level.dart';
import 'package:mind_paystack/src/config/mind_paystack_config.dart';
import 'package:mind_paystack/src/config/retry_policy.dart';
import 'package:mind_paystack/src/model/payment_model.dart';
import 'package:mind_paystack/src/services/charge_api_service.dart';

class MindPaystack {
  // Private constructor with required parameters
  MindPaystack._({
    required MindPaystackConfig config,
  }) : _config = config;

  // Factory constructor that returns the static instance
  factory MindPaystack() {
    return instance;
  }

  // Static instance declaration
  static late MindPaystack instance;

  // Private fields
  final MindPaystackConfig _config;
  late final ChargeApiService _chargeApiService;

  // Initialize services
  void _initializeServices() {
    // final client = MindPaystackClientImpl(config: _config);
    _chargeApiService = ChargeApiService(config: _config);
  }

  // Static initialization method
  static Future<void> initialize({
    required String publicKey,
    Environment environment = Environment.test,
    LogLevel logLevel = LogLevel.info,
    RetryPolicy? retryPolicy,
  }) async {
    final config = MindPaystackConfig(
      publicKey: publicKey,
      environment: environment,
      logLevel: logLevel,
      retryPolicy: retryPolicy ?? const RetryPolicy(),
    );

    instance = MindPaystack._(config: config);
    instance._initializeServices();
  }

  // Charge using a card
  Future<Map<String, dynamic>> chargeCard({
    required CardPaymentRequest chargeDetails,
  }) async {
    return await _chargeApiService.chargeCard(chargeDetails: chargeDetails);
  }

  // Charge using a bank
  Future<Map<String, dynamic>> chargeBank({
    required BankPaymentRequest bankDetails,
  }) async {
    return await _chargeApiService.chargeBank(bankDetails: bankDetails);
  }

  // Dispose resources if needed
  void dispose() {
    _chargeApiService.dispose();
  }
}
