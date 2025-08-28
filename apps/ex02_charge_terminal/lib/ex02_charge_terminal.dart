import 'dart:io';

import 'package:dotenv/dotenv.dart';
import 'package:mind_paystack/mind_paystack.dart';

int calculate() {
  return 42;
}

/// Terminal application for demonstrating charge flows with card processing.
///
/// This class provides interactive methods to create charges, handle various
/// submission flows (PIN, OTP, phone verification, etc.), and manage the
/// complete charge lifecycle using the MindPaystack SDK.
///
/// ## Usage
///
/// ```dart
/// // Create and initialize
/// final terminal = await ChargeTerminal.create();
///
/// // Start interactive session
/// await terminal.runInteractiveSession();
/// ```
class ChargeTerminal {
  /// Creates a new ChargeTerminal instance.
  const ChargeTerminal();

  /// Creates a ChargeTerminal instance with SDK initialized from .env file.
  ///
  /// Expected .env variables:
  /// - PAYSTACK_PUBLIC_KEY: Your Paystack public key
  /// - PAYSTACK_SECRET_KEY: Your Paystack secret key
  /// - PAYSTACK_ENVIRONMENT: (optional) 'test' or 'production'
  /// - PAYSTACK_LOG_LEVEL: (optional) 'debug', 'info', 'warning', 'error'
  static Future<ChargeTerminal> create() async {
    try {
      final env = DotEnv(includePlatformEnvironment: true)..load();
      final secretKey = env['PAYSTACK_SECRET_KEY'];
      final publicKey = env['PAYSTACK_PUBLIC_KEY'];

      if (secretKey == null || secretKey.isEmpty) {
        stderr.writeln('❌ Error: PAYSTACK_SECRET_KEY not set in .env file');
        exit(1);
      }

      if (publicKey == null || publicKey.isEmpty) {
        stderr.writeln('❌ Error: PAYSTACK_PUBLIC_KEY not set in .env file');
        exit(1);
      }

      stdout.writeln('🔧 Initializing MindPaystack SDK...');

      await MindPaystack.initialize(
        PaystackConfig(
          publicKey: publicKey,
          secretKey: secretKey,
          environment: Environment.fromString(
            env['PAYSTACK_ENVIRONMENT'] ?? 'test',
          ),
          logLevel: LogLevel.fromString(env['PAYSTACK_LOG_LEVEL'] ?? 'info'),
        ),
      );

      stdout.writeln('✅ SDK initialized successfully!');
      return const ChargeTerminal();
    } on MindException catch (e) {
      stderr.writeln('❌ Failed to initialize SDK: ${e.message}');
      stderr.writeln('Code: ${e.code}');
      exit(1);
    } catch (e) {
      stderr.writeln('❌ Unexpected error during initialization: $e');
      exit(1);
    }
  }

  /// Runs an interactive terminal session for charge operations.
  ///
  /// Displays a menu of available operations and handles user input
  /// to perform various charge-related tasks.
  Future<void> runInteractiveSession() async {
    stdout.writeln('\n🚀 MindPaystack Charge Terminal');
    stdout.writeln('================================');

    while (true) {
      _showMenu();
      stdout.write('Enter your choice (1-12, q to quit): ');

      final input = stdin.readLineSync()?.trim() ?? '';

      try {
        switch (input.toLowerCase()) {
          case '1':
            await _createCardCharge();
            break;
          case '2':
            await _createBankTransferCharge();
            break;
          case '3':
            await _createUssdCharge();
            break;
          case '4':
            await _createMobileMoneyCharge();
            break;
          case '5':
            await _createQrCharge();
            break;
          case '6':
            await _createSavedCardCharge();
            break;
          case '7':
            await _submitPin();
            break;
          case '8':
            await _submitOtp();
            break;
          case '9':
            await _submitPhone();
            break;
          case '10':
            await _submitBirthday();
            break;
          case '11':
            await _submitAddress();
            break;
          case '12':
            await _checkPendingCharge();
            break;
          case 'q':
          case 'quit':
            stdout.writeln('\n👋 Goodbye!');
            return;
          default:
            stdout.writeln('❌ Invalid choice. Please try again.\n');
        }
      } catch (e) {
        stderr.writeln('❌ Error: $e\n');
      }

      stdout.writeln('Press Enter to continue...');
      stdin.readLineSync();
    }
  }

