import 'package:dart_mappable/dart_mappable.dart';
import 'package:mind_paystack/src/core/models/src/bank.dart';
import 'package:mind_paystack/src/core/models/src/bank_transfer.dart';
import 'package:mind_paystack/src/core/models/src/card.dart';
import 'package:mind_paystack/src/core/models/src/mobile_money.dart';
import 'package:mind_paystack/src/core/models/src/payment_metadata.dart';
import 'package:mind_paystack/src/core/models/src/qr.dart';
import 'package:mind_paystack/src/core/models/src/ussd.dart';
import 'package:mind_paystack/src/features/charge/models/options/src/charge_options.dart';
part 'create_charge_options.mapper.dart';

/// Comprehensive options for creating a new charge transaction with Paystack.
///
/// This class encapsulates all the parameters needed to initiate a payment
/// charge using various payment methods supported by Paystack. It provides
/// flexibility to handle different payment scenarios including card payments,
/// bank transfers, USSD, mobile money, and QR code payments.
///
/// The charge creation supports:
/// - Multiple payment channels (card, bank, USSD, mobile money, QR)
/// - Split payments with subaccounts
/// - Transaction charge allocation
/// - Payment metadata for post-processing
/// - Authorization code reuse for returning customers
///
/// Basic usage:
/// ```dart
/// final options = CreateChargeOptions(
///   email: 'customer@example.com',
///   amount: '50000', // ₦500.00 in kobo
///   reference: 'TXN_${DateTime.now().millisecondsSinceEpoch}',
/// );
/// ```
///
/// Card payment with card details:
/// ```dart
/// final cardOptions = CreateChargeOptions(
///   email: 'customer@example.com',
///   amount: '50000',
///   card: Card(
///     number: '4084084084084081',
///     cvv: '123',
///     expiryMonth: '12',
///     expiryYear: '2025',
///     pin: '1234', // For debit cards
///   ),
/// );
/// ```
///
/// Saved card payment:
/// ```dart
/// final savedCardOptions = CreateChargeOptions(
///   email: 'customer@example.com',
///   amount: '50000',
///   authorizationCode: 'AUTH_CODE_123',
/// );
/// ```
///
/// Bank transfer payment:
/// ```dart
/// final transferOptions = CreateChargeOptions(
///   email: 'customer@example.com',
///   amount: '50000',
///   bankTransfer: BankTransfer(
///     account_expires_at: '2024-12-31T23:59:59Z',
///   ),
/// );
/// ```
@MappableClass()
class CreateChargeOptions with CreateChargeOptionsMappable {
  /// Creates comprehensive options for initiating a new charge transaction.
  ///
  /// Parameters:
  /// - [email]: Customer's email address (required)
  /// - [amount]: Amount in smallest currency unit as string (required)
  /// - [splitCode]: Code for pre-configured payment split (optional)
  /// - [subaccount]: Subaccount code for payment routing (optional)
  /// - [transactionCharge]: Custom transaction charge override (optional)
  /// - [bearer]: Who bears the transaction fees (optional)
  /// - [card]: Card details for new card payments (optional)
  /// - [bank]: Bank account details for direct debit (optional)
  /// - [bankTransfer]: Bank transfer payment configuration (optional)
  /// - [ussd]: USSD payment channel settings (optional)
  /// - [mobileMoney]: Mobile money payment details (optional)
  /// - [qr]: QR code payment provider settings (optional)
  /// - [authorizationCode]: Saved payment method authorization (optional)
  /// - [pin]: PIN for card or bank authentication (optional)
  /// - [metadata]: Additional payment metadata (optional)
  /// - [reference]: Unique transaction reference (optional)
  /// - [deviceId]: Customer device identifier (optional)
  const CreateChargeOptions({
    required this.email,
    required this.amount,
    this.splitCode,
    this.subaccount,
    this.transactionCharge,
    this.bearer,
    this.card,
    this.bank,
    this.bankTransfer,
    this.ussd,
    this.mobileMoney,
    this.qr,
    this.authorizationCode,
    this.pin,
    this.metadata,
    this.reference,
    this.deviceId,
  });

