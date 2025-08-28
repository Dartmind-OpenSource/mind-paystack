import 'dart:async';
import 'package:mind_paystack/src/core/errors/models/mind_exception.dart';
import 'package:mind_paystack/src/core/models/resource.dart';
import 'package:mind_paystack/src/features/charge/models/charge/charge.dart';
import 'package:mind_paystack/src/features/charge/models/options/src/check_pending_charge_options.dart';
import 'package:mind_paystack/src/features/charge/services/charge_service.dart';

/// Utility functions and helpers for charge processing operations.
///
/// This class provides convenient methods for handling complex charge flows,
/// polling charge status, and managing authentication sequences. It simplifies
/// common charge operations that would otherwise require multiple API calls
/// and complex state management.
///
/// Key features:
/// - Automatic charge polling for asynchronous payment methods
/// - Smart authentication flow handling
/// - Charge validation and verification utilities
/// - Status monitoring with customizable intervals
///
/// Example usage:
/// ```dart
/// final utils = ChargeUtils(chargeService);
/// 
/// // Poll a charge until completion
/// final finalCharge = await utils.pollChargeUntilComplete(
///   'TXN_123456789',
///   maxWaitTime: Duration(minutes: 5),
/// );
/// 
/// // Check if charge requires authentication
/// final needsAuth = utils.requiresAuthentication(charge);
/// ```
class ChargeUtils {
  /// Creates a new ChargeUtils instance.
  ///
  /// Parameters:
  /// - [_chargeService]: The charge service instance for API operations
  const ChargeUtils(this._chargeService);

  /// The charge service used for API operations.
  final ChargeService _chargeService;

  /// Polls a charge status until it reaches a final state (success, failed, or abandoned).
  ///
  /// This method is particularly useful for payment methods that process
  /// asynchronously, such as bank transfers, USSD, or mobile money payments
  /// where the customer completes the payment outside your application.
  ///
  /// The polling continues until the charge reaches a final state or the
  /// maximum wait time is exceeded. Use this to automatically monitor
  /// pending charges without manual intervention.
  ///
  /// Parameters:
  /// - [reference]: The transaction reference to monitor
  /// - [pollInterval]: Time between status checks (default: 10 seconds)
  /// - [maxWaitTime]: Maximum time to wait before giving up (default: 10 minutes)
  /// - [onStatusChange]: Optional callback for status updates
  ///
  /// Returns:
  /// A Future that resolves with the final charge data when complete,
  /// or throws a TimeoutException if maxWaitTime is exceeded.
  ///
  /// Example:
  /// ```dart
  /// try {
  ///   final finalCharge = await chargeUtils.pollChargeUntilComplete(
  ///     'TXN_123456789',
  ///     maxWaitTime: Duration(minutes: 5),
  ///     onStatusChange: (charge) {
  ///       print('Status update: ${charge.status}');
  ///     },
  ///   );
  ///   
  ///   if (finalCharge.status == 'success') {
  ///     print('Payment completed successfully!');
  ///   } else {
  ///     print('Payment failed: ${finalCharge.gatewayResponse}');
  ///   }
  /// } on TimeoutException {
  ///   print('Payment is taking too long - check status manually');
  /// }
  /// ```
  Future<ChargeData> pollChargeUntilComplete(
    String reference, {
    Duration pollInterval = const Duration(seconds: 10),
    Duration maxWaitTime = const Duration(minutes: 10),
    void Function(ChargeData)? onStatusChange,
  }) async {
    final startTime = DateTime.now();
    ChargeData? lastCharge;

    while (DateTime.now().difference(startTime) < maxWaitTime) {
      try {
        final result = await _chargeService.checkPendingCharge(
          CheckPendingChargeOptions(reference: reference),
        );

        if (!result.isSuccess) {
          throw MindException(
            message: 'Failed to check charge status: ${result.message}',
            code: 'status_check_error',
          );
        }

        final charge = result.data!;
        
        // Call status change callback if provided and status changed
        if (onStatusChange != null && 
            (lastCharge == null || lastCharge.status != charge.status)) {
          onStatusChange(charge);
        }
        
        lastCharge = charge;

        // Check if charge has reached a final state
        if (isFinalState(charge.status)) {
          return charge;
        }

        // Wait before next poll
        await Future.delayed(pollInterval);
      } catch (e) {
        // Re-throw MindExceptions, wrap others
        if (e is MindException) rethrow;
        throw MindException(
          message: 'Error polling charge status: $e',
          code: 'polling_error',
          technicalMessage: e.toString(),
        );
      }
    }

    throw TimeoutException(
      'Charge polling timed out after ${maxWaitTime.inMinutes} minutes',
      maxWaitTime,
    );
  }

