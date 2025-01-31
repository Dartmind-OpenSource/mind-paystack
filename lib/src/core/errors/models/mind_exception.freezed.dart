// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mind_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MindException _$MindExceptionFromJson(Map<String, dynamic> json) {
  return _MindException.fromJson(json);
}

/// @nodoc
mixin _$MindException {
  /// Main error message
  String get message => throw _privateConstructorUsedError;

  /// Unique error code
  String get code => throw _privateConstructorUsedError;

  /// Error category
  ErrorCategory get category => throw _privateConstructorUsedError;

  /// Error severity
  ExceptionSeverity get severity => throw _privateConstructorUsedError;

  /// Source of the error
  ErrorSource get source => throw _privateConstructorUsedError;

  /// Technical description for developers
  String? get technicalMessage => throw _privateConstructorUsedError;

  /// User-friendly message that can be shown to end users
  String? get userMessage => throw _privateConstructorUsedError;

  /// Suggested resolution steps
  List<String>? get resolutionSteps => throw _privateConstructorUsedError;

  /// Related documentation URL
  String? get documentationUrl => throw _privateConstructorUsedError;

  /// Support contact information
  String? get supportContact => throw _privateConstructorUsedError;

  /// List of validation errors if applicable
  List<ValidationError>? get validationErrors =>
      throw _privateConstructorUsedError;

  /// Additional error metadata
  ErrorMetadata? get metadata => throw _privateConstructorUsedError;

  /// Whether the error is retriable
  bool get isRetriable => throw _privateConstructorUsedError;

  /// Suggested retry delay in seconds
  int? get suggestedRetryDelaySeconds => throw _privateConstructorUsedError;

  /// Serializes this MindException to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MindException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MindExceptionCopyWith<MindException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MindExceptionCopyWith<$Res> {
  factory $MindExceptionCopyWith(
          MindException value, $Res Function(MindException) then) =
      _$MindExceptionCopyWithImpl<$Res, MindException>;
  @useResult
  $Res call(
      {String message,
      String code,
      ErrorCategory category,
      ExceptionSeverity severity,
      ErrorSource source,
      String? technicalMessage,
      String? userMessage,
      List<String>? resolutionSteps,
      String? documentationUrl,
      String? supportContact,
      List<ValidationError>? validationErrors,
      ErrorMetadata? metadata,
      bool isRetriable,
      int? suggestedRetryDelaySeconds});

  $ErrorMetadataCopyWith<$Res>? get metadata;
}

