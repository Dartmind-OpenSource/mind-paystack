// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_resolution.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AccountResolution _$AccountResolutionFromJson(Map<String, dynamic> json) {
  return _AccountResolution.fromJson(json);
}

/// @nodoc
mixin _$AccountResolution {
  /// Account number
  String get accountNumber => throw _privateConstructorUsedError;

  /// Account name
  String get accountName => throw _privateConstructorUsedError;

  /// Bank code
  String get bankCode => throw _privateConstructorUsedError;

  /// Bank name
  String? get bankName => throw _privateConstructorUsedError;

  /// Account type
  String? get accountType => throw _privateConstructorUsedError;

  /// BVN match status
  bool? get bvnMatch => throw _privateConstructorUsedError;

  /// Serializes this AccountResolution to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AccountResolution
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountResolutionCopyWith<AccountResolution> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountResolutionCopyWith<$Res> {
  factory $AccountResolutionCopyWith(
          AccountResolution value, $Res Function(AccountResolution) then) =
      _$AccountResolutionCopyWithImpl<$Res, AccountResolution>;
  @useResult
  $Res call(
      {String accountNumber,
      String accountName,
      String bankCode,
      String? bankName,
      String? accountType,
      bool? bvnMatch});
}

/// @nodoc
class _$AccountResolutionCopyWithImpl<$Res, $Val extends AccountResolution>
    implements $AccountResolutionCopyWith<$Res> {
  _$AccountResolutionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountResolution
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountNumber = null,
    Object? accountName = null,
    Object? bankCode = null,
    Object? bankName = freezed,
    Object? accountType = freezed,
    Object? bvnMatch = freezed,
  }) {
    return _then(_value.copyWith(
      accountNumber: null == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      accountName: null == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
      bankCode: null == bankCode
          ? _value.bankCode
          : bankCode // ignore: cast_nullable_to_non_nullable
              as String,
      bankName: freezed == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      accountType: freezed == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as String?,
      bvnMatch: freezed == bvnMatch
          ? _value.bvnMatch
          : bvnMatch // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountResolutionImplCopyWith<$Res>
    implements $AccountResolutionCopyWith<$Res> {
  factory _$$AccountResolutionImplCopyWith(_$AccountResolutionImpl value,
          $Res Function(_$AccountResolutionImpl) then) =
      __$$AccountResolutionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String accountNumber,
      String accountName,
      String bankCode,
      String? bankName,
      String? accountType,
      bool? bvnMatch});
}

/// @nodoc
class __$$AccountResolutionImplCopyWithImpl<$Res>
    extends _$AccountResolutionCopyWithImpl<$Res, _$AccountResolutionImpl>
    implements _$$AccountResolutionImplCopyWith<$Res> {
  __$$AccountResolutionImplCopyWithImpl(_$AccountResolutionImpl _value,
      $Res Function(_$AccountResolutionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountResolution
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountNumber = null,
    Object? accountName = null,
    Object? bankCode = null,
    Object? bankName = freezed,
    Object? accountType = freezed,
    Object? bvnMatch = freezed,
  }) {
    return _then(_$AccountResolutionImpl(
      accountNumber: null == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      accountName: null == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
      bankCode: null == bankCode
          ? _value.bankCode
          : bankCode // ignore: cast_nullable_to_non_nullable
              as String,
      bankName: freezed == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      accountType: freezed == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as String?,
      bvnMatch: freezed == bvnMatch
          ? _value.bvnMatch
          : bvnMatch // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountResolutionImpl implements _AccountResolution {
  const _$AccountResolutionImpl(
      {required this.accountNumber,
      required this.accountName,
      required this.bankCode,
      this.bankName,
      this.accountType,
      this.bvnMatch});

  factory _$AccountResolutionImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountResolutionImplFromJson(json);

  /// Account number
  @override
  final String accountNumber;

  /// Account name
  @override
  final String accountName;

  /// Bank code
  @override
  final String bankCode;

  /// Bank name
  @override
  final String? bankName;

  /// Account type
  @override
  final String? accountType;

  /// BVN match status
  @override
  final bool? bvnMatch;

  @override
  String toString() {
    return 'AccountResolution(accountNumber: $accountNumber, accountName: $accountName, bankCode: $bankCode, bankName: $bankName, accountType: $accountType, bvnMatch: $bvnMatch)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountResolutionImpl &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName) &&
            (identical(other.bankCode, bankCode) ||
                other.bankCode == bankCode) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.accountType, accountType) ||
                other.accountType == accountType) &&
            (identical(other.bvnMatch, bvnMatch) ||
                other.bvnMatch == bvnMatch));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accountNumber, accountName,
      bankCode, bankName, accountType, bvnMatch);

  /// Create a copy of AccountResolution
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountResolutionImplCopyWith<_$AccountResolutionImpl> get copyWith =>
      __$$AccountResolutionImplCopyWithImpl<_$AccountResolutionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountResolutionImplToJson(
      this,
    );
  }
}

abstract class _AccountResolution implements AccountResolution {
  const factory _AccountResolution(
      {required final String accountNumber,
      required final String accountName,
      required final String bankCode,
      final String? bankName,
      final String? accountType,
      final bool? bvnMatch}) = _$AccountResolutionImpl;

  factory _AccountResolution.fromJson(Map<String, dynamic> json) =
      _$AccountResolutionImpl.fromJson;

  /// Account number
  @override
  String get accountNumber;

  /// Account name
  @override
  String get accountName;

  /// Bank code
  @override
  String get bankCode;

  /// Bank name
  @override
  String? get bankName;

  /// Account type
  @override
  String? get accountType;

  /// BVN match status
  @override
  bool? get bvnMatch;

  /// Create a copy of AccountResolution
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountResolutionImplCopyWith<_$AccountResolutionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