  void _showMenu() {
    stdout.writeln('\n📋 Available Operations:');
    stdout.writeln('');
    stdout.writeln('💳 CREATE CHARGES:');
    stdout.writeln('1. Create Card Charge');
    stdout.writeln('2. Create Bank Transfer Charge');
    stdout.writeln('3. Create USSD Charge');
    stdout.writeln('4. Create Mobile Money Charge');
    stdout.writeln('5. Create QR Code Charge');
    stdout.writeln('6. Create Saved Card Charge');
    stdout.writeln('');
    stdout.writeln('🔐 SUBMIT AUTHORIZATION:');
    stdout.writeln('7. Submit PIN');
    stdout.writeln('8. Submit OTP');
    stdout.writeln('9. Submit Phone');
    stdout.writeln('10. Submit Birthday');
    stdout.writeln('11. Submit Address');
    stdout.writeln('');
    stdout.writeln('📊 STATUS CHECK:');
    stdout.writeln('12. Check Pending Charge');
    stdout.writeln('q. Quit');
    stdout.writeln('');
  }

  /// Creates a charge with card details.
  Future<void> _createCardCharge() async {
    stdout.writeln('\n💳 Create Card Charge');
    stdout.writeln('====================');

    // Get charge details
    stdout.write('Customer email: ');
    final email = stdin.readLineSync()?.trim() ?? '';
    if (email.isEmpty) {
      stdout.writeln('❌ Email is required');
      return;
    }

    stdout.write('Amount (in kobo, e.g., 50000 for ₦500): ');
    final amountInput = stdin.readLineSync()?.trim() ?? '';
    final amount = int.tryParse(amountInput);
    if (amount == null || amount <= 0) {
      stdout.writeln('❌ Invalid amount');
      return;
    }

    // Get card details
    stdout.writeln('\n💳 Card Details:');
    stdout.write('Card number (e.g., 4084084084084081 for test): ');
    final cardNumber = stdin.readLineSync()?.trim() ?? '';

    stdout.write('CVV: ');
    final cvv = stdin.readLineSync()?.trim() ?? '';

    stdout.write('Expiry month (MM): ');
    final expiryMonth = stdin.readLineSync()?.trim() ?? '';

    stdout.write('Expiry year (YYYY): ');
    final expiryYear = stdin.readLineSync()?.trim() ?? '';

    stdout.write('PIN (optional, for debit cards): ');
    final pin = stdin.readLineSync()?.trim();

    // Create and validate card
    final card = Card(
      number: cardNumber,
      cvv: cvv,
      expiryMonth: expiryMonth,
      expiryYear: expiryYear,
      pin: pin?.isEmpty == true ? null : pin,
    );

    stdout.writeln('\n🔍 Validating card details...');
    stdout.writeln('Card Type: ${card.cardType.toUpperCase()}');
    stdout.writeln('Last 4 Digits: ****${card.last4}');
    stdout.writeln('Valid Number: ${card.isValidNumber}');
    stdout.writeln('Not Expired: ${card.isNotExpired}');
    stdout.writeln('Valid CVV: ${card.isValidCvv}');
    stdout.writeln('Overall Valid: ${card.isValid}');

    if (!card.isValid) {
      stdout.writeln('❌ Card validation failed. Please check your details.');
      return;
    }

    try {
      final reference = 'charge_${DateTime.now().millisecondsSinceEpoch}';

      stdout.writeln('\n🔄 Creating charge...');
      stdout.writeln('Email: $email');
      stdout.writeln('Amount: ₦${(amount / 100).toStringAsFixed(2)}');
      stdout.writeln('Reference: $reference');
      stdout.writeln('Card: ${card.cardType.toUpperCase()} ****${card.last4}');

      final response = await MindPaystack.instance.charge.createCharge(
        CreateChargeOptions(
          amount: amount.toString(),
          email: email,
          reference: reference,
          card: card,
        ),
      );

      _displayChargeResponse('Create Charge', response);
    } on MindException catch (e) {
      stderr.writeln('❌ MindPaystack Error: ${e.message}');
      stderr.writeln('Code: ${e.code}');
    } catch (e) {
      stderr.writeln('❌ Unexpected error: $e');
    }
  }

