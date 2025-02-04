// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionSessionImpl _$$TransactionSessionImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionSessionImpl(
      id: json['id'] as String,
      reference: json['reference'] as String,
      status: json['status'] as String,
      deviceId: json['deviceId'] as String,
      clientData: json['clientData'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$TransactionSessionImplToJson(
        _$TransactionSessionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reference': instance.reference,
      'status': instance.status,
      'deviceId': instance.deviceId,
      'clientData': instance.clientData,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
