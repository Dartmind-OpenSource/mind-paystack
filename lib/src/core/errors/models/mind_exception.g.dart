// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mind_exception.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MindExceptionImpl _$$MindExceptionImplFromJson(Map<String, dynamic> json) =>
    _$MindExceptionImpl(
      message: json['message'] as String,
      code: json['code'] as String,
      category: $enumDecodeNullable(_$ErrorCategoryEnumMap, json['category']) ??
          ErrorCategory.unknown,
      severity:
          $enumDecodeNullable(_$ExceptionSeverityEnumMap, json['severity']) ??
              ExceptionSeverity.error,
      source: $enumDecodeNullable(_$ErrorSourceEnumMap, json['source']) ??
          ErrorSource.sdk,
      technicalMessage: json['technicalMessage'] as String?,
      userMessage: json['userMessage'] as String?,
      resolutionSteps: (json['resolutionSteps'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      documentationUrl: json['documentationUrl'] as String?,
      supportContact: json['supportContact'] as String?,
      validationErrors: (json['validationErrors'] as List<dynamic>?)
          ?.map((e) => ValidationError.fromJson(e as Map<String, dynamic>))
          .toList(),
      metadata: json['metadata'] == null
          ? null
          : ErrorMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
      isRetriable: json['isRetriable'] as bool? ?? false,
      suggestedRetryDelaySeconds:
          (json['suggestedRetryDelaySeconds'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MindExceptionImplToJson(_$MindExceptionImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'category': _$ErrorCategoryEnumMap[instance.category]!,
      'severity': _$ExceptionSeverityEnumMap[instance.severity]!,
      'source': _$ErrorSourceEnumMap[instance.source]!,
      'technicalMessage': instance.technicalMessage,
      'userMessage': instance.userMessage,
      'resolutionSteps': instance.resolutionSteps,
      'documentationUrl': instance.documentationUrl,
      'supportContact': instance.supportContact,
      'validationErrors': instance.validationErrors,
      'metadata': instance.metadata,
      'isRetriable': instance.isRetriable,
      'suggestedRetryDelaySeconds': instance.suggestedRetryDelaySeconds,
    };

const _$ErrorCategoryEnumMap = {
  ErrorCategory.network: 'network',
  ErrorCategory.authentication: 'authentication',
  ErrorCategory.validation: 'validation',
  ErrorCategory.business: 'business',
  ErrorCategory.server: 'server',
  ErrorCategory.unknown: 'unknown',
};

const _$ExceptionSeverityEnumMap = {
  ExceptionSeverity.fatal: 'fatal',
  ExceptionSeverity.error: 'error',
  ExceptionSeverity.warning: 'warning',
  ExceptionSeverity.info: 'info',
};

const _$ErrorSourceEnumMap = {
  ErrorSource.api: 'api',
  ErrorSource.sdk: 'sdk',
  ErrorSource.user: 'user',
  ErrorSource.system: 'system',
};