  /// Customer's email address for the charge transaction.
  ///
  /// This email is used for transaction receipts, notifications,
  /// and customer identification within the Paystack system.
  /// Must be a valid email format.
  final String email;

  /// Amount to charge in the smallest currency unit as a string.
  ///
  /// The amount should be specified in the smallest denomination
  /// of the currency being used:
  /// - For NGN: amount in kobo (e.g., '50000' for ₦500.00)
  /// - For USD: amount in cents (e.g., '1000' for $10.00)
  /// - For GHS: amount in pesewas (e.g., '500' for GH₵5.00)
  final String amount;

  /// Split code from a previously created payment split configuration.
  ///
  /// When provided, this enables automatic splitting of the payment
  /// according to the predefined split rules. Use this for
  /// marketplace scenarios where payments need to be distributed
  /// among multiple parties.
  final String? splitCode;

  /// Code identifying the subaccount that should receive this payment.
  ///
  /// Subaccounts allow you to route payments to different settlement
  /// accounts. Useful for marketplace applications where different
  /// vendors need to receive their portion of payments.
  final String? subaccount;

  /// Custom transaction charge amount to override the default split.
  ///
  /// When using subaccounts, this allows you to specify a fixed
  /// charge amount instead of using the percentage-based split
  /// configuration. Amount should be in the smallest currency unit.
  final int? transactionCharge;

  /// Specifies who bears the Paystack transaction charges.
  ///
  /// Allowed values:
  /// - 'account': Main account bears all charges
  /// - 'subaccount': Subaccount bears the charges
  ///
  /// Only relevant when using subaccounts for payment splitting.
  final String? bearer;

  /// Card details for processing card payments.
  ///
  /// Provide this when charging a new card that hasn't been saved before.
  /// Contains the card number, CVV, expiry date, and optional PIN for
  /// debit cards. Use this for first-time card payments or when you want
  /// to collect card details directly in your app.
  ///
  /// Alternative: Use [authorizationCode] for saved cards instead.
  ///
  /// Example:
  /// ```dart
  /// card: Card(
  ///   number: '4084084084084081',
  ///   cvv: '123',
  ///   expiryMonth: '12',
  ///   expiryYear: '2025',
  ///   pin: '1234', // For debit cards
  /// )
  /// ```
  final Card? card;

  /// Bank account details for direct debit transactions.
  ///
  /// Use this when charging a customer's bank account directly.
  /// Contains account number, bank code, and other required
  /// information for bank account debits.
  final BankDetails? bank;

  /// Configuration for bank transfer payment channel.
  ///
  /// When provided, this enables the bank transfer payment option
  /// where customers can transfer money to a generated account number.
  /// Useful for high-value transactions or customers who prefer
  /// bank transfers over card payments.
  @MappableField(key: 'bank_transfer')
  final BankTransfer? bankTransfer;

  /// USSD payment channel configuration.
  ///
  /// Enables USSD-based payments where customers dial a code
  /// on their mobile phones to complete the payment. Popular
  /// in markets with high mobile phone penetration but limited
  /// internet connectivity.
  final Ussd? ussd;

  /// Mobile money payment configuration for Ghana and Kenya.
  ///
  /// Enables mobile money payments through services like MTN Mobile
  /// Money, Vodafone Cash (Ghana), or M-Pesa (Kenya). Only available
  /// in supported countries with mobile money infrastructure.
  @MappableField(key: 'mobile_money')
  final MobileMoney? mobileMoney;

  /// QR code payment provider configuration.
  ///
  /// Enables QR code-based payments where customers scan a code
  /// with their mobile banking app to complete the transaction.
  /// Supports various QR payment providers based on the market.
  final Qr? qr;

  /// Authorization code from a previously saved payment method.
  ///
  /// Use this to charge a customer using their previously saved
  /// card or payment method. This enables one-click payments for
  /// returning customers without requiring them to re-enter
  /// their payment details.
  final String? authorizationCode;

  /// 4-digit PIN for card or bank account authentication.
  ///
  /// Required when using certain payment methods like debit cards
  /// or bank accounts that require PIN verification. Should be
  /// collected securely from the customer during the payment flow.
  final String? pin;

