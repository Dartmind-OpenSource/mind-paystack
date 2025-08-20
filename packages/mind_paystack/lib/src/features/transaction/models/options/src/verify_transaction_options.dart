import 'package:dart_mappable/dart_mappable.dart';
part 'verify_transaction_options.mapper.dart';

@MappableClass()
class VerifyTransactionOptions with VerifyTransactionOptionsMappable {
  final String reference;

  const VerifyTransactionOptions({required this.reference});
}
