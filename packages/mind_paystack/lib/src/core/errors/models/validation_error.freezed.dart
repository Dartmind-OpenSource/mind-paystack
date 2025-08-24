// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'validation_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ValidationError _$ValidationErrorFromJson(Map<String, dynamic> json) {
  return _ValidationError.fromJson(json);
}

/// @nodoc
mixin _$ValidationError {
  /// Name of the field or parameter that failed validation.
  ///
  /// This corresponds to the API parameter name or form field identifier
  /// that caused the validation error. Used for targeting specific
  /// form fields or parameters for error display.
  /// Examples: 'email', 'amount', 'currency', 'reference'
  String get field => throw _privateConstructorUsedError;

  /// Human-readable description of the validation error.
  ///
  /// This message can be displayed directly to users or used as a basis
  /// for creating user-friendly error messages. Should clearly explain
  /// what went wrong and potentially how to fix it.
  String get message => throw _privateConstructorUsedError;

  /// Category or type of validation that failed.
  ///
  /// Provides programmatic identification of the validation rule that
  /// was violated, enabling specific error handling logic.
  /// Examples: 'required', 'format', 'range', 'length', 'pattern'
  String get type => throw _privateConstructorUsedError;

  /// The actual value that was provided and failed validation.
  ///
  /// Contains the original input that caused the validation error.
  /// Useful for debugging and providing context in error messages.
  /// Can be any type depending on the field being validated.
  dynamic get actualValue => throw _privateConstructorUsedError;

  /// Expected value, format, or pattern for the field.
  ///
  /// Describes what the field should contain or match to pass validation.
  /// May be a specific value, a format example, a range, or a pattern.
  /// Examples: 'user@example.com', '1000-50000', '/^[A-Z]{3}$/'
  dynamic get expectedValue => throw _privateConstructorUsedError;

  /// Serializes this ValidationError to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ValidationError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ValidationErrorCopyWith<ValidationError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValidationErrorCopyWith<$Res> {
  factory $ValidationErrorCopyWith(
          ValidationError value, $Res Function(ValidationError) then) =
      _$ValidationErrorCopyWithImpl<$Res, ValidationError>;
  @useResult
  $Res call(
      {String field,
      String message,
      String type,
      dynamic actualValue,
      dynamic expectedValue});
}