  /// Additional metadata for post-payment processing and tracking.
  ///
  /// Custom data that can be attached to the transaction for your
  /// own record-keeping, analytics, or post-payment processing.
  /// This data is returned in webhooks and transaction queries.
  final PaymentMetadata? metadata;

  /// Unique reference identifier for this transaction.
  ///
  /// If not provided, Paystack will generate one automatically.
  /// Use this to implement idempotency and prevent duplicate
  /// charges. Should be unique across all your transactions.
  final String? reference;

  /// Unique identifier for the customer's device making the payment.
  ///
  /// Helps with fraud detection and risk assessment by tracking
  /// the device used for the transaction. Can be a device fingerprint,
  /// UUID, or other unique device identifier.
  final String? deviceId;

  /// Creates charge options for card payments
  ///
  /// This factory method simplifies creating charge options when you want
  /// to charge a card with specific card details. Perfect for first-time
  /// card payments or when collecting card details directly.
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
  /// Example:
  /// ```dart
  /// final options = CreateChargeOptions.forCard(
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
  @Deprecated('forCard method is deprecated due to PCI DSS compliance '
      'requirements and will be removed in a future version')
  static CreateChargeOptions forCard({
    required String email,
    required String amount,
    required Card card,
    String? pin,
    String? reference,
    PaymentMetadata? metadata,
    String? deviceId,
  }) {
    return CreateChargeOptions(
      email: email,
      amount: amount,
      card: card,
      pin: pin,
      reference: reference,
      metadata: metadata,
      deviceId: deviceId,
    );
  }

  /// Creates charge options for bank transfer payments
  ///
  /// This factory method sets up a charge for bank transfer payments,
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
  /// Example:
  /// ```dart
  /// final options = CreateChargeOptions.forBankTransfer(
  ///   email: 'customer@example.com',
  ///   amount: '50000',
  ///   bankTransfer: BankTransfer(
  ///     accountExpiresAt: DateTime.now().add(Duration(hours: 24)),
  ///   ),
  /// );
  /// ```
  static CreateChargeOptions forBankTransfer({
    required String email,
    required String amount,
    BankTransfer? bankTransfer,
    String? reference,
    PaymentMetadata? metadata,
  }) {
    return CreateChargeOptions(
      email: email,
      amount: amount,
      bankTransfer: bankTransfer ?? const BankTransfer(),
      reference: reference,
      metadata: metadata,
    );
  }

  /// Creates charge options for saved card payments
  ///
  /// This factory method enables charging customers using their previously
  /// saved payment method via authorization code. Perfect for returning
  /// customers and one-click payment experiences.
  ///
  /// Parameters:
  /// - [email]: Customer's email address
  /// - [amount]: Amount in smallest currency unit
  /// - [authorizationCode]: Authorization code from previous transaction
  /// - [reference]: Optional unique transaction reference
  /// - [metadata]: Optional additional data for tracking
  ///
  /// Example:
  /// ```dart
  /// final options = CreateChargeOptions.forSavedCard(
  ///   email: 'customer@example.com',
  ///   amount: '50000',
  ///   authorizationCode: 'AUTH_abc123def',
  /// );
  /// ```
  static CreateChargeOptions forSavedCard({
    required String email,
    required String amount,
    required String authorizationCode,
    String? reference,
    PaymentMetadata? metadata,
  }) {
    return CreateChargeOptions(
      email: email,
      amount: amount,
      authorizationCode: authorizationCode,
      reference: reference,
      metadata: metadata,
    );
  }

  /// Creates charge options for mobile money payments
  ///
  /// This factory method sets up charges for mobile money payments,
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
  /// Example:
  /// ```dart
  /// final options = CreateChargeOptions.forMobileMoney(
  ///   email: 'customer@example.com',
  ///   amount: '50000',
  ///   mobileMoney: MobileMoney(
  ///     provider: 'mtn',
  ///     phone: '+233501234567',
  ///   ),
  /// );
  /// ```
  static CreateChargeOptions forMobileMoney({
    required String email,
    required String amount,
    required MobileMoney mobileMoney,
    String? reference,
    PaymentMetadata? metadata,
  }) {
    return CreateChargeOptions(
      email: email,
      amount: amount,
      mobileMoney: mobileMoney,
      reference: reference,
      metadata: metadata,
    );
  }