/// @nodoc
class _$MindExceptionCopyWithImpl<$Res, $Val extends MindException>
    implements $MindExceptionCopyWith<$Res> {
  _$MindExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MindException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = null,
    Object? category = null,
    Object? severity = null,
    Object? source = null,
    Object? technicalMessage = freezed,
    Object? userMessage = freezed,
    Object? resolutionSteps = freezed,
    Object? documentationUrl = freezed,
    Object? supportContact = freezed,
    Object? validationErrors = freezed,
    Object? metadata = freezed,
    Object? isRetriable = null,
    Object? suggestedRetryDelaySeconds = freezed,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ErrorCategory,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as ExceptionSeverity,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as ErrorSource,
      technicalMessage: freezed == technicalMessage
          ? _value.technicalMessage
          : technicalMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      userMessage: freezed == userMessage
          ? _value.userMessage
          : userMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      resolutionSteps: freezed == resolutionSteps
          ? _value.resolutionSteps
          : resolutionSteps // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      documentationUrl: freezed == documentationUrl
          ? _value.documentationUrl
          : documentationUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      supportContact: freezed == supportContact
          ? _value.supportContact
          : supportContact // ignore: cast_nullable_to_non_nullable
              as String?,
      validationErrors: freezed == validationErrors
          ? _value.validationErrors
          : validationErrors // ignore: cast_nullable_to_non_nullable
              as List<ValidationError>?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as ErrorMetadata?,
      isRetriable: null == isRetriable
          ? _value.isRetriable
          : isRetriable // ignore: cast_nullable_to_non_nullable
              as bool,
      suggestedRetryDelaySeconds: freezed == suggestedRetryDelaySeconds
          ? _value.suggestedRetryDelaySeconds
          : suggestedRetryDelaySeconds // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of MindException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ErrorMetadataCopyWith<$Res>? get metadata {
    if (_value.metadata == null) {
      return null;
    }

    return $ErrorMetadataCopyWith<$Res>(_value.metadata!, (value) {
      return _then(_value.copyWith(metadata: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MindExceptionImplCopyWith<$Res>
    implements $MindExceptionCopyWith<$Res> {
  factory _$$MindExceptionImplCopyWith(
          _$MindExceptionImpl value, $Res Function(_$MindExceptionImpl) then) =
      __$$MindExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message,
      String code,
      ErrorCategory category,
      ExceptionSeverity severity,
      ErrorSource source,
      String? technicalMessage,
      String? userMessage,
      List<String>? resolutionSteps,
      String? documentationUrl,
      String? supportContact,
      List<ValidationError>? validationErrors,
      ErrorMetadata? metadata,
      bool isRetriable,
      int? suggestedRetryDelaySeconds});

  @override
  $ErrorMetadataCopyWith<$Res>? get metadata;
}

/// @nodoc
class __$$MindExceptionImplCopyWithImpl<$Res>
    extends _$MindExceptionCopyWithImpl<$Res, _$MindExceptionImpl>
    implements _$$MindExceptionImplCopyWith<$Res> {
  __$$MindExceptionImplCopyWithImpl(
      _$MindExceptionImpl _value, $Res Function(_$MindExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of MindException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = null,
    Object? category = null,
    Object? severity = null,
    Object? source = null,
    Object? technicalMessage = freezed,
    Object? userMessage = freezed,
    Object? resolutionSteps = freezed,
    Object? documentationUrl = freezed,
    Object? supportContact = freezed,
    Object? validationErrors = freezed,
    Object? metadata = freezed,
    Object? isRetriable = null,
    Object? suggestedRetryDelaySeconds = freezed,
  }) {
    return _then(_$MindExceptionImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ErrorCategory,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as ExceptionSeverity,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as ErrorSource,
      technicalMessage: freezed == technicalMessage
          ? _value.technicalMessage
          : technicalMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      userMessage: freezed == userMessage
          ? _value.userMessage
          : userMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      resolutionSteps: freezed == resolutionSteps
          ? _value._resolutionSteps
          : resolutionSteps // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      documentationUrl: freezed == documentationUrl
          ? _value.documentationUrl
          : documentationUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      supportContact: freezed == supportContact
          ? _value.supportContact
          : supportContact // ignore: cast_nullable_to_non_nullable
              as String?,
      validationErrors: freezed == validationErrors
          ? _value._validationErrors
          : validationErrors // ignore: cast_nullable_to_non_nullable
              as List<ValidationError>?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as ErrorMetadata?,
      isRetriable: null == isRetriable
          ? _value.isRetriable
          : isRetriable // ignore: cast_nullable_to_non_nullable
              as bool,
      suggestedRetryDelaySeconds: freezed == suggestedRetryDelaySeconds
          ? _value.suggestedRetryDelaySeconds
          : suggestedRetryDelaySeconds // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MindExceptionImpl extends _MindException {
  const _$MindExceptionImpl(
      {required this.message,
      required this.code,
      this.category = ErrorCategory.unknown,
      this.severity = ExceptionSeverity.error,
      this.source = ErrorSource.sdk,
      this.technicalMessage,
      this.userMessage,
      final List<String>? resolutionSteps,
      this.documentationUrl,
      this.supportContact,
      final List<ValidationError>? validationErrors,
      this.metadata,
      this.isRetriable = false,
      this.suggestedRetryDelaySeconds})
      : _resolutionSteps = resolutionSteps,
        _validationErrors = validationErrors,
        super._();

  factory _$MindExceptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$MindExceptionImplFromJson(json);

  /// Main error message
  @override
  final String message;

  /// Unique error code
  @override
  final String code;

  /// Error category
  @override
  @JsonKey()
  final ErrorCategory category;

  /// Error severity
  @override
  @JsonKey()
  final ExceptionSeverity severity;

  /// Source of the error
  @override
  @JsonKey()
  final ErrorSource source;

  /// Technical description for developers
  @override
  final String? technicalMessage;

  /// User-friendly message that can be shown to end users
  @override
  final String? userMessage;

  /// Suggested resolution steps
  final List<String>? _resolutionSteps;

  /// Suggested resolution steps
  @override
  List<String>? get resolutionSteps {
    final value = _resolutionSteps;
    if (value == null) return null;
    if (_resolutionSteps is EqualUnmodifiableListView) return _resolutionSteps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Related documentation URL
  @override
  final String? documentationUrl;

  /// Support contact information
  @override
  final String? supportContact;

  /// List of validation errors if applicable
  final List<ValidationError>? _validationErrors;

  /// List of validation errors if applicable
  @override
  List<ValidationError>? get validationErrors {
    final value = _validationErrors;
    if (value == null) return null;
    if (_validationErrors is EqualUnmodifiableListView)
      return _validationErrors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Additional error metadata
  @override
  final ErrorMetadata? metadata;

  /// Whether the error is retriable
  @override
  @JsonKey()
  final bool isRetriable;

  /// Suggested retry delay in seconds
  @override
  final int? suggestedRetryDelaySeconds;

  @override
  String toString() {
    return 'MindException(message: $message, code: $code, category: $category, severity: $severity, source: $source, technicalMessage: $technicalMessage, userMessage: $userMessage, resolutionSteps: $resolutionSteps, documentationUrl: $documentationUrl, supportContact: $supportContact, validationErrors: $validationErrors, metadata: $metadata, isRetriable: $isRetriable, suggestedRetryDelaySeconds: $suggestedRetryDelaySeconds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MindExceptionImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.technicalMessage, technicalMessage) ||
                other.technicalMessage == technicalMessage) &&
            (identical(other.userMessage, userMessage) ||
                other.userMessage == userMessage) &&
            const DeepCollectionEquality()
                .equals(other._resolutionSteps, _resolutionSteps) &&
            (identical(other.documentationUrl, documentationUrl) ||
                other.documentationUrl == documentationUrl) &&
            (identical(other.supportContact, supportContact) ||
                other.supportContact == supportContact) &&
            const DeepCollectionEquality()
                .equals(other._validationErrors, _validationErrors) &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            (identical(other.isRetriable, isRetriable) ||
                other.isRetriable == isRetriable) &&
            (identical(other.suggestedRetryDelaySeconds,
                    suggestedRetryDelaySeconds) ||
                other.suggestedRetryDelaySeconds ==
                    suggestedRetryDelaySeconds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      message,
      code,
      category,
      severity,
      source,
      technicalMessage,
      userMessage,
      const DeepCollectionEquality().hash(_resolutionSteps),
      documentationUrl,
      supportContact,
      const DeepCollectionEquality().hash(_validationErrors),
      metadata,
      isRetriable,
      suggestedRetryDelaySeconds);

  /// Create a copy of MindException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MindExceptionImplCopyWith<_$MindExceptionImpl> get copyWith =>
      __$$MindExceptionImplCopyWithImpl<_$MindExceptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MindExceptionImplToJson(
      this,
    );
  }
}

abstract class _MindException extends MindException {
  const factory _MindException(
      {required final String message,
      required final String code,
      final ErrorCategory category,
      final ExceptionSeverity severity,
      final ErrorSource source,
      final String? technicalMessage,
      final String? userMessage,
      final List<String>? resolutionSteps,
      final String? documentationUrl,
      final String? supportContact,
      final List<ValidationError>? validationErrors,
      final ErrorMetadata? metadata,
      final bool isRetriable,
      final int? suggestedRetryDelaySeconds}) = _$MindExceptionImpl;
  const _MindException._() : super._();

  factory _MindException.fromJson(Map<String, dynamic> json) =
      _$MindExceptionImpl.fromJson;

  /// Main error message
  @override
  String get message;

  /// Unique error code
  @override
  String get code;

  /// Error category
  @override
  ErrorCategory get category;

  /// Error severity
  @override
  ExceptionSeverity get severity;

  /// Source of the error
  @override
  ErrorSource get source;

  /// Technical description for developers
  @override
  String? get technicalMessage;

  /// User-friendly message that can be shown to end users
  @override
  String? get userMessage;

  /// Suggested resolution steps
  @override
  List<String>? get resolutionSteps;

  /// Related documentation URL
  @override
  String? get documentationUrl;

  /// Support contact information
  @override
  String? get supportContact;

  /// List of validation errors if applicable
  @override
  List<ValidationError>? get validationErrors;

  /// Additional error metadata
  @override
  ErrorMetadata? get metadata;

  /// Whether the error is retriable
  @override
  bool get isRetriable;

  /// Suggested retry delay in seconds
  @override
  int? get suggestedRetryDelaySeconds;

  /// Create a copy of MindException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MindExceptionImplCopyWith<_$MindExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
