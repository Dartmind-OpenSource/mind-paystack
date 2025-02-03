// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_bin_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CardBinInfo _$CardBinInfoFromJson(Map<String, dynamic> json) {
  return _CardBinInfo.fromJson(json);
}

/// @nodoc
mixin _$CardBinInfo {
  /// BIN/IIN number
  String get bin => throw _privateConstructorUsedError;

  /// Card brand
  String get brand => throw _privateConstructorUsedError;

  /// Sub brand
  String? get subBrand => throw _privateConstructorUsedError;

  /// Country code
  String get countryCode => throw _privateConstructorUsedError;

  /// Card type (debit, credit)
  String get cardType => throw _privateConstructorUsedError;

  /// Bank name
  String? get bankName => throw _privateConstructorUsedError;

  /// Card category (classic, platinum etc)
  String? get cardCategory => throw _privateConstructorUsedError;

  /// Whether card is international
  bool get international => throw _privateConstructorUsedError;

  /// Serializes this CardBinInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CardBinInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CardBinInfoCopyWith<CardBinInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardBinInfoCopyWith<$Res> {
  factory $CardBinInfoCopyWith(
          CardBinInfo value, $Res Function(CardBinInfo) then) =
      _$CardBinInfoCopyWithImpl<$Res, CardBinInfo>;
  @useResult
  $Res call(
      {String bin,
      String brand,
      String? subBrand,
      String countryCode,
      String cardType,
      String? bankName,
      String? cardCategory,
      bool international});
}

/// @nodoc
class _$CardBinInfoCopyWithImpl<$Res, $Val extends CardBinInfo>
    implements $CardBinInfoCopyWith<$Res> {
  _$CardBinInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CardBinInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bin = null,
    Object? brand = null,
    Object? subBrand = freezed,
    Object? countryCode = null,
    Object? cardType = null,
    Object? bankName = freezed,
    Object? cardCategory = freezed,
    Object? international = null,
  }) {
    return _then(_value.copyWith(
      bin: null == bin
          ? _value.bin
          : bin // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      subBrand: freezed == subBrand
          ? _value.subBrand
          : subBrand // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      cardType: null == cardType
          ? _value.cardType
          : cardType // ignore: cast_nullable_to_non_nullable
              as String,
      bankName: freezed == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      cardCategory: freezed == cardCategory
          ? _value.cardCategory
          : cardCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      international: null == international
          ? _value.international
          : international // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CardBinInfoImplCopyWith<$Res>
    implements $CardBinInfoCopyWith<$Res> {
  factory _$$CardBinInfoImplCopyWith(
          _$CardBinInfoImpl value, $Res Function(_$CardBinInfoImpl) then) =
      __$$CardBinInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String bin,
      String brand,
      String? subBrand,
      String countryCode,
      String cardType,
      String? bankName,
      String? cardCategory,
      bool international});
}

/// @nodoc
class __$$CardBinInfoImplCopyWithImpl<$Res>
    extends _$CardBinInfoCopyWithImpl<$Res, _$CardBinInfoImpl>
    implements _$$CardBinInfoImplCopyWith<$Res> {
  __$$CardBinInfoImplCopyWithImpl(
      _$CardBinInfoImpl _value, $Res Function(_$CardBinInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CardBinInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bin = null,
    Object? brand = null,
    Object? subBrand = freezed,
    Object? countryCode = null,
    Object? cardType = null,
    Object? bankName = freezed,
    Object? cardCategory = freezed,
    Object? international = null,
  }) {
    return _then(_$CardBinInfoImpl(
      bin: null == bin
          ? _value.bin
          : bin // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      subBrand: freezed == subBrand
          ? _value.subBrand
          : subBrand // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      cardType: null == cardType
          ? _value.cardType
          : cardType // ignore: cast_nullable_to_non_nullable
              as String,
      bankName: freezed == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      cardCategory: freezed == cardCategory
          ? _value.cardCategory
          : cardCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      international: null == international
          ? _value.international
          : international // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CardBinInfoImpl implements _CardBinInfo {
  const _$CardBinInfoImpl(
      {required this.bin,
      required this.brand,
      this.subBrand,
      required this.countryCode,
      required this.cardType,
      this.bankName,
      this.cardCategory,
      this.international = false});

  factory _$CardBinInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CardBinInfoImplFromJson(json);

  /// BIN/IIN number
  @override
  final String bin;

  /// Card brand
  @override
  final String brand;

  /// Sub brand
  @override
  final String? subBrand;

  /// Country code
  @override
  final String countryCode;

  /// Card type (debit, credit)
  @override
  final String cardType;

  /// Bank name
  @override
  final String? bankName;

  /// Card category (classic, platinum etc)
  @override
  final String? cardCategory;

  /// Whether card is international
  @override
  @JsonKey()
  final bool international;

  @override
  String toString() {
    return 'CardBinInfo(bin: $bin, brand: $brand, subBrand: $subBrand, countryCode: $countryCode, cardType: $cardType, bankName: $bankName, cardCategory: $cardCategory, international: $international)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardBinInfoImpl &&
            (identical(other.bin, bin) || other.bin == bin) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.subBrand, subBrand) ||
                other.subBrand == subBrand) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.cardType, cardType) ||
                other.cardType == cardType) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.cardCategory, cardCategory) ||
                other.cardCategory == cardCategory) &&
            (identical(other.international, international) ||
                other.international == international));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, bin, brand, subBrand,
      countryCode, cardType, bankName, cardCategory, international);

  /// Create a copy of CardBinInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CardBinInfoImplCopyWith<_$CardBinInfoImpl> get copyWith =>
      __$$CardBinInfoImplCopyWithImpl<_$CardBinInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CardBinInfoImplToJson(
      this,
    );
  }
}

abstract class _CardBinInfo implements CardBinInfo {
  const factory _CardBinInfo(
      {required final String bin,
      required final String brand,
      final String? subBrand,
      required final String countryCode,
      required final String cardType,
      final String? bankName,
      final String? cardCategory,
      final bool international}) = _$CardBinInfoImpl;

  factory _CardBinInfo.fromJson(Map<String, dynamic> json) =
      _$CardBinInfoImpl.fromJson;

  /// BIN/IIN number
  @override
  String get bin;

  /// Card brand
  @override
  String get brand;

  /// Sub brand
  @override
  String? get subBrand;

  /// Country code
  @override
  String get countryCode;

  /// Card type (debit, credit)
  @override
  String get cardType;

  /// Bank name
  @override
  String? get bankName;

  /// Card category (classic, platinum etc)
  @override
  String? get cardCategory;

  /// Whether card is international
  @override
  bool get international;

  /// Create a copy of CardBinInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CardBinInfoImplCopyWith<_$CardBinInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
