// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorization_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthorizationResponseImpl _$$AuthorizationResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthorizationResponseImpl(
      authorizationCode: json['authorizationCode'] as String,
      cardType: json['cardType'] as String,
      last4: json['last4'] as String,
      expMonth: json['expMonth'] as String,
      expYear: json['expYear'] as String,
      bin: json['bin'] as String,
      bank: json['bank'] as String,
      channel: json['channel'] as String,
      signature: json['signature'] as String,
      countryCode: json['countryCode'] as String,
      brand: json['brand'] as String,
      reusable: json['reusable'] as bool,
      accountName: json['accountName'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$AuthorizationResponseImplToJson(
        _$AuthorizationResponseImpl instance) =>
    <String, dynamic>{
      'authorizationCode': instance.authorizationCode,
      'cardType': instance.cardType,
      'last4': instance.last4,
      'expMonth': instance.expMonth,
      'expYear': instance.expYear,
      'bin': instance.bin,
      'bank': instance.bank,
      'channel': instance.channel,
      'signature': instance.signature,
      'countryCode': instance.countryCode,
      'brand': instance.brand,
      'reusable': instance.reusable,
      'accountName': instance.accountName,
    };
