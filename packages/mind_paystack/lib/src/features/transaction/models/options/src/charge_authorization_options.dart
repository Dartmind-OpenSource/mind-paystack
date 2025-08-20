import 'package:dart_mappable/dart_mappable.dart';
part 'charge_authorization_options.mapper.dart';

@MappableClass()
class ChargeAuthorizationOptions with ChargeAuthorizationOptionsMappable {
  final String email;
  final String amount;
  final String authorizationCode;
  final String? reference;
  final String? currency;
  final Map<String, dynamic>? metadata;
  final List<String>? channels;
  final String? subaccount;
  final int? transactionCharge;
  final String? bearer;
  final bool? queue;

  const ChargeAuthorizationOptions({
    required this.email,
    required this.amount,
    required this.authorizationCode,
    this.reference,
    this.currency,
    this.metadata,
    this.channels,
    this.subaccount,
    this.transactionCharge,
    this.bearer,
    this.queue,
  });
}