  /// Creates a bank transfer charge.
  Future<void> _createBankTransferCharge() async {
    stdout.writeln('\n🏦 Create Bank Transfer Charge');
    stdout.writeln('==============================');

    // Get charge details
    stdout.write('Customer email: ');
    final email = stdin.readLineSync()?.trim() ?? '';
    if (email.isEmpty) {
      stdout.writeln('❌ Email is required');
      return;
    }

    stdout.write('Amount (in kobo, e.g., 50000 for ₦500): ');
    final amountInput = stdin.readLineSync()?.trim() ?? '';
    final amount = int.tryParse(amountInput);
    if (amount == null || amount <= 0) {
      stdout.writeln('❌ Invalid amount');
      return;
    }

    stdout.write('Account expiry (optional, YYYY-MM-DD HH:MM:SS): ');
    final expiryInput = stdin.readLineSync()?.trim();
    DateTime? accountExpiresAt;
    if (expiryInput != null && expiryInput.isNotEmpty) {
      try {
        accountExpiresAt = DateTime.parse(expiryInput);
      } catch (e) {
        stdout.writeln('⚠️ Invalid date format, using default expiry');
      }
    }

    try {
      final reference = 'transfer_${DateTime.now().millisecondsSinceEpoch}';

      stdout.writeln('\n🔄 Creating bank transfer charge...');
      stdout.writeln('Email: $email');
      stdout.writeln('Amount: ₦${(amount / 100).toStringAsFixed(2)}');
      stdout.writeln('Reference: $reference');

      if (accountExpiresAt != null) {
        stdout.writeln('Account expires: $accountExpiresAt');
      }

      final response = await MindPaystack.instance.charge.createCharge(
        CreateChargeOptions(
          amount: amount.toString(),
          email: email,
          reference: reference,
          bankTransfer: BankTransfer(accountExpiresAt: accountExpiresAt),
        ),
      );

      _displayChargeResponse('Create Bank Transfer Charge', response);
    } on MindException catch (e) {
      stderr.writeln('❌ MindPaystack Error: ${e.message}');
      stderr.writeln('Code: ${e.code}');
    } catch (e) {
      stderr.writeln('❌ Unexpected error: $e');
    }
  }

  /// Creates a USSD charge.
  Future<void> _createUssdCharge() async {
    stdout.writeln('\n📱 Create USSD Charge');
    stdout.writeln('=====================');

    // Get charge details
    stdout.write('Customer email: ');
    final email = stdin.readLineSync()?.trim() ?? '';
    if (email.isEmpty) {
      stdout.writeln('❌ Email is required');
      return;
    }

    stdout.write('Amount (in kobo, e.g., 50000 for ₦500): ');
    final amountInput = stdin.readLineSync()?.trim() ?? '';
    final amount = int.tryParse(amountInput);
    if (amount == null || amount <= 0) {
      stdout.writeln('❌ Invalid amount');
      return;
    }

    stdout.writeln('\n📞 Available USSD Types:');
    stdout.writeln('1. GTB (*737#)');
    stdout.writeln('2. Zenith (*966#)');
    stdout.writeln('3. UBA (*919#)');
    stdout.writeln('4. Custom USSD code');
    stdout.write('Select USSD type (1-4): ');

    final typeChoice = stdin.readLineSync()?.trim() ?? '';
    String ussdType;

    switch (typeChoice) {
      case '1':
        ussdType = '*737#';
        break;
      case '2':
        ussdType = '*966#';
        break;
      case '3':
        ussdType = '*919#';
        break;
      case '4':
        stdout.write('Enter USSD code (e.g., *123#): ');
        ussdType = stdin.readLineSync()?.trim() ?? '';
        if (ussdType.isEmpty) {
          stdout.writeln('❌ USSD code is required');
          return;
        }
        break;
      default:
        stdout.writeln('❌ Invalid choice');
        return;
    }

    try {
      final reference = 'ussd_${DateTime.now().millisecondsSinceEpoch}';

      stdout.writeln('\n🔄 Creating USSD charge...');
      stdout.writeln('Email: $email');
      stdout.writeln('Amount: ₦${(amount / 100).toStringAsFixed(2)}');
      stdout.writeln('Reference: $reference');
      stdout.writeln('USSD Type: $ussdType');

      final response = await MindPaystack.instance.charge.createCharge(
        CreateChargeOptions(
          amount: amount.toString(),
          email: email,
          reference: reference,
          ussd: Ussd(type: ussdType),
        ),
      );

      _displayChargeResponse('Create USSD Charge', response);
    } on MindException catch (e) {
      stderr.writeln('❌ MindPaystack Error: ${e.message}');
      stderr.writeln('Code: ${e.code}');
    } catch (e) {
      stderr.writeln('❌ Unexpected error: $e');
    }
  }

