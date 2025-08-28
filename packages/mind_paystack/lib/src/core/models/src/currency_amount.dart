import 'package:dart_mappable/dart_mappable.dart';
part 'currency_amount.mapper.dart';

/// Represents an amount in a specific currency.
/// 
/// This model is used to represent monetary values in their smallest
/// currency unit (subunits) along with the currency code.
/// 
/// Example usage:
/// ```dart
/// final amount = CurrencyAmount(
///   currency: 'NGN',
///   amount: 50000, // ₦500.00 in kobo
/// );
/// 
/// final usdAmount = CurrencyAmount(
///   currency: 'USD',
///   amount: 1000, // $10.00 in cents
/// );
/// ```
@MappableClass()
class CurrencyAmount with CurrencyAmountMappable {
  /// Creates a new CurrencyAmount instance.
  /// 
  /// Both [currency] and [amount] are required. The [amount] should be
  /// provided in the smallest unit of the specified currency.
  const CurrencyAmount({
    required this.currency,
    required this.amount,
  });
  /// Currency code for this amount.
  /// 
  /// Uses standard currency codes like 'NGN' (Nigerian Naira),
  /// 'USD' (US Dollar), 'GHS' (Ghanaian Cedi), etc.
  final String currency;
  
  /// Amount in the smallest currency unit (subunits).
  /// 
  /// Examples:
  /// - NGN: amount in kobo (100 kobo = 1 naira)
  /// - USD: amount in cents (100 cents = 1 dollar)
  /// - GHS: amount in pesewas (100 pesewas = 1 cedi)
  final int amount;
}
