// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionEventImpl _$$TransactionEventImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionEventImpl(
      time: json['time'] as String,
      type: json['type'] as String,
      message: json['message'] as String,
      data: json['data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$TransactionEventImplToJson(
        _$TransactionEventImpl instance) =>
    <String, dynamic>{
      'time': instance.time,
      'type': instance.type,
      'message': instance.message,
      'data': instance.data,
    };
