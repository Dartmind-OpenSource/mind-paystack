// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionSession _$TransactionSessionFromJson(Map<String, dynamic> json) {
  return _TransactionSession.fromJson(json);
}

/// @nodoc
mixin _$TransactionSession {
  String get id => throw _privateConstructorUsedError;
  String get reference => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get deviceId => throw _privateConstructorUsedError;
  String get clientData => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this TransactionSession to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionSessionCopyWith<TransactionSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionSessionCopyWith<$Res> {
  factory $TransactionSessionCopyWith(
          TransactionSession value, $Res Function(TransactionSession) then) =
      _$TransactionSessionCopyWithImpl<$Res, TransactionSession>;
  @useResult
  $Res call(
      {String id,
      String reference,
      String status,
      String deviceId,
      String clientData,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$TransactionSessionCopyWithImpl<$Res, $Val extends TransactionSession>
    implements $TransactionSessionCopyWith<$Res> {
  _$TransactionSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? reference = null,
    Object? status = null,
    Object? deviceId = null,
    Object? clientData = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      clientData: null == clientData
          ? _value.clientData
          : clientData // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionSessionImplCopyWith<$Res>
    implements $TransactionSessionCopyWith<$Res> {
  factory _$$TransactionSessionImplCopyWith(_$TransactionSessionImpl value,
          $Res Function(_$TransactionSessionImpl) then) =
      __$$TransactionSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String reference,
      String status,
      String deviceId,
      String clientData,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$TransactionSessionImplCopyWithImpl<$Res>
    extends _$TransactionSessionCopyWithImpl<$Res, _$TransactionSessionImpl>
    implements _$$TransactionSessionImplCopyWith<$Res> {
  __$$TransactionSessionImplCopyWithImpl(_$TransactionSessionImpl _value,
      $Res Function(_$TransactionSessionImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? reference = null,
    Object? status = null,
    Object? deviceId = null,
    Object? clientData = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$TransactionSessionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      clientData: null == clientData
          ? _value.clientData
          : clientData // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionSessionImpl implements _TransactionSession {
  const _$TransactionSessionImpl(
      {required this.id,
      required this.reference,
      required this.status,
      required this.deviceId,
      required this.clientData,
      required this.createdAt,
      required this.updatedAt});

  factory _$TransactionSessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionSessionImplFromJson(json);

  @override
  final String id;
  @override
  final String reference;
  @override
  final String status;
  @override
  final String deviceId;
  @override
  final String clientData;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'TransactionSession(id: $id, reference: $reference, status: $status, deviceId: $deviceId, clientData: $clientData, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionSessionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.clientData, clientData) ||
                other.clientData == clientData) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, reference, status, deviceId,
      clientData, createdAt, updatedAt);

  /// Create a copy of TransactionSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionSessionImplCopyWith<_$TransactionSessionImpl> get copyWith =>
      __$$TransactionSessionImplCopyWithImpl<_$TransactionSessionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionSessionImplToJson(
      this,
    );
  }
}

abstract class _TransactionSession implements TransactionSession {
  const factory _TransactionSession(
      {required final String id,
      required final String reference,
      required final String status,
      required final String deviceId,
      required final String clientData,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$TransactionSessionImpl;

  factory _TransactionSession.fromJson(Map<String, dynamic> json) =
      _$TransactionSessionImpl.fromJson;

  @override
  String get id;
  @override
  String get reference;
  @override
  String get status;
  @override
  String get deviceId;
  @override
  String get clientData;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of TransactionSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionSessionImplCopyWith<_$TransactionSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
