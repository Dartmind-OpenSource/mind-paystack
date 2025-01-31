// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validation_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ValidationErrorImpl _$$ValidationErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$ValidationErrorImpl(
      field: json['field'] as String,
      message: json['message'] as String,
      type: json['type'] as String,
      actualValue: json['actualValue'],
      expectedValue: json['expectedValue'],
    );

Map<String, dynamic> _$$ValidationErrorImplToJson(
        _$ValidationErrorImpl instance) =>
    <String, dynamic>{
      'field': instance.field,
      'message': instance.message,
      'type': instance.type,
      'actualValue': instance.actualValue,
      'expectedValue': instance.expectedValue,
    };