/// @nodoc
class _$ValidationErrorCopyWithImpl<$Res, $Val extends ValidationError>
    implements $ValidationErrorCopyWith<$Res> {
  _$ValidationErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ValidationError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field = null,
    Object? message = null,
    Object? type = null,
    Object? actualValue = freezed,
    Object? expectedValue = freezed,
  }) {
    return _then(_value.copyWith(
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      actualValue: freezed == actualValue
          ? _value.actualValue
          : actualValue // ignore: cast_nullable_to_non_nullable
              as dynamic,
      expectedValue: freezed == expectedValue
          ? _value.expectedValue
          : expectedValue // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ValidationErrorImplCopyWith<$Res>
    implements $ValidationErrorCopyWith<$Res> {
  factory _$$ValidationErrorImplCopyWith(_$ValidationErrorImpl value,
          $Res Function(_$ValidationErrorImpl) then) =
      __$$ValidationErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String field,
      String message,
      String type,
      dynamic actualValue,
      dynamic expectedValue});
}

/// @nodoc
class __$$ValidationErrorImplCopyWithImpl<$Res>
    extends _$ValidationErrorCopyWithImpl<$Res, _$ValidationErrorImpl>
    implements _$$ValidationErrorImplCopyWith<$Res> {
  __$$ValidationErrorImplCopyWithImpl(
      _$ValidationErrorImpl _value, $Res Function(_$ValidationErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ValidationError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field = null,
    Object? message = null,
    Object? type = null,
    Object? actualValue = freezed,
    Object? expectedValue = freezed,
  }) {
    return _then(_$ValidationErrorImpl(
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      actualValue: freezed == actualValue
          ? _value.actualValue
          : actualValue // ignore: cast_nullable_to_non_nullable
              as dynamic,
      expectedValue: freezed == expectedValue
          ? _value.expectedValue
          : expectedValue // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ValidationErrorImpl implements _ValidationError {
  const _$ValidationErrorImpl(
      {required this.field,
      required this.message,
      required this.type,
      this.actualValue,
      this.expectedValue});

  factory _$ValidationErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$ValidationErrorImplFromJson(json);

  /// Name of the field or parameter that failed validation.
  ///
  /// This corresponds to the API parameter name or form field identifier
  /// that caused the validation error. Used for targeting specific
  /// form fields or parameters for error display.
  /// Examples: 'email', 'amount', 'currency', 'reference'
  @override
  final String field;

  /// Human-readable description of the validation error.
  ///
  /// This message can be displayed directly to users or used as a basis
  /// for creating user-friendly error messages. Should clearly explain
  /// what went wrong and potentially how to fix it.
  @override
  final String message;

  /// Category or type of validation that failed.
  ///
  /// Provides programmatic identification of the validation rule that
  /// was violated, enabling specific error handling logic.
  /// Examples: 'required', 'format', 'range', 'length', 'pattern'
  @override
  final String type;

  /// The actual value that was provided and failed validation.
  ///
  /// Contains the original input that caused the validation error.
  /// Useful for debugging and providing context in error messages.
  /// Can be any type depending on the field being validated.
  @override
  final dynamic actualValue;

  /// Expected value, format, or pattern for the field.
  ///
  /// Describes what the field should contain or match to pass validation.
  /// May be a specific value, a format example, a range, or a pattern.
  /// Examples: 'user@example.com', '1000-50000', '/^[A-Z]{3}$/'
  @override
  final dynamic expectedValue;

  @override
  String toString() {
    return 'ValidationError(field: $field, message: $message, type: $type, actualValue: $actualValue, expectedValue: $expectedValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidationErrorImpl &&
            (identical(other.field, field) || other.field == field) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other.actualValue, actualValue) &&
            const DeepCollectionEquality()
                .equals(other.expectedValue, expectedValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      field,
      message,
      type,
      const DeepCollectionEquality().hash(actualValue),
      const DeepCollectionEquality().hash(expectedValue));

  /// Create a copy of ValidationError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidationErrorImplCopyWith<_$ValidationErrorImpl> get copyWith =>
      __$$ValidationErrorImplCopyWithImpl<_$ValidationErrorImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ValidationErrorImplToJson(
      this,
    );
  }
}

abstract class _ValidationError implements ValidationError {
  const factory _ValidationError(
      {required final String field,
      required final String message,
      required final String type,
      final dynamic actualValue,
      final dynamic expectedValue}) = _$ValidationErrorImpl;

  factory _ValidationError.fromJson(Map<String, dynamic> json) =
      _$ValidationErrorImpl.fromJson;

  /// Name of the field or parameter that failed validation.
  ///
  /// This corresponds to the API parameter name or form field identifier
  /// that caused the validation error. Used for targeting specific
  /// form fields or parameters for error display.
  /// Examples: 'email', 'amount', 'currency', 'reference'
  @override
  String get field;

  /// Human-readable description of the validation error.
  ///
  /// This message can be displayed directly to users or used as a basis
  /// for creating user-friendly error messages. Should clearly explain
  /// what went wrong and potentially how to fix it.
  @override
  String get message;

  /// Category or type of validation that failed.
  ///
  /// Provides programmatic identification of the validation rule that
  /// was violated, enabling specific error handling logic.
  /// Examples: 'required', 'format', 'range', 'length', 'pattern'
  @override
  String get type;

  /// The actual value that was provided and failed validation.
  ///
  /// Contains the original input that caused the validation error.
  /// Useful for debugging and providing context in error messages.
  /// Can be any type depending on the field being validated.
  @override
  dynamic get actualValue;

  /// Expected value, format, or pattern for the field.
  ///
  /// Describes what the field should contain or match to pass validation.
  /// May be a specific value, a format example, a range, or a pattern.
  /// Examples: 'user@example.com', '1000-50000', '/^[A-Z]{3}$/'
  @override
  dynamic get expectedValue;

  /// Create a copy of ValidationError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValidationErrorImplCopyWith<_$ValidationErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
