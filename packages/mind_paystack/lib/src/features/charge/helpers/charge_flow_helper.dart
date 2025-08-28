import 'dart:async';
import 'package:mind_paystack/src/core/errors/models/mind_exception.dart';
import 'package:mind_paystack/src/core/models/resource.dart';
import 'package:mind_paystack/src/features/charge/models/charge/charge.dart';
import 'package:mind_paystack/src/features/charge/models/options/src/create_charge_options.dart';
import 'package:mind_paystack/src/features/charge/models/options/src/submit_charge_options.dart';
import 'package:mind_paystack/src/features/charge/services/charge_service.dart';
import 'package:mind_paystack/src/features/charge/utils/charge_utils.dart';

/// Callback function for authentication data collection.
///
/// This function is called when the charge flow requires additional
/// authentication data from the user. The implementation should
/// collect the required data and return it.
///
/// Parameters:
/// - [type]: The type of authentication required ('pin', 'otp', etc.)
/// - [charge]: The current charge data for context
/// - [attempt]: The number of attempts made (starts at 1)
///
/// Returns:
/// A Future that resolves with the collected authentication data,
/// or null to cancel the authentication flow.
typedef AuthenticationCallback = Future<String?> Function(
  String type,
  ChargeData charge,
  int attempt,
);

/// Callback function for charge status updates.
///
/// This function is called whenever the charge status changes during
/// the flow processing. Use this to update UI, log progress, or
/// provide user feedback.
///
/// Parameters:
/// - [charge]: The updated charge data
/// - [previous]: The previous charge state (null for initial status)
typedef StatusUpdateCallback = void Function(
  ChargeData charge,
  ChargeData? previous,
);

/// Configuration options for charge flow processing.
///
/// This class encapsulates various settings that control how the
/// charge flow behaves, including timeouts, retry policies, and
/// callback configurations.
class ChargeFlowConfig {
  /// Creates a new charge flow configuration.
  ///
  /// Parameters:
  /// - [maxAuthenticationAttempts]: Maximum number of authentication attempts (default: 3)
  /// - [authenticationTimeout]: Time to wait for each authentication (default: 5 minutes)
  /// - [pollInterval]: Interval between status checks for async payments (default: 10 seconds)
  /// - [maxPollDuration]: Maximum time to poll async payments (default: 10 minutes)
  /// - [autoRetryTransientErrors]: Whether to retry transient errors (default: true)
  /// - [maxRetryAttempts]: Maximum number of retry attempts (default: 2)
  const ChargeFlowConfig({
    this.maxAuthenticationAttempts = 3,
    this.authenticationTimeout = const Duration(minutes: 5),
    this.pollInterval = const Duration(seconds: 10),
    this.maxPollDuration = const Duration(minutes: 10),
    this.autoRetryTransientErrors = true,
    this.maxRetryAttempts = 2,
  });

  /// Maximum number of authentication attempts allowed.
  final int maxAuthenticationAttempts;

  /// Timeout for each authentication step.
  final Duration authenticationTimeout;

  /// Interval between status polls for async payments.
  final Duration pollInterval;

  /// Maximum duration to poll for async payment completion.
  final Duration maxPollDuration;

  /// Whether to automatically retry transient network errors.
  final bool autoRetryTransientErrors;

  /// Maximum number of retry attempts for failed requests.
  final int maxRetryAttempts;
}

/// Result of a complete charge flow execution.
///
/// Contains the final charge state and metadata about the flow execution.
class ChargeFlowResult {
  /// Creates a new charge flow result.
  const ChargeFlowResult({
    required this.charge,
    required this.isSuccess,
    required this.authenticationAttempts,
    required this.totalDuration,
    this.error,
    this.cancellationReason,
  });

  /// The final charge data.
  final ChargeData charge;

  /// Whether the charge flow completed successfully.
  final bool isSuccess;

  /// Number of authentication attempts made.
  final int authenticationAttempts;

  /// Total time taken for the flow.
  final Duration totalDuration;

  /// Error that caused the flow to fail (if any).
  final Exception? error;

  /// Reason for flow cancellation (if cancelled).
  final String? cancellationReason;

