// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authorization_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthorizationResponse _$AuthorizationResponseFromJson(
    Map<String, dynamic> json) {
  return _AuthorizationResponse.fromJson(json);
}

/// @nodoc
mixin _$AuthorizationResponse {
  String get authorizationCode => throw _privateConstructorUsedError;
  String get cardType => throw _privateConstructorUsedError;
  String get last4 => throw _privateConstructorUsedError;
  String get expMonth => throw _privateConstructorUsedError;
  String get expYear => throw _privateConstructorUsedError;
  String get bin => throw _privateConstructorUsedError;
  String get bank => throw _privateConstructorUsedError;
  String get channel => throw _privateConstructorUsedError;
  String get signature => throw _privateConstructorUsedError;
  String get countryCode => throw _privateConstructorUsedError;
  String get brand => throw _privateConstructorUsedError;
  bool get reusable => throw _privateConstructorUsedError;
  Map<String, dynamic>? get accountName => throw _privateConstructorUsedError;

  /// Serializes this AuthorizationResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthorizationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthorizationResponseCopyWith<AuthorizationResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorizationResponseCopyWith<$Res> {
  factory $AuthorizationResponseCopyWith(AuthorizationResponse value,
          $Res Function(AuthorizationResponse) then) =
      _$AuthorizationResponseCopyWithImpl<$Res, AuthorizationResponse>;
  @useResult
  $Res call(
      {String authorizationCode,
      String cardType,
      String last4,
      String expMonth,
      String expYear,
      String bin,
      String bank,
      String channel,
      String signature,
      String countryCode,
      String brand,
      bool reusable,
      Map<String, dynamic>? accountName});
}

