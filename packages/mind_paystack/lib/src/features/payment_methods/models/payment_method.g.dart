// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentMethodImpl _$$PaymentMethodImplFromJson(Map<String, dynamic> json) =>
    _$PaymentMethodImpl(
      id: json['id'] as String,
      type: json['type'] as String,
      channel: json['channel'] as String,
      email: json['email'] as String,
      currency: json['currency'] as String? ?? 'NGN',
      bankCode: json['bankCode'] as String?,
      last4: json['last4'] as String?,
      expiryMonth: (json['expiryMonth'] as num?)?.toInt(),
      expiryYear: (json['expiryYear'] as num?)?.toInt(),
      accountName: json['accountName'] as String?,
      accountNumber: json['accountNumber'] as String?,
      bankName: json['bankName'] as String?,
      cardBrand: json['cardBrand'] as String?,
      cardType: json['cardType'] as String?,
      reusable: json['reusable'] as bool? ?? false,
      country: json['country'] as String? ?? 'NG',
      signature: json['signature'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$PaymentMethodImplToJson(_$PaymentMethodImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'channel': instance.channel,
      'email': instance.email,
      'currency': instance.currency,
      'bankCode': instance.bankCode,
      'last4': instance.last4,
      'expiryMonth': instance.expiryMonth,
      'expiryYear': instance.expiryYear,
      'accountName': instance.accountName,
      'accountNumber': instance.accountNumber,
      'bankName': instance.bankName,
      'cardBrand': instance.cardBrand,
      'cardType': instance.cardType,
      'reusable': instance.reusable,
      'country': instance.country,
      'signature': instance.signature,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
