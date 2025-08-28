import 'package:dio/dio.dart';
import 'package:mind_paystack/src/core/errors/models/mind_exception.dart';
import 'package:mind_paystack/src/core/models/resource.dart';
import 'package:mind_paystack/src/core/models/src/bank.dart';
import 'package:mind_paystack/src/core/models/src/bank_transfer.dart';
import 'package:mind_paystack/src/core/models/src/card.dart';
import 'package:mind_paystack/src/core/models/src/mobile_money.dart';
import 'package:mind_paystack/src/core/models/src/payment_metadata.dart';
import 'package:mind_paystack/src/core/models/src/qr.dart';
import 'package:mind_paystack/src/core/models/src/ussd.dart';
import 'package:mind_paystack/src/features/charge/interfaces/i_charge_service.dart';
import 'package:mind_paystack/src/features/charge/models/charge/charge.dart';
import 'package:mind_paystack/src/features/charge/models/options/src/check_pending_charge_options.dart';
import 'package:mind_paystack/src/features/charge/models/options/src/charge_options.dart';
import 'package:mind_paystack/src/features/charge/models/options/src/create_charge_options.dart';
import 'package:mind_paystack/src/features/charge/models/options/src/submit_charge_options.dart';
import 'package:mind_paystack/src/features/charge/repositories/charge_repository.dart';

/// Service class for managing charge operations with proper exception handling.
///
/// This service implements the IChargeService interface and provides
/// comprehensive charge management functionality including payment creation,
/// authentication submission, and status monitoring. It handles all
/// business logic, validation, and exception management for charge operations.
///
/// The service acts as an intermediary between the application layer and
/// the repository layer, ensuring consistent error handling and data
/// validation across all charge operations.
///
/// Example usage:
/// ```dart
/// final repository = ChargeRepository();
/// final chargeService = ChargeService(repository);
///
/// // Create a new charge
/// final options = CreateChargeOptions(
///   email: 'customer@example.com',
///   amount: '50000',
/// );
///
/// final result = await chargeService.createCharge(options);
/// if (result.isSuccess) {
///   final charge = result.data!;
///   // Handle successful charge creation
/// }
/// ```
class ChargeService implements IChargeService {
  /// Creates a new ChargeService instance.
  ///
  /// Parameters:
  /// - [_repository]: The repository instance for handling charge data operations
  ChargeService(this._repository);

  /// The repository used for charge operations.
  final ChargeRepository _repository;

  @override
  Future<Resource<ChargeData>> createCharge(
    CreateChargeOptions options,
  ) async {
    try {
      // Validation logic
      if (options.email.isEmpty || !options.email.contains('@')) {
        throw MindException.validation(
          message: 'Valid email address is required',
          errors: [],
        );
      }

      if (options.amount.isEmpty || int.tryParse(options.amount) == null) {
        throw MindException.validation(
          message: 'Valid amount is required',
          errors: [],
        );
      }

      final amountValue = int.parse(options.amount);
      if (amountValue <= 0) {
        throw MindException.validation(
          message: 'Amount must be greater than zero',
          errors: [],
        );
      }

      return await _repository.createCharge(options);
    } on DioException catch (e) {
      print(e.message);
      throw MindException.fromDioError(e);
    } catch (e, s) {
      print(
        e.toString() + s.toString(),
      );
      throw MindException(
        message: 'Failed to create charge',
        code: 'charge_creation_error',
        technicalMessage: e.toString(),
      );
    }
  }

  @override
  Future<Resource<ChargeData>> submitPin(
    SubmitPinOptions options,
  ) async {
    try {
      // Validation logic
      if (options.reference.isEmpty) {
        throw MindException.validation(
          message: 'Transaction reference is required',
          errors: [],
        );
      }

      if (options.pin.isEmpty) {
        throw MindException.validation(
          message: 'PIN is required',
          errors: [],
        );
      }

      if (options.pin.length != 4 ||
          !RegExp(r'^\d{4}$').hasMatch(options.pin)) {
        throw MindException.validation(
          message: 'PIN must be exactly 4 digits',
          errors: [],
        );
      }

      return await _repository.submitPin(options);
    } on DioException catch (e) {
      throw MindException.fromDioError(e);
    } catch (e) {
      throw MindException(
        message: 'Failed to submit PIN',
        code: 'pin_submission_error',
        technicalMessage: e.toString(),
      );
    }
  }

