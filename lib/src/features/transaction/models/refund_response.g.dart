// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refund_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RefundResponseImpl _$$RefundResponseImplFromJson(Map<String, dynamic> json) =>
    _$RefundResponseImpl(
      reference: json['reference'] as String,
      status: json['status'] as String,
      amount: (json['amount'] as num).toInt(),
      currency: json['currency'] as String,
      transactionReference: json['transactionReference'] as String,
      customerNote: json['customerNote'] as String?,
      merchantNote: json['merchantNote'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$RefundResponseImplToJson(
        _$RefundResponseImpl instance) =>
    <String, dynamic>{
      'reference': instance.reference,
      'status': instance.status,
      'amount': instance.amount,
      'currency': instance.currency,
      'transactionReference': instance.transactionReference,
      'customerNote': instance.customerNote,
      'merchantNote': instance.merchantNote,
      'createdAt': instance.createdAt.toIso8601String(),
    };
