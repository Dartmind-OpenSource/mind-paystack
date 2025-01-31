// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ErrorMetadataImpl _$$ErrorMetadataImplFromJson(Map<String, dynamic> json) =>
    _$ErrorMetadataImpl(
      timestamp: DateTime.parse(json['timestamp'] as String),
      requestId: json['requestId'] as String?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      httpMethod: json['httpMethod'] as String?,
      url: json['url'] as String?,
      headers: (json['headers'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
      context: json['context'] as Map<String, dynamic>?,
      stackTrace: json['stackTrace'] as String?,
      originalError: json['originalError'] as String?,
    );

Map<String, dynamic> _$$ErrorMetadataImplToJson(_$ErrorMetadataImpl instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp.toIso8601String(),
      'requestId': instance.requestId,
      'statusCode': instance.statusCode,
      'httpMethod': instance.httpMethod,
      'url': instance.url,
      'headers': instance.headers,
      'context': instance.context,
      'stackTrace': instance.stackTrace,
      'originalError': instance.originalError,
    };
