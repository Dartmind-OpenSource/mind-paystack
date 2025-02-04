// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_method.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentMethod _$PaymentMethodFromJson(Map<String, dynamic> json) {
  return _PaymentMethod.fromJson(json);
}

/// @nodoc
mixin _$PaymentMethod {
  /// Unique identifier for the payment method
  String get id => throw _privateConstructorUsedError;

  /// Type of payment method (card, bank_account, ussd, etc.)
  String get type => throw _privateConstructorUsedError;

  /// Channel of the payment method (e.g., visa, mastercard, gtbank)
  String get channel => throw _privateConstructorUsedError;

  /// Email of the customer associated with this payment method
  String get email => throw _privateConstructorUsedError;

  /// Currency of the payment method
  String get currency => throw _privateConstructorUsedError;

  /// Bank code (if applicable)
  String? get bankCode => throw _privateConstructorUsedError;

  /// Last 4 digits (for cards)
  String? get last4 => throw _privateConstructorUsedError;

  /// Expiry month (for cards)
  int? get expiryMonth => throw _privateConstructorUsedError;

  /// Expiry year (for cards)
  int? get expiryYear => throw _privateConstructorUsedError;

  /// Account name (for bank accounts)
  String? get accountName => throw _privateConstructorUsedError;

  /// Account number (for bank accounts)
  String? get accountNumber => throw _privateConstructorUsedError;

  /// Bank name (for bank accounts)
  String? get bankName => throw _privateConstructorUsedError;

  /// Card brand (visa, mastercard, etc.)
  String? get cardBrand => throw _privateConstructorUsedError;

  /// Card type (debit, credit)
  String? get cardType => throw _privateConstructorUsedError;

  /// Whether this payment method is reusable
  bool get reusable => throw _privateConstructorUsedError;

  /// Country code of the payment method
  String get country => throw _privateConstructorUsedError;

  /// Signature hash for the payment method
  String? get signature => throw _privateConstructorUsedError;

  /// Creation timestamp
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Last update timestamp
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this PaymentMethod to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentMethodCopyWith<PaymentMethod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodCopyWith<$Res> {
  factory $PaymentMethodCopyWith(
          PaymentMethod value, $Res Function(PaymentMethod) then) =
      _$PaymentMethodCopyWithImpl<$Res, PaymentMethod>;
  @useResult
  $Res call(
      {String id,
      String type,
      String channel,
      String email,
      String currency,
      String? bankCode,
      String? last4,
      int? expiryMonth,
      int? expiryYear,
      String? accountName,
      String? accountNumber,
      String? bankName,
      String? cardBrand,
      String? cardType,
      bool reusable,
      String country,
      String? signature,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$PaymentMethodCopyWithImpl<$Res, $Val extends PaymentMethod>
    implements $PaymentMethodCopyWith<$Res> {
  _$PaymentMethodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? channel = null,
    Object? email = null,
    Object? currency = null,
    Object? bankCode = freezed,
    Object? last4 = freezed,
    Object? expiryMonth = freezed,
    Object? expiryYear = freezed,
    Object? accountName = freezed,
    Object? accountNumber = freezed,
    Object? bankName = freezed,
    Object? cardBrand = freezed,
    Object? cardType = freezed,
    Object? reusable = null,
    Object? country = null,
    Object? signature = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      bankCode: freezed == bankCode
          ? _value.bankCode
          : bankCode // ignore: cast_nullable_to_non_nullable
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
      accountName: freezed == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String?,
      accountNumber: freezed == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      bankName: freezed == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      cardBrand: freezed == cardBrand
          ? _value.cardBrand
          : cardBrand // ignore: cast_nullable_to_non_nullable
              as String?,
      cardType: freezed == cardType
          ? _value.cardType
          : cardType // ignore: cast_nullable_to_non_nullable
              as String?,
      reusable: null == reusable
          ? _value.reusable
          : reusable // ignore: cast_nullable_to_non_nullable
              as bool,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      signature: freezed == signature
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$PaymentMethodImplCopyWith<$Res>
    implements $PaymentMethodCopyWith<$Res> {
  factory _$$PaymentMethodImplCopyWith(
          _$PaymentMethodImpl value, $Res Function(_$PaymentMethodImpl) then) =
      __$$PaymentMethodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String type,
      String channel,
      String email,
      String currency,
      String? bankCode,
      String? last4,
      int? expiryMonth,
      int? expiryYear,
      String? accountName,
      String? accountNumber,
      String? bankName,
      String? cardBrand,
      String? cardType,
      bool reusable,
      String country,
      String? signature,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$PaymentMethodImplCopyWithImpl<$Res>
    extends _$PaymentMethodCopyWithImpl<$Res, _$PaymentMethodImpl>
    implements _$$PaymentMethodImplCopyWith<$Res> {
  __$$PaymentMethodImplCopyWithImpl(
      _$PaymentMethodImpl _value, $Res Function(_$PaymentMethodImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? channel = null,
    Object? email = null,
    Object? currency = null,
    Object? bankCode = freezed,
    Object? last4 = freezed,
    Object? expiryMonth = freezed,
    Object? expiryYear = freezed,
    Object? accountName = freezed,
    Object? accountNumber = freezed,
    Object? bankName = freezed,
    Object? cardBrand = freezed,
    Object? cardType = freezed,
    Object? reusable = null,
    Object? country = null,
    Object? signature = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$PaymentMethodImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      bankCode: freezed == bankCode
          ? _value.bankCode
          : bankCode // ignore: cast_nullable_to_non_nullable
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
      accountName: freezed == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String?,
      accountNumber: freezed == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      bankName: freezed == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      cardBrand: freezed == cardBrand
          ? _value.cardBrand
          : cardBrand // ignore: cast_nullable_to_non_nullable
              as String?,
      cardType: freezed == cardType
          ? _value.cardType
          : cardType // ignore: cast_nullable_to_non_nullable
              as String?,
      reusable: null == reusable
          ? _value.reusable
          : reusable // ignore: cast_nullable_to_non_nullable
              as bool,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      signature: freezed == signature
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$PaymentMethodImpl implements _PaymentMethod {
  const _$PaymentMethodImpl(
      {required this.id,
      required this.type,
      required this.channel,
      required this.email,
      this.currency = 'NGN',
      this.bankCode,
      this.last4,
      this.expiryMonth,
      this.expiryYear,
      this.accountName,
      this.accountNumber,
      this.bankName,
      this.cardBrand,
      this.cardType,
      this.reusable = false,
      this.country = 'NG',
      this.signature,
      required this.createdAt,
      required this.updatedAt});

  factory _$PaymentMethodImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentMethodImplFromJson(json);

  /// Unique identifier for the payment method
  @override
  final String id;

  /// Type of payment method (card, bank_account, ussd, etc.)
  @override
  final String type;

  /// Channel of the payment method (e.g., visa, mastercard, gtbank)
  @override
  final String channel;

  /// Email of the customer associated with this payment method
  @override
  final String email;

  /// Currency of the payment method
  @override
  @JsonKey()
  final String currency;

  /// Bank code (if applicable)
  @override
  final String? bankCode;

  /// Last 4 digits (for cards)
  @override
  final String? last4;

  /// Expiry month (for cards)
  @override
  final int? expiryMonth;

  /// Expiry year (for cards)
  @override
  final int? expiryYear;

  /// Account name (for bank accounts)
  @override
  final String? accountName;

  /// Account number (for bank accounts)
  @override
  final String? accountNumber;

  /// Bank name (for bank accounts)
  @override
  final String? bankName;

  /// Card brand (visa, mastercard, etc.)
  @override
  final String? cardBrand;

  /// Card type (debit, credit)
  @override
  final String? cardType;

  /// Whether this payment method is reusable
  @override
  @JsonKey()
  final bool reusable;

  /// Country code of the payment method
  @override
  @JsonKey()
  final String country;

  /// Signature hash for the payment method
  @override
  final String? signature;

  /// Creation timestamp
  @override
  final DateTime createdAt;

  /// Last update timestamp
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'PaymentMethod(id: $id, type: $type, channel: $channel, email: $email, currency: $currency, bankCode: $bankCode, last4: $last4, expiryMonth: $expiryMonth, expiryYear: $expiryYear, accountName: $accountName, accountNumber: $accountNumber, bankName: $bankName, cardBrand: $cardBrand, cardType: $cardType, reusable: $reusable, country: $country, signature: $signature, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentMethodImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.bankCode, bankCode) ||
                other.bankCode == bankCode) &&
            (identical(other.last4, last4) || other.last4 == last4) &&
            (identical(other.expiryMonth, expiryMonth) ||
                other.expiryMonth == expiryMonth) &&
            (identical(other.expiryYear, expiryYear) ||
                other.expiryYear == expiryYear) &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.cardBrand, cardBrand) ||
                other.cardBrand == cardBrand) &&
            (identical(other.cardType, cardType) ||
                other.cardType == cardType) &&
            (identical(other.reusable, reusable) ||
                other.reusable == reusable) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.signature, signature) ||
                other.signature == signature) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        type,
        channel,
        email,
        currency,
        bankCode,
        last4,
        expiryMonth,
        expiryYear,
        accountName,
        accountNumber,
        bankName,
        cardBrand,
        cardType,
        reusable,
        country,
        signature,
        createdAt,
        updatedAt
      ]);

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentMethodImplCopyWith<_$PaymentMethodImpl> get copyWith =>
      __$$PaymentMethodImplCopyWithImpl<_$PaymentMethodImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentMethodImplToJson(
      this,
    );
  }
}

abstract class _PaymentMethod implements PaymentMethod {
  const factory _PaymentMethod(
      {required final String id,
      required final String type,
      required final String channel,
      required final String email,
      final String currency,
      final String? bankCode,
      final String? last4,
      final int? expiryMonth,
      final int? expiryYear,
      final String? accountName,
      final String? accountNumber,
      final String? bankName,
      final String? cardBrand,
      final String? cardType,
      final bool reusable,
      final String country,
      final String? signature,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$PaymentMethodImpl;

  factory _PaymentMethod.fromJson(Map<String, dynamic> json) =
      _$PaymentMethodImpl.fromJson;

  /// Unique identifier for the payment method
  @override
  String get id;

  /// Type of payment method (card, bank_account, ussd, etc.)
  @override
  String get type;

  /// Channel of the payment method (e.g., visa, mastercard, gtbank)
  @override
  String get channel;

  /// Email of the customer associated with this payment method
  @override
  String get email;

  /// Currency of the payment method
  @override
  String get currency;

  /// Bank code (if applicable)
  @override
  String? get bankCode;

  /// Last 4 digits (for cards)
  @override
  String? get last4;

  /// Expiry month (for cards)
  @override
  int? get expiryMonth;

  /// Expiry year (for cards)
  @override
  int? get expiryYear;

  /// Account name (for bank accounts)
  @override
  String? get accountName;

  /// Account number (for bank accounts)
  @override
  String? get accountNumber;

  /// Bank name (for bank accounts)
  @override
  String? get bankName;

  /// Card brand (visa, mastercard, etc.)
  @override
  String? get cardBrand;

  /// Card type (debit, credit)
  @override
  String? get cardType;

  /// Whether this payment method is reusable
  @override
  bool get reusable;

  /// Country code of the payment method
  @override
  String get country;

  /// Signature hash for the payment method
  @override
  String? get signature;

  /// Creation timestamp
  @override
  DateTime get createdAt;

  /// Last update timestamp
  @override
  DateTime get updatedAt;

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentMethodImplCopyWith<_$PaymentMethodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
