// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobile_money.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MobileMoneyImpl _$$MobileMoneyImplFromJson(Map<String, dynamic> json) =>
    _$MobileMoneyImpl(
      code: json['code'] as String,
      name: json['name'] as String,
      logoUrl: json['logoUrl'] as String?,
      currencies: (json['currencies'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      country: json['country'] as String,
      isActive: json['isActive'] as bool? ?? true,
      type: json['type'] as String? ?? 'mobile_money',
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$MobileMoneyImplToJson(_$MobileMoneyImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'logoUrl': instance.logoUrl,
      'currencies': instance.currencies,
      'country': instance.country,
      'isActive': instance.isActive,
      'type': instance.type,
      'createdAt': instance.createdAt.toIso8601String(),
    };
