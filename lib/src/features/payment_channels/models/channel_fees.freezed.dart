// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'channel_fees.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChannelFees _$ChannelFeesFromJson(Map<String, dynamic> json) {
  return _ChannelFees.fromJson(json);
}

/// @nodoc
mixin _$ChannelFees {
  /// Channel identifier
  String get channel => throw _privateConstructorUsedError;

  /// Fee amount
  int get amount => throw _privateConstructorUsedError;

  /// Fee percentage
  double get percentage => throw _privateConstructorUsedError;

  /// Cap on fees
  int? get cap => throw _privateConstructorUsedError;

  /// Additional fees
  Map<String, int>? get additionalFees => throw _privateConstructorUsedError;

  /// Fee breakdown
  Map<String, dynamic>? get breakdown => throw _privateConstructorUsedError;

  /// Currency
  String get currency => throw _privateConstructorUsedError;

  /// Serializes this ChannelFees to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChannelFees
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChannelFeesCopyWith<ChannelFees> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChannelFeesCopyWith<$Res> {
  factory $ChannelFeesCopyWith(
          ChannelFees value, $Res Function(ChannelFees) then) =
      _$ChannelFeesCopyWithImpl<$Res, ChannelFees>;
  @useResult
  $Res call(
      {String channel,
      int amount,
      double percentage,
      int? cap,
      Map<String, int>? additionalFees,
      Map<String, dynamic>? breakdown,
      String currency});
}

/// @nodoc
class _$ChannelFeesCopyWithImpl<$Res, $Val extends ChannelFees>
    implements $ChannelFeesCopyWith<$Res> {
  _$ChannelFeesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChannelFees
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channel = null,
    Object? amount = null,
    Object? percentage = null,
    Object? cap = freezed,
    Object? additionalFees = freezed,
    Object? breakdown = freezed,
    Object? currency = null,
  }) {
    return _then(_value.copyWith(
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
      cap: freezed == cap
          ? _value.cap
          : cap // ignore: cast_nullable_to_non_nullable
              as int?,
      additionalFees: freezed == additionalFees
          ? _value.additionalFees
          : additionalFees // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
      breakdown: freezed == breakdown
          ? _value.breakdown
          : breakdown // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChannelFeesImplCopyWith<$Res>
    implements $ChannelFeesCopyWith<$Res> {
  factory _$$ChannelFeesImplCopyWith(
          _$ChannelFeesImpl value, $Res Function(_$ChannelFeesImpl) then) =
      __$$ChannelFeesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String channel,
      int amount,
      double percentage,
      int? cap,
      Map<String, int>? additionalFees,
      Map<String, dynamic>? breakdown,
      String currency});
}

/// @nodoc
class __$$ChannelFeesImplCopyWithImpl<$Res>
    extends _$ChannelFeesCopyWithImpl<$Res, _$ChannelFeesImpl>
    implements _$$ChannelFeesImplCopyWith<$Res> {
  __$$ChannelFeesImplCopyWithImpl(
      _$ChannelFeesImpl _value, $Res Function(_$ChannelFeesImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChannelFees
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channel = null,
    Object? amount = null,
    Object? percentage = null,
    Object? cap = freezed,
    Object? additionalFees = freezed,
    Object? breakdown = freezed,
    Object? currency = null,
  }) {
    return _then(_$ChannelFeesImpl(
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
      cap: freezed == cap
          ? _value.cap
          : cap // ignore: cast_nullable_to_non_nullable
              as int?,
      additionalFees: freezed == additionalFees
          ? _value._additionalFees
          : additionalFees // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
      breakdown: freezed == breakdown
          ? _value._breakdown
          : breakdown // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChannelFeesImpl implements _ChannelFees {
  const _$ChannelFeesImpl(
      {required this.channel,
      required this.amount,
      required this.percentage,
      this.cap,
      final Map<String, int>? additionalFees,
      final Map<String, dynamic>? breakdown,
      required this.currency})
      : _additionalFees = additionalFees,
        _breakdown = breakdown;

  factory _$ChannelFeesImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChannelFeesImplFromJson(json);

  /// Channel identifier
  @override
  final String channel;

  /// Fee amount
  @override
  final int amount;

  /// Fee percentage
  @override
  final double percentage;

  /// Cap on fees
  @override
  final int? cap;

  /// Additional fees
  final Map<String, int>? _additionalFees;

  /// Additional fees
  @override
  Map<String, int>? get additionalFees {
    final value = _additionalFees;
    if (value == null) return null;
    if (_additionalFees is EqualUnmodifiableMapView) return _additionalFees;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Fee breakdown
  final Map<String, dynamic>? _breakdown;

  /// Fee breakdown
  @override
  Map<String, dynamic>? get breakdown {
    final value = _breakdown;
    if (value == null) return null;
    if (_breakdown is EqualUnmodifiableMapView) return _breakdown;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Currency
  @override
  final String currency;

  @override
  String toString() {
    return 'ChannelFees(channel: $channel, amount: $amount, percentage: $percentage, cap: $cap, additionalFees: $additionalFees, breakdown: $breakdown, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChannelFeesImpl &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.cap, cap) || other.cap == cap) &&
            const DeepCollectionEquality()
                .equals(other._additionalFees, _additionalFees) &&
            const DeepCollectionEquality()
                .equals(other._breakdown, _breakdown) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      channel,
      amount,
      percentage,
      cap,
      const DeepCollectionEquality().hash(_additionalFees),
      const DeepCollectionEquality().hash(_breakdown),
      currency);

  /// Create a copy of ChannelFees
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChannelFeesImplCopyWith<_$ChannelFeesImpl> get copyWith =>
      __$$ChannelFeesImplCopyWithImpl<_$ChannelFeesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChannelFeesImplToJson(
      this,
    );
  }
}

abstract class _ChannelFees implements ChannelFees {
  const factory _ChannelFees(
      {required final String channel,
      required final int amount,
      required final double percentage,
      final int? cap,
      final Map<String, int>? additionalFees,
      final Map<String, dynamic>? breakdown,
      required final String currency}) = _$ChannelFeesImpl;

  factory _ChannelFees.fromJson(Map<String, dynamic> json) =
      _$ChannelFeesImpl.fromJson;

  /// Channel identifier
  @override
  String get channel;

  /// Fee amount
  @override
  int get amount;

  /// Fee percentage
  @override
  double get percentage;

  /// Cap on fees
  @override
  int? get cap;

  /// Additional fees
  @override
  Map<String, int>? get additionalFees;

  /// Fee breakdown
  @override
  Map<String, dynamic>? get breakdown;

  /// Currency
  @override
  String get currency;

  /// Create a copy of ChannelFees
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChannelFeesImplCopyWith<_$ChannelFeesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