  /// Whether the flow was cancelled by the user or system.
  bool get wasCancelled => cancellationReason != null;

  /// Whether the flow failed due to an error.
  bool get hasError => error != null;
}

/// High-level helper for managing complete charge flows.
///
/// This class provides convenient methods for handling the entire charge
/// lifecycle, from initial charge creation through authentication and
/// final status resolution. It abstracts away the complexity of managing
/// multiple API calls, authentication flows, and status polling.
///
/// Key features:
/// - Automatic authentication flow management
/// - Smart retry logic for transient failures
/// - Configurable timeouts and polling intervals
/// - Comprehensive callback system for UI updates
/// - Support for all payment methods and authentication types
///
/// Example usage:
/// ```dart
/// final flowHelper = ChargeFlowHelper(chargeService);
///
/// final result = await flowHelper.processCompleteFlow(
///   options: CreateChargeOptions(
///     email: 'customer@example.com',
///     amount: '50000',
///     authorizationCode: 'AUTH_abc123',
///   ),
///   onAuthentication: (type, charge, attempt) async {
///     switch (type) {
///       case 'pin':
///         return await showPinDialog();
///       case 'otp':
///         return await showOtpDialog();
///       default:
///         return null;
///     }
///   },
///   onStatusUpdate: (charge, previous) {
///     updateUI(charge);
///   },
/// );
///
/// if (result.isSuccess) {
///   print('Payment completed: ${result.charge.reference}');
/// }
/// ```
class ChargeFlowHelper {
  /// Creates a new charge flow helper.
  ///
  /// Parameters:
  /// - [_chargeService]: The charge service for API operations
  /// - [_config]: Optional configuration for flow behavior
  ChargeFlowHelper(
    this._chargeService, {
    ChargeFlowConfig? config,
  })  : _config = config ?? const ChargeFlowConfig(),
        _utils = ChargeUtils(_chargeService);

  /// The charge service used for API operations.
  final ChargeService _chargeService;

  /// Configuration settings for the flow.
  final ChargeFlowConfig _config;

  /// Utility functions for charge operations.
  final ChargeUtils _utils;

