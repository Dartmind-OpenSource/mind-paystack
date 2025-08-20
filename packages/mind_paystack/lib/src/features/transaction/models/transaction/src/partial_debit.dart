import 'package:dart_mappable/dart_mappable.dart';
part 'partial_debit.mapper.dart';

@MappableClass()
class PartialDebit with PartialDebitMappable {
  final String reference;
  final String status;
  final int amount; // subunits
  final String currency;

  const PartialDebit({
    required this.reference,
    required this.status,
    required this.amount,
    required this.currency,
  });
}
