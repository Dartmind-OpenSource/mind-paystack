// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bin_resolution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BinResolutionImpl _$$BinResolutionImplFromJson(Map<String, dynamic> json) =>
    _$BinResolutionImpl(
      bin: json['bin'] as String,
      brand: json['brand'] as String,
      cardType: json['cardType'] as String,
      bankName: json['bankName'] as String?,
      countryCode: json['countryCode'] as String,
      category: json['category'] as String?,
      international: json['international'] as bool? ?? false,
    );

Map<String, dynamic> _$$BinResolutionImplToJson(_$BinResolutionImpl instance) =>
    <String, dynamic>{
      'bin': instance.bin,
      'brand': instance.brand,
      'cardType': instance.cardType,
      'bankName': instance.bankName,
      'countryCode': instance.countryCode,
      'category': instance.category,
      'international': instance.international,
    };
