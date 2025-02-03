// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_resolution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountResolutionImpl _$$AccountResolutionImplFromJson(
        Map<String, dynamic> json) =>
    _$AccountResolutionImpl(
      accountNumber: json['accountNumber'] as String,
      accountName: json['accountName'] as String,
      bankCode: json['bankCode'] as String,
      bankName: json['bankName'] as String?,
      accountType: json['accountType'] as String?,
      bvnMatch: json['bvnMatch'] as bool?,
    );

Map<String, dynamic> _$$AccountResolutionImplToJson(
        _$AccountResolutionImpl instance) =>
    <String, dynamic>{
      'accountNumber': instance.accountNumber,
      'accountName': instance.accountName,
      'bankCode': instance.bankCode,
      'bankName': instance.bankName,
      'accountType': instance.accountType,
      'bvnMatch': instance.bvnMatch,
    };
