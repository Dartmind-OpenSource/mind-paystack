import 'dart:convert';


/// Enum defining payment types
enum PaymentType {
  /// Card payment type
  card,
  /// Bank transfer payment type
  bank
}

 class Card {
  final String number;
  final String cvv;
  final String expiryMonth;
  final String expiryYear;

  /// Creates a new [Card] instance
  Card({
    required this.number,
    required this.cvv,
    required this.expiryMonth,
    required this.expiryYear,
  });

  /// Creates a [Card] instance from JSON map
  factory Card.fromJson(Map<String, dynamic> json) {
    return Card(
      number: json['number']?.toString() ?? '',
      cvv: json['cvv']?.toString() ?? '',
      expiryMonth: json['expiry_month']?.toString() ?? '',
      expiryYear: json['expiry_year']?.toString() ?? '',
    );
  }

  /// Converts the card details to JSON map
  Map<String, dynamic> toJson() => {
    'number': number,
    'cvv': cvv,
    'expiry_month': expiryMonth,
    'expiry_year': expiryYear,
  };

  /// Validates the card details
  bool isValid() => 
    number.isNotEmpty && 
    cvv.isNotEmpty && 
    expiryMonth.isNotEmpty && 
    expiryYear.isNotEmpty;
}

/// Model class representing bank account details
class Bank {
  final String accountNumber;
  final String code;

  /// Creates a new [Bank] instance
  Bank({
    required this.accountNumber,
    required this.code,
  });

  /// Creates a [Bank] instance from JSON map
  factory Bank.fromJson(Map<String, dynamic> json) {
    return Bank(
      accountNumber: json['account_number']?.toString() ?? '',
      code: json['code']?.toString() ?? '',
    );
  }

  /// Converts the bank details to JSON map
  Map<String, dynamic> toJson() => {
    'account_number': accountNumber,
    'code': code,
  };

  /// Validates the bank details
  bool isValid() => accountNumber.isNotEmpty && code.isNotEmpty;
}

/// Abstract class defining common payment request properties
abstract class PaymentRequest {
  /// Email address of the customer
  String get email;
  
  /// Payment amount in main currency
  double get amount;
  
  /// Converts the payment request to JSON map
  Map<String, dynamic> toJson();
  
  /// Validates the payment request
  bool isValid();
}

/// Implementation of card-based payment request
class CardPaymentRequest implements PaymentRequest {
  @override
  final String email;
  @override
  final double amount;
  final Card card;

  /// Creates a new [CardPaymentRequest] instance
  CardPaymentRequest({
    required this.email,
    required this.amount,
    required this.card,
  });

  /// Gets the amount in kobo (amount * 100)
  int get amountInKobo => (amount * 100).toInt();

  /// Creates a [CardPaymentRequest] instance from JSON map
  factory CardPaymentRequest.fromJson(Map<String, dynamic> json) {
    return CardPaymentRequest(
      email: json['email']?.toString() ?? '',
      amount: (json['amount'] as num?)?.toDouble() ?? 0.0 / 100,
      card: Card.fromJson(json['card'] as Map<String, dynamic>),
    );
  }

  @override
  /// Converts the card payment request to JSON map
  Map<String, dynamic> toJson() => {
    'email': email,
    'amount': amountInKobo,
    'card': card.toJson(),
  };

  @override
  /// Validates the card payment request
  bool isValid() => 
    email.isNotEmpty && 
    amount > 0 && 
    card.isValid();
}

/// Implementation of bank-based payment request
class BankPaymentRequest implements PaymentRequest {
  @override
  final String email;
  @override
  final double amount;
  final Bank bank;

  /// Creates a new [BankPaymentRequest] instance
  BankPaymentRequest({
    required this.email,
    required this.amount,
    required this.bank,
  });

  /// Gets the amount in kobo (amount * 100)
  int get amountInKobo => (amount * 100).toInt();

  /// Creates a [BankPaymentRequest] instance from JSON map
  factory BankPaymentRequest.fromJson(Map<String, dynamic> json) {
    return BankPaymentRequest(
      email: json['email']?.toString() ?? '',
      amount: (json['amount'] as num?)?.toDouble() ?? 0.0 / 100,
      bank: Bank.fromJson(json['bank'] as Map<String, dynamic>),
    );
  }

  @override
  /// Converts the bank payment request to JSON map
  Map<String, dynamic> toJson() => {
    'email': email,
    'amount': amountInKobo,
    'bank': bank.toJson(),
  };

  @override
  /// Validates the bank payment request
  bool isValid() => 
    email.isNotEmpty && 
    amount > 0 && 
    bank.isValid();
}