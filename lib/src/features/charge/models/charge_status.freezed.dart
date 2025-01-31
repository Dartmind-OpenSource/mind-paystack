// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'charge_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChargeStatus _$ChargeStatusFromJson(Map<String, dynamic> json) {
  return _ChargeStatus.fromJson(json);
}

/// @nodoc
mixin _$ChargeStatus {
  /// Transaction reference
  String get reference => throw _privateConstructorUsedError;

  /// Current status (success, pending, failed)
  String get status => throw _privateConstructorUsedError;

  /// Whether transaction requires verification
  bool get requiresVerification => throw _privateConstructorUsedError;

  /// Next required action (pin, otp, phone, birthday, redirect)
  String? get nextAction => throw _privateConstructorUsedError;

  /// Detailed status message
  String get message => throw _privateConstructorUsedError;

  /// Gateway response message
  String get gatewayResponse => throw _privateConstructorUsedError;

  /// Last check timestamp
  DateTime get checkedAt => throw _privateConstructorUsedError;

  /// Serializes this ChargeStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChargeStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChargeStatusCopyWith<ChargeStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChargeStatusCopyWith<$Res> {
  factory $ChargeStatusCopyWith(
          ChargeStatus value, $Res Function(ChargeStatus) then) =
      _$ChargeStatusCopyWithImpl<$Res, ChargeStatus>;
  @useResult
  $Res call(
      {String reference,
      String status,
      bool requiresVerification,
      String? nextAction,
      String message,
      String gatewayResponse,
      DateTime checkedAt});
}

/// @nodoc
class _$ChargeStatusCopyWithImpl<$Res, $Val extends ChargeStatus>
    implements $ChargeStatusCopyWith<$Res> {
  _$ChargeStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChargeStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reference = null,
    Object? status = null,
    Object? requiresVerification = null,
    Object? nextAction = freezed,
    Object? message = null,
    Object? gatewayResponse = null,
    Object? checkedAt = null,
  }) {
    return _then(_value.copyWith(
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      requiresVerification: null == requiresVerification
          ? _value.requiresVerification
          : requiresVerification // ignore: cast_nullable_to_non_nullable
              as bool,
      nextAction: freezed == nextAction
          ? _value.nextAction
          : nextAction // ignore: cast_nullable_to_non_nullable
              as String?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      gatewayResponse: null == gatewayResponse
          ? _value.gatewayResponse
          : gatewayResponse // ignore: cast_nullable_to_non_nullable
              as String,
      checkedAt: null == checkedAt
          ? _value.checkedAt
          : checkedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChargeStatusImplCopyWith<$Res>
    implements $ChargeStatusCopyWith<$Res> {
  factory _$$ChargeStatusImplCopyWith(
          _$ChargeStatusImpl value, $Res Function(_$ChargeStatusImpl) then) =
      __$$ChargeStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String reference,
      String status,
      bool requiresVerification,
      String? nextAction,
      String message,
      String gatewayResponse,
      DateTime checkedAt});
}

/// @nodoc
class __$$ChargeStatusImplCopyWithImpl<$Res>
    extends _$ChargeStatusCopyWithImpl<$Res, _$ChargeStatusImpl>
    implements _$$ChargeStatusImplCopyWith<$Res> {
  __$$ChargeStatusImplCopyWithImpl(
      _$ChargeStatusImpl _value, $Res Function(_$ChargeStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChargeStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reference = null,
    Object? status = null,
    Object? requiresVerification = null,
    Object? nextAction = freezed,
    Object? message = null,
    Object? gatewayResponse = null,
    Object? checkedAt = null,
  }) {
    return _then(_$ChargeStatusImpl(
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      requiresVerification: null == requiresVerification
          ? _value.requiresVerification
          : requiresVerification // ignore: cast_nullable_to_non_nullable
              as bool,
      nextAction: freezed == nextAction
          ? _value.nextAction
          : nextAction // ignore: cast_nullable_to_non_nullable
              as String?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      gatewayResponse: null == gatewayResponse
          ? _value.gatewayResponse
          : gatewayResponse // ignore: cast_nullable_to_non_nullable
              as String,
      checkedAt: null == checkedAt
          ? _value.checkedAt
          : checkedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChargeStatusImpl implements _ChargeStatus {
  const _$ChargeStatusImpl(
      {required this.reference,
      required this.status,
      this.requiresVerification = false,
      this.nextAction,
      required this.message,
      required this.gatewayResponse,
      required this.checkedAt});

  factory _$ChargeStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChargeStatusImplFromJson(json);

  /// Transaction reference
  @override
  final String reference;

  /// Current status (success, pending, failed)
  @override
  final String status;

  /// Whether transaction requires verification
  @override
  @JsonKey()
  final bool requiresVerification;

  /// Next required action (pin, otp, phone, birthday, redirect)
  @override
  final String? nextAction;

  /// Detailed status message
  @override
  final String message;

  /// Gateway response message
  @override
  final String gatewayResponse;

  /// Last check timestamp
  @override
  final DateTime checkedAt;

  @override
  String toString() {
    return 'ChargeStatus(reference: $reference, status: $status, requiresVerification: $requiresVerification, nextAction: $nextAction, message: $message, gatewayResponse: $gatewayResponse, checkedAt: $checkedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChargeStatusImpl &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.requiresVerification, requiresVerification) ||
                other.requiresVerification == requiresVerification) &&
            (identical(other.nextAction, nextAction) ||
                other.nextAction == nextAction) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.gatewayResponse, gatewayResponse) ||
                other.gatewayResponse == gatewayResponse) &&
            (identical(other.checkedAt, checkedAt) ||
                other.checkedAt == checkedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, reference, status,
      requiresVerification, nextAction, message, gatewayResponse, checkedAt);

  /// Create a copy of ChargeStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChargeStatusImplCopyWith<_$ChargeStatusImpl> get copyWith =>
      __$$ChargeStatusImplCopyWithImpl<_$ChargeStatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChargeStatusImplToJson(
      this,
    );
  }
}

abstract class _ChargeStatus implements ChargeStatus {
  const factory _ChargeStatus(
      {required final String reference,
      required final String status,
      final bool requiresVerification,
      final String? nextAction,
      required final String message,
      required final String gatewayResponse,
      required final DateTime checkedAt}) = _$ChargeStatusImpl;

  factory _ChargeStatus.fromJson(Map<String, dynamic> json) =
      _$ChargeStatusImpl.fromJson;

  /// Transaction reference
  @override
  String get reference;

  /// Current status (success, pending, failed)
  @override
  String get status;

  /// Whether transaction requires verification
  @override
  bool get requiresVerification;

  /// Next required action (pin, otp, phone, birthday, redirect)
  @override
  String? get nextAction;

  /// Detailed status message
  @override
  String get message;

  /// Gateway response message
  @override
  String get gatewayResponse;

  /// Last check timestamp
  @override
  DateTime get checkedAt;

  /// Create a copy of ChargeStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChargeStatusImplCopyWith<_$ChargeStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