  /// Processes a complete charge flow from creation to completion.
  ///
  /// This method handles the entire charge lifecycle:
  /// 1. Creates the initial charge
  /// 2. Handles any required authentication steps
  /// 3. Polls for completion of async payment methods
  /// 4. Returns the final result with metadata
  ///
  /// The method automatically handles common scenarios like PIN/OTP
  /// requirements, phone verification, and address collection through
  /// the provided callback functions.
  ///
  /// Parameters:
  /// - [options]: The charge creation options
  /// - [onAuthentication]: Callback to collect authentication data
  /// - [onStatusUpdate]: Optional callback for status updates
  ///
  /// Returns:
  /// A Future that resolves with the complete flow result
  ///
  /// Example:
  /// ```dart
  /// final result = await flowHelper.processCompleteFlow(
  ///   options: CreateChargeOptions.forSavedCard(
  ///     email: 'customer@example.com',
  ///     amount: '50000',
  ///     authorizationCode: 'AUTH_abc123',
  ///   ),
  ///   onAuthentication: (type, charge, attempt) async {
  ///     return await collectAuthenticationData(type, attempt);
  ///   },
  ///   onStatusUpdate: (charge, previous) {
  ///     logStatusChange(charge.status);
  ///   },
  /// );
  /// ```
  Future<ChargeFlowResult> processCompleteFlow({
    required CreateChargeOptions options,
    required AuthenticationCallback onAuthentication,
    StatusUpdateCallback? onStatusUpdate,
  }) async {
    final startTime = DateTime.now();
    var authenticationAttempts = 0;
    ChargeData? previousCharge;

    try {
      // Step 1: Create initial charge
      var result = await _createChargeWithRetry(options);
      if (!result.isSuccess) {
        throw MindException(
          message: 'Failed to create charge: ${result.message}',
          code: 'charge_creation_failed',
        );
      }

      var charge = result.data!;
      onStatusUpdate?.call(charge, previousCharge);
      previousCharge = charge;

      // Step 2: Handle authentication flow
      while (_utils.requiresAuthentication(charge)) {
        authenticationAttempts++;

        if (authenticationAttempts > _config.maxAuthenticationAttempts) {
          return ChargeFlowResult(
            charge: charge,
            isSuccess: false,
            authenticationAttempts: authenticationAttempts,
            totalDuration: DateTime.now().difference(startTime),
            cancellationReason: 'Maximum authentication attempts exceeded',
          );
        }

        final authType = _utils.getAuthenticationType(charge);
        if (authType == null) break;

        // Collect authentication data with timeout
        final authData = await _collectAuthenticationWithTimeout(
          authType,
          charge,
          authenticationAttempts,
          onAuthentication,
        );

        if (authData == null) {
          return ChargeFlowResult(
            charge: charge,
            isSuccess: false,
            authenticationAttempts: authenticationAttempts,
            totalDuration: DateTime.now().difference(startTime),
            cancellationReason: 'Authentication cancelled by user',
          );
        }

        // Submit authentication data
        result = await _submitAuthenticationWithRetry(
          charge.reference,
          authType,
          authData,
        );

        if (!result.isSuccess) {
          throw MindException(
            message: 'Authentication failed: ${result.message}',
            code: 'authentication_failed',
          );
        }

        charge = result.data!;
        onStatusUpdate?.call(charge, previousCharge);
        previousCharge = charge;
      }

      // Step 3: Handle async payments (polling)
      if (_shouldPoll(charge.status)) {
        charge = await _utils.pollChargeUntilComplete(
          charge.reference,
          pollInterval: _config.pollInterval,
          maxWaitTime: _config.maxPollDuration,
          onStatusChange: (updatedCharge) {
            onStatusUpdate?.call(updatedCharge, previousCharge);
            previousCharge = updatedCharge;
          },
        );
      }

      // Step 4: Return final result
      return ChargeFlowResult(
        charge: charge,
        isSuccess: _utils.isSuccessful(charge),
        authenticationAttempts: authenticationAttempts,
        totalDuration: DateTime.now().difference(startTime),
      );
    } catch (e) {
      return ChargeFlowResult(
        charge: previousCharge ??
            ChargeData(
              reference: options.reference ?? 'unknown',
              amount: int.tryParse(options.amount) ?? 0,
              currency: 'NGN',
              status: 'failed',
              gatewayResponse: 'Flow processing failed',
            ),
        isSuccess: false,
        authenticationAttempts: authenticationAttempts,
        totalDuration: DateTime.now().difference(startTime),
        error: e is Exception ? e : Exception(e.toString()),
      );
    }
  }

  /// Processes a simplified charge flow for payment methods that typically don't require authentication.
  ///
  /// This method is optimized for payment methods like saved cards that
  /// usually complete without additional user interaction. It still handles
  /// authentication if required, but with shorter timeouts and fewer retries.
  ///
  /// Parameters:
  /// - [options]: The charge creation options
  /// - [onAuthentication]: Optional callback for unexpected authentication
  ///
  /// Returns:
  /// A Future that resolves with the charge result
  ///
  /// Example:
  /// ```dart
  /// final result = await flowHelper.processSimpleFlow(
  ///   CreateChargeOptions.forSavedCard(
  ///     email: 'customer@example.com',
  ///     amount: '50000',
  ///     authorizationCode: 'AUTH_abc123',
  ///   ),
  /// );
  /// ```
  Future<ChargeFlowResult> processSimpleFlow(
    CreateChargeOptions options, {
    AuthenticationCallback? onAuthentication,
  }) async {
    const config = ChargeFlowConfig(
      maxAuthenticationAttempts: 1,
      authenticationTimeout: const Duration(minutes: 2),
      pollInterval: const Duration(seconds: 5),
      maxPollDuration: const Duration(minutes: 3),
    );

    final helper = ChargeFlowHelper(_chargeService, config: config);

    return await helper.processCompleteFlow(
      options: options,
      onAuthentication:
          onAuthentication ?? (type, charge, attempt) async => null,
    );
  }

