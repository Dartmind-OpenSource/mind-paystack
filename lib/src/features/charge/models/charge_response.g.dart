// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'charge_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChargeResponseImpl _$$ChargeResponseImplFromJson(Map<String, dynamic> json) =>
    _$ChargeResponseImpl(
      reference: json['reference'] as String,
      status: json['status'] as String,
      amount: (json['amount'] as num).toInt(),
      currency: json['currency'] as String? ?? 'NGN',
      email: json['email'] as String,
      authorizationUrl: json['authorizationUrl'] as String?,
      accessCode: json['accessCode'] as String?,
      message: json['message'] as String,
      authorization: json['authorization'] == null
          ? null
          : ChargeAuthorization.fromJson(
              json['authorization'] as Map<String, dynamic>),
      nextAction: json['nextAction'] as String?,
      gatewayResponse: json['gatewayResponse'] as String,
      channel: json['channel'] as String,
      ipAddress: json['ipAddress'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ChargeResponseImplToJson(
        _$ChargeResponseImpl instance) =>
    <String, dynamic>{
      'reference': instance.reference,
      'status': instance.status,
      'amount': instance.amount,
      'currency': instance.currency,
      'email': instance.email,
      'authorizationUrl': instance.authorizationUrl,
      'accessCode': instance.accessCode,
      'message': instance.message,
      'authorization': instance.authorization,
      'nextAction': instance.nextAction,
      'gatewayResponse': instance.gatewayResponse,
      'channel': instance.channel,
      'ipAddress': instance.ipAddress,
      'metadata': instance.metadata,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
