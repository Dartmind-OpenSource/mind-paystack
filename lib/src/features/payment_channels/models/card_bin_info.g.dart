// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_bin_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CardBinInfoImpl _$$CardBinInfoImplFromJson(Map<String, dynamic> json) =>
    _$CardBinInfoImpl(
      bin: json['bin'] as String,
      brand: json['brand'] as String,
      subBrand: json['subBrand'] as String?,
      countryCode: json['countryCode'] as String,
      cardType: json['cardType'] as String,
      bankName: json['bankName'] as String?,
      cardCategory: json['cardCategory'] as String?,
      international: json['international'] as bool? ?? false,
    );

Map<String, dynamic> _$$CardBinInfoImplToJson(_$CardBinInfoImpl instance) =>
    <String, dynamic>{
      'bin': instance.bin,
      'brand': instance.brand,
      'subBrand': instance.subBrand,
      'countryCode': instance.countryCode,
      'cardType': instance.cardType,
      'bankName': instance.bankName,
      'cardCategory': instance.cardCategory,
      'international': instance.international,
    };
