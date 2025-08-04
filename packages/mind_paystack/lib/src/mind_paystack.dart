import 'package:mind_paystack/src/config/mind_paystack_config.dart';
import 'package:mind_paystack/src/core/di/injectable.dart';
import 'package:mind_paystack/src/core/errors/models/mind_exception.dart';
import 'package:mind_paystack/src/features/charge/services/charge_service.dart';
import 'package:mind_paystack/src/features/payment_channels/services/payment_channel_service.dart';
import 'package:mind_paystack/src/features/payment_methods/services/payment_method_service.dart';
import 'package:mind_paystack/src/features/transaction/services/transaction_service.dart';

export 'package:mind_paystack/src/config/mind_paystack_config.dart';
export 'package:mind_paystack/src/core/di/injectable.dart';
export 'package:mind_paystack/src/core/errors/models/mind_exception.dart';

/// Main class for interacting with the MindPaystack SDK
class MindPaystack {
  /// Creates a new instance of MindPaystack with the provided configuration
  MindPaystack._(this._config);

  static MindPaystack? _instance;

  final PaystackConfig _config;
  bool _isInitialized = false;

  /// Current configuration
  PaystackConfig get config => _config;

  /// Whether the SDK has been initialized
  bool get isInitialized => _isInitialized;

  static Future<void> init(PaystackConfig config) async {
    if (_instance != null) {
      // Instance already exists, just update config if needed
      return;
    }

    _instance = MindPaystack._(config);

    try {
      await configureDependencies();
      _instance!._isInitialized = true;
    } catch (e) {
      if (e.toString().contains('already registered')) {
        // Dependencies already registered, we can consider this initialized
        _instance!._isInitialized = true;
        print(
          'Dependencies already registered, continuing with existing configuration',
        );
      } else {
        // Unexpected error, rethrow
        rethrow;
      }
    }
  }

  static MindPaystack get instance {
    if (_instance == null) {
      throw MindException(
        message: 'MindPaystack has not been initialized',
        code: 'not_initialized',
      );
    }
    return _instance!;
  }

  /// Initialize the SDK with configuration
  ///
  /// This must be called before using any SDK features
  ///
  /// Example:
  /// ```dart
  /// final paystack = MindPaystack(
  ///   PaystackConfig(
  ///     publicKey: 'pk_test_...',
  ///     secretKey: 'sk_test_...',
  ///     environment: Environment.test,
  ///   ),
  /// );
  ///
  /// await paystack.initialize();
  /// ```
  // Future<void> initialize() async {
  //   if (_isInitialized) {
  //     throw const MindException(
  //       message: 'SDK is already initialized',
  //       code: 'already_initialized',
  //     );
  //   }
  //   await configureDependencies();
  //   _isInitialized = true;
  // }

  /// Get the transaction service instance
  // ITransactionService get transactions {
  //   _checkInitialized();
  //   return getIt<ITransactionService>();
  // }

  /// Get the customer service instance
  // ICustomerService get customers {
  //   _checkInitialized();
  //   return getIt<ICustomerService>();
  // }

  /// Get the payment methods service instance
  PaymentMethodService get paymentMethods {
    _checkInitialized();
    return resolveWithParameter<PaymentMethodService, PaystackConfig>(
      parameter: config,
    );
  }

  ChargeService get charge {
    _checkInitialized();
    return resolveWithParameter<ChargeService, PaystackConfig>(
      parameter: config,
    );
  }

  TransactionService get transaction {
    // _checkInitialized();
    return resolveWithParameter<TransactionService, PaystackConfig>(
      parameter: config,
    );
  }

  PaymentChannelService get paymentChannel {
    // _checkInitialized();
    return resolveWithParameter<PaymentChannelService, PaystackConfig>(
      parameter: config,
    );
  }

  void _checkInitialized() {
    if (!_isInitialized) {
      throw const MindException(
        message: 'SDK is not initialized. Call initialize() first.',
        code: 'not_initialized',
      );
    }
  }
}
