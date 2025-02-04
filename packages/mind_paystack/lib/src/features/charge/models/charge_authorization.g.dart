// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'charge_authorization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChargeAuthorizationImpl _$$ChargeAuthorizationImplFromJson(
        Map<String, dynamic> json) =>
    _$ChargeAuthorizationImpl(
      authorizationCode: json['authorizationCode'] as String,
      bin: json['bin'] as String?,
      last4: json['last4'] as String?,
      expiryMonth: (json['expiryMonth'] as num?)?.toInt(),
      expiryYear: (json['expiryYear'] as num?)?.toInt(),
      brand: json['brand'] as String?,
      cardType: json['cardType'] as String?,
      bank: json['bank'] as String?,
      country: json['country'] as String?,
      signature: json['signature'] as String?,
      accountName: json['accountName'] as String?,
      reusable: json['reusable'] as bool? ?? false,
    );

Map<String, dynamic> _$$ChargeAuthorizationImplToJson(
        _$ChargeAuthorizationImpl instance) =>
    <String, dynamic>{
      'authorizationCode': instance.authorizationCode,
      'bin': instance.bin,
      'last4': instance.last4,
      'expiryMonth': instance.expiryMonth,
      'expiryYear': instance.expiryYear,
      'brand': instance.brand,
      'cardType': instance.cardType,
      'bank': instance.bank,
      'country': instance.country,
      'signature': instance.signature,
      'accountName': instance.accountName,
      'reusable': instance.reusable,
    };