  /// Checks if a charge status represents a final state.
  ///
  /// Final states are those where no further processing is expected:
  /// - 'success': Payment completed successfully
  /// - 'failed': Payment failed permanently
  /// - 'abandoned': Payment was abandoned by customer
  /// - 'cancelled': Payment was cancelled
  ///
  /// Parameters:
  /// - [status]: The charge status to check
  ///
  /// Returns:
  /// true if the status is final, false if more processing is expected
  ///
  /// Example:
  /// ```dart
  /// final isFinal = chargeUtils.isFinalState('success'); // true
  /// final stillProcessing = chargeUtils.isFinalState('pending'); // false
  /// ```
  bool isFinalState(String status) {
    return [
      'success',
      'failed', 
      'abandoned',
      'cancelled',
    ].contains(status.toLowerCase());
  }

  /// Checks if a charge requires additional authentication.
  ///
  /// Authentication is required for statuses that expect user input:
  /// - 'send_pin': Customer needs to provide PIN
  /// - 'send_otp': Customer needs to provide OTP
  /// - 'send_phone': Customer needs to provide phone number
  /// - 'send_birthday': Customer needs to provide birth date
  /// - 'send_address': Customer needs to provide billing address
  ///
  /// Parameters:
  /// - [charge]: The charge data to check
  ///
  /// Returns:
  /// true if authentication is required, false otherwise
  ///
  /// Example:
  /// ```dart
  /// if (chargeUtils.requiresAuthentication(charge)) {
  ///   // Show appropriate authentication UI
  ///   await handleAuthenticationFlow(charge);
  /// }
  /// ```
  bool requiresAuthentication(ChargeData charge) {
    return [
      'send_pin',
      'send_otp', 
      'send_phone',
      'send_birthday',
      'send_address',
    ].contains(charge.status.toLowerCase());
  }

  /// Determines the type of authentication required for a charge.
  ///
  /// This method analyzes the charge status and returns the specific
  /// authentication type needed to proceed with the payment flow.
  ///
  /// Parameters:
  /// - [charge]: The charge data to analyze
  ///
  /// Returns:
  /// The authentication type required, or null if no authentication is needed
  ///
  /// Possible return values:
  /// - 'pin': Customer needs to enter their card/bank PIN
  /// - 'otp': Customer needs to enter OTP from SMS/app
  /// - 'phone': Customer needs to provide phone number
  /// - 'birthday': Customer needs to provide birth date
  /// - 'address': Customer needs to provide billing address
  /// - null: No authentication required
  ///
  /// Example:
  /// ```dart
  /// switch (chargeUtils.getAuthenticationType(charge)) {
  ///   case 'pin':
  ///     await showPinDialog();
  ///     break;
  ///   case 'otp':
  ///     await showOtpDialog();
  ///     break;
  ///   case 'phone':
  ///     await showPhoneDialog();
  ///     break;
  ///   // ... handle other cases
  ///   case null:
  ///     // No authentication needed
  ///     break;
  /// }
  /// ```
  String? getAuthenticationType(ChargeData charge) {
    final status = charge.status.toLowerCase();
    
    if (status == 'send_pin') return 'pin';
    if (status == 'send_otp') return 'otp';
    if (status == 'send_phone') return 'phone';
    if (status == 'send_birthday') return 'birthday';
    if (status == 'send_address') return 'address';
    
    return null;
  }

  /// Checks if a charge was successful.
  ///
  /// A charge is considered successful if its status is 'success' and
  /// the gateway response indicates approval.
  ///
  /// Parameters:
  /// - [charge]: The charge data to check
  ///
  /// Returns:
  /// true if the charge was successful, false otherwise
  ///
  /// Example:
  /// ```dart
  /// if (chargeUtils.isSuccessful(charge)) {
  ///   await processSuccessfulPayment(charge);
  /// } else {
  ///   await handlePaymentFailure(charge);
  /// }
  /// ```
  bool isSuccessful(ChargeData charge) {
    return charge.status.toLowerCase() == 'success';
  }

  /// Checks if a charge failed permanently.
  ///
  /// A charge is considered failed if its status indicates permanent failure
  /// and no further action can resolve it.
  ///
  /// Parameters:
  /// - [charge]: The charge data to check
  ///
  /// Returns:
  /// true if the charge failed permanently, false otherwise
  ///
  /// Example:
  /// ```dart
  /// if (chargeUtils.isFailed(charge)) {
  ///   await logPaymentFailure(charge);
  ///   await showFailureMessage(charge.gatewayResponse);
  /// }
  /// ```
  bool isFailed(ChargeData charge) {
    final status = charge.status.toLowerCase();
    return ['failed', 'abandoned', 'cancelled'].contains(status);
  }

  /// Checks if a charge is still processing.
  ///
  /// A charge is considered processing if it's in a state where the
  /// outcome is not yet determined and further action may resolve it.
  ///
  /// Parameters:
  /// - [charge]: The charge data to check
  ///
  /// Returns:
  /// true if the charge is still processing, false otherwise
  ///
  /// Example:
  /// ```dart
  /// if (chargeUtils.isProcessing(charge)) {
  ///   // Continue monitoring or wait for user action
  ///   await continueMonitoring(charge);
  /// }
  /// ```
  bool isProcessing(ChargeData charge) {
    return !isSuccessful(charge) && !isFailed(charge);
  }