  @override
  Future<Resource<ChargeData>> submitOtp(
    SubmitOtpOptions options,
  ) async {
    try {
      // Validation logic
      if (options.reference.isEmpty) {
        throw MindException.validation(
          message: 'Transaction reference is required',
          errors: [],
        );
      }

      if (options.otp.isEmpty) {
        throw MindException.validation(
          message: 'OTP is required',
          errors: [],
        );
      }

      if (!RegExp(r'^\d{4,8}$').hasMatch(options.otp)) {
        throw MindException.validation(
          message: 'OTP must be 4-8 digits',
          errors: [],
        );
      }

      return await _repository.submitOtp(options);
    } on DioException catch (e) {
      throw MindException.fromDioError(e);
    } catch (e) {
      throw MindException(
        message: 'Failed to submit OTP',
        code: 'otp_submission_error',
        technicalMessage: e.toString(),
      );
    }
  }

  @override
  Future<Resource<ChargeData>> submitPhone(
    SubmitPhoneOptions options,
  ) async {
    try {
      // Validation logic
      if (options.reference.isEmpty) {
        throw MindException.validation(
          message: 'Transaction reference is required',
          errors: [],
        );
      }

      if (options.phone.isEmpty) {
        throw MindException.validation(
          message: 'Phone number is required',
          errors: [],
        );
      }

      if (!RegExp(r'^\+\d{10,15}$').hasMatch(options.phone)) {
        throw MindException.validation(
          message: 'Phone number must be in international format (+1234567890)',
          errors: [],
        );
      }

      return await _repository.submitPhone(options);
    } on DioException catch (e) {
      throw MindException.fromDioError(e);
    } catch (e) {
      throw MindException(
        message: 'Failed to submit phone number',
        code: 'phone_submission_error',
        technicalMessage: e.toString(),
      );
    }
  }

  @override
  Future<Resource<ChargeData>> submitBirthday(
    SubmitBirthdayOptions options,
  ) async {
    try {
      // Validation logic
      if (options.reference.isEmpty) {
        throw MindException.validation(
          message: 'Transaction reference is required',
          errors: [],
        );
      }

      if (options.birthday.isEmpty) {
        throw MindException.validation(
          message: 'Birthday is required',
          errors: [],
        );
      }

      if (!RegExp(r'^\d{4}-\d{2}-\d{2}$').hasMatch(options.birthday)) {
        throw MindException.validation(
          message: 'Birthday must be in YYYY-MM-DD format',
          errors: [],
        );
      }

      // Validate date
      try {
        final date = DateTime.parse(options.birthday);
        final now = DateTime.now();
        final age = now.year - date.year;

        if (date.isAfter(now)) {
          throw MindException.validation(
            message: 'Birthday cannot be in the future',
            errors: [],
          );
        }

        if (age > 150) {
          throw MindException.validation(
            message: 'Invalid birth date',
            errors: [],
          );
        }
      } catch (e) {
        throw MindException.validation(
          message: 'Invalid date format',
          errors: [],
        );
      }

      return await _repository.submitBirthday(options);
    } on DioException catch (e) {
      throw MindException.fromDioError(e);
    } catch (e) {
      throw MindException(
        message: 'Failed to submit birthday',
        code: 'birthday_submission_error',
        technicalMessage: e.toString(),
      );
    }
  }

