// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'charge_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChargeStatusImpl _$$ChargeStatusImplFromJson(Map<String, dynamic> json) =>
    _$ChargeStatusImpl(
      reference: json['reference'] as String,
      status: json['status'] as String,
      requiresVerification: json['requiresVerification'] as bool? ?? false,
      nextAction: json['nextAction'] as String?,
      message: json['message'] as String,
      gatewayResponse: json['gatewayResponse'] as String,
      checkedAt: DateTime.parse(json['checkedAt'] as String),
    );

Map<String, dynamic> _$$ChargeStatusImplToJson(_$ChargeStatusImpl instance) =>
    <String, dynamic>{
      'reference': instance.reference,
      'status': instance.status,
      'requiresVerification': instance.requiresVerification,
      'nextAction': instance.nextAction,
      'message': instance.message,
      'gatewayResponse': instance.gatewayResponse,
      'checkedAt': instance.checkedAt.toIso8601String(),
    };
