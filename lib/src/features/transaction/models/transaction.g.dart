// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionImpl _$$TransactionImplFromJson(Map<String, dynamic> json) =>
    _$TransactionImpl(
      id: json['id'] as String,
      reference: json['reference'] as String,
      domain: json['domain'] as String,
      status: json['status'] as String,
      amount: (json['amount'] as num).toInt(),
      currency: json['currency'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      channel: json['channel'] as String,
      gatewayResponse: json['gatewayResponse'] as String,
      paidAt: json['paidAt'] as bool,
      description: json['description'] as String?,
      customerId: json['customerId'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
      authorization: json['authorization'] == null
          ? null
          : AuthorizationResponse.fromJson(
              json['authorization'] as Map<String, dynamic>),
      customerCode: json['customerCode'] as String?,
      customerEmail: json['customerEmail'] as String?,
      plan: json['plan'] as String?,
      subaccount: json['subaccount'] as String?,
      fees: (json['fees'] as num?)?.toInt(),
      splitCode: json['splitCode'] as String?,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$TransactionImplToJson(_$TransactionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reference': instance.reference,
      'domain': instance.domain,
      'status': instance.status,
      'amount': instance.amount,
      'currency': instance.currency,
      'createdAt': instance.createdAt.toIso8601String(),
      'channel': instance.channel,
      'gatewayResponse': instance.gatewayResponse,
      'paidAt': instance.paidAt,
      'description': instance.description,
      'customerId': instance.customerId,
      'metadata': instance.metadata,
      'authorization': instance.authorization,
      'customerCode': instance.customerCode,
      'customerEmail': instance.customerEmail,
      'plan': instance.plan,
      'subaccount': instance.subaccount,
      'fees': instance.fees,
      'splitCode': instance.splitCode,
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
