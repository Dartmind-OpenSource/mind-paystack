import 'package:mind_paystack/src/core/models/resource.dart';
import 'package:mind_paystack/src/core/network/http_client.dart';
import 'package:mind_paystack/src/features/charge/models/charge/charge.dart';
import 'package:mind_paystack/src/features/charge/models/options/src/check_pending_charge_options.dart';
import 'package:mind_paystack/src/features/charge/models/options/src/create_charge_options.dart';
import 'package:mind_paystack/src/features/charge/models/options/src/submit_charge_options.dart';

/// Repository for handling all charge-related API operations.
///
/// This repository provides a comprehensive interface for interacting with
/// Paystack's charge APIs, including payment creation, authentication
/// submission (PIN, OTP, phone, birthday, address), and status checking.
///
/// The repository handles HTTP communication with the Paystack API and
/// transforms raw responses into typed model objects wrapped in [Resource]
/// containers for consistent error handling.
///
/// Example usage:
/// ```dart
/// final repository = ChargeRepository(httpClient);
///
/// // Create a new charge
/// final createResult = await repository.createCharge(
///   CreateChargeOptions(
///     email: 'customer@example.com',
///     amount: '50000', // ₦500.00 in kobo
///   ),
/// );
///
/// // Submit PIN if required
/// if (createResult.data?.status == 'send_pin') {
///   final pinResult = await repository.submitPin(
///     SubmitPinOptions(
///       pin: '1234',
///       reference: createResult.data!.reference,
///     ),
///   );
/// }
/// ```
class ChargeRepository {
  /// Creates a new ChargeRepository instance.
  ///
  /// The [_httpClient] is used for all HTTP communication with the
  /// Paystack API and should be properly configured with authentication.
  ChargeRepository(this._httpClient);

  /// HTTP client used for API communication.
  final HttpClient _httpClient;