  /// Creates a mobile money charge.
  Future<void> _createMobileMoneyCharge() async {
    stdout.writeln('\n💰 Create Mobile Money Charge');
    stdout.writeln('=============================');

    // Get charge details
    stdout.write('Customer email: ');
    final email = stdin.readLineSync()?.trim() ?? '';
    if (email.isEmpty) {
      stdout.writeln('❌ Email is required');
      return;
    }

    stdout.write('Amount (in kobo, e.g., 50000 for ₦500): ');
    final amountInput = stdin.readLineSync()?.trim() ?? '';
    final amount = int.tryParse(amountInput);
    if (amount == null || amount <= 0) {
      stdout.writeln('❌ Invalid amount');
      return;
    }

    stdout.writeln('\n📱 Available Mobile Money Providers:');
    stdout.writeln('🇬🇭 Ghana:');
    stdout.writeln('  1. MTN Mobile Money (mtn)');
    stdout.writeln('  2. Vodafone Cash (vodafone)');
    stdout.writeln('  3. AirtelTigo Money (airtel-tigo)');
    stdout.writeln('🇰🇪 Kenya:');
    stdout.writeln('  4. M-Pesa (mpesa)');
    stdout.writeln('  5. Custom provider');
    stdout.write('Select provider (1-5): ');

    final providerChoice = stdin.readLineSync()?.trim() ?? '';
    String provider;

    switch (providerChoice) {
      case '1':
        provider = 'mtn';
        break;
      case '2':
        provider = 'vodafone';
        break;
      case '3':
        provider = 'airtel-tigo';
        break;
      case '4':
        provider = 'mpesa';
        break;
      case '5':
        stdout.write('Enter provider name: ');
        provider = stdin.readLineSync()?.trim() ?? '';
        if (provider.isEmpty) {
          stdout.writeln('❌ Provider name is required');
          return;
        }
        break;
      default:
        stdout.writeln('❌ Invalid choice');
        return;
    }

    stdout.write('Mobile number (with country code, e.g., +233123456789): ');
    final phone = stdin.readLineSync()?.trim() ?? '';
    if (phone.isEmpty) {
      stdout.writeln('❌ Phone number is required');
      return;
    }

    try {
      final reference = 'momo_${DateTime.now().millisecondsSinceEpoch}';

      stdout.writeln('\n🔄 Creating mobile money charge...');
      stdout.writeln('Email: $email');
      stdout.writeln('Amount: ₦${(amount / 100).toStringAsFixed(2)}');
      stdout.writeln('Reference: $reference');
      stdout.writeln('Provider: $provider');
      stdout.writeln('Phone: $phone');

      final response = await MindPaystack.instance.charge.createCharge(
        CreateChargeOptions(
          amount: amount.toString(),
          email: email,
          reference: reference,
          mobileMoney: MobileMoney(provider: provider, phone: phone),
        ),
      );

      _displayChargeResponse('Create Mobile Money Charge', response);
    } on MindException catch (e) {
      stderr.writeln('❌ MindPaystack Error: ${e.message}');
      stderr.writeln('Code: ${e.code}');
    } catch (e) {
      stderr.writeln('❌ Unexpected error: $e');
    }
  }

