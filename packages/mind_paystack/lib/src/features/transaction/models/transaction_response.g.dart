// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionResponseImpl _$$TransactionResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionResponseImpl(
      reference: json['reference'] as String?,
      message: json['message'] as String?,
      status: json['status'] as bool?,
      authorizationUrl: json['authorizationUrl'] as String?,
      accessCode: json['accessCode'] as String?,
      data: json['data'] as Map<String, dynamic>?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$TransactionResponseImplToJson(
        _$TransactionResponseImpl instance) =>
    <String, dynamic>{
      'reference': instance.reference,
      'message': instance.message,
      'status': instance.status,
      'authorizationUrl': instance.authorizationUrl,
      'accessCode': instance.accessCode,
      'data': instance.data,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
