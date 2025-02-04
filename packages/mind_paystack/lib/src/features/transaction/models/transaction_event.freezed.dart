// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionEvent _$TransactionEventFromJson(Map<String, dynamic> json) {
  return _TransactionEvent.fromJson(json);
}

/// @nodoc
mixin _$TransactionEvent {
  String get time => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  Map<String, dynamic>? get data => throw _privateConstructorUsedError;

  /// Serializes this TransactionEvent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionEventCopyWith<TransactionEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionEventCopyWith<$Res> {
  factory $TransactionEventCopyWith(
          TransactionEvent value, $Res Function(TransactionEvent) then) =
      _$TransactionEventCopyWithImpl<$Res, TransactionEvent>;
  @useResult
  $Res call(
      {String time, String type, String message, Map<String, dynamic>? data});
}

/// @nodoc
class _$TransactionEventCopyWithImpl<$Res, $Val extends TransactionEvent>
    implements $TransactionEventCopyWith<$Res> {
  _$TransactionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? type = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionEventImplCopyWith<$Res>
    implements $TransactionEventCopyWith<$Res> {
  factory _$$TransactionEventImplCopyWith(_$TransactionEventImpl value,
          $Res Function(_$TransactionEventImpl) then) =
      __$$TransactionEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String time, String type, String message, Map<String, dynamic>? data});
}

/// @nodoc
class __$$TransactionEventImplCopyWithImpl<$Res>
    extends _$TransactionEventCopyWithImpl<$Res, _$TransactionEventImpl>
    implements _$$TransactionEventImplCopyWith<$Res> {
  __$$TransactionEventImplCopyWithImpl(_$TransactionEventImpl _value,
      $Res Function(_$TransactionEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? type = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$TransactionEventImpl(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionEventImpl implements _TransactionEvent {
  const _$TransactionEventImpl(
      {required this.time,
      required this.type,
      required this.message,
      final Map<String, dynamic>? data})
      : _data = data;

  factory _$TransactionEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionEventImplFromJson(json);

  @override
  final String time;
  @override
  final String type;
  @override
  final String message;
  final Map<String, dynamic>? _data;
  @override
  Map<String, dynamic>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'TransactionEvent(time: $time, type: $type, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionEventImpl &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, time, type, message,
      const DeepCollectionEquality().hash(_data));

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionEventImplCopyWith<_$TransactionEventImpl> get copyWith =>
      __$$TransactionEventImplCopyWithImpl<_$TransactionEventImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionEventImplToJson(
      this,
    );
  }
}

abstract class _TransactionEvent implements TransactionEvent {
  const factory _TransactionEvent(
      {required final String time,
      required final String type,
      required final String message,
      final Map<String, dynamic>? data}) = _$TransactionEventImpl;

  factory _TransactionEvent.fromJson(Map<String, dynamic> json) =
      _$TransactionEventImpl.fromJson;

  @override
  String get time;
  @override
  String get type;
  @override
  String get message;
  @override
  Map<String, dynamic>? get data;

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionEventImplCopyWith<_$TransactionEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