  /// Creates a new charge transaction.
  ///
  /// Initiates a payment charge using the specified payment method and
  /// customer details. The charge may complete immediately or require
  /// additional authentication steps depending on the payment method.
  ///
  /// Parameters:
  /// - [options]: Complete charge configuration including customer details,
  ///   payment method, amount, and channel-specific options.
  ///
  /// Returns:
  /// A [Resource] containing [ChargeData] with transaction details, status,
  /// and any authentication requirements.
  ///
  /// Example:
  /// ```dart
  /// final result = await repository.createCharge(
  ///   CreateChargeOptions(
  ///     email: 'customer@example.com',
  ///     amount: '50000', // ₦500.00 in kobo
  ///     authorizationCode: 'AUTH_pmx3mgawyd',
  ///   ),
  /// );
  ///
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
  ) async {
    final res = await _httpClient.post<Map<String, dynamic>>(
      '/charge',
      data: options.toMap(),
    );
    return Resource.fromMap(
      res.data!,
      ChargeDataMapper.fromMap,
    );
  }

  /// Submits a PIN for charge authentication.
  ///
  /// Continues the charge flow by providing the customer's PIN when
  /// required for payment method authentication.
  ///
  /// Parameters:
  /// - [options]: PIN submission data including the PIN and transaction
  ///   reference to authenticate.
  ///
  /// Returns:
  /// A [Resource] containing updated [ChargeData] with the result of PIN
  /// authentication and any next steps required.
  ///
  /// Example:
  /// ```dart
  /// final result = await repository.submitPin(
  ///   SubmitPinOptions(
  ///     pin: '1234',
  ///     reference: 'TXN_123456789',
  ///   ),
  /// );
  ///
  /// if (result.isSuccess) {
  ///   final charge = result.data!;
  ///   if (charge.status == 'success') {
  ///     // PIN authentication successful
  ///   } else if (charge.status == 'send_otp') {
  ///     // OTP now required
  ///   }
  /// }
  /// ```
  Future<Resource<ChargeData>> submitPin(
    SubmitPinOptions options,
  ) async {
    final res = await _httpClient.post<Map<String, dynamic>>(
      '/charge/submit_pin',
      data: options.toMap(),
    );
    return Resource.fromMap(
      res.data!,
      ChargeDataMapper.fromMap,
    );
  }

  /// Submits an OTP for charge authentication.
  ///
  /// Continues the charge flow by providing the One-Time Password (OTP)
  /// received by the customer via SMS or mobile app.
  ///
  /// Parameters:
  /// - [options]: OTP submission data including the verification code
  ///   and transaction reference.
  ///
  /// Returns:
  /// A [Resource] containing updated [ChargeData] with the result of OTP
  /// verification and final transaction status.
  ///
  /// Example:
  /// ```dart
  /// final result = await repository.submitOtp(
  ///   SubmitOtpOptions(
  ///     otp: '123456',
  ///     reference: 'TXN_123456789',
  ///   ),
  /// );
  ///
  /// if (result.isSuccess) {
  ///   final charge = result.data!;
  ///   if (charge.status == 'success') {
  ///     // OTP verification successful
  ///   }
  /// }
  /// ```
  Future<Resource<ChargeData>> submitOtp(
    SubmitOtpOptions options,
  ) async {
    final res = await _httpClient.post<Map<String, dynamic>>(
      '/charge/submit_otp',
      data: options.toMap(),
    );
    return Resource.fromMap(
      res.data!,
      ChargeDataMapper.fromMap,
    );
  }

  /// Submits a phone number for charge verification.
  ///
  /// Provides the customer's phone number when additional phone verification
  /// is required during the charge flow.
  ///
  /// Parameters:
  /// - [options]: Phone submission data including the customer's phone
  ///   number in international format and transaction reference.
  ///
  /// Returns:
  /// A [Resource] containing updated [ChargeData] with the result of phone
  /// submission and any subsequent authentication requirements.
  ///
  /// Example:
  /// ```dart
  /// final result = await repository.submitPhone(
  ///   SubmitPhoneOptions(
  ///     phone: '+2348012345678',
  ///     reference: 'TXN_123456789',
  ///   ),
  /// );
  ///
  /// if (result.isSuccess) {
  ///   final charge = result.data!;
  ///   // Check charge status for next required step
  /// }
  /// ```
  Future<Resource<ChargeData>> submitPhone(
    SubmitPhoneOptions options,
  ) async {
    final res = await _httpClient.post<Map<String, dynamic>>(
      '/charge/submit_phone',
      data: options.toMap(),
    );
    return Resource.fromMap(
      res.data!,
      ChargeDataMapper.fromMap,
    );
  }

  /// Submits a birthday for charge identity verification.
  ///
  /// Provides the customer's birth date when additional identity verification
  /// is required during the charge flow.
  ///
  /// Parameters:
  /// - [options]: Birthday submission data including the birth date in
  ///   YYYY-MM-DD format and transaction reference.
  ///
  /// Returns:
  /// A [Resource] containing updated [ChargeData] with the result of identity
  /// verification and charge processing status.
  ///
  /// Example:
  /// ```dart
  /// final result = await repository.submitBirthday(
  ///   SubmitBirthdayOptions(
  ///     birthday: '1990-05-15',
  ///     reference: 'TXN_123456789',
  ///   ),
  /// );
  ///
  /// if (result.isSuccess) {
  ///   final charge = result.data!;
  ///   if (charge.status == 'success') {
  ///     // Identity verification successful
  ///   }
  /// }
  /// ```
  Future<Resource<ChargeData>> submitBirthday(
    SubmitBirthdayOptions options,
  ) async {
    final res = await _httpClient.post<Map<String, dynamic>>(
      '/charge/submit_birthday',
      data: options.toMap(),
    );
    return Resource.fromMap(
      res.data!,
      ChargeDataMapper.fromMap,
    );
  }

  /// Submits an address for charge verification.
  ///
  /// Provides the customer's complete billing address when address
  /// verification is required during the charge flow.
  ///
  /// Parameters:
  /// - [options]: Complete address information including street address,
  ///   city, state, ZIP code, and transaction reference.
  ///
  /// Returns:
  /// A [Resource] containing updated [ChargeData] with the result of address
  /// verification and final charge status.
  ///
  /// Example:
  /// ```dart
  /// final result = await repository.submitAddress(
  ///   SubmitAddressOptions(
  ///     address: '123 Main Street, Apt 4B',
  ///     city: 'Lagos',
  ///     state: 'Lagos',
  ///     zipcode: '100001',
  ///     reference: 'TXN_123456789',
  ///   ),
  /// );
  ///
  /// if (result.isSuccess) {
  ///   final charge = result.data!;
  ///   if (charge.status == 'success') {
  ///     // Address verification successful
  ///   }
  /// }
  /// ```
  Future<Resource<ChargeData>> submitAddress(
    SubmitAddressOptions options,
  ) async {
    final res = await _httpClient.post<Map<String, dynamic>>(
      '/charge/submit_address',
      data: options.toMap(),
    );
    return Resource.fromMap(
      res.data!,
      ChargeDataMapper.fromMap,
    );
  }

  /// Checks the current status of a pending charge transaction.
  ///
  /// Retrieves the latest status and details of a charge that may still
  /// be processing or awaiting additional authentication steps.
  ///
  /// Parameters:
  /// - [options]: Status check configuration containing the transaction
  ///   reference to query.
  ///
  /// Returns:
  /// A [Resource] containing current [ChargeData] with updated status,
  /// transaction details, and any remaining authentication requirements.
  ///
  /// Example:
  /// ```dart
  /// final result = await repository.checkPendingCharge(
  ///   CheckPendingChargeOptions(
  ///     reference: 'TXN_123456789',
  ///   ),
  /// );
  ///
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
  ) async {
    final res = await _httpClient.get<Map<String, dynamic>>(
      '/charge/${options.reference}',
    );
    return Resource.fromMap(
      res.data!,
      ChargeDataMapper.fromMap,
    );
  }
}
