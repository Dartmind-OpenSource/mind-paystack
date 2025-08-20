import 'package:dart_mappable/dart_mappable.dart';
part 'currency_amount.mapper.dart';

@MappableClass()
class CurrencyAmount with CurrencyAmountMappable {
  final String currency; // e.g. NGN
  final int amount; // in subunits

  const CurrencyAmount({
    required this.currency,
    required this.amount,
  });
}