  /// Creates charge options for USSD payments
  ///
  /// This factory method enables USSD-based payments where customers
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
  /// Example:
  /// ```dart
  /// final options = CreateChargeOptions.forUssd(
  ///   email: 'customer@example.com',
  ///   amount: '50000',
  ///   ussd: Ussd(type: '*737#'),
  /// );
  /// ```
  static CreateChargeOptions forUssd({
    required String email,
    required String amount,
    required Ussd ussd,
    String? reference,
    PaymentMetadata? metadata,
  }) {
    return CreateChargeOptions(
      email: email,
      amount: amount,
      ussd: ussd,
      reference: reference,
      metadata: metadata,
    );
  }

  /// Creates charge options for QR code payments
  ///
  /// This factory method sets up QR code-based payments where customers
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
  /// Example:
  /// ```dart
  /// final options = CreateChargeOptions.forQr(
  ///   email: 'customer@example.com',
  ///   amount: '50000',
  ///   qr: Qr(provider: 'scan-to-pay'),
  /// );
  /// ```
  static CreateChargeOptions forQr({
    required String email,
    required String amount,
    required Qr qr,
    String? reference,
    PaymentMetadata? metadata,
  }) {
    return CreateChargeOptions(
      email: email,
      amount: amount,
      qr: qr,
      reference: reference,
      metadata: metadata,
    );
  }

  /// Creates charge options for bank account payments
  ///
  /// This factory method enables direct debit from customer's bank account.
  /// Requires bank account details and may need additional authentication.
  ///
  /// Parameters:
  /// - [email]: Customer's email address
  /// - [amount]: Amount in smallest currency unit
  /// - [bank]: Bank account details for direct debit
  /// - [pin]: Optional PIN for authentication
  /// - [reference]: Optional unique transaction reference
  /// - [metadata]: Optional additional data for tracking
  ///
  /// Example:
  /// ```dart
  /// final options = CreateChargeOptions.forBankAccount(
  ///   email: 'customer@example.com',
  ///   amount: '50000',
  ///   bank: BankDetails(
  ///     code: '057',
  ///     accountNumber: '1234567890',
  ///   ),
  ///   pin: '1234',
  /// );
  /// ```
  static CreateChargeOptions forBankAccount({
    required String email,
    required String amount,
    required BankDetails bank,
    String? pin,
    String? reference,
    PaymentMetadata? metadata,
  }) {
    return CreateChargeOptions(
      email: email,
      amount: amount,
      bank: bank,
      pin: pin,
      reference: reference,
      metadata: metadata,
    );
  }

  /// Creates charge options from card payment options
  ///
  /// This factory method accepts a [CardOptions] object and converts
  /// it to a full [CreateChargeOptions] instance, making it easier
  /// to pass grouped parameters.
  ///
  /// Example:
  /// ```dart
  /// final cardOptions = CardOptions(
  ///   email: 'customer@example.com',
  ///   amount: '50000',
  ///   card: Card(...),
  /// );
  /// final createOptions = CreateChargeOptions.fromCardOptions(cardOptions);
  /// ```
  @Deprecated('fromCardOptions method is deprecated due to PCI DSS '
      'compliance requirements and will be removed in a future version')
  static CreateChargeOptions fromCardOptions(CardOptions options) {
    return CreateChargeOptions(
      email: options.email,
      amount: options.amount,
      card: options.card,
      pin: options.pin,
      reference: options.reference,
      metadata: options.metadata,
      deviceId: options.deviceId,
    );
  }

  /// Creates charge options from bank transfer payment options
  ///
  /// This factory method accepts a [BankTransferOptions] object and converts
  /// it to a full [CreateChargeOptions] instance.
  ///
  /// Example:
  /// ```dart
  /// final transferOptions = BankTransferOptions(
  ///   email: 'customer@example.com',
  ///   amount: '50000',
  /// );
  /// final createOptions = CreateChargeOptions.fromBankTransferOptions(transferOptions);
  /// ```
  static CreateChargeOptions fromBankTransferOptions(
      BankTransferOptions options) {
    return CreateChargeOptions(
      email: options.email,
      amount: options.amount,
      bankTransfer: options.bankTransfer,
      reference: options.reference,
      metadata: options.metadata,
    );
  }