/// @nodoc
class _$AuthorizationResponseCopyWithImpl<$Res,
        $Val extends AuthorizationResponse>
    implements $AuthorizationResponseCopyWith<$Res> {
  _$AuthorizationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthorizationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authorizationCode = null,
    Object? cardType = null,
    Object? last4 = null,
    Object? expMonth = null,
    Object? expYear = null,
    Object? bin = null,
    Object? bank = null,
    Object? channel = null,
    Object? signature = null,
    Object? countryCode = null,
    Object? brand = null,
    Object? reusable = null,
    Object? accountName = freezed,
  }) {
    return _then(_value.copyWith(
      authorizationCode: null == authorizationCode
          ? _value.authorizationCode
          : authorizationCode // ignore: cast_nullable_to_non_nullable
              as String,
      cardType: null == cardType
          ? _value.cardType
          : cardType // ignore: cast_nullable_to_non_nullable
              as String,
      last4: null == last4
          ? _value.last4
          : last4 // ignore: cast_nullable_to_non_nullable
              as String,
      expMonth: null == expMonth
          ? _value.expMonth
          : expMonth // ignore: cast_nullable_to_non_nullable
              as String,
      expYear: null == expYear
          ? _value.expYear
          : expYear // ignore: cast_nullable_to_non_nullable
              as String,
      bin: null == bin
          ? _value.bin
          : bin // ignore: cast_nullable_to_non_nullable
              as String,
      bank: null == bank
          ? _value.bank
          : bank // ignore: cast_nullable_to_non_nullable
              as String,
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String,
      signature: null == signature
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      reusable: null == reusable
          ? _value.reusable
          : reusable // ignore: cast_nullable_to_non_nullable
              as bool,
      accountName: freezed == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthorizationResponseImplCopyWith<$Res>
    implements $AuthorizationResponseCopyWith<$Res> {
  factory _$$AuthorizationResponseImplCopyWith(
          _$AuthorizationResponseImpl value,
          $Res Function(_$AuthorizationResponseImpl) then) =
      __$$AuthorizationResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String authorizationCode,
      String cardType,
      String last4,
      String expMonth,
      String expYear,
      String bin,
      String bank,
      String channel,
      String signature,
      String countryCode,
      String brand,
      bool reusable,
      Map<String, dynamic>? accountName});
}

/// @nodoc
class __$$AuthorizationResponseImplCopyWithImpl<$Res>
    extends _$AuthorizationResponseCopyWithImpl<$Res,
        _$AuthorizationResponseImpl>
    implements _$$AuthorizationResponseImplCopyWith<$Res> {
  __$$AuthorizationResponseImplCopyWithImpl(_$AuthorizationResponseImpl _value,
      $Res Function(_$AuthorizationResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthorizationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authorizationCode = null,
    Object? cardType = null,
    Object? last4 = null,
    Object? expMonth = null,
    Object? expYear = null,
    Object? bin = null,
    Object? bank = null,
    Object? channel = null,
    Object? signature = null,
    Object? countryCode = null,
    Object? brand = null,
    Object? reusable = null,
    Object? accountName = freezed,
  }) {
    return _then(_$AuthorizationResponseImpl(
      authorizationCode: null == authorizationCode
          ? _value.authorizationCode
          : authorizationCode // ignore: cast_nullable_to_non_nullable
              as String,
      cardType: null == cardType
          ? _value.cardType
          : cardType // ignore: cast_nullable_to_non_nullable
              as String,
      last4: null == last4
          ? _value.last4
          : last4 // ignore: cast_nullable_to_non_nullable
              as String,
      expMonth: null == expMonth
          ? _value.expMonth
          : expMonth // ignore: cast_nullable_to_non_nullable
              as String,
      expYear: null == expYear
          ? _value.expYear
          : expYear // ignore: cast_nullable_to_non_nullable
              as String,
      bin: null == bin
          ? _value.bin
          : bin // ignore: cast_nullable_to_non_nullable
              as String,
      bank: null == bank
          ? _value.bank
          : bank // ignore: cast_nullable_to_non_nullable
              as String,
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String,
      signature: null == signature
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      reusable: null == reusable
          ? _value.reusable
          : reusable // ignore: cast_nullable_to_non_nullable
              as bool,
      accountName: freezed == accountName
          ? _value._accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthorizationResponseImpl implements _AuthorizationResponse {
  const _$AuthorizationResponseImpl(
      {required this.authorizationCode,
      required this.cardType,
      required this.last4,
      required this.expMonth,
      required this.expYear,
      required this.bin,
      required this.bank,
      required this.channel,
      required this.signature,
      required this.countryCode,
      required this.brand,
      required this.reusable,
      final Map<String, dynamic>? accountName})
      : _accountName = accountName;

  factory _$AuthorizationResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthorizationResponseImplFromJson(json);

  @override
  final String authorizationCode;
  @override
  final String cardType;
  @override
  final String last4;
  @override
  final String expMonth;
  @override
  final String expYear;
  @override
  final String bin;
  @override
  final String bank;
  @override
  final String channel;
  @override
  final String signature;
  @override
  final String countryCode;
  @override
  final String brand;
  @override
  final bool reusable;
  final Map<String, dynamic>? _accountName;
  @override
  Map<String, dynamic>? get accountName {
    final value = _accountName;
    if (value == null) return null;
    if (_accountName is EqualUnmodifiableMapView) return _accountName;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'AuthorizationResponse(authorizationCode: $authorizationCode, cardType: $cardType, last4: $last4, expMonth: $expMonth, expYear: $expYear, bin: $bin, bank: $bank, channel: $channel, signature: $signature, countryCode: $countryCode, brand: $brand, reusable: $reusable, accountName: $accountName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthorizationResponseImpl &&
            (identical(other.authorizationCode, authorizationCode) ||
                other.authorizationCode == authorizationCode) &&
            (identical(other.cardType, cardType) ||
                other.cardType == cardType) &&
            (identical(other.last4, last4) || other.last4 == last4) &&
            (identical(other.expMonth, expMonth) ||
                other.expMonth == expMonth) &&
            (identical(other.expYear, expYear) || other.expYear == expYear) &&
            (identical(other.bin, bin) || other.bin == bin) &&
            (identical(other.bank, bank) || other.bank == bank) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.signature, signature) ||
                other.signature == signature) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.reusable, reusable) ||
                other.reusable == reusable) &&
            const DeepCollectionEquality()
                .equals(other._accountName, _accountName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      authorizationCode,
      cardType,
      last4,
      expMonth,
      expYear,
      bin,
      bank,
      channel,
      signature,
      countryCode,
      brand,
      reusable,
      const DeepCollectionEquality().hash(_accountName));

  /// Create a copy of AuthorizationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthorizationResponseImplCopyWith<_$AuthorizationResponseImpl>
      get copyWith => __$$AuthorizationResponseImplCopyWithImpl<
          _$AuthorizationResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthorizationResponseImplToJson(
      this,
    );
  }
}

abstract class _AuthorizationResponse implements AuthorizationResponse {
  const factory _AuthorizationResponse(
      {required final String authorizationCode,
      required final String cardType,
      required final String last4,
      required final String expMonth,
      required final String expYear,
      required final String bin,
      required final String bank,
      required final String channel,
      required final String signature,
      required final String countryCode,
      required final String brand,
      required final bool reusable,
      final Map<String, dynamic>? accountName}) = _$AuthorizationResponseImpl;

  factory _AuthorizationResponse.fromJson(Map<String, dynamic> json) =
      _$AuthorizationResponseImpl.fromJson;

  @override
  String get authorizationCode;
  @override
  String get cardType;
  @override
  String get last4;
  @override
  String get expMonth;
  @override
  String get expYear;
  @override
  String get bin;
  @override
  String get bank;
  @override
  String get channel;
  @override
  String get signature;
  @override
  String get countryCode;
  @override
  String get brand;
  @override
  bool get reusable;
  @override
  Map<String, dynamic>? get accountName;

  /// Create a copy of AuthorizationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthorizationResponseImplCopyWith<_$AuthorizationResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
