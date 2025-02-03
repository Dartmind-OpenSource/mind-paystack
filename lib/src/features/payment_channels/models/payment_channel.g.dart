// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_channel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentChannelImpl _$$PaymentChannelImplFromJson(Map<String, dynamic> json) =>
    _$PaymentChannelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      code: json['code'] as String,
      type: json['type'] as String,
      currency: json['currency'] as String,
      minimumAmount: (json['minimumAmount'] as num?)?.toInt(),
      maximumAmount: (json['maximumAmount'] as num?)?.toInt(),
      configuration: json['configuration'] as Map<String, dynamic>?,
      isActive: json['isActive'] as bool? ?? true,
      supportsRecurring: json['supportsRecurring'] as bool? ?? false,
      country: json['country'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$PaymentChannelImplToJson(
        _$PaymentChannelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'type': instance.type,
      'currency': instance.currency,
      'minimumAmount': instance.minimumAmount,
      'maximumAmount': instance.maximumAmount,
      'configuration': instance.configuration,
      'isActive': instance.isActive,
      'supportsRecurring': instance.supportsRecurring,
      'country': instance.country,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