  /// Generates a unique transaction reference.
  ///
  /// Creates a reference string that can be used for new charge requests.
  /// The reference includes a timestamp to ensure uniqueness and optional
  /// prefix for categorization.
  ///
  /// Parameters:
  /// - [prefix]: Optional prefix for the reference (default: 'TXN')
  ///
  /// Returns:
  /// A unique transaction reference string
  ///
  /// Example:
  /// ```dart
  /// final cardRef = chargeUtils.generateReference('CARD');
  /// // Returns: 'CARD_1640995200000'
  /// 
  /// final transferRef = chargeUtils.generateReference('TRANSFER');
  /// // Returns: 'TRANSFER_1640995201000'
  /// 
  /// final defaultRef = chargeUtils.generateReference();
  /// // Returns: 'TXN_1640995202000'
  /// ```
  String generateReference([String prefix = 'TXN']) {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    return '${prefix}_$timestamp';
  }

  /// Formats an amount from kobo to a human-readable currency string.
  ///
  /// Converts amounts from Paystack's smallest currency unit format
  /// to a readable format with proper decimal places and currency symbol.
  ///
  /// Parameters:
  /// - [amount]: Amount in smallest currency unit (kobo, cents, pesewas)
  /// - [currency]: Currency code (default: 'NGN')
  /// - [includeSymbol]: Whether to include currency symbol (default: true)
  ///
  /// Returns:
  /// A formatted currency string
  ///
  /// Example:
  /// ```dart
  /// final formatted1 = chargeUtils.formatAmount(50000); 
  /// // Returns: '₦500.00'
  /// 
  /// final formatted2 = chargeUtils.formatAmount(50000, 'USD'); 
  /// // Returns: '$500.00'
  /// 
  /// final formatted3 = chargeUtils.formatAmount(50000, includeSymbol: false); 
  /// // Returns: '500.00'
  /// ```
  String formatAmount(int amount, [String currency = 'NGN', bool includeSymbol = true]) {
    final value = (amount / 100).toStringAsFixed(2);
    
    if (!includeSymbol) return value;
    
    switch (currency.toUpperCase()) {
      case 'NGN':
        return '₦$value';
      case 'USD':
        return '\$$value';
      case 'GHS':
        return 'GH₵$value';
      case 'KES':
        return 'KES $value';
      case 'ZAR':
        return 'R$value';
      default:
        return '$currency $value';
    }
  }

  /// Validates that a charge reference has the expected format.
  ///
  /// Checks if a reference string follows common patterns and length
  /// requirements to help catch issues early in the payment flow.
  ///
  /// Parameters:
  /// - [reference]: The reference to validate
  ///
  /// Returns:
  /// true if the reference appears valid, false otherwise
  ///
  /// Example:
  /// ```dart
  /// final valid1 = chargeUtils.isValidReference('TXN_1640995200000'); // true
  /// final valid2 = chargeUtils.isValidReference(''); // false
  /// final valid3 = chargeUtils.isValidReference('a'); // false
  /// ```
  bool isValidReference(String reference) {
    if (reference.isEmpty) return false;
    if (reference.length < 3) return false;
    if (reference.length > 100) return false;
    
    // Check for common patterns
    final validPattern = RegExp(r'^[A-Z0-9_-]+$', caseSensitive: false);
    return validPattern.hasMatch(reference);
  }

  /// Creates a summary of charge information for logging or display.
  ///
  /// Generates a formatted summary containing key charge details that
  /// can be used for logging, debugging, or user display purposes.
  ///
  /// Parameters:
  /// - [charge]: The charge data to summarize
  /// - [includeCustomer]: Whether to include customer information (default: true)
  ///
  /// Returns:
  /// A formatted string summary of the charge
  ///
  /// Example:
  /// ```dart
  /// final summary = chargeUtils.getChargeSummary(charge);
  /// print(summary);
  /// // Output:
  /// // Charge Summary:
  /// // Reference: TXN_123456789
  /// // Amount: ₦500.00 (NGN)
  /// // Status: success
  /// // Customer: customer@example.com
  /// // Gateway: Approved by Financial Institution
  /// ```
  String getChargeSummary(ChargeData charge, {bool includeCustomer = true}) {
    final buffer = StringBuffer();
    
    buffer.writeln('Charge Summary:');
    buffer.writeln('Reference: ${charge.reference}');
    buffer.writeln('Amount: ${formatAmount(charge.amount, charge.currency)}');
    buffer.writeln('Status: ${charge.status}');
    
    if (includeCustomer && charge.customer?.email != null) {
      buffer.writeln('Customer: ${charge.customer!.email}');
    }
    
    if (charge.gatewayResponse != null && charge.gatewayResponse!.isNotEmpty) {
      buffer.writeln('Gateway: ${charge.gatewayResponse}');
    }
    
    return buffer.toString();
  }
}

/// Exception thrown when charge polling times out.
class TimeoutException implements Exception {
  /// Creates a timeout exception.
  const TimeoutException(this.message, this.timeout);

  /// The error message describing the timeout.
  final String message;
  
  /// The duration that was exceeded.
  final Duration timeout;

  @override
  String toString() => 'TimeoutException: $message';
}