  @override
  Future<Resource<ChargeData>> submitAddress(
    SubmitAddressOptions options,
  ) async {
    try {
      // Validation logic
      if (options.reference.isEmpty) {
        throw MindException.validation(
          message: 'Transaction reference is required',
          errors: [],
        );
      }

      if (options.address.isEmpty) {
        throw MindException.validation(
          message: 'Address is required',
          errors: [],
        );
      }

      if (options.city.isEmpty) {
        throw MindException.validation(
          message: 'City is required',
          errors: [],
        );
      }

      if (options.state.isEmpty) {
        throw MindException.validation(
          message: 'State is required',
          errors: [],
        );
      }

      if (options.zipcode.isEmpty) {
        throw MindException.validation(
          message: 'ZIP code is required',
          errors: [],
        );
      }

      return await _repository.submitAddress(options);
    } on DioException catch (e) {
      throw MindException.fromDioError(e);
    } catch (e) {
      throw MindException(
        message: 'Failed to submit address',
        code: 'address_submission_error',
        technicalMessage: e.toString(),
      );
    }
  }

  @override
  Future<Resource<ChargeData>> checkPendingCharge(
    CheckPendingChargeOptions options,
  ) async {
    try {
      // Validation logic
      if (options.reference.isEmpty) {
        throw MindException.validation(
          message: 'Transaction reference is required',
          errors: [],
        );
      }

      return await _repository.checkPendingCharge(options);
    } on DioException catch (e) {
      throw MindException.fromDioError(e);
    } catch (e) {
      throw MindException(
        message: 'Failed to check pending charge',
        code: 'charge_status_check_error',
        technicalMessage: e.toString(),
      );
    }
  }

  /// Charges a card with the provided card details
  ///
  /// This convenience method simplifies card charging by accepting only
  /// the required parameters for card payments. Perfect for first-time
  /// card payments or when collecting card details directly in your app.
  ///
  /// Parameters:
  /// - [email]: Customer's email address
  /// - [amount]: Amount in smallest currency unit (kobo, cents, etc.)
  /// - [card]: Card details including number, CVV, expiry
  /// - [pin]: Optional PIN for debit cards
  /// - [reference]: Optional unique transaction reference
  /// - [metadata]: Optional additional data for tracking
  /// - [deviceId]: Optional device identifier for fraud detection
  ///
  /// Returns a [Resource] containing the charge result
  ///
  /// Example:
  /// ```dart
  /// final result = await chargeService.chargeCard(
  ///   email: 'customer@example.com',
  ///   amount: '50000',
  ///   card: Card(
  ///     number: '4084084084084081',
  ///     cvv: '123',
  ///     expiryMonth: '12',
  ///     expiryYear: '2025',
  ///   ),
  /// );
  /// ```
  @Deprecated('chargeCard method is deprecated due to PCI DSS compliance '
      'requirements and will be removed in a future version')
  Future<Resource<ChargeData>> chargeCard({
    required String email,
    required String amount,
    required Card card,
    String? pin,
    String? reference,
    PaymentMetadata? metadata,
    String? deviceId,
  }) async {
    final options = CreateChargeOptions.forCard(
      email: email,
      amount: amount,
      card: card,
      pin: pin,
      reference: reference,
      metadata: metadata,
      deviceId: deviceId,
    );
    return createCharge(options);
  }

  /// Charges using bank transfer payment method
  ///
  /// This convenience method sets up a charge for bank transfer payments,
  /// where customers transfer money to a generated account number.
  /// Ideal for high-value transactions or customers preferring bank transfers.
  ///
  /// Parameters:
  /// - [email]: Customer's email address
  /// - [amount]: Amount in smallest currency unit
  /// - [bankTransfer]: Optional bank transfer configuration
  /// - [reference]: Optional unique transaction reference
  /// - [metadata]: Optional additional data for tracking
  ///
  /// Returns a [Resource] containing the charge result
  ///
  /// Example:
  /// ```dart
  /// final result = await chargeService.chargeBankTransfer(
  ///   email: 'customer@example.com',
  ///   amount: '50000',
  /// );
  /// ```
  Future<Resource<ChargeData>> chargeBankTransfer({
    required String email,
    required String amount,
    BankTransfer? bankTransfer,
    String? reference,
    PaymentMetadata? metadata,
  }) async {
    final options = CreateChargeOptions.forBankTransfer(
      email: email,
      amount: amount,
      bankTransfer: bankTransfer,
      reference: reference,
      metadata: metadata,
    );
    return createCharge(options);
  }

