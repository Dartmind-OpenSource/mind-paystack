import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency.freezed.dart';
part 'currency.g.dart';

/// Represents a currency with its properties and formatting rules.
/// 
/// This value object encapsulates currency information including the currency
/// code, symbol, subunit factor (for converting to smallest denomination),
/// and display name.
/// 
/// ## Supported Currencies
/// 
/// The SDK provides predefined constants for commonly used currencies:
/// - Nigerian Naira (NGN)
/// - US Dollar (USD)
/// - Ghanaian Cedi (GHS)
/// - South African Rand (ZAR)
/// - Kenyan Shilling (KES)
/// 
/// ## Usage
/// 
/// ```dart
/// // Use predefined currencies
/// final naira = Currency.ngn;
/// final dollar = Currency.usd;
/// 
/// // Create custom currency
/// final customCurrency = Currency(
///   code: 'GBP',
///   symbol: '£',
///   subunitFactor: 100,
///   name: 'British Pound',
/// );
/// ```
@freezed
class Currency with _$Currency {
  /// Creates a new Currency instance.
  /// 
  /// [code] ISO 4217 currency code (e.g., 'NGN', 'USD')
  /// [symbol] Currency symbol for display (e.g., '₦', '$')
  /// [subunitFactor] Factor to convert to smallest unit (typically 100)
  /// [name] Human-readable currency name
  const factory Currency({
    required String code,
    required String symbol,
    required int subunitFactor,
    required String name,
  }) = _Currency;

  /// Nigerian Naira currency constant
  static const ngn = Currency(
    code: 'NGN',
    symbol: '₦',
    subunitFactor: 100,
    name: 'Nigerian Naira',
  );

  /// US Dollar currency constant
  static const usd = Currency(
    code: 'USD',
    symbol: '\$',
    subunitFactor: 100,
    name: 'US Dollar',
  );

  /// Ghanaian Cedi currency constant
  static const ghs = Currency(
    code: 'GHS',
    symbol: 'GH₵',
    subunitFactor: 100,
    name: 'Ghanaian Cedi',
  );

  /// South African Rand currency constant
  static const zar = Currency(
    code: 'ZAR',
    symbol: 'R',
    subunitFactor: 100,
    name: 'South African Rand',
  );

  /// Kenyan Shilling currency constant
  static const kes = Currency(
    code: 'KES',
    symbol: 'KSh',
    subunitFactor: 100,
    name: 'Kenyan Shilling',
  );

  /// List of all supported currencies
  static const List<Currency> supported = [ngn, usd, ghs, zar, kes];

  /// Creates a Currency from its ISO code.
  /// 
  /// Returns null if the currency code is not supported.
  /// 
  /// Example:
  /// ```dart
  /// final currency = Currency.fromCode('NGN'); // Returns Currency.ngn
  /// final unknown = Currency.fromCode('XYZ'); // Returns null
  /// ```
  static Currency? fromCode(String code) {
    try {
      return supported.firstWhere(
        (currency) => currency.code.toUpperCase() == code.toUpperCase(),
      );
    } catch (e) {
      return null;
    }
  }

  /// JSON serialization
  factory Currency.fromJson(Map<String, dynamic> json) =>
      _$CurrencyFromJson(json);
}