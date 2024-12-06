import 'package:mind_paystack/src/config/environment.dart';
import 'package:mind_paystack/src/config/log_level.dart';
import 'package:mind_paystack/src/config/mind_paystack_config.dart';
import 'package:mind_paystack/src/config/retry_policy.dart';
import 'package:mind_paystack/src/core/exceptions.dart';
import 'package:mind_paystack/src/di/injection.dart';
import 'package:mind_paystack/src/ui/theme.dart';

/// {@template mind_paystack}
/// My new Flutter package
/// {@endtemplate}
///
void main() {
  MindPaystack.initialize(
    publicKey: '',
    logLevel: LogLevel.debug,
  );
}

class MindPaystack {
  static late MindPaystack instance;
  final MindPaystackConfig _config;
  final PaymentService _paymentService;

  MindPaystack._({
    required MindPaystackConfig config,
    required PaymentService paymentService,
  })  : _config = config,
        _paymentService = paymentService;

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
      retryPolicy: retryPolicy ?? RetryPolicy(),
    );

    await initializeDependencies();

    instance = MindPaystack._(
      config: config,
      paymentService: getIt<PaymentService>(),
    );
  }

  static Future<Payment> createPayment({
    required int amount,
    required String email,
    String? reference,
    Map<String, dynamic>? metadata,
  }) async {
    _ensureInitialized();
    return instance._paymentService.createPayment(
      amount: amount,
      email: email,
      reference: reference,
      metadata: metadata,
    );
  }

  static Future<Transaction> verifyTransaction(String reference) async {
    _ensureInitialized();
    return instance._paymentService.verifyTransaction(reference);
  }

  static Future<List<Transaction>> listTransactions({
    DateTime? from,
    DateTime? to,
    int? limit,
  }) async {
    _ensureInitialized();
    return instance._paymentService.listTransactions(
      from: from,
      to: to,
      limit: limit,
    );
  }

  static Future<Customer> createCustomer({
    required String email,
    String? firstName,
    String? lastName,
    String? phone,
  }) async {
    _ensureInitialized();
    return instance._paymentService.createCustomer(
      email: email,
      firstName: firstName,
      lastName: lastName,
      phone: phone,
    );
  }

  void configure({
    String? currency,
    String? locale,
    MPTheme? theme,
  }) {
    if (currency != null) _config.currency = currency;
    if (locale != null) _config.locale = locale;
    if (theme != null) _config.theme = theme;
  }

  void setLogger(void Function(LogLevel, String) logger) {
    _config.logger = logger;
  }

  static void _ensureInitialized() {
    if (instance == null) {
      throw PaystackException(
        message:
            'MindPaystack not initialized. Call MindPaystack.initialize() first.',
        code: 'not_initialized',
      );
    }
  }

  static Future<void> dispose() async {
    await getIt.reset();
  }

  // Test helpers
  static Future<void> enableTestMode() async {
    _ensureInitialized();
    instance._config.environment = Environment.test;
  }

  static Future<void> mockServices() async {
    await getIt.reset();
    MockPaymentService.registerMocks();
  }
}

class PaymentService {
  Future<List<dynamic>> listTransactions(
      {DateTime? from, DateTime? to, int? limit}) async {
    return [];
  }
}

// user story
// MindPaystack needs to be initialized before any operation can be performed.
// - Initialize MindPaystack with public key, environment, log level, base url and retry policy.
// - Implement http client with dio to make requests to the Paystack
//   API(To be handled by Czar).
// - Create and implement a  each service to handle operations like card
//   payment, charge service, bank payment, transaction service etc. each services
//   should take in the abstract http client and retry policy.
// - Create repositories to handle data storage and retrieval of charge, transaction, payment.
// - Create and implement MindPaystack class to handle all operations like
//   authorization, charge, card payment, bank payment, transaction etc.
// - Create a retry interceptor to handle retry logic for failed requests.
// - Create a payment with amount, email, reference, and metadata.