  /// Charges a previously saved card using authorization code
  ///
  /// This convenience method enables charging customers using their
  /// previously saved payment method. Perfect for returning customers
  /// and one-click payment experiences.
  ///
  /// Parameters:
  /// - [email]: Customer's email address
  /// - [amount]: Amount in smallest currency unit
  /// - [authorizationCode]: Authorization code from previous transaction
  /// - [reference]: Optional unique transaction reference
  /// - [metadata]: Optional additional data for tracking
  ///
  /// Returns a [Resource] containing the charge result
  ///
  /// Example:
  /// ```dart
  /// final result = await chargeService.chargeSavedCard(
  ///   email: 'customer@example.com',
  ///   amount: '50000',
  ///   authorizationCode: 'AUTH_abc123def',
  /// );
  /// ```
  Future<Resource<ChargeData>> chargeSavedCard({
    required String email,
    required String amount,
    required String authorizationCode,
    String? reference,
    PaymentMetadata? metadata,
  }) async {
    final options = CreateChargeOptions.forSavedCard(
      email: email,
      amount: amount,
      authorizationCode: authorizationCode,
      reference: reference,
      metadata: metadata,
    );
    return createCharge(options);
  }

  /// Charges using mobile money (Ghana/Kenya)
  ///
  /// This convenience method sets up charges for mobile money payments,
  /// available in Ghana and Kenya. Supports providers like MTN,
  /// Vodafone, AirtelTigo (Ghana) and M-Pesa (Kenya).
  ///
  /// Parameters:
  /// - [email]: Customer's email address
  /// - [amount]: Amount in smallest currency unit
  /// - [mobileMoney]: Mobile money provider and phone details
  /// - [reference]: Optional unique transaction reference
  /// - [metadata]: Optional additional data for tracking
  ///
  /// Returns a [Resource] containing the charge result
  ///
  /// Example:
  /// ```dart
  /// final result = await chargeService.chargeMobileMoney(
  ///   email: 'customer@example.com',
  ///   amount: '50000',
  ///   mobileMoney: MobileMoney(
  ///     provider: 'mtn',
  ///     phone: '+233501234567',
  ///   ),
  /// );
  /// ```
  Future<Resource<ChargeData>> chargeMobileMoney({
    required String email,
    required String amount,
    required MobileMoney mobileMoney,
    String? reference,
    PaymentMetadata? metadata,
  }) async {
    final options = CreateChargeOptions.forMobileMoney(
      email: email,
      amount: amount,
      mobileMoney: mobileMoney,
      reference: reference,
      metadata: metadata,
    );
    return createCharge(options);
  }

  /// Charges using USSD payment method
  ///
  /// This convenience method enables USSD-based payments where customers
  /// dial a code on their mobile phones. Popular in markets with
  /// high mobile penetration but limited internet connectivity.
  ///
  /// Parameters:
  /// - [email]: Customer's email address
  /// - [amount]: Amount in smallest currency unit
  /// - [ussd]: USSD configuration with provider code
  /// - [reference]: Optional unique transaction reference
  /// - [metadata]: Optional additional data for tracking
  ///
  /// Returns a [Resource] containing the charge result
  ///
  /// Example:
  /// ```dart
  /// final result = await chargeService.chargeUssd(
  ///   email: 'customer@example.com',
  ///   amount: '50000',
  ///   ussd: Ussd(type: '*737#'),
  /// );
  /// ```
  Future<Resource<ChargeData>> chargeUssd({
    required String email,
    required String amount,
    required Ussd ussd,
    String? reference,
    PaymentMetadata? metadata,
  }) async {
    final options = CreateChargeOptions.forUssd(
      email: email,
      amount: amount,
      ussd: ussd,
      reference: reference,
      metadata: metadata,
    );
    return createCharge(options);
  }

