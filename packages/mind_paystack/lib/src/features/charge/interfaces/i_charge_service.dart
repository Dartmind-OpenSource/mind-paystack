import 'package:mind_paystack/src/core/models/resource.dart';
import 'package:mind_paystack/src/features/charge/models/charge/charge.dart';
import 'package:mind_paystack/src/features/charge/models/options/src/check_pending_charge_options.dart';
import 'package:mind_paystack/src/features/charge/models/options/src/create_charge_options.dart';
import 'package:mind_paystack/src/features/charge/models/options/src/submit_charge_options.dart';

/// Interface defining the contract for charge-related business operations.
///
/// This abstract class defines all the charge operations that can be
/// performed through the MindPaystack SDK. It serves as a contract that
/// concrete service implementations must fulfill, providing a clean separation
/// between the business logic layer and the data access layer.
///
/// The service provides high-level charge operations including payment
/// creation, authentication submission (PIN, OTP, phone, birthday, address),
/// and status checking. All methods return Resource objects for consistent
/// error handling and response structure.
///
/// Example implementation usage:
/// ```dart
/// class ChargeService implements IChargeService {
///   final ChargeRepository _repository;
///
///   ChargeService(this._repository);
///
///   @override
///   Future<Resource<ChargeData>> createCharge(
///     CreateChargeOptions options,
///   ) async {
///     // Business logic and validation here
///     return await _repository.createCharge(options);
///   }
/// }
/// ```
abstract class IChargeService {
  /// Creates a new charge transaction with Paystack.
  ///
  /// Initiates a new payment charge using the specified payment method
  /// and customer details. This is the entry point for all charge operations,
  /// supporting various payment channels including cards, bank accounts,
  /// USSD, mobile money, and bank transfers.
  ///
  /// The charge may complete immediately for some payment methods or require
  /// additional authentication steps for others (PIN, OTP, etc.).
  ///
  /// Parameters:
  /// - [options]: Complete charge configuration including customer details,
  ///   payment method, amount, and channel-specific options
  ///
  /// Returns:
  /// A Resource containing ChargeData with transaction details, status,
  /// and any authentication requirements for completing the payment.
  ///
  /// Throws:
  /// - MindException if validation fails or API request encounters errors
  ///
  /// Example:
  /// ```dart
  /// final options = CreateChargeOptions(
  ///   email: 'customer@example.com',
  ///   amount: '50000', // 500 NGN in kobo
  ///   currency: 'NGN',
  ///   authorizationCode: 'AUTH_pmx3mgawyd',
  /// );
  ///
  /// final result = await chargeService.createCharge(options);
  /// if (result.isSuccess) {
  ///   final charge = result.data!;
  ///   if (charge.status == 'success') {
  ///     // Payment completed
  ///   } else if (charge.status == 'send_pin') {
  ///     // PIN required for authentication
  ///   }
  /// }
  /// ```
  Future<Resource<ChargeData>> createCharge(
    CreateChargeOptions options,
  );

  /// Submits a PIN for charge authentication.
  ///
  /// Continues the charge flow by providing the customer's PIN when
  /// required for payment method authentication. This is typically needed
  /// for debit card transactions or bank account charges that require
  /// PIN verification.
  ///
  /// This method should be called when a charge returns a status indicating
  /// PIN authentication is required (e.g., 'send_pin').
  ///
  /// Parameters:
  /// - [options]: PIN submission data including the PIN and transaction
  ///   reference to authenticate
  ///
  /// Returns:
  /// A Resource containing updated ChargeData with the result of PIN
  /// authentication and any next steps required.
  ///
  /// Example:
  /// ```dart
  /// final options = SubmitChargeOptions.pin(
  ///   pin: '1234',
  ///   reference: 'TXN_123456789',
  /// );
  ///
  /// final result = await chargeService.submitPin(options);
  /// if (result.isSuccess) {
  ///   final charge = result.data!;
  ///   if (charge.status == 'success') {
  ///     // PIN authentication successful, payment complete
  ///   } else if (charge.status == 'send_otp') {
  ///     // OTP now required
  ///   }
  /// }
  /// ```
  Future<Resource<ChargeData>> submitPin(
    SubmitPinOptions options,
  );

  /// Submits an OTP for charge authentication.
  ///
  /// Continues the charge flow by providing the One-Time Password (OTP)
  /// received by the customer via SMS or mobile app. This is commonly
  /// required for bank card transactions as an additional security measure.
  ///
  /// This method should be called when a charge returns a status indicating
  /// OTP verification is required (e.g., 'send_otp').
  ///
  /// Parameters:
  /// - [options]: OTP submission data including the verification code
  ///   and transaction reference
  ///
  /// Returns:
  /// A Resource containing updated ChargeData with the result of OTP
  /// verification and final transaction status.
  ///
  /// Example:
  /// ```dart
  /// final options = SubmitChargeOptions.otp(
  ///   otp: '123456',
  ///   reference: 'TXN_123456789',
  /// );
  ///
  /// final result = await chargeService.submitOtp(options);
  /// if (result.isSuccess) {
  ///   final charge = result.data!;
  ///   if (charge.status == 'success') {
  ///     // OTP verification successful, payment complete
  ///   }
  /// }
  /// ```
  Future<Resource<ChargeData>> submitOtp(
    SubmitOtpOptions options,
  );

