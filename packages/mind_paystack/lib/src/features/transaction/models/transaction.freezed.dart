// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return _Transaction.fromJson(json);
}

/// @nodoc
mixin _$Transaction {
  String get id => throw _privateConstructorUsedError;
  String get reference => throw _privateConstructorUsedError;
  String get domain => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get channel => throw _privateConstructorUsedError;
  String get gatewayResponse => throw _privateConstructorUsedError;
  bool get paidAt => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get customerId => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  AuthorizationResponse? get authorization =>
      throw _privateConstructorUsedError;
  String? get customerCode => throw _privateConstructorUsedError;
  String? get customerEmail => throw _privateConstructorUsedError;
  String? get plan => throw _privateConstructorUsedError;
  String? get subaccount => throw _privateConstructorUsedError;
  int? get fees => throw _privateConstructorUsedError;
  String? get splitCode => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Transaction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionCopyWith<Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCopyWith<$Res> {
  factory $TransactionCopyWith(
          Transaction value, $Res Function(Transaction) then) =
      _$TransactionCopyWithImpl<$Res, Transaction>;
  @useResult
  $Res call(
      {String id,
      String reference,
      String domain,
      String status,
      int amount,
      String currency,
      DateTime createdAt,
      String channel,
      String gatewayResponse,
      bool paidAt,
      String? description,
      String? customerId,
      Map<String, dynamic>? metadata,
      AuthorizationResponse? authorization,
      String? customerCode,
      String? customerEmail,
      String? plan,
      String? subaccount,
      int? fees,
      String? splitCode,
      DateTime updatedAt});

  $AuthorizationResponseCopyWith<$Res>? get authorization;
}

/// @nodoc
class _$TransactionCopyWithImpl<$Res, $Val extends Transaction>
    implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? reference = null,
    Object? domain = null,
    Object? status = null,
    Object? amount = null,
    Object? currency = null,
    Object? createdAt = null,
    Object? channel = null,
    Object? gatewayResponse = null,
    Object? paidAt = null,
    Object? description = freezed,
    Object? customerId = freezed,
    Object? metadata = freezed,
    Object? authorization = freezed,
    Object? customerCode = freezed,
    Object? customerEmail = freezed,
    Object? plan = freezed,
    Object? subaccount = freezed,
    Object? fees = freezed,
    Object? splitCode = freezed,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      domain: null == domain
          ? _value.domain
          : domain // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String,
      gatewayResponse: null == gatewayResponse
          ? _value.gatewayResponse
          : gatewayResponse // ignore: cast_nullable_to_non_nullable
              as String,
      paidAt: null == paidAt
          ? _value.paidAt
          : paidAt // ignore: cast_nullable_to_non_nullable
              as bool,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      authorization: freezed == authorization
          ? _value.authorization
          : authorization // ignore: cast_nullable_to_non_nullable
              as AuthorizationResponse?,
      customerCode: freezed == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String?,
      customerEmail: freezed == customerEmail
          ? _value.customerEmail
          : customerEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      plan: freezed == plan
          ? _value.plan
          : plan // ignore: cast_nullable_to_non_nullable
              as String?,
      subaccount: freezed == subaccount
          ? _value.subaccount
          : subaccount // ignore: cast_nullable_to_non_nullable
              as String?,
      fees: freezed == fees
          ? _value.fees
          : fees // ignore: cast_nullable_to_non_nullable
              as int?,
      splitCode: freezed == splitCode
          ? _value.splitCode
          : splitCode // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AuthorizationResponseCopyWith<$Res>? get authorization {
    if (_value.authorization == null) {
      return null;
    }

    return $AuthorizationResponseCopyWith<$Res>(_value.authorization!, (value) {
      return _then(_value.copyWith(authorization: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TransactionImplCopyWith<$Res>
    implements $TransactionCopyWith<$Res> {
  factory _$$TransactionImplCopyWith(
          _$TransactionImpl value, $Res Function(_$TransactionImpl) then) =
      __$$TransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String reference,
      String domain,
      String status,
      int amount,
      String currency,
      DateTime createdAt,
      String channel,
      String gatewayResponse,
      bool paidAt,
      String? description,
      String? customerId,
      Map<String, dynamic>? metadata,
      AuthorizationResponse? authorization,
      String? customerCode,
      String? customerEmail,
      String? plan,
      String? subaccount,
      int? fees,
      String? splitCode,
      DateTime updatedAt});

  @override
  $AuthorizationResponseCopyWith<$Res>? get authorization;
}

/// @nodoc
class __$$TransactionImplCopyWithImpl<$Res>
    extends _$TransactionCopyWithImpl<$Res, _$TransactionImpl>
    implements _$$TransactionImplCopyWith<$Res> {
  __$$TransactionImplCopyWithImpl(
      _$TransactionImpl _value, $Res Function(_$TransactionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? reference = null,
    Object? domain = null,
    Object? status = null,
    Object? amount = null,
    Object? currency = null,
    Object? createdAt = null,
    Object? channel = null,
    Object? gatewayResponse = null,
    Object? paidAt = null,
    Object? description = freezed,
    Object? customerId = freezed,
    Object? metadata = freezed,
    Object? authorization = freezed,
    Object? customerCode = freezed,
    Object? customerEmail = freezed,
    Object? plan = freezed,
    Object? subaccount = freezed,
    Object? fees = freezed,
    Object? splitCode = freezed,
    Object? updatedAt = null,
  }) {
    return _then(_$TransactionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      domain: null == domain
          ? _value.domain
          : domain // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String,
      gatewayResponse: null == gatewayResponse
          ? _value.gatewayResponse
          : gatewayResponse // ignore: cast_nullable_to_non_nullable
              as String,
      paidAt: null == paidAt
          ? _value.paidAt
          : paidAt // ignore: cast_nullable_to_non_nullable
              as bool,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      authorization: freezed == authorization
          ? _value.authorization
          : authorization // ignore: cast_nullable_to_non_nullable
              as AuthorizationResponse?,
      customerCode: freezed == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String?,
      customerEmail: freezed == customerEmail
          ? _value.customerEmail
          : customerEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      plan: freezed == plan
          ? _value.plan
          : plan // ignore: cast_nullable_to_non_nullable
              as String?,
      subaccount: freezed == subaccount
          ? _value.subaccount
          : subaccount // ignore: cast_nullable_to_non_nullable
              as String?,
      fees: freezed == fees
          ? _value.fees
          : fees // ignore: cast_nullable_to_non_nullable
              as int?,
      splitCode: freezed == splitCode
          ? _value.splitCode
          : splitCode // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionImpl implements _Transaction {
  const _$TransactionImpl(
      {required this.id,
      required this.reference,
      required this.domain,
      required this.status,
      required this.amount,
      required this.currency,
      required this.createdAt,
      required this.channel,
      required this.gatewayResponse,
      required this.paidAt,
      this.description,
      this.customerId,
      final Map<String, dynamic>? metadata,
      this.authorization,
      this.customerCode,
      this.customerEmail,
      this.plan,
      this.subaccount,
      this.fees,
      this.splitCode,
      required this.updatedAt})
      : _metadata = metadata;

  factory _$TransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionImplFromJson(json);

  @override
  final String id;
  @override
  final String reference;
  @override
  final String domain;
  @override
  final String status;
  @override
  final int amount;
  @override
  final String currency;
  @override
  final DateTime createdAt;
  @override
  final String channel;
  @override
  final String gatewayResponse;
  @override
  final bool paidAt;
  @override
  final String? description;
  @override
  final String? customerId;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final AuthorizationResponse? authorization;
  @override
  final String? customerCode;
  @override
  final String? customerEmail;
  @override
  final String? plan;
  @override
  final String? subaccount;
  @override
  final int? fees;
  @override
  final String? splitCode;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Transaction(id: $id, reference: $reference, domain: $domain, status: $status, amount: $amount, currency: $currency, createdAt: $createdAt, channel: $channel, gatewayResponse: $gatewayResponse, paidAt: $paidAt, description: $description, customerId: $customerId, metadata: $metadata, authorization: $authorization, customerCode: $customerCode, customerEmail: $customerEmail, plan: $plan, subaccount: $subaccount, fees: $fees, splitCode: $splitCode, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.domain, domain) || other.domain == domain) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.gatewayResponse, gatewayResponse) ||
                other.gatewayResponse == gatewayResponse) &&
            (identical(other.paidAt, paidAt) || other.paidAt == paidAt) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.authorization, authorization) ||
                other.authorization == authorization) &&
            (identical(other.customerCode, customerCode) ||
                other.customerCode == customerCode) &&
            (identical(other.customerEmail, customerEmail) ||
                other.customerEmail == customerEmail) &&
            (identical(other.plan, plan) || other.plan == plan) &&
            (identical(other.subaccount, subaccount) ||
                other.subaccount == subaccount) &&
            (identical(other.fees, fees) || other.fees == fees) &&
            (identical(other.splitCode, splitCode) ||
                other.splitCode == splitCode) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        reference,
        domain,
        status,
        amount,
        currency,
        createdAt,
        channel,
        gatewayResponse,
        paidAt,
        description,
        customerId,
        const DeepCollectionEquality().hash(_metadata),
        authorization,
        customerCode,
        customerEmail,
        plan,
        subaccount,
        fees,
        splitCode,
        updatedAt
      ]);

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionImplCopyWith<_$TransactionImpl> get copyWith =>
      __$$TransactionImplCopyWithImpl<_$TransactionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionImplToJson(
      this,
    );
  }
}