  /// Creates a charge with automatic retry on transient failures.
  Future<Resource<ChargeData>> _createChargeWithRetry(
    CreateChargeOptions options,
  ) async {
    var attempts = 0;

    while (attempts <= _config.maxRetryAttempts) {
      try {
        return await _chargeService.createCharge(options);
      } catch (e) {
        attempts++;

        if (attempts > _config.maxRetryAttempts ||
            !_config.autoRetryTransientErrors ||
            !_isTransientError(e)) {
          rethrow;
        }

        // Wait before retry with exponential backoff
        final delay = Duration(milliseconds: 1000 * (1 << (attempts - 1)));
        await Future.delayed(delay);
      }
    }

    throw StateError('Retry logic error - should not reach here');
  }

  /// Submits authentication data with automatic retry.
  Future<Resource<ChargeData>> _submitAuthenticationWithRetry(
    String reference,
    String authType,
    String authData,
  ) async {
    var attempts = 0;

    while (attempts <= _config.maxRetryAttempts) {
      try {
        switch (authType) {
          case 'pin':
            return await _chargeService.submitPin(
              SubmitPinOptions(reference: reference, pin: authData),
            );
          case 'otp':
            return await _chargeService.submitOtp(
              SubmitOtpOptions(reference: reference, otp: authData),
            );
          case 'phone':
            return await _chargeService.submitPhone(
              SubmitPhoneOptions(reference: reference, phone: authData),
            );
          case 'birthday':
            return await _chargeService.submitBirthday(
              SubmitBirthdayOptions(reference: reference, birthday: authData),
            );
          case 'address':
            // For address, authData should be JSON string with address parts
            final parts = _parseAddressData(authData);
            return await _chargeService.submitAddress(
              SubmitAddressOptions(
                reference: reference,
                address: parts['address'] ?? '',
                city: parts['city'] ?? '',
                state: parts['state'] ?? '',
                zipcode: parts['zipcode'] ?? '',
              ),
            );
          default:
            throw MindException(
              message: 'Unknown authentication type: $authType',
              code: 'unknown_auth_type',
            );
        }
      } catch (e) {
        attempts++;

        if (attempts > _config.maxRetryAttempts ||
            !_config.autoRetryTransientErrors ||
            !_isTransientError(e)) {
          rethrow;
        }

        // Wait before retry
        final delay = Duration(milliseconds: 1000 * (1 << (attempts - 1)));
        await Future.delayed(delay);
      }
    }

    throw StateError('Retry logic error - should not reach here');
  }

  /// Collects authentication data with timeout handling.
  Future<String?> _collectAuthenticationWithTimeout(
    String authType,
    ChargeData charge,
    int attempt,
    AuthenticationCallback callback,
  ) async {
    try {
      return await callback(authType, charge, attempt)
          .timeout(_config.authenticationTimeout);
    } on TimeoutException {
      return null;
    }
  }

  /// Determines if a charge status should be polled.
  bool _shouldPoll(String status) {
    return [
      'pending',
      'ongoing',
      'processing',
    ].contains(status.toLowerCase());
  }

  /// Checks if an error is transient and should be retried.
  bool _isTransientError(dynamic error) {
    if (error is MindException) {
      // Network errors and some server errors are transient
      return error.code?.contains('network') == true ||
          error.code?.contains('timeout') == true ||
          error.code?.contains('server') == true;
    }

    // Consider other network-related errors as transient
    return error.toString().toLowerCase().contains('network') ||
        error.toString().toLowerCase().contains('timeout') ||
        error.toString().toLowerCase().contains('connection');
  }

  /// Parses address data from string format.
  Map<String, String> _parseAddressData(String addressData) {
    try {
      // Expected format: "address|city|state|zipcode"
      final parts = addressData.split('|');
      return {
        'address': parts.isNotEmpty ? parts[0] : '',
        'city': parts.length > 1 ? parts[1] : '',
        'state': parts.length > 2 ? parts[2] : '',
        'zipcode': parts.length > 3 ? parts[3] : '',
      };
    } catch (e) {
      // Return empty map if parsing fails
      return {
        'address': addressData,
        'city': '',
        'state': '',
        'zipcode': '',
      };
    }
  }
}
