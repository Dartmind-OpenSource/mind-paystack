// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Bank _$BankFromJson(Map<String, dynamic> json) {
  return _Bank.fromJson(json);
}

/// @nodoc
mixin _$Bank {
  /// Bank code
  String get code => throw _privateConstructorUsedError;

  /// Bank name
  String get name => throw _privateConstructorUsedError;

  /// Bank slug
  String get slug => throw _privateConstructorUsedError;

  /// Bank USSD code
  String? get ussdCode => throw _privateConstructorUsedError;

  /// Bank logo URL
  String? get logoUrl => throw _privateConstructorUsedError;

  /// Supported payment types
  List<String>? get supportedPaymentTypes => throw _privateConstructorUsedError;

  /// Whether bank is active
  bool get isActive => throw _privateConstructorUsedError;

  /// Country where bank operates
  String get country => throw _privateConstructorUsedError;

  /// Bank type (commercial, microfinance, etc)
  String? get type => throw _privateConstructorUsedError;

  /// Gateway identifier
  String? get gateway => throw _privateConstructorUsedError;

  /// Creation timestamp
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this Bank to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Bank
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BankCopyWith<Bank> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankCopyWith<$Res> {
  factory $BankCopyWith(Bank value, $Res Function(Bank) then) =
      _$BankCopyWithImpl<$Res, Bank>;
  @useResult
  $Res call(
      {String code,
      String name,
      String slug,
      String? ussdCode,
      String? logoUrl,
      List<String>? supportedPaymentTypes,
      bool isActive,
      String country,
      String? type,
      String? gateway,
      DateTime createdAt});
}

/// @nodoc
class _$BankCopyWithImpl<$Res, $Val extends Bank>
    implements $BankCopyWith<$Res> {
  _$BankCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Bank
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? slug = null,
    Object? ussdCode = freezed,
    Object? logoUrl = freezed,
    Object? supportedPaymentTypes = freezed,
    Object? isActive = null,
    Object? country = null,
    Object? type = freezed,
    Object? gateway = freezed,
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
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      ussdCode: freezed == ussdCode
          ? _value.ussdCode
          : ussdCode // ignore: cast_nullable_to_non_nullable
              as String?,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      supportedPaymentTypes: freezed == supportedPaymentTypes
          ? _value.supportedPaymentTypes
          : supportedPaymentTypes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      gateway: freezed == gateway
          ? _value.gateway
          : gateway // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BankImplCopyWith<$Res> implements $BankCopyWith<$Res> {
  factory _$$BankImplCopyWith(
          _$BankImpl value, $Res Function(_$BankImpl) then) =
      __$$BankImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code,
      String name,
      String slug,
      String? ussdCode,
      String? logoUrl,
      List<String>? supportedPaymentTypes,
      bool isActive,
      String country,
      String? type,
      String? gateway,
      DateTime createdAt});
}

/// @nodoc
class __$$BankImplCopyWithImpl<$Res>
    extends _$BankCopyWithImpl<$Res, _$BankImpl>
    implements _$$BankImplCopyWith<$Res> {
  __$$BankImplCopyWithImpl(_$BankImpl _value, $Res Function(_$BankImpl) _then)
      : super(_value, _then);

  /// Create a copy of Bank
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? slug = null,
    Object? ussdCode = freezed,
    Object? logoUrl = freezed,
    Object? supportedPaymentTypes = freezed,
    Object? isActive = null,
    Object? country = null,
    Object? type = freezed,
    Object? gateway = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$BankImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      ussdCode: freezed == ussdCode
          ? _value.ussdCode
          : ussdCode // ignore: cast_nullable_to_non_nullable
              as String?,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      supportedPaymentTypes: freezed == supportedPaymentTypes
          ? _value._supportedPaymentTypes
          : supportedPaymentTypes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      gateway: freezed == gateway
          ? _value.gateway
          : gateway // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BankImpl implements _Bank {
  const _$BankImpl(
      {required this.code,
      required this.name,
      required this.slug,
      this.ussdCode,
      this.logoUrl,
      final List<String>? supportedPaymentTypes,
      this.isActive = true,
      required this.country,
      this.type,
      this.gateway,
      required this.createdAt})
      : _supportedPaymentTypes = supportedPaymentTypes;

  factory _$BankImpl.fromJson(Map<String, dynamic> json) =>
      _$$BankImplFromJson(json);

  /// Bank code
  @override
  final String code;

  /// Bank name
  @override
  final String name;

  /// Bank slug
  @override
  final String slug;

  /// Bank USSD code
  @override
  final String? ussdCode;

  /// Bank logo URL
  @override
  final String? logoUrl;

  /// Supported payment types
  final List<String>? _supportedPaymentTypes;

  /// Supported payment types
  @override
  List<String>? get supportedPaymentTypes {
    final value = _supportedPaymentTypes;
    if (value == null) return null;
    if (_supportedPaymentTypes is EqualUnmodifiableListView)
      return _supportedPaymentTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Whether bank is active
  @override
  @JsonKey()
  final bool isActive;

  /// Country where bank operates
  @override
  final String country;

  /// Bank type (commercial, microfinance, etc)
  @override
  final String? type;

  /// Gateway identifier
  @override
  final String? gateway;

  /// Creation timestamp
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'Bank(code: $code, name: $name, slug: $slug, ussdCode: $ussdCode, logoUrl: $logoUrl, supportedPaymentTypes: $supportedPaymentTypes, isActive: $isActive, country: $country, type: $type, gateway: $gateway, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.ussdCode, ussdCode) ||
                other.ussdCode == ussdCode) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            const DeepCollectionEquality()
                .equals(other._supportedPaymentTypes, _supportedPaymentTypes) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.gateway, gateway) || other.gateway == gateway) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      code,
      name,
      slug,
      ussdCode,
      logoUrl,
      const DeepCollectionEquality().hash(_supportedPaymentTypes),
      isActive,
      country,
      type,
      gateway,
      createdAt);

  /// Create a copy of Bank
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BankImplCopyWith<_$BankImpl> get copyWith =>
      __$$BankImplCopyWithImpl<_$BankImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BankImplToJson(
      this,
    );
  }
}

abstract class _Bank implements Bank {
  const factory _Bank(
      {required final String code,
      required final String name,
      required final String slug,
      final String? ussdCode,
      final String? logoUrl,
      final List<String>? supportedPaymentTypes,
      final bool isActive,
      required final String country,
      final String? type,
      final String? gateway,
      required final DateTime createdAt}) = _$BankImpl;

  factory _Bank.fromJson(Map<String, dynamic> json) = _$BankImpl.fromJson;

  /// Bank code
  @override
  String get code;

  /// Bank name
  @override
  String get name;

  /// Bank slug
  @override
  String get slug;

  /// Bank USSD code
  @override
  String? get ussdCode;

  /// Bank logo URL
  @override
  String? get logoUrl;

  /// Supported payment types
  @override
  List<String>? get supportedPaymentTypes;

  /// Whether bank is active
  @override
  bool get isActive;

  /// Country where bank operates
  @override
  String get country;

  /// Bank type (commercial, microfinance, etc)
  @override
  String? get type;

  /// Gateway identifier
  @override
  String? get gateway;

  /// Creation timestamp
  @override
  DateTime get createdAt;

  /// Create a copy of Bank
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BankImplCopyWith<_$BankImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
