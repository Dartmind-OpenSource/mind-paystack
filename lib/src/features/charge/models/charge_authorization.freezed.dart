// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'charge_authorization.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChargeAuthorization _$ChargeAuthorizationFromJson(Map<String, dynamic> json) {
  return _ChargeAuthorization.fromJson(json);
}

/// @nodoc
mixin _$ChargeAuthorization {
  /// Authorization code for subsequent charges
  String get authorizationCode => throw _privateConstructorUsedError;

  /// Card bin number
  String? get bin => throw _privateConstructorUsedError;

  /// Last 4 digits of the card
  String? get last4 => throw _privateConstructorUsedError;

  /// Expiry month
  int? get expiryMonth => throw _privateConstructorUsedError;

  /// Expiry year
  int? get expiryYear => throw _privateConstructorUsedError;

  /// Card brand (visa, mastercard, etc.)
  String? get brand => throw _privateConstructorUsedError;

  /// Card type (debit, credit)
  String? get cardType => throw _privateConstructorUsedError;

  /// Bank name
  String? get bank => throw _privateConstructorUsedError;

  /// Country code
  String? get country => throw _privateConstructorUsedError;

  /// Signature hash
  String? get signature => throw _privateConstructorUsedError;

  /// Account name (for bank accounts)
  String? get accountName => throw _privateConstructorUsedError;

  /// Reusable status
  bool get reusable => throw _privateConstructorUsedError;

  /// Serializes this ChargeAuthorization to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChargeAuthorization
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChargeAuthorizationCopyWith<ChargeAuthorization> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChargeAuthorizationCopyWith<$Res> {
  factory $ChargeAuthorizationCopyWith(
          ChargeAuthorization value, $Res Function(ChargeAuthorization) then) =
      _$ChargeAuthorizationCopyWithImpl<$Res, ChargeAuthorization>;
  @useResult
  $Res call(
      {String authorizationCode,
      String? bin,
      String? last4,
      int? expiryMonth,
      int? expiryYear,
      String? brand,
      String? cardType,
      String? bank,
      String? country,
      String? signature,
      String? accountName,
      bool reusable});
}

/// @nodoc
class _$ChargeAuthorizationCopyWithImpl<$Res, $Val extends ChargeAuthorization>
    implements $ChargeAuthorizationCopyWith<$Res> {
  _$ChargeAuthorizationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChargeAuthorization
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authorizationCode = null,
    Object? bin = freezed,
    Object? last4 = freezed,
    Object? expiryMonth = freezed,
    Object? expiryYear = freezed,
    Object? brand = freezed,
    Object? cardType = freezed,
    Object? bank = freezed,
    Object? country = freezed,
    Object? signature = freezed,
    Object? accountName = freezed,
    Object? reusable = null,
  }) {
    return _then(_value.copyWith(
      authorizationCode: null == authorizationCode
          ? _value.authorizationCode
          : authorizationCode // ignore: cast_nullable_to_non_nullable
              as String,
      bin: freezed == bin
          ? _value.bin
          : bin // ignore: cast_nullable_to_non_nullable
              as String?,
      last4: freezed == last4
          ? _value.last4
          : last4 // ignore: cast_nullable_to_non_nullable
              as String?,
      expiryMonth: freezed == expiryMonth
          ? _value.expiryMonth
          : expiryMonth // ignore: cast_nullable_to_non_nullable
              as int?,
      expiryYear: freezed == expiryYear
          ? _value.expiryYear
          : expiryYear // ignore: cast_nullable_to_non_nullable
              as int?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
      cardType: freezed == cardType
          ? _value.cardType
          : cardType // ignore: cast_nullable_to_non_nullable
              as String?,
      bank: freezed == bank
          ? _value.bank
          : bank // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      signature: freezed == signature
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String?,
      accountName: freezed == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String?,
      reusable: null == reusable
          ? _value.reusable
          : reusable // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChargeAuthorizationImplCopyWith<$Res>
    implements $ChargeAuthorizationCopyWith<$Res> {
  factory _$$ChargeAuthorizationImplCopyWith(_$ChargeAuthorizationImpl value,
          $Res Function(_$ChargeAuthorizationImpl) then) =
      __$$ChargeAuthorizationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String authorizationCode,
      String? bin,
      String? last4,
      int? expiryMonth,
      int? expiryYear,
      String? brand,
      String? cardType,
      String? bank,
      String? country,
      String? signature,
      String? accountName,
      bool reusable});
}

/// @nodoc
class __$$ChargeAuthorizationImplCopyWithImpl<$Res>
    extends _$ChargeAuthorizationCopyWithImpl<$Res, _$ChargeAuthorizationImpl>
    implements _$$ChargeAuthorizationImplCopyWith<$Res> {
  __$$ChargeAuthorizationImplCopyWithImpl(_$ChargeAuthorizationImpl _value,
      $Res Function(_$ChargeAuthorizationImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChargeAuthorization
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authorizationCode = null,
    Object? bin = freezed,
    Object? last4 = freezed,
    Object? expiryMonth = freezed,
    Object? expiryYear = freezed,
    Object? brand = freezed,
    Object? cardType = freezed,
    Object? bank = freezed,
    Object? country = freezed,
    Object? signature = freezed,
    Object? accountName = freezed,
    Object? reusable = null,
  }) {
    return _then(_$ChargeAuthorizationImpl(
      authorizationCode: null == authorizationCode
          ? _value.authorizationCode
          : authorizationCode // ignore: cast_nullable_to_non_nullable
              as String,
      bin: freezed == bin
          ? _value.bin
          : bin // ignore: cast_nullable_to_non_nullable
              as String?,
      last4: freezed == last4
          ? _value.last4
          : last4 // ignore: cast_nullable_to_non_nullable
              as String?,
      expiryMonth: freezed == expiryMonth
          ? _value.expiryMonth
          : expiryMonth // ignore: cast_nullable_to_non_nullable
              as int?,
      expiryYear: freezed == expiryYear
          ? _value.expiryYear
          : expiryYear // ignore: cast_nullable_to_non_nullable
              as int?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
      cardType: freezed == cardType
          ? _value.cardType
          : cardType // ignore: cast_nullable_to_non_nullable
              as String?,
      bank: freezed == bank
          ? _value.bank
          : bank // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      signature: freezed == signature
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String?,
      accountName: freezed == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String?,
      reusable: null == reusable
          ? _value.reusable
          : reusable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChargeAuthorizationImpl implements _ChargeAuthorization {
  const _$ChargeAuthorizationImpl(
      {required this.authorizationCode,
      this.bin,
      this.last4,
      this.expiryMonth,
      this.expiryYear,
      this.brand,
      this.cardType,
      this.bank,
      this.country,
      this.signature,
      this.accountName,
      this.reusable = false});

  factory _$ChargeAuthorizationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChargeAuthorizationImplFromJson(json);

  /// Authorization code for subsequent charges
  @override
  final String authorizationCode;

  /// Card bin number
  @override
  final String? bin;

  /// Last 4 digits of the card
  @override
  final String? last4;

  /// Expiry month
  @override
  final int? expiryMonth;

  /// Expiry year
  @override
  final int? expiryYear;

  /// Card brand (visa, mastercard, etc.)
  @override
  final String? brand;

  /// Card type (debit, credit)
  @override
  final String? cardType;

  /// Bank name
  @override
  final String? bank;

  /// Country code
  @override
  final String? country;

  /// Signature hash
  @override
  final String? signature;

  /// Account name (for bank accounts)
  @override
  final String? accountName;

  /// Reusable status
  @override
  @JsonKey()
  final bool reusable;

  @override
  String toString() {
    return 'ChargeAuthorization(authorizationCode: $authorizationCode, bin: $bin, last4: $last4, expiryMonth: $expiryMonth, expiryYear: $expiryYear, brand: $brand, cardType: $cardType, bank: $bank, country: $country, signature: $signature, accountName: $accountName, reusable: $reusable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChargeAuthorizationImpl &&
            (identical(other.authorizationCode, authorizationCode) ||
                other.authorizationCode == authorizationCode) &&
            (identical(other.bin, bin) || other.bin == bin) &&
            (identical(other.last4, last4) || other.last4 == last4) &&
            (identical(other.expiryMonth, expiryMonth) ||
                other.expiryMonth == expiryMonth) &&
            (identical(other.expiryYear, expiryYear) ||
                other.expiryYear == expiryYear) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.cardType, cardType) ||
                other.cardType == cardType) &&
            (identical(other.bank, bank) || other.bank == bank) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.signature, signature) ||
                other.signature == signature) &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName) &&
            (identical(other.reusable, reusable) ||
                other.reusable == reusable));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      authorizationCode,
      bin,
      last4,
      expiryMonth,
      expiryYear,
      brand,
      cardType,
      bank,
      country,
      signature,
      accountName,
      reusable);

  /// Create a copy of ChargeAuthorization
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChargeAuthorizationImplCopyWith<_$ChargeAuthorizationImpl> get copyWith =>
      __$$ChargeAuthorizationImplCopyWithImpl<_$ChargeAuthorizationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChargeAuthorizationImplToJson(
      this,
    );
  }
}

abstract class _ChargeAuthorization implements ChargeAuthorization {
  const factory _ChargeAuthorization(
      {required final String authorizationCode,
      final String? bin,
      final String? last4,
      final int? expiryMonth,
      final int? expiryYear,
      final String? brand,
      final String? cardType,
      final String? bank,
      final String? country,
      final String? signature,
      final String? accountName,
      final bool reusable}) = _$ChargeAuthorizationImpl;

  factory _ChargeAuthorization.fromJson(Map<String, dynamic> json) =
      _$ChargeAuthorizationImpl.fromJson;

  /// Authorization code for subsequent charges
  @override
  String get authorizationCode;

  /// Card bin number
  @override
  String? get bin;

  /// Last 4 digits of the card
  @override
  String? get last4;

  /// Expiry month
  @override
  int? get expiryMonth;

  /// Expiry year
  @override
  int? get expiryYear;

  /// Card brand (visa, mastercard, etc.)
  @override
  String? get brand;

  /// Card type (debit, credit)
  @override
  String? get cardType;

  /// Bank name
  @override
  String? get bank;

  /// Country code
  @override
  String? get country;

  /// Signature hash
  @override
  String? get signature;

  /// Account name (for bank accounts)
  @override
  String? get accountName;

  /// Reusable status
  @override
  bool get reusable;

  /// Create a copy of ChargeAuthorization
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChargeAuthorizationImplCopyWith<_$ChargeAuthorizationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
