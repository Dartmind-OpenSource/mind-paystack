// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_channel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentChannel _$PaymentChannelFromJson(Map<String, dynamic> json) {
  return _PaymentChannel.fromJson(json);
}

/// @nodoc
mixin _$PaymentChannel {
  /// Unique identifier for the channel
  String get id => throw _privateConstructorUsedError;

  /// Name of the channel
  String get name => throw _privateConstructorUsedError;

  /// Channel code/slug
  String get code => throw _privateConstructorUsedError;

  /// Channel type (card, bank, ussd, etc)
  String get type => throw _privateConstructorUsedError;

  /// Currency supported by the channel
  String get currency => throw _privateConstructorUsedError;

  /// Minimum amount allowed
  int? get minimumAmount => throw _privateConstructorUsedError;

  /// Maximum amount allowed
  int? get maximumAmount => throw _privateConstructorUsedError;

  /// Channel configuration
  Map<String, dynamic>? get configuration => throw _privateConstructorUsedError;

  /// Whether channel is currently active
  bool get isActive => throw _privateConstructorUsedError;

  /// Whether channel supports recurring payments
  bool get supportsRecurring => throw _privateConstructorUsedError;

  /// Country where channel is available
  String get country => throw _privateConstructorUsedError;

  /// Creation timestamp
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Last update timestamp
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this PaymentChannel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentChannel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentChannelCopyWith<PaymentChannel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentChannelCopyWith<$Res> {
  factory $PaymentChannelCopyWith(
          PaymentChannel value, $Res Function(PaymentChannel) then) =
      _$PaymentChannelCopyWithImpl<$Res, PaymentChannel>;
  @useResult
  $Res call(
      {String id,
      String name,
      String code,
      String type,
      String currency,
      int? minimumAmount,
      int? maximumAmount,
      Map<String, dynamic>? configuration,
      bool isActive,
      bool supportsRecurring,
      String country,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$PaymentChannelCopyWithImpl<$Res, $Val extends PaymentChannel>
    implements $PaymentChannelCopyWith<$Res> {
  _$PaymentChannelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentChannel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? code = null,
    Object? type = null,
    Object? currency = null,
    Object? minimumAmount = freezed,
    Object? maximumAmount = freezed,
    Object? configuration = freezed,
    Object? isActive = null,
    Object? supportsRecurring = null,
    Object? country = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      minimumAmount: freezed == minimumAmount
          ? _value.minimumAmount
          : minimumAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      maximumAmount: freezed == maximumAmount
          ? _value.maximumAmount
          : maximumAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      configuration: freezed == configuration
          ? _value.configuration
          : configuration // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      supportsRecurring: null == supportsRecurring
          ? _value.supportsRecurring
          : supportsRecurring // ignore: cast_nullable_to_non_nullable
              as bool,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
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
abstract class _$$PaymentChannelImplCopyWith<$Res>
    implements $PaymentChannelCopyWith<$Res> {
  factory _$$PaymentChannelImplCopyWith(_$PaymentChannelImpl value,
          $Res Function(_$PaymentChannelImpl) then) =
      __$$PaymentChannelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String code,
      String type,
      String currency,
      int? minimumAmount,
      int? maximumAmount,
      Map<String, dynamic>? configuration,
      bool isActive,
      bool supportsRecurring,
      String country,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$PaymentChannelImplCopyWithImpl<$Res>
    extends _$PaymentChannelCopyWithImpl<$Res, _$PaymentChannelImpl>
    implements _$$PaymentChannelImplCopyWith<$Res> {
  __$$PaymentChannelImplCopyWithImpl(
      _$PaymentChannelImpl _value, $Res Function(_$PaymentChannelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentChannel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? code = null,
    Object? type = null,
    Object? currency = null,
    Object? minimumAmount = freezed,
    Object? maximumAmount = freezed,
    Object? configuration = freezed,
    Object? isActive = null,
    Object? supportsRecurring = null,
    Object? country = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$PaymentChannelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      minimumAmount: freezed == minimumAmount
          ? _value.minimumAmount
          : minimumAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      maximumAmount: freezed == maximumAmount
          ? _value.maximumAmount
          : maximumAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      configuration: freezed == configuration
          ? _value._configuration
          : configuration // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      supportsRecurring: null == supportsRecurring
          ? _value.supportsRecurring
          : supportsRecurring // ignore: cast_nullable_to_non_nullable
              as bool,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
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
class _$PaymentChannelImpl implements _PaymentChannel {
  const _$PaymentChannelImpl(
      {required this.id,
      required this.name,
      required this.code,
      required this.type,
      required this.currency,
      this.minimumAmount,
      this.maximumAmount,
      final Map<String, dynamic>? configuration,
      this.isActive = true,
      this.supportsRecurring = false,
      required this.country,
      required this.createdAt,
      required this.updatedAt})
      : _configuration = configuration;

  factory _$PaymentChannelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentChannelImplFromJson(json);

  /// Unique identifier for the channel
  @override
  final String id;

  /// Name of the channel
  @override
  final String name;

  /// Channel code/slug
  @override
  final String code;

  /// Channel type (card, bank, ussd, etc)
  @override
  final String type;

  /// Currency supported by the channel
  @override
  final String currency;

  /// Minimum amount allowed
  @override
  final int? minimumAmount;

  /// Maximum amount allowed
  @override
  final int? maximumAmount;

  /// Channel configuration
  final Map<String, dynamic>? _configuration;

  /// Channel configuration
  @override
  Map<String, dynamic>? get configuration {
    final value = _configuration;
    if (value == null) return null;
    if (_configuration is EqualUnmodifiableMapView) return _configuration;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Whether channel is currently active
  @override
  @JsonKey()
  final bool isActive;

  /// Whether channel supports recurring payments
  @override
  @JsonKey()
  final bool supportsRecurring;

  /// Country where channel is available
  @override
  final String country;

  /// Creation timestamp
  @override
  final DateTime createdAt;

  /// Last update timestamp
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'PaymentChannel(id: $id, name: $name, code: $code, type: $type, currency: $currency, minimumAmount: $minimumAmount, maximumAmount: $maximumAmount, configuration: $configuration, isActive: $isActive, supportsRecurring: $supportsRecurring, country: $country, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentChannelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.minimumAmount, minimumAmount) ||
                other.minimumAmount == minimumAmount) &&
            (identical(other.maximumAmount, maximumAmount) ||
                other.maximumAmount == maximumAmount) &&
            const DeepCollectionEquality()
                .equals(other._configuration, _configuration) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.supportsRecurring, supportsRecurring) ||
                other.supportsRecurring == supportsRecurring) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      code,
      type,
      currency,
      minimumAmount,
      maximumAmount,
      const DeepCollectionEquality().hash(_configuration),
      isActive,
      supportsRecurring,
      country,
      createdAt,
      updatedAt);

  /// Create a copy of PaymentChannel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentChannelImplCopyWith<_$PaymentChannelImpl> get copyWith =>
      __$$PaymentChannelImplCopyWithImpl<_$PaymentChannelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentChannelImplToJson(
      this,
    );
  }
}

abstract class _PaymentChannel implements PaymentChannel {
  const factory _PaymentChannel(
      {required final String id,
      required final String name,
      required final String code,
      required final String type,
      required final String currency,
      final int? minimumAmount,
      final int? maximumAmount,
      final Map<String, dynamic>? configuration,
      final bool isActive,
      final bool supportsRecurring,
      required final String country,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$PaymentChannelImpl;

  factory _PaymentChannel.fromJson(Map<String, dynamic> json) =
      _$PaymentChannelImpl.fromJson;

  /// Unique identifier for the channel
  @override
  String get id;

  /// Name of the channel
  @override
  String get name;

  /// Channel code/slug
  @override
  String get code;

  /// Channel type (card, bank, ussd, etc)
  @override
  String get type;

  /// Currency supported by the channel
  @override
  String get currency;

  /// Minimum amount allowed
  @override
  int? get minimumAmount;

  /// Maximum amount allowed
  @override
  int? get maximumAmount;

  /// Channel configuration
  @override
  Map<String, dynamic>? get configuration;

  /// Whether channel is currently active
  @override
  bool get isActive;

  /// Whether channel supports recurring payments
  @override
  bool get supportsRecurring;

  /// Country where channel is available
  @override
  String get country;

  /// Creation timestamp
  @override
  DateTime get createdAt;

  /// Last update timestamp
  @override
  DateTime get updatedAt;

  /// Create a copy of PaymentChannel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentChannelImplCopyWith<_$PaymentChannelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