  /// Submits a phone number for charge verification.
  ///
  /// Provides the customer's phone number when additional phone verification
  /// is required during the charge flow. This is typically requested for
  /// risk assessment or when the payment method doesn't have an associated
  /// phone number.
  ///
  /// Parameters:
  /// - [options]: Phone submission data including the customer's phone
  ///   number in international format and transaction reference
  ///
  /// Returns:
  /// A Resource containing updated ChargeData with the result of phone
  /// submission and any subsequent authentication requirements.
  ///
  /// Example:
  /// ```dart
  /// final options = SubmitChargeOptions.phone(
  ///   phone: '+2348012345678',
  ///   reference: 'TXN_123456789',
  /// );
  ///
  /// final result = await chargeService.submitPhone(options);
  /// if (result.isSuccess) {
  ///   final charge = result.data!;
  ///   // Check charge status for next required step
  /// }
  /// ```
  Future<Resource<ChargeData>> submitPhone(
    SubmitPhoneOptions options,
  );

  /// Submits a birthday for charge identity verification.
  ///
  /// Provides the customer's birth date when additional identity verification
  /// is required during the charge flow. This is typically requested for
  /// high-value transactions or specific bank requirements to confirm
  /// customer identity.
  ///
  /// Parameters:
  /// - [options]: Birthday submission data including the birth date in
  ///   YYYY-MM-DD format and transaction reference
  ///
  /// Returns:
  /// A Resource containing updated ChargeData with the result of identity
  /// verification and charge processing status.
  ///
  /// Example:
  /// ```dart
  /// final options = SubmitChargeOptions.birthday(
  ///   birthday: '1990-05-15',
  ///   reference: 'TXN_123456789',
  /// );
  ///
  /// final result = await chargeService.submitBirthday(options);
  /// if (result.isSuccess) {
  ///   final charge = result.data!;
  ///   if (charge.status == 'success') {
  ///     // Identity verification successful, payment complete
  ///   }
  /// }
  /// ```
  Future<Resource<ChargeData>> submitBirthday(
    SubmitBirthdayOptions options,
  );

  /// Submits an address for charge verification.
  ///
  /// Provides the customer's complete billing address when address
  /// verification is required during the charge flow. This is commonly
  /// needed for international transactions, high-value payments, or
  /// merchants requiring AVS (Address Verification Service).
  ///
  /// Parameters:
  /// - [options]: Complete address information including street address,
  ///   city, state, ZIP code, and transaction reference
  ///
  /// Returns:
  /// A Resource containing updated ChargeData with the result of address
  /// verification and final charge status.
  ///
  /// Example:
  /// ```dart
  /// final options = SubmitChargeOptions.address(
  ///   address: '123 Main Street, Apt 4B',
  ///   city: 'Lagos',
  ///   state: 'Lagos',
  ///   zipcode: '100001',
  ///   reference: 'TXN_123456789',
  /// );
  ///
  /// final result = await chargeService.submitAddress(options);
  /// if (result.isSuccess) {
  ///   final charge = result.data!;
  ///   if (charge.status == 'success') {
  ///     // Address verification successful, payment complete
  ///   }
  /// }
  /// ```
  Future<Resource<ChargeData>> submitAddress(
    SubmitAddressOptions options,
  );

  /// Checks the current status of a pending charge transaction.
  ///
  /// Retrieves the latest status and details of a charge that may still
  /// be processing or awaiting additional authentication steps. This is
  /// used to poll transaction status after initiating a charge that
  /// requires async processing or to verify final payment status.
  ///
  /// This method is particularly useful for:
  /// - Monitoring bank transfer payments that process asynchronously
  /// - Checking final status after completing authentication flows
  /// - Refreshing charge state in long-running payment sessions
  ///
  /// Parameters:
  /// - [options]: Status check configuration containing the transaction
  ///   reference to query
  ///
  /// Returns:
  /// A Resource containing current ChargeData with updated status,
  /// transaction details, and any remaining authentication requirements.
  ///
  /// Example:
  /// ```dart
  /// final options = CheckPendingChargeOptions(
  ///   reference: 'TXN_123456789',
  /// );
  ///
  /// final result = await chargeService.checkPendingCharge(options);
  /// if (result.isSuccess) {
  ///   final charge = result.data!;
  ///   switch (charge.status) {
  ///     case 'success':
  ///       // Payment completed successfully
  ///       break;
  ///     case 'pending':
  ///       // Still processing, check again later
  ///       break;
  ///     case 'failed':
  ///       // Payment failed
  ///       break;
  ///   }
  /// }
  /// ```
  Future<Resource<ChargeData>> checkPendingCharge(
    CheckPendingChargeOptions options,
  );
}