  /// Creates a QR code charge.
  Future<void> _createQrCharge() async {
    stdout.writeln('\n🔲 Create QR Code Charge');
    stdout.writeln('========================');

    // Get charge details
    stdout.write('Customer email: ');
    final email = stdin.readLineSync()?.trim() ?? '';
    if (email.isEmpty) {
      stdout.writeln('❌ Email is required');
      return;
    }

    stdout.write('Amount (in kobo, e.g., 50000 for ₦500): ');
    final amountInput = stdin.readLineSync()?.trim() ?? '';
    final amount = int.tryParse(amountInput);
    if (amount == null || amount <= 0) {
      stdout.writeln('❌ Invalid amount');
      return;
    }

    stdout.writeln('\n🔲 Available QR Providers:');
    stdout.writeln('1. Scan to Pay');
    stdout.writeln('2. Visa QR');
    stdout.writeln('3. Custom provider');
    stdout.write('Select provider (1-3): ');

    final providerChoice = stdin.readLineSync()?.trim() ?? '';
    String provider;

    switch (providerChoice) {
      case '1':
        provider = 'scan-to-pay';
        break;
      case '2':
        provider = 'visa';
        break;
      case '3':
        stdout.write('Enter provider name: ');
        provider = stdin.readLineSync()?.trim() ?? '';
        if (provider.isEmpty) {
          stdout.writeln('❌ Provider name is required');
          return;
        }
        break;
      default:
        stdout.writeln('❌ Invalid choice');
        return;
    }

    try {
      final reference = 'qr_${DateTime.now().millisecondsSinceEpoch}';

      stdout.writeln('\n🔄 Creating QR code charge...');
      stdout.writeln('Email: $email');
      stdout.writeln('Amount: ₦${(amount / 100).toStringAsFixed(2)}');
      stdout.writeln('Reference: $reference');
      stdout.writeln('Provider: $provider');

      final response = await MindPaystack.instance.charge.createCharge(
        CreateChargeOptions(
          amount: amount.toString(),
          email: email,
          reference: reference,
          qr: Qr(provider: provider),
        ),
      );

      _displayChargeResponse('Create QR Code Charge', response);
    } on MindException catch (e) {
      stderr.writeln('❌ MindPaystack Error: ${e.message}');
      stderr.writeln('Code: ${e.code}');
    } catch (e) {
      stderr.writeln('❌ Unexpected error: $e');
    }
  }

  /// Creates a charge using a saved card authorization code.
  Future<void> _createSavedCardCharge() async {
    stdout.writeln('\n💾 Create Saved Card Charge');
    stdout.writeln('===========================');

    // Get charge details
    stdout.write('Customer email: ');
    final email = stdin.readLineSync()?.trim() ?? '';
    if (email.isEmpty) {
      stdout.writeln('❌ Email is required');
      return;
    }

    stdout.write('Amount (in kobo, e.g., 50000 for ₦500): ');
    final amountInput = stdin.readLineSync()?.trim() ?? '';
    final amount = int.tryParse(amountInput);
    if (amount == null || amount <= 0) {
      stdout.writeln('❌ Invalid amount');
      return;
    }

    stdout.write('Authorization code (from previous successful charge): ');
    final authCode = stdin.readLineSync()?.trim() ?? '';
    if (authCode.isEmpty) {
      stdout.writeln('❌ Authorization code is required');
      return;
    }

    try {
      final reference = 'auth_${DateTime.now().millisecondsSinceEpoch}';

      stdout.writeln('\n🔄 Creating saved card charge...');
      stdout.writeln('Email: $email');
      stdout.writeln('Amount: ₦${(amount / 100).toStringAsFixed(2)}');
      stdout.writeln('Reference: $reference');
      stdout.writeln('Authorization: ${authCode.substring(0, 8)}...');

      final response = await MindPaystack.instance.charge.createCharge(
        CreateChargeOptions(
          amount: amount.toString(),
          email: email,
          reference: reference,
          authorizationCode: authCode,
        ),
      );

      _displayChargeResponse('Create Saved Card Charge', response);
    } on MindException catch (e) {
      stderr.writeln('❌ MindPaystack Error: ${e.message}');
      stderr.writeln('Code: ${e.code}');
    } catch (e) {
      stderr.writeln('❌ Unexpected error: $e');
    }
  }

  /// Submits PIN for charge authorization.
  Future<void> _submitPin() async {
    stdout.writeln('\n🔢 Submit PIN');
    stdout.writeln('=============');

    stdout.write('Charge reference: ');
    final reference = stdin.readLineSync()?.trim() ?? '';
    if (reference.isEmpty) {
      stdout.writeln('❌ Reference is required');
      return;
    }

    stdout.write('PIN: ');
    final pin = stdin.readLineSync()?.trim() ?? '';
    if (pin.isEmpty) {
      stdout.writeln('❌ PIN is required');
      return;
    }

    try {
      stdout.writeln('\n🔄 Submitting PIN...');

      final response = await MindPaystack.instance.charge.submitPin(
        SubmitPinOptions(reference: reference, pin: pin),
      );

      _displayChargeResponse('Submit PIN', response);
    } on MindException catch (e) {
      stderr.writeln('❌ MindPaystack Error: ${e.message}');
      stderr.writeln('Code: ${e.code}');
    } catch (e) {
      stderr.writeln('❌ Unexpected error: $e');
    }
  }

  /// Submits OTP for charge authorization.
  Future<void> _submitOtp() async {
    stdout.writeln('\n📱 Submit OTP');
    stdout.writeln('=============');

    stdout.write('Charge reference: ');
    final reference = stdin.readLineSync()?.trim() ?? '';
    if (reference.isEmpty) {
      stdout.writeln('❌ Reference is required');
      return;
    }

    stdout.write('OTP: ');
    final otp = stdin.readLineSync()?.trim() ?? '';
    if (otp.isEmpty) {
      stdout.writeln('❌ OTP is required');
      return;
    }

    try {
      stdout.writeln('\n🔄 Submitting OTP...');

      final response = await MindPaystack.instance.charge.submitOtp(
        SubmitOtpOptions(reference: reference, otp: otp),
      );

      _displayChargeResponse('Submit OTP', response);
    } on MindException catch (e) {
      stderr.writeln('❌ MindPaystack Error: ${e.message}');
      stderr.writeln('Code: ${e.code}');
    } catch (e) {
      stderr.writeln('❌ Unexpected error: $e');
    }
  }

  /// Submits phone number for charge authorization.
  Future<void> _submitPhone() async {
    stdout.writeln('\n📞 Submit Phone');
    stdout.writeln('===============');

    stdout.write('Charge reference: ');
    final reference = stdin.readLineSync()?.trim() ?? '';
    if (reference.isEmpty) {
      stdout.writeln('❌ Reference is required');
      return;
    }

    stdout.write('Phone number: ');
    final phone = stdin.readLineSync()?.trim() ?? '';
    if (phone.isEmpty) {
      stdout.writeln('❌ Phone number is required');
      return;
    }

    try {
      stdout.writeln('\n🔄 Submitting phone number...');

      final response = await MindPaystack.instance.charge.submitPhone(
        SubmitPhoneOptions(reference: reference, phone: phone),
      );

      _displayChargeResponse('Submit Phone', response);
    } on MindException catch (e) {
      stderr.writeln('❌ MindPaystack Error: ${e.message}');
      stderr.writeln('Code: ${e.code}');
    } catch (e) {
      stderr.writeln('❌ Unexpected error: $e');
    }
  }

  /// Submits birthday for charge authorization.
  Future<void> _submitBirthday() async {
    stdout.writeln('\n🎂 Submit Birthday');
    stdout.writeln('==================');

    stdout.write('Charge reference: ');
    final reference = stdin.readLineSync()?.trim() ?? '';
    if (reference.isEmpty) {
      stdout.writeln('❌ Reference is required');
      return;
    }

    stdout.write('Birthday (YYYY-MM-DD): ');
    final birthday = stdin.readLineSync()?.trim() ?? '';
    if (birthday.isEmpty) {
      stdout.writeln('❌ Birthday is required');
      return;
    }

    try {
      stdout.writeln('\n🔄 Submitting birthday...');

      final response = await MindPaystack.instance.charge.submitBirthday(
        SubmitBirthdayOptions(reference: reference, birthday: birthday),
      );

      _displayChargeResponse('Submit Birthday', response);
    } on MindException catch (e) {
      stderr.writeln('❌ MindPaystack Error: ${e.message}');
      stderr.writeln('Code: ${e.code}');
    } catch (e) {
      stderr.writeln('❌ Unexpected error: $e');
    }
  }

  /// Submits address for charge authorization.
  Future<void> _submitAddress() async {
    stdout.writeln('\n🏠 Submit Address');
    stdout.writeln('=================');

    stdout.write('Charge reference: ');
    final reference = stdin.readLineSync()?.trim() ?? '';
    if (reference.isEmpty) {
      stdout.writeln('❌ Reference is required');
      return;
    }

    stdout.write('Address: ');
    final address = stdin.readLineSync()?.trim() ?? '';
    if (address.isEmpty) {
      stdout.writeln('❌ Address is required');
      return;
    }

    stdout.write('City: ');
    final city = stdin.readLineSync()?.trim() ?? '';
    if (city.isEmpty) {
      stdout.writeln('❌ City is required');
      return;
    }

    stdout.write('State: ');
    final state = stdin.readLineSync()?.trim() ?? '';
    if (state.isEmpty) {
      stdout.writeln('❌ State is required');
      return;
    }

    stdout.write('ZIP Code: ');
    final zipCode = stdin.readLineSync()?.trim() ?? '';
    if (zipCode.isEmpty) {
      stdout.writeln('❌ ZIP code is required');
      return;
    }

    try {
      stdout.writeln('\n🔄 Submitting address...');

      final response = await MindPaystack.instance.charge.submitAddress(
        SubmitAddressOptions(
          reference: reference,
          address: address,
          city: city,
          state: state,
          zipcode: zipCode,
        ),
      );

      _displayChargeResponse('Submit Address', response);
    } on MindException catch (e) {
      stderr.writeln('❌ MindPaystack Error: ${e.message}');
      stderr.writeln('Code: ${e.code}');
    } catch (e) {
      stderr.writeln('❌ Unexpected error: $e');
    }
  }

  /// Checks the status of a pending charge.
  Future<void> _checkPendingCharge() async {
    stdout.writeln('\n🔍 Check Pending Charge');
    stdout.writeln('=======================');

    stdout.write('Charge reference: ');
    final reference = stdin.readLineSync()?.trim() ?? '';
    if (reference.isEmpty) {
      stdout.writeln('❌ Reference is required');
      return;
    }

    try {
      stdout.writeln('\n🔄 Checking charge status...');

      final response = await MindPaystack.instance.charge.checkPendingCharge(
        CheckPendingChargeOptions(reference: reference),
      );

      _displayChargeResponse('Check Pending Charge', response);
    } on MindException catch (e) {
      stderr.writeln('❌ MindPaystack Error: ${e.message}');
      stderr.writeln('Code: ${e.code}');
    } catch (e) {
      stderr.writeln('❌ Unexpected error: $e');
    }
  }

  /// Displays a formatted charge response.
  void _displayChargeResponse(String operation, Resource<ChargeData> response) {
    stdout.writeln('\n📊 $operation Result');
    stdout.writeln('=${'=' * operation.length}=======');
    stdout.writeln('Status: ${response.status}');
    stdout.writeln('Message: ${response.message}');

    if (response.data != null) {
      final data = response.data!;
      stdout.writeln('\n💰 Charge Details:');
      stdout.writeln('Reference: ${data.reference}');
      stdout.writeln('Amount: ₦${(data.amount / 100).toStringAsFixed(2)}');
      stdout.writeln('Currency: ${data.currency}');
      stdout.writeln('Status: ${data.status}');
      stdout.writeln('Gateway Response: ${data.gatewayResponse}');

      if (data.customer != null) {
        stdout.writeln('Customer: ${data.customer.email}');
        stdout.writeln(data.toJson());
      }

      if (data.status == 'success') {
        stdout.writeln('✅ Charge completed successfully!');
      } else if (data.status == 'pending') {
        stdout.writeln('⏳ Charge is pending further action');
        stdout.writeln('💡 You may need to submit additional information');
      } else {
        stdout.writeln('❌ Charge failed or requires action');
      }
    } else {
      stdout.writeln('❌ No charge data received');
    }
  }
}
