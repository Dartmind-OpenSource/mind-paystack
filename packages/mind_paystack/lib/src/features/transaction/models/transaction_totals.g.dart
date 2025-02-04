// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_totals.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionTotalsImpl _$$TransactionTotalsImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionTotalsImpl(
      totalTransactions: (json['totalTransactions'] as num).toInt(),
      uniqueCustomers: (json['uniqueCustomers'] as num).toInt(),
      totalVolume: (json['totalVolume'] as num).toInt(),
      totalSuccessful: (json['totalSuccessful'] as num).toInt(),
      totalFailed: (json['totalFailed'] as num).toInt(),
      pendingTransfers: (json['pendingTransfers'] as num).toInt(),
      volumeByChannel: Map<String, int>.from(json['volumeByChannel'] as Map),
      volumeByCurrency: Map<String, int>.from(json['volumeByCurrency'] as Map),
    );

Map<String, dynamic> _$$TransactionTotalsImplToJson(
        _$TransactionTotalsImpl instance) =>
    <String, dynamic>{
      'totalTransactions': instance.totalTransactions,
      'uniqueCustomers': instance.uniqueCustomers,
      'totalVolume': instance.totalVolume,
      'totalSuccessful': instance.totalSuccessful,
      'totalFailed': instance.totalFailed,
      'pendingTransfers': instance.pendingTransfers,
      'volumeByChannel': instance.volumeByChannel,
      'volumeByCurrency': instance.volumeByCurrency,
    };
