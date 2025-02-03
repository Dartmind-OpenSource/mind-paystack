// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BankImpl _$$BankImplFromJson(Map<String, dynamic> json) => _$BankImpl(
      code: json['code'] as String,
      name: json['name'] as String,
      slug: json['slug'] as String,
      ussdCode: json['ussdCode'] as String?,
      logoUrl: json['logoUrl'] as String?,
      supportedPaymentTypes: (json['supportedPaymentTypes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isActive: json['isActive'] as bool? ?? true,
      country: json['country'] as String,
      type: json['type'] as String?,
      gateway: json['gateway'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$BankImplToJson(_$BankImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'slug': instance.slug,
      'ussdCode': instance.ussdCode,
      'logoUrl': instance.logoUrl,
      'supportedPaymentTypes': instance.supportedPaymentTypes,
      'isActive': instance.isActive,
      'country': instance.country,
      'type': instance.type,
      'gateway': instance.gateway,
      'createdAt': instance.createdAt.toIso8601String(),
    };
