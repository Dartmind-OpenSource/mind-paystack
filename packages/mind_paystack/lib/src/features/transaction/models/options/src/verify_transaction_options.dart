import 'package:dart_mappable/dart_mappable.dart';
part 'verify_transaction_options.mapper.dart';

@MappableClass()
class VerifyTransactionOptions with VerifyTransactionOptionsMappable {

  const VerifyTransactionOptions({required this.reference});
  final String reference;
}
