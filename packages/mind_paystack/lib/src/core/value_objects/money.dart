import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mind_paystack/src/core/value_objects/currency.dart';

part 'money.freezed.dart';
part 'money.g.dart';

/// Represents a monetary amount with its currency.
/// 
/// This value object handles money calculations and formatting, ensuring
/// proper handling of subunits (e.g., kobo for NGN, cents for USD) and
/// providing safe arithmetic operations.
/// 
/// ## Key Features
/// 
/// - **Precision Handling**: Uses integer subunits to avoid floating-point errors
/// - **Currency Awareness**: Knows its currency and formatting rules
/// - **API Integration**: Provides formats needed for Paystack API
/// - **Display Formatting**: Human-readable formatting for UI
/// - **Arithmetic Operations**: Safe addition, subtraction, and comparison
/// 
/// ## Usage
/// 
/// ```dart
/// // Create from major units (Naira/Dollars)
/// final amount = Money.fromMajor(500.50, Currency.ngn); // ₦500.50
/// 
/// // Create from minor units (kobo/cents)
/// final amount2 = Money.fromMinor(50050, Currency.ngn); // ₦500.50
/// 
/// // Arithmetic operations
/// final total = amount + amount2; // ₦1001.00
/// 
/// // API format
/// final apiAmount = amount.apiFormat; // "50050"
/// 
/// // Display format
/// final display = amount.formatted; // "₦500.50"
/// ```
@freezed
class Money with _$Money {
  /// Creates a Money instance with the specified amount and currency.
  /// 
  /// [amountInSubunits] Amount in the currency's smallest unit (kobo, cents, etc.)
  /// [currency] The currency for this monetary amount
  const factory Money({
    required int amountInSubunits,
    required Currency currency,
  }) = _Money;

  /// JSON serialization
  factory Money.fromJson(Map<String, dynamic> json) => _$MoneyFromJson(json);

  const Money._();

  /// Creates Money from major currency units (e.g., Naira, Dollars).
  /// 
  /// [amount] Amount in major units (can have decimal places)
  /// [currency] The currency for this amount
  /// 
  /// Example:
  /// ```dart
  /// final price = Money.fromMajor(99.99, Currency.usd); // $99.99
  /// ```
  factory Money.fromMajor(double amount, Currency currency) {
    return Money(
      amountInSubunits: (amount * currency.subunitFactor).round(),
      currency: currency,
    );
  }

  /// Creates Money from minor currency units (e.g., kobo, cents).
  /// 
  /// [amountInSubunits] Amount in smallest currency unit
  /// [currency] The currency for this amount
  /// 
  /// Example:
  /// ```dart
  /// final price = Money.fromMinor(9999, Currency.usd); // $99.99
  /// ```
  factory Money.fromMinor(int amountInSubunits, Currency currency) {
    return Money(
      amountInSubunits: amountInSubunits,
      currency: currency,
    );
  }

  /// Creates Money with zero value in the specified currency.
  /// 
  /// Example:
  /// ```dart
  /// final zero = Money.zero(Currency.ngn); // ₦0.00
  /// ```
  factory Money.zero(Currency currency) {
    return Money(amountInSubunits: 0, currency: currency);
  }

  /// Gets the amount in major currency units (with decimal places).
  /// 
  /// Example:
  /// ```dart
  /// final money = Money.fromMinor(12345, Currency.ngn);
  /// print(money.majorAmount); // 123.45
  /// ```
  double get majorAmount => amountInSubunits / currency.subunitFactor;

  /// Formats the amount for display with currency symbol.
  /// 
  /// Example:
  /// ```dart
  /// final money = Money.fromMajor(1500.0, Currency.ngn);
  /// print(money.formatted); // "₦1,500.00"
  /// ```
  String get formatted {
    final amount = majorAmount.toStringAsFixed(2);
    final parts = amount.split('.');
    final integerPart = parts[0];
    final decimalPart = parts.length > 1 ? parts[1] : '00';
    
    // Add thousand separators
    final buffer = StringBuffer();
    for (var i = 0; i < integerPart.length; i++) {
      if (i > 0 && (integerPart.length - i) % 3 == 0) {
        buffer.write(',');
      }
      buffer.write(integerPart[i]);
    }
    
    return '${currency.symbol}$buffer.$decimalPart';
  }

