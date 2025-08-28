import 'package:mind_paystack/src/config/mind_paystack_config.dart';
import 'package:mind_paystack/src/core/di/injectable.dart';
import 'package:mind_paystack/src/core/errors/models/mind_exception.dart';
import 'package:mind_paystack/src/features/charge/services/charge_service.dart';
import 'package:mind_paystack/src/features/transaction/services/transaction_service.dart';

// Core exports
export 'package:mind_paystack/src/config/environment.dart';
export 'package:mind_paystack/src/config/log_level.dart';
export 'package:mind_paystack/src/config/mind_paystack_config.dart';
export 'package:mind_paystack/src/core/di/injectable.dart';
export 'package:mind_paystack/src/core/errors/models/mind_exception.dart';
export 'package:mind_paystack/src/core/models/models.dart';
// Charge exports
export 'package:mind_paystack/src/core/models/src/bank.dart';
export 'package:mind_paystack/src/core/models/src/bank_transfer.dart';
export 'package:mind_paystack/src/core/models/src/card.dart';
export 'package:mind_paystack/src/core/models/src/mobile_money.dart';
export 'package:mind_paystack/src/core/models/src/qr.dart';
export 'package:mind_paystack/src/core/models/src/ussd.dart';
export 'package:mind_paystack/src/features/charge/models/charge/charge.dart';
export 'package:mind_paystack/src/features/charge/models/options/src/charge_options.dart';
export 'package:mind_paystack/src/features/charge/models/options/src/check_pending_charge_options.dart';
export 'package:mind_paystack/src/features/charge/models/options/src/create_charge_options.dart';
export 'package:mind_paystack/src/features/charge/models/options/src/submit_charge_options.dart';
// Transaction exports
export 'package:mind_paystack/src/features/transaction/models/models.dart';

/// The main entry point for the MindPaystack SDK.
///
/// This class provides a singleton interface to access all Paystack services
/// including transactions, charges, and payment channels. It manages SDK
/// initialization, configuration, and dependency injection.
///
/// ## Basic Usage
///
/// ```dart
/// // Initialize the SDK
/// await MindPaystack.initialize(
///   PaystackConfig(
///     publicKey: 'pk_test_your_key',
///     secretKey: 'sk_test_your_key',
///   ),
/// );
///
/// // Access services
/// final sdk = MindPaystack.instance;
/// final transaction = await sdk.transaction.initialize(request);
/// ```
///
/// ## Alternative Initialization
///
/// ```dart
/// // From environment variables
/// final sdk = await MindPaystack.fromEnvironment();
///
/// // With custom configuration
/// final sdk = await MindPaystack.create(
///   config: PaystackConfig(
///     publicKey: 'pk_test_your_key',
///     secretKey: 'sk_test_your_key',
///     environment: Environment.test,
///   ),
/// );
/// ```
class MindPaystack {
  /// Private constructor for singleton pattern
  MindPaystack._(this._config);

  static MindPaystack? _instance;
  final PaystackConfig _config;
  bool _isInitialized = false;

  /// Gets the current SDK configuration
  ///
  /// Throws [MindException] if the SDK hasn't been initialized
  PaystackConfig get config => _config;

  /// Returns whether the SDK has been properly initialized
  bool get isInitialized => _isInitialized;

  /// Initializes the MindPaystack SDK with the provided configuration
  ///
  /// This method must be called before accessing any services. It sets up
  /// dependency injection and validates the configuration.
  ///
  /// [config] The configuration containing API keys and environment settings
  ///
  /// Throws [MindException] if initialization fails or configuration is invalid
  ///
  /// Example:
  /// ```dart
  /// await MindPaystack.initialize(
  ///   PaystackConfig(
  ///     publicKey: 'pk_test_your_key',
  ///     secretKey: 'sk_test_your_key',
  ///     environment: Environment.test,
  ///   ),
  /// );
  /// ```
  static Future<void> initialize(PaystackConfig config) async {
    if (_instance != null) {
      return;
    }

    _instance = MindPaystack._(config);

    try {
      await configureDependencies();
      _instance!._isInitialized = true;
    } catch (e) {
      if (e.toString().contains('already registered')) {
        _instance!._isInitialized = true;
      } else {
        _instance = null;
        rethrow;
      }
    }
  }

  /// Creates and initializes a new MindPaystack instance
  ///
  /// This is a convenience factory method that combines initialization
  /// and instance creation in a single call.
  ///
  /// [config] The configuration containing API keys and environment settings
  ///
  /// Returns the initialized MindPaystack instance
  ///
  /// Example:
  /// ```dart
  /// final sdk = await MindPaystack.create(
  ///   config: PaystackConfig(
  ///     publicKey: 'pk_test_your_key',
  ///     secretKey: 'sk_test_your_key',
  ///   ),
  /// );
  /// ```
  static Future<MindPaystack> create({required PaystackConfig config}) async {
    await initialize(config);
    return instance;
  }

  /// Creates and initializes MindPaystack from environment variables
  ///
  /// Looks for the following environment variables:
  /// - PAYSTACK_PUBLIC_KEY
  /// - PAYSTACK_SECRET_KEY
  /// - PAYSTACK_ENVIRONMENT (optional, defaults to 'test')
  /// - PAYSTACK_LOG_LEVEL (optional, defaults to 'info')
  ///
  /// Returns the initialized MindPaystack instance
  ///
  /// Throws [MindException] if required environment variables are missing
  ///
  /// Example:
  /// ```dart
  /// final sdk = await MindPaystack.fromEnvironment();
  /// ```
  static Future<MindPaystack> fromEnvironment() async {
    final config = PaystackConfig.fromEnvironment();
    await initialize(config);
    return instance;
  }

  /// Gets the singleton instance of MindPaystack
  ///
  /// Throws [MindException] if the SDK hasn't been initialized.
  /// Call [initialize], [create], or [fromEnvironment] first.
  ///
  /// Example:
  /// ```dart
  /// final sdk = MindPaystack.instance;
  /// final result = await sdk.transaction.initialize(request);
  /// ```
  static MindPaystack get instance {
    if (_instance == null) {
      throw const MindException(
        message: 'MindPaystack has not been initialized. '
            'Call MindPaystack.initialize() first.',
        code: 'not_initialized',
      );
    }
    return _instance!;
  }

  /// Resets the SDK instance
  ///
  /// This clears the singleton instance, allowing for reinitialization
  /// with different configuration. Mainly useful for testing.
  static void reset() {
    _instance = null;
  }

  /// Provides access to charge-related operations
  ///
  /// Handles direct charges, authentication flows (PIN, OTP, phone, birthday,
  /// address verification), and charge status monitoring. Use this for
  /// in-app payment flows where you manage the payment UI yourself.
  ///
  /// Throws [MindException] if the SDK is not properly initialized
  ///
  /// Example:
  /// ```dart
  /// // Create a charge
  /// final chargeResult = await MindPaystack.instance.charge
  ///     .createCharge(options);
  ///
  /// // Handle authentication if required
  /// if (chargeResult.data?.status == 'send_pin') {
  ///   final pinResult = await MindPaystack.instance.charge
  ///       .submitPin(pinOptions);
  /// }
  /// ```
  ChargeService get charge {
    _checkInitialized();
    return resolveWithParameter<ChargeService, PaystackConfig>(
      parameter: config,
    );
  }

  /// Provides access to transaction-related operations
  ///
  /// Handles transaction initialization, verification, and management.
  ///
  /// Example:
  /// ```dart
  /// final transaction = await MindPaystack.instance.transaction
  ///     .initialize(request);
  /// final verified = await MindPaystack.instance.transaction
  ///     .verify(reference);
  /// ```
  TransactionService get transaction {
    _checkInitialized();
    return resolveWithParameter<TransactionService, PaystackConfig>(
      parameter: config,
    );
  }

  /// Provides access to payment channel operations
  ///
  /// Handles retrieval and management of available payment methods.
  ///
  /// Example:
  /// ```dart
  /// final channels = await MindPaystack.instance.paymentChannel.getChannels();
  /// ```
  // PaymentChannelService get paymentChannel {
  //   _checkInitialized();
  //   return resolveWithParameter<PaymentChannelService, PaystackConfig>(
  //     parameter: config,
  //   );
  // }

  /// Validates that the SDK has been properly initialized
  ///
  /// Throws [MindException] if not initialized
  void _checkInitialized() {
    if (!_isInitialized) {
      throw const MindException(
        message: 'SDK is not initialized. '
            'Call MindPaystack.initialize() first.',
        code: 'not_initialized',
      );
    }
  }
}
