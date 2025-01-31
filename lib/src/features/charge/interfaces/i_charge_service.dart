import 'package:mind_paystack/src/features/charge/models/charge_response.dart';
import 'package:mind_paystack/src/features/charge/models/charge_status.dart';

/// Interface defining the contract for payment charge operations
abstract class IChargeService {
  /// Initiates a new charge
  ///
  /// [amount] Amount in lowest currency unit (e.g., kobo for NGN)
  /// [email] Customer's email address
  /// [authorizationCode] Code from previous transaction (optional)
  Future<ChargeResponse> charge({
    required int amount,
    required String email,
    required String currency,
    String? authorizationCode,
    Map<String, dynamic>? metadata,
  });

  /// Submits PIN to complete a charge
  ///
  /// [reference] Reference from the initial charge request
  /// [pin] Customer's card PIN
  Future<ChargeResponse> submitPin({
    required String reference,
    required String pin,
  });

  /// Submits OTP to complete a charge
  ///
  /// [reference] Reference from the initial charge request
  /// [otp] One-time password sent to customer
  Future<ChargeResponse> submitOtp({
    required String reference,
    required String otp,
  });

  /// Submits phone number for charge authorization
  ///
  /// [reference] Reference from the initial charge request
  /// [phone] Customer's phone number
  Future<ChargeResponse> submitPhone({
    required String reference,
    required String phone,
  });

  /// Submits birthday for charge authorization
  ///
  /// [reference] Reference from the initial charge request
  /// [birthday] Customer's birthday in YYYY-MM-DD format
  Future<ChargeResponse> submitBirthday({
    required String reference,
    required String birthday,
  });

  /// Validates a charge using address verification system
  ///
  /// [reference] Reference from the initial charge request
  /// [address] Billing address details
  /// [zipCode] Billing address ZIP code
  /// [city] Billing address city
  /// [state] Billing address state
  Future<ChargeResponse> submitAddress({
    required String reference,
    required String address,
    required String zipCode,
    required String city,
    required String state,
  });

  /// Checks the status of a pending charge
  ///
  /// [reference] Reference from the initial charge request
  Future<ChargeStatus> checkChargeStatus(String reference);

  /// Creates a partial debit charge
  ///
  /// [amount] Amount in lowest currency unit
  /// [email] Customer's email address
  /// [authorizationCode] Code from previous transaction
  /// [currency] Three-letter ISO currency code
  Future<ChargeResponse> createPartialDebit({
    required int amount,
    required String email,
    required String authorizationCode,
    required String currency,
    Map<String, dynamic>? metadata,
  });
}
