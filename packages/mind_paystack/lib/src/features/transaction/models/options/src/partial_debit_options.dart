import 'package:dart_mappable/dart_mappable.dart';
part 'partial_debit_options.mapper.dart';

@MappableClass()
class PartialDebitOptions with PartialDebitOptionsMappable {
  final String authorizationCode;
  final String currency;
  final String amount;
  final String email;
  final String? reference;
  final String? atLeast;

  const PartialDebitOptions({
    required this.authorizationCode,
    required this.currency,
    required this.amount,
    required this.email,
    this.reference,
    this.atLeast,
  });
}
