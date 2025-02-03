// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mobile_money.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MobileMoney _$MobileMoneyFromJson(Map<String, dynamic> json) {
  return _MobileMoney.fromJson(json);
}

/// @nodoc
mixin _$MobileMoney {
  /// Provider code
  String get code => throw _privateConstructorUsedError;

  /// Provider name
  String get name => throw _privateConstructorUsedError;

  /// Provider logo URL
  String? get logoUrl => throw _privateConstructorUsedError;

  /// Supported currencies
  List<String>? get currencies => throw _privateConstructorUsedError;

  /// Country of operation
  String get country => throw _privateConstructorUsedError;

  /// Whether provider is active
  bool get isActive => throw _privateConstructorUsedError;

  /// Payment type
  String get type => throw _privateConstructorUsedError;

  /// Creation timestamp
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this MobileMoney to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MobileMoney
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MobileMoneyCopyWith<MobileMoney> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MobileMoneyCopyWith<$Res> {
  factory $MobileMoneyCopyWith(
          MobileMoney value, $Res Function(MobileMoney) then) =
      _$MobileMoneyCopyWithImpl<$Res, MobileMoney>;
  @useResult
  $Res call(
      {String code,
      String name,
      String? logoUrl,
      List<String>? currencies,
      String country,
      bool isActive,
      String type,
      DateTime createdAt});
}

/// @nodoc
class _$MobileMoneyCopyWithImpl<$Res, $Val extends MobileMoney>
    implements $MobileMoneyCopyWith<$Res> {
  _$MobileMoneyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MobileMoney
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? logoUrl = freezed,
    Object? currencies = freezed,
    Object? country = null,
    Object? isActive = null,
    Object? type = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      currencies: freezed == currencies
          ? _value.currencies
          : currencies // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MobileMoneyImplCopyWith<$Res>
    implements $MobileMoneyCopyWith<$Res> {
  factory _$$MobileMoneyImplCopyWith(
          _$MobileMoneyImpl value, $Res Function(_$MobileMoneyImpl) then) =
      __$$MobileMoneyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code,
      String name,
      String? logoUrl,
      List<String>? currencies,
      String country,
      bool isActive,
      String type,
      DateTime createdAt});
}

/// @nodoc
class __$$MobileMoneyImplCopyWithImpl<$Res>
    extends _$MobileMoneyCopyWithImpl<$Res, _$MobileMoneyImpl>
    implements _$$MobileMoneyImplCopyWith<$Res> {
  __$$MobileMoneyImplCopyWithImpl(
      _$MobileMoneyImpl _value, $Res Function(_$MobileMoneyImpl) _then)
      : super(_value, _then);

  /// Create a copy of MobileMoney
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? logoUrl = freezed,
    Object? currencies = freezed,
    Object? country = null,
    Object? isActive = null,
    Object? type = null,
    Object? createdAt = null,
  }) {
    return _then(_$MobileMoneyImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      currencies: freezed == currencies
          ? _value._currencies
          : currencies // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MobileMoneyImpl implements _MobileMoney {
  const _$MobileMoneyImpl(
      {required this.code,
      required this.name,
      this.logoUrl,
      final List<String>? currencies,
      required this.country,
      this.isActive = true,
      this.type = 'mobile_money',
      required this.createdAt})
      : _currencies = currencies;

  factory _$MobileMoneyImpl.fromJson(Map<String, dynamic> json) =>
      _$$MobileMoneyImplFromJson(json);

  /// Provider code
  @override
  final String code;

  /// Provider name
  @override
  final String name;

  /// Provider logo URL
  @override
  final String? logoUrl;

  /// Supported currencies
  final List<String>? _currencies;

  /// Supported currencies
  @override
  List<String>? get currencies {
    final value = _currencies;
    if (value == null) return null;
    if (_currencies is EqualUnmodifiableListView) return _currencies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Country of operation
  @override
  final String country;

  /// Whether provider is active
  @override
  @JsonKey()
  final bool isActive;

  /// Payment type
  @override
  @JsonKey()
  final String type;

  /// Creation timestamp
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'MobileMoney(code: $code, name: $name, logoUrl: $logoUrl, currencies: $currencies, country: $country, isActive: $isActive, type: $type, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MobileMoneyImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            const DeepCollectionEquality()
                .equals(other._currencies, _currencies) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      code,
      name,
      logoUrl,
      const DeepCollectionEquality().hash(_currencies),
      country,
      isActive,
      type,
      createdAt);

  /// Create a copy of MobileMoney
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MobileMoneyImplCopyWith<_$MobileMoneyImpl> get copyWith =>
      __$$MobileMoneyImplCopyWithImpl<_$MobileMoneyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MobileMoneyImplToJson(
      this,
    );
  }
}

abstract class _MobileMoney implements MobileMoney {
  const factory _MobileMoney(
      {required final String code,
      required final String name,
      final String? logoUrl,
      final List<String>? currencies,
      required final String country,
      final bool isActive,
      final String type,
      required final DateTime createdAt}) = _$MobileMoneyImpl;

  factory _MobileMoney.fromJson(Map<String, dynamic> json) =
      _$MobileMoneyImpl.fromJson;

  /// Provider code
  @override
  String get code;

  /// Provider name
  @override
  String get name;

  /// Provider logo URL
  @override
  String? get logoUrl;

  /// Supported currencies
  @override
  List<String>? get currencies;

  /// Country of operation
  @override
  String get country;

  /// Whether provider is active
  @override
  bool get isActive;

  /// Payment type
  @override
  String get type;

  /// Creation timestamp
  @override
  DateTime get createdAt;

  /// Create a copy of MobileMoney
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MobileMoneyImplCopyWith<_$MobileMoneyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
