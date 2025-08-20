import 'package:dart_mappable/dart_mappable.dart';
part 'authorization_data.mapper.dart';

@MappableClass()
class AuthorizationData with AuthorizationDataMappable {
  const AuthorizationData({
    required this.authorizationCode,
    this.bin,
    this.last4,
    this.expMonth,
    this.expYear,
    this.channel,
    this.cardType,
    this.bank,
    this.countryCode,
    this.brand,
    this.signature,
    this.reusable,
    this.accountName,
  });
  @MappableField(key: 'authorization_code')
  final String authorizationCode;
  final String? bin;
  final String? last4;
  @MappableField(key: 'exp_month')
  final String? expMonth;
  @MappableField(key: 'exp_year')
  final String? expYear;
  final String? channel; // e.g. card
  @MappableField(key: 'card_type')
  final String? cardType; // e.g. visa
  final String? bank;
  @MappableField(key: 'country_code')
  final String? countryCode;
  final String? brand; // e.g. visa/mastercard
  final String? signature;
  final bool? reusable;
  @MappableField(key: 'account_name')
  final String? accountName;
}
