import 'package:dart_mappable/dart_mappable.dart';
part 'transaction_initialization.mapper.dart';

@MappableClass()
class TransactionInitialization with TransactionInitializationMappable {
  @MappableField(key: 'authorization_url')
  final String authorizationUrl;
  @MappableField(key: 'access_code')
  final String accessCode;
  final String reference;

  const TransactionInitialization({
    required this.authorizationUrl,
    required this.accessCode,
    required this.reference,
  });
}