  /// Creates charge options from saved card payment options
  ///
  /// This factory method accepts a [SavedCardOptions] object and converts
  /// it to a full [CreateChargeOptions] instance.
  ///
  /// Example:
  /// ```dart
  /// final savedCardOptions = SavedCardOptions(
  ///   email: 'customer@example.com',
  ///   amount: '50000',
  ///   authorizationCode: 'AUTH_abc123',
  /// );
  /// final createOptions = CreateChargeOptions.fromSavedCardOptions(savedCardOptions);
  /// ```
  static CreateChargeOptions fromSavedCardOptions(SavedCardOptions options) {
    return CreateChargeOptions(
      email: options.email,
      amount: options.amount,
      authorizationCode: options.authorizationCode,
      reference: options.reference,
      metadata: options.metadata,
    );
  }

  /// Creates charge options from mobile money payment options
  ///
  /// This factory method accepts a [MobileMoneyOptions] object and converts
  /// it to a full [CreateChargeOptions] instance.
  ///
  /// Example:
  /// ```dart
  /// final mobileMoneyOptions = MobileMoneyOptions(
  ///   email: 'customer@example.com',
  ///   amount: '50000',
  ///   mobileMoney: MobileMoney(provider: 'mtn', phone: '+233501234567'),
  /// );
  /// final createOptions = CreateChargeOptions.fromMobileMoneyOptions(mobileMoneyOptions);
  /// ```
  static CreateChargeOptions fromMobileMoneyOptions(
      MobileMoneyOptions options) {
    return CreateChargeOptions(
      email: options.email,
      amount: options.amount,
      mobileMoney: options.mobileMoney,
      reference: options.reference,
      metadata: options.metadata,
    );
  }

  /// Creates charge options from USSD payment options
  ///
  /// This factory method accepts a [UssdOptions] object and converts
  /// it to a full [CreateChargeOptions] instance.
  ///
  /// Example:
  /// ```dart
  /// final ussdOptions = UssdOptions(
  ///   email: 'customer@example.com',
  ///   amount: '50000',
  ///   ussd: Ussd(type: '*737#'),
  /// );
  /// final createOptions = CreateChargeOptions.fromUssdOptions(ussdOptions);
  /// ```
  static CreateChargeOptions fromUssdOptions(UssdOptions options) {
    return CreateChargeOptions(
      email: options.email,
      amount: options.amount,
      ussd: options.ussd,
      reference: options.reference,
      metadata: options.metadata,
    );
  }

  /// Creates charge options from QR code payment options
  ///
  /// This factory method accepts a [QrOptions] object and converts
  /// it to a full [CreateChargeOptions] instance.
  ///
  /// Example:
  /// ```dart
  /// final qrOptions = QrOptions(
  ///   email: 'customer@example.com',
  ///   amount: '50000',
  ///   qr: Qr(provider: 'scan-to-pay'),
  /// );
  /// final createOptions = CreateChargeOptions.fromQrOptions(qrOptions);
  /// ```
  static CreateChargeOptions fromQrOptions(QrOptions options) {
    return CreateChargeOptions(
      email: options.email,
      amount: options.amount,
      qr: options.qr,
      reference: options.reference,
      metadata: options.metadata,
    );
  }

  /// Creates charge options from bank account payment options
  ///
  /// This factory method accepts a [BankAccountOptions] object and converts
  /// it to a full [CreateChargeOptions] instance.
  ///
  /// Example:
  /// ```dart
  /// final bankAccountOptions = BankAccountOptions(
  ///   email: 'customer@example.com',
  ///   amount: '50000',
  ///   bank: BankDetails(code: '057', accountNumber: '1234567890'),
  /// );
  /// final createOptions = CreateChargeOptions.fromBankAccountOptions(bankAccountOptions);
  /// ```
  static CreateChargeOptions fromBankAccountOptions(
      BankAccountOptions options) {
    return CreateChargeOptions(
      email: options.email,
      amount: options.amount,
      bank: options.bank,
      pin: options.pin,
      reference: options.reference,
      metadata: options.metadata,
    );
  }
}