  /// Charges using QR code payment method
  ///
  /// This convenience method sets up QR code-based payments where customers
  /// scan a code with their banking app. Supports various QR payment
  /// providers based on the market and customer preferences.
  ///
  /// Parameters:
  /// - [email]: Customer's email address
  /// - [amount]: Amount in smallest currency unit
  /// - [qr]: QR code provider configuration
  /// - [reference]: Optional unique transaction reference
  /// - [metadata]: Optional additional data for tracking
  ///
  /// Returns a [Resource] containing the charge result
  ///
  /// Example:
  /// ```dart
  /// final result = await chargeService.chargeQr(
  ///   email: 'customer@example.com',
  ///   amount: '50000',
  ///   qr: Qr(provider: 'scan-to-pay'),
  /// );
  /// ```
  Future<Resource<ChargeData>> chargeQr({
    required String email,
    required String amount,
    required Qr qr,
    String? reference,
    PaymentMetadata? metadata,
  }) async {
    final options = CreateChargeOptions.forQr(
      email: email,
      amount: amount,
      qr: qr,
      reference: reference,
      metadata: metadata,
    );
    return createCharge(options);
  }

  /// Charges using bank account direct debit
  ///
  /// This convenience method enables direct debit from customer's bank account.
  /// Requires bank account details and may need additional authentication
  /// like PIN verification.
  ///
  /// Parameters:
  /// - [email]: Customer's email address
  /// - [amount]: Amount in smallest currency unit
  /// - [bank]: Bank account details for direct debit
  /// - [pin]: Optional PIN for authentication
  /// - [reference]: Optional unique transaction reference
  /// - [metadata]: Optional additional data for tracking
  ///
  /// Returns a [Resource] containing the charge result
  ///
  /// Example:
  /// ```dart
  /// final result = await chargeService.chargeBankAccount(
  ///   email: 'customer@example.com',
  ///   amount: '50000',
  ///   bank: BankDetails(
  ///     code: '057',
  ///     accountNumber: '1234567890',
  ///   ),
  ///   pin: '1234',
  /// );
  /// ```
  Future<Resource<ChargeData>> chargeBankAccount({
    required String email,
    required String amount,
    required BankDetails bank,
    String? pin,
    String? reference,
    PaymentMetadata? metadata,
  }) async {
    final options = CreateChargeOptions.forBankAccount(
      email: email,
      amount: amount,
      bank: bank,
      pin: pin,
      reference: reference,
      metadata: metadata,
    );
    return createCharge(options);
  }

  /// Charges a card using a [CardOptions] object
  ///
  /// This overloaded method accepts a [CardOptions] object containing
  /// all the necessary parameters for card charging, providing a cleaner
  /// way to pass grouped parameters.
  ///
  /// Returns a [Resource] containing the charge result
  ///
  /// Example:
  /// ```dart
  /// final cardOptions = CardOptions(
  ///   email: 'customer@example.com',
  ///   amount: '50000',
  ///   card: Card(
  ///     number: '4084084084084081',
  ///     cvv: '123',
  ///     expiryMonth: '12',
  ///     expiryYear: '2025',
  ///   ),
  /// );
  /// final result = await chargeService.chargeCardWithOptions(cardOptions);
  /// ```
  @Deprecated('chargeCardWithOptions method is deprecated due to PCI DSS '
      'compliance requirements and will be removed in a future version')
  Future<Resource<ChargeData>> chargeCardWithOptions(
    CardOptions options,
  ) async {
    final chargeOptions = CreateChargeOptions.fromCardOptions(options);
    return createCharge(chargeOptions);
  }

  /// Charges using bank transfer with a [BankTransferOptions] object
  ///
  /// This overloaded method accepts a [BankTransferOptions] object containing
  /// all the necessary parameters for bank transfer payments.
  ///
  /// Returns a [Resource] containing the charge result
  ///
  /// Example:
  /// ```dart
  /// final transferOptions = BankTransferOptions(
  ///   email: 'customer@example.com',
  ///   amount: '50000',
  /// );
  /// final result = await chargeService.chargeBankTransferWithOptions(transferOptions);
  /// ```
  Future<Resource<ChargeData>> chargeBankTransferWithOptions(
    BankTransferOptions options,
  ) async {
    final chargeOptions = CreateChargeOptions.fromBankTransferOptions(options);
    return createCharge(chargeOptions);
  }