  /// Formats the amount for Paystack API (subunits as string).
  /// 
  /// Example:
  /// ```dart
  /// final money = Money.fromMajor(500.0, Currency.ngn);
  /// print(money.apiFormat); // "50000"
  /// ```
  String get apiFormat => amountInSubunits.toString();

  /// Checks if this amount is zero.
  bool get isZero => amountInSubunits == 0;

  /// Checks if this amount is positive.
  bool get isPositive => amountInSubunits > 0;

  /// Checks if this amount is negative.
  bool get isNegative => amountInSubunits < 0;

  /// Adds another Money amount to this one.
  /// 
  /// Throws [ArgumentError] if currencies don't match.
  /// 
  /// Example:
  /// ```dart
  /// final amount1 = Money.fromMajor(100.0, Currency.ngn);
  /// final amount2 = Money.fromMajor(50.0, Currency.ngn);
  /// final total = amount1 + amount2; // ₦150.00
  /// ```
  Money operator +(Money other) {
    _ensureSameCurrency(other);
    return Money(
      amountInSubunits: amountInSubunits + other.amountInSubunits,
      currency: currency,
    );
  }

  /// Subtracts another Money amount from this one.
  /// 
  /// Throws [ArgumentError] if currencies don't match.
  /// 
  /// Example:
  /// ```dart
  /// final amount1 = Money.fromMajor(100.0, Currency.ngn);
  /// final amount2 = Money.fromMajor(30.0, Currency.ngn);
  /// final difference = amount1 - amount2; // ₦70.00
  /// ```
  Money operator -(Money other) {
    _ensureSameCurrency(other);
    return Money(
      amountInSubunits: amountInSubunits - other.amountInSubunits,
      currency: currency,
    );
  }

  /// Multiplies this amount by a factor.
  /// 
  /// Example:
  /// ```dart
  /// final price = Money.fromMajor(50.0, Currency.ngn);
  /// final total = price * 3; // ₦150.00
  /// ```
  Money operator *(num factor) {
    return Money(
      amountInSubunits: (amountInSubunits * factor).round(),
      currency: currency,
    );
  }

  /// Divides this amount by a divisor.
  /// 
  /// Example:
  /// ```dart
  /// final total = Money.fromMajor(100.0, Currency.ngn);
  /// final perPerson = total / 4; // ₦25.00
  /// ```
  Money operator /(num divisor) {
    return Money(
      amountInSubunits: (amountInSubunits / divisor).round(),
      currency: currency,
    );
  }

  /// Checks if this amount is less than another.
  /// 
  /// Throws [ArgumentError] if currencies don't match.
  bool operator <(Money other) {
    _ensureSameCurrency(other);
    return amountInSubunits < other.amountInSubunits;
  }

  /// Checks if this amount is less than or equal to another.
  /// 
  /// Throws [ArgumentError] if currencies don't match.
  bool operator <=(Money other) {
    _ensureSameCurrency(other);
    return amountInSubunits <= other.amountInSubunits;
  }

  /// Checks if this amount is greater than another.
  /// 
  /// Throws [ArgumentError] if currencies don't match.
  bool operator >(Money other) {
    _ensureSameCurrency(other);
    return amountInSubunits > other.amountInSubunits;
  }

  /// Checks if this amount is greater than or equal to another.
  /// 
  /// Throws [ArgumentError] if currencies don't match.
  bool operator >=(Money other) {
    _ensureSameCurrency(other);
    return amountInSubunits >= other.amountInSubunits;
  }

  /// Returns the absolute value of this amount.
  /// 
  /// Example:
  /// ```dart
  /// final negative = Money.fromMajor(-50.0, Currency.ngn);
  /// final positive = negative.abs(); // ₦50.00
  /// ```
  Money abs() {
    return Money(
      amountInSubunits: amountInSubunits.abs(),
      currency: currency,
    );
  }

  /// Returns the negative of this amount.
  /// 
  /// Example:
  /// ```dart
  /// final positive = Money.fromMajor(50.0, Currency.ngn);
  /// final negative = -positive; // ₦-50.00
  /// ```
  Money operator -() {
    return Money(
      amountInSubunits: -amountInSubunits,
      currency: currency,
    );
  }

  /// Ensures that two Money instances have the same currency.
  /// 
  /// Throws [ArgumentError] if currencies don't match.
  void _ensureSameCurrency(Money other) {
    if (currency.code != other.currency.code) {
      throw ArgumentError(
        'Cannot perform operation on different currencies: '
        '${currency.code} and ${other.currency.code}',
      );
    }
  }
}