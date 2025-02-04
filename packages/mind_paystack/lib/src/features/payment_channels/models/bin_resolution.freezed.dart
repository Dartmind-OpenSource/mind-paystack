// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bin_resolution.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BinResolution _$BinResolutionFromJson(Map<String, dynamic> json) {
  return _BinResolution.fromJson(json);
}

/// @nodoc
mixin _$BinResolution {
  /// BIN/IIN number
  String get bin => throw _privateConstructorUsedError;

  /// Card brand
  String get brand => throw _privateConstructorUsedError;

  /// Card type
  String get cardType => throw _privateConstructorUsedError;

  /// Bank name
  String? get bankName => throw _privateConstructorUsedError;

  /// Country code
  String get countryCode => throw _privateConstructorUsedError;

  /// Card category
  String? get category => throw _privateConstructorUsedError;

  /// Whether card is international
  bool get international => throw _privateConstructorUsedError;

  /// Serializes this BinResolution to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BinResolution
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BinResolutionCopyWith<BinResolution> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BinResolutionCopyWith<$Res> {
  factory $BinResolutionCopyWith(
          BinResolution value, $Res Function(BinResolution) then) =
      _$BinResolutionCopyWithImpl<$Res, BinResolution>;
  @useResult
  $Res call(
      {String bin,
      String brand,
      String cardType,
      String? bankName,
      String countryCode,
      String? category,
      bool international});
}

/// @nodoc
class _$BinResolutionCopyWithImpl<$Res, $Val extends BinResolution>
    implements $BinResolutionCopyWith<$Res> {
  _$BinResolutionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BinResolution
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bin = null,
    Object? brand = null,
    Object? cardType = null,
    Object? bankName = freezed,
    Object? countryCode = null,
    Object? category = freezed,
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
      cardType: null == cardType
          ? _value.cardType
          : cardType // ignore: cast_nullable_to_non_nullable
              as String,
      bankName: freezed == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      international: null == international
          ? _value.international
          : international // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BinResolutionImplCopyWith<$Res>
    implements $BinResolutionCopyWith<$Res> {
  factory _$$BinResolutionImplCopyWith(
          _$BinResolutionImpl value, $Res Function(_$BinResolutionImpl) then) =
      __$$BinResolutionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String bin,
      String brand,
      String cardType,
      String? bankName,
      String countryCode,
      String? category,
      bool international});
}

/// @nodoc
class __$$BinResolutionImplCopyWithImpl<$Res>
    extends _$BinResolutionCopyWithImpl<$Res, _$BinResolutionImpl>
    implements _$$BinResolutionImplCopyWith<$Res> {
  __$$BinResolutionImplCopyWithImpl(
      _$BinResolutionImpl _value, $Res Function(_$BinResolutionImpl) _then)
      : super(_value, _then);

  /// Create a copy of BinResolution
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bin = null,
    Object? brand = null,
    Object? cardType = null,
    Object? bankName = freezed,
    Object? countryCode = null,
    Object? category = freezed,
    Object? international = null,
  }) {
    return _then(_$BinResolutionImpl(
      bin: null == bin
          ? _value.bin
          : bin // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      cardType: null == cardType
          ? _value.cardType
          : cardType // ignore: cast_nullable_to_non_nullable
              as String,
      bankName: freezed == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
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
class _$BinResolutionImpl implements _BinResolution {
  const _$BinResolutionImpl(
      {required this.bin,
      required this.brand,
      required this.cardType,
      this.bankName,
      required this.countryCode,
      this.category,
      this.international = false});

  factory _$BinResolutionImpl.fromJson(Map<String, dynamic> json) =>
      _$$BinResolutionImplFromJson(json);

  /// BIN/IIN number
  @override
  final String bin;

  /// Card brand
  @override
  final String brand;

  /// Card type
  @override
  final String cardType;

  /// Bank name
  @override
  final String? bankName;

  /// Country code
  @override
  final String countryCode;

  /// Card category
  @override
  final String? category;

  /// Whether card is international
  @override
  @JsonKey()
  final bool international;

  @override
  String toString() {
    return 'BinResolution(bin: $bin, brand: $brand, cardType: $cardType, bankName: $bankName, countryCode: $countryCode, category: $category, international: $international)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BinResolutionImpl &&
            (identical(other.bin, bin) || other.bin == bin) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.cardType, cardType) ||
                other.cardType == cardType) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.international, international) ||
                other.international == international));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, bin, brand, cardType, bankName,
      countryCode, category, international);

  /// Create a copy of BinResolution
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BinResolutionImplCopyWith<_$BinResolutionImpl> get copyWith =>
      __$$BinResolutionImplCopyWithImpl<_$BinResolutionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BinResolutionImplToJson(
      this,
    );
  }
}

abstract class _BinResolution implements BinResolution {
  const factory _BinResolution(
      {required final String bin,
      required final String brand,
      required final String cardType,
      final String? bankName,
      required final String countryCode,
      final String? category,
      final bool international}) = _$BinResolutionImpl;

  factory _BinResolution.fromJson(Map<String, dynamic> json) =
      _$BinResolutionImpl.fromJson;

  /// BIN/IIN number
  @override
  String get bin;

  /// Card brand
  @override
  String get brand;

  /// Card type
  @override
  String get cardType;

  /// Bank name
  @override
  String? get bankName;

  /// Country code
  @override
  String get countryCode;

  /// Card category
  @override
  String? get category;

  /// Whether card is international
  @override
  bool get international;

  /// Create a copy of BinResolution
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BinResolutionImplCopyWith<_$BinResolutionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