abstract class _Transaction implements Transaction {
  const factory _Transaction(
      {required final String id,
      required final String reference,
      required final String domain,
      required final String status,
      required final int amount,
      required final String currency,
      required final DateTime createdAt,
      required final String channel,
      required final String gatewayResponse,
      required final bool paidAt,
      final String? description,
      final String? customerId,
      final Map<String, dynamic>? metadata,
      final AuthorizationResponse? authorization,
      final String? customerCode,
      final String? customerEmail,
      final String? plan,
      final String? subaccount,
      final int? fees,
      final String? splitCode,
      required final DateTime updatedAt}) = _$TransactionImpl;

  factory _Transaction.fromJson(Map<String, dynamic> json) =
      _$TransactionImpl.fromJson;

  @override
  String get id;
  @override
  String get reference;
  @override
  String get domain;
  @override
  String get status;
  @override
  int get amount;
  @override
  String get currency;
  @override
  DateTime get createdAt;
  @override
  String get channel;
  @override
  String get gatewayResponse;
  @override
  bool get paidAt;
  @override
  String? get description;
  @override
  String? get customerId;
  @override
  Map<String, dynamic>? get metadata;
  @override
  AuthorizationResponse? get authorization;
  @override
  String? get customerCode;
  @override
  String? get customerEmail;
  @override
  String? get plan;
  @override
  String? get subaccount;
  @override
  int? get fees;
  @override
  String? get splitCode;
  @override
  DateTime get updatedAt;

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionImplCopyWith<_$TransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
