import 'package:mind_paystack/src/core/models/src/bank.dart';
import 'package:mind_paystack/src/core/models/src/bank_transfer.dart';
import 'package:mind_paystack/src/core/models/src/card.dart';
import 'package:mind_paystack/src/core/models/src/mobile_money.dart';
import 'package:mind_paystack/src/core/models/src/payment_metadata.dart';
import 'package:mind_paystack/src/core/models/src/qr.dart';
import 'package:mind_paystack/src/core/models/src/ussd.dart';

/// Options specifically for card payment charges
///
/// This class encapsulates all parameters needed for card-based payments,
/// providing a clean interface for card charging operations.
@Deprecated('CardOptions is deprecated due to PCI DSS compliance '
    'requirements and will be removed in a future version')
class CardOptions {
  /// Creates options for card payment charges
  @Deprecated('CardOptions constructor is deprecated due to PCI DSS '
      'compliance requirements and will be removed in a future version')
  ///
  /// Parameters:
  /// - [email]: Customer's email address
  /// - [amount]: Amount in smallest currency unit
  /// - [card]: Card details for payment
  /// - [pin]: Optional PIN for debit cards
  /// - [reference]: Optional unique transaction reference
  /// - [metadata]: Optional additional payment metadata
  /// - [deviceId]: Optional device identifier for fraud detection
  const CardOptions({
    required this.email,
    required this.amount,
    required this.card,
    this.pin,
    this.reference,
    this.metadata,
    this.deviceId,
  });

  /// Customer's email address
  final String email;

  /// Amount in smallest currency unit (kobo, cents, etc.)
  final String amount;

  /// Card details including number, CVV, expiry
  final Card card;

  /// Optional PIN for debit cards
  final String? pin;

  /// Optional unique transaction reference
  final String? reference;

  /// Optional additional payment metadata
  final PaymentMetadata? metadata;

  /// Optional device identifier for fraud detection
  final String? deviceId;
}

/// Options specifically for bank transfer payment charges
///
/// This class encapsulates all parameters needed for bank transfer payments,
/// where customers transfer money to a generated account number.
class BankTransferOptions {
  /// Creates options for bank transfer payment charges
  ///
  /// Parameters:
  /// - [email]: Customer's email address
  /// - [amount]: Amount in smallest currency unit
  /// - [bankTransfer]: Optional bank transfer configuration
  /// - [reference]: Optional unique transaction reference
  /// - [metadata]: Optional additional payment metadata
  const BankTransferOptions({
    required this.email,
    required this.amount,
    this.bankTransfer,
    this.reference,
    this.metadata,
  });

  /// Customer's email address
  final String email;

  /// Amount in smallest currency unit
  final String amount;

  /// Optional bank transfer configuration
  final BankTransfer? bankTransfer;

  /// Optional unique transaction reference
  final String? reference;

  /// Optional additional payment metadata
  final PaymentMetadata? metadata;
}

/// Options specifically for saved card payment charges
///
/// This class encapsulates all parameters needed for charging previously
/// saved payment methods using authorization codes.
class SavedCardOptions {
  /// Creates options for saved card payment charges
  ///
  /// Parameters:
  /// - [email]: Customer's email address
  /// - [amount]: Amount in smallest currency unit
  /// - [authorizationCode]: Authorization code from previous transaction
  /// - [reference]: Optional unique transaction reference
  /// - [metadata]: Optional additional payment metadata
  const SavedCardOptions({
    required this.email,
    required this.amount,
    required this.authorizationCode,
    this.reference,
    this.metadata,
  });

  /// Customer's email address
  final String email;

  /// Amount in smallest currency unit
  final String amount;

  /// Authorization code from previous transaction
  final String authorizationCode;

  /// Optional unique transaction reference
  final String? reference;

  /// Optional additional payment metadata
  final PaymentMetadata? metadata;
}

/// Options specifically for mobile money payment charges
///
/// This class encapsulates all parameters needed for mobile money payments,
/// available in Ghana and Kenya.
class MobileMoneyOptions {
  /// Creates options for mobile money payment charges
  ///
  /// Parameters:
  /// - [email]: Customer's email address
  /// - [amount]: Amount in smallest currency unit
  /// - [mobileMoney]: Mobile money provider and phone details
  /// - [reference]: Optional unique transaction reference
  /// - [metadata]: Optional additional payment metadata
  const MobileMoneyOptions({
    required this.email,
    required this.amount,
    required this.mobileMoney,
    this.reference,
    this.metadata,
  });

  /// Customer's email address
  final String email;

  /// Amount in smallest currency unit
  final String amount;

  /// Mobile money provider and phone details
  final MobileMoney mobileMoney;

  /// Optional unique transaction reference
  final String? reference;

  /// Optional additional payment metadata
  final PaymentMetadata? metadata;
}

/// Options specifically for USSD payment charges
///
/// This class encapsulates all parameters needed for USSD-based payments,
/// where customers dial codes on their mobile phones.
class UssdOptions {
  /// Creates options for USSD payment charges
  ///
  /// Parameters:
  /// - [email]: Customer's email address
  /// - [amount]: Amount in smallest currency unit
  /// - [ussd]: USSD configuration with provider code
  /// - [reference]: Optional unique transaction reference
  /// - [metadata]: Optional additional payment metadata
  const UssdOptions({
    required this.email,
    required this.amount,
    required this.ussd,
    this.reference,
    this.metadata,
  });

  /// Customer's email address
  final String email;

  /// Amount in smallest currency unit
  final String amount;

  /// USSD configuration with provider code
  final Ussd ussd;

  /// Optional unique transaction reference
  final String? reference;

  /// Optional additional payment metadata
  final PaymentMetadata? metadata;
}

/// Options specifically for QR code payment charges
///
/// This class encapsulates all parameters needed for QR code-based payments,
/// where customers scan codes with their banking apps.
class QrOptions {
  /// Creates options for QR code payment charges
  ///
  /// Parameters:
  /// - [email]: Customer's email address
  /// - [amount]: Amount in smallest currency unit
  /// - [qr]: QR code provider configuration
  /// - [reference]: Optional unique transaction reference
  /// - [metadata]: Optional additional payment metadata
  const QrOptions({
    required this.email,
    required this.amount,
    required this.qr,
    this.reference,
    this.metadata,
  });

  /// Customer's email address
  final String email;

  /// Amount in smallest currency unit
  final String amount;

  /// QR code provider configuration
  final Qr qr;

  /// Optional unique transaction reference
  final String? reference;

  /// Optional additional payment metadata
  final PaymentMetadata? metadata;
}

/// Options specifically for bank account payment charges
///
/// This class encapsulates all parameters needed for direct debit
/// from customer's bank accounts.
class BankAccountOptions {
  /// Creates options for bank account payment charges
  ///
  /// Parameters:
  /// - [email]: Customer's email address
  /// - [amount]: Amount in smallest currency unit
  /// - [bank]: Bank account details for direct debit
  /// - [pin]: Optional PIN for authentication
  /// - [reference]: Optional unique transaction reference
  /// - [metadata]: Optional additional payment metadata
  const BankAccountOptions({
    required this.email,
    required this.amount,
    required this.bank,
    this.pin,
    this.reference,
    this.metadata,
  });

  /// Customer's email address
  final String email;

  /// Amount in smallest currency unit
  final String amount;

  /// Bank account details for direct debit
  final BankDetails bank;

  /// Optional PIN for authentication
  final String? pin;

  /// Optional unique transaction reference
  final String? reference;

  /// Optional additional payment metadata
  final PaymentMetadata? metadata;
}
