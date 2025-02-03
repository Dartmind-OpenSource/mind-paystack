// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_fees.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChannelFeesImpl _$$ChannelFeesImplFromJson(Map<String, dynamic> json) =>
    _$ChannelFeesImpl(
      channel: json['channel'] as String,
      amount: (json['amount'] as num).toInt(),
      percentage: (json['percentage'] as num).toDouble(),
      cap: (json['cap'] as num?)?.toInt(),
      additionalFees: (json['additionalFees'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toInt()),
      ),
      breakdown: json['breakdown'] as Map<String, dynamic>?,
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$$ChannelFeesImplToJson(_$ChannelFeesImpl instance) =>
    <String, dynamic>{
      'channel': instance.channel,
      'amount': instance.amount,
      'percentage': instance.percentage,
      'cap': instance.cap,
      'additionalFees': instance.additionalFees,
      'breakdown': instance.breakdown,
      'currency': instance.currency,
    };