  /// Charges a saved card using a [SavedCardOptions] object
  ///
  /// This overloaded method accepts a [SavedCardOptions] object containing
  /// all the necessary parameters for saved card charging.
  ///
  /// Returns a [Resource] containing the charge result
  ///
  /// Example:
  /// ```dart
  /// final savedCardOptions = SavedCardOptions(
  ///   email: 'customer@example.com',
  ///   amount: '50000',
  ///   authorizationCode: 'AUTH_abc123def',
  /// );
  /// final result = await chargeService.chargeSavedCardWithOptions(savedCardOptions);
  /// ```
  Future<Resource<ChargeData>> chargeSavedCardWithOptions(
    SavedCardOptions options,
  ) async {
    final chargeOptions = CreateChargeOptions.fromSavedCardOptions(options);
    return createCharge(chargeOptions);
  }

  /// Charges using mobile money with a [MobileMoneyOptions] object
  ///
  /// This overloaded method accepts a [MobileMoneyOptions] object containing
  /// all the necessary parameters for mobile money payments.
  ///
  /// Returns a [Resource] containing the charge result
  ///
  /// Example:
  /// ```dart
  /// final mobileMoneyOptions = MobileMoneyOptions(
  ///   email: 'customer@example.com',
  ///   amount: '50000',
  ///   mobileMoney: MobileMoney(provider: 'mtn', phone: '+233501234567'),
  /// );
  /// final result = await chargeService.chargeMobileMoneyWithOptions(mobileMoneyOptions);
  /// ```
  Future<Resource<ChargeData>> chargeMobileMoneyWithOptions(
    MobileMoneyOptions options,
  ) async {
    final chargeOptions = CreateChargeOptions.fromMobileMoneyOptions(options);
    return createCharge(chargeOptions);
  }

  /// Charges using USSD with a [UssdOptions] object
  ///
  /// This overloaded method accepts a [UssdOptions] object containing
  /// all the necessary parameters for USSD payments.
  ///
  /// Returns a [Resource] containing the charge result
  ///
  /// Example:
  /// ```dart
  /// final ussdOptions = UssdOptions(
  ///   email: 'customer@example.com',
  ///   amount: '50000',
  ///   ussd: Ussd(type: '*737#'),
  /// );
  /// final result = await chargeService.chargeUssdWithOptions(ussdOptions);
  /// ```
  Future<Resource<ChargeData>> chargeUssdWithOptions(
    UssdOptions options,
  ) async {
    final chargeOptions = CreateChargeOptions.fromUssdOptions(options);
    return createCharge(chargeOptions);
  }

  /// Charges using QR code with a [QrOptions] object
  ///
  /// This overloaded method accepts a [QrOptions] object containing
  /// all the necessary parameters for QR code payments.
  ///
  /// Returns a [Resource] containing the charge result
  ///
  /// Example:
  /// ```dart
  /// final qrOptions = QrOptions(
  ///   email: 'customer@example.com',
  ///   amount: '50000',
  ///   qr: Qr(provider: 'scan-to-pay'),
  /// );
  /// final result = await chargeService.chargeQrWithOptions(qrOptions);
  /// ```
  Future<Resource<ChargeData>> chargeQrWithOptions(
    QrOptions options,
  ) async {
    final chargeOptions = CreateChargeOptions.fromQrOptions(options);
    return createCharge(chargeOptions);
  }

  /// Charges using bank account with a [BankAccountOptions] object
  ///
  /// This overloaded method accepts a [BankAccountOptions] object containing
  /// all the necessary parameters for bank account direct debit.
  ///
  /// Returns a [Resource] containing the charge result
  ///
  /// Example:
  /// ```dart
  /// final bankAccountOptions = BankAccountOptions(
  ///   email: 'customer@example.com',
  ///   amount: '50000',
  ///   bank: BankDetails(code: '057', accountNumber: '1234567890'),
  ///   pin: '1234',
  /// );
  /// final result = await chargeService.chargeBankAccountWithOptions(bankAccountOptions);
  /// ```
  Future<Resource<ChargeData>> chargeBankAccountWithOptions(
    BankAccountOptions options,
  ) async {
    final chargeOptions = CreateChargeOptions.fromBankAccountOptions(options);
    return createCharge(chargeOptions);
  }
}
