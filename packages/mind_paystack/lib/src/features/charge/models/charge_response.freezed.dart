// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'charge_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChargeResponse _$ChargeResponseFromJson(Map<String, dynamic> json) {
  return _ChargeResponse.fromJson(json);
}

/// @nodoc
mixin _$ChargeResponse {
  /// Unique identifier for the transaction
  String? get reference => throw _privateConstructorUsedError;

  /// Status of the charge (success, pending, failed)
  bool? get status => throw _privateConstructorUsedError;

  /// Transaction amount in lowest currency unit
  int? get amount => throw _privateConstructorUsedError;

  /// Currency of the transaction
  String? get currency => throw _privateConstructorUsedError;

  /// Email of the customer
  String? get email => throw _privateConstructorUsedError;

  /// Authorization URL for completing the transaction
  String? get authorizationUrl => throw _privateConstructorUsedError;

  /// Access code for the transaction
  String? get accessCode => throw _privateConstructorUsedError;

  /// Message describing the status
  String? get message => throw _privateConstructorUsedError;

  /// Authorization details if successful
  ChargeAuthorization? get authorization => throw _privateConstructorUsedError;

  /// Next action required (pin, otp, phone, birthday, redirect)
  String? get nextAction => throw _privateConstructorUsedError;

  /// Gateway response message
  String? get gatewayResponse => throw _privateConstructorUsedError;

  /// Channel used for the transaction
  String? get channel => throw _privateConstructorUsedError;

  /// IP address of the request
  String? get ipAddress => throw _privateConstructorUsedError;

  /// Metadata associated with the charge
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  /// Creation timestamp
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Last update timestamp
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this ChargeResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChargeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChargeResponseCopyWith<ChargeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChargeResponseCopyWith<$Res> {
  factory $ChargeResponseCopyWith(
          ChargeResponse value, $Res Function(ChargeResponse) then) =
      _$ChargeResponseCopyWithImpl<$Res, ChargeResponse>;
  @useResult
  $Res call(
      {String? reference,
      bool? status,
      int? amount,
      String? currency,
      String? email,
      String? authorizationUrl,
      String? accessCode,
      String? message,
      ChargeAuthorization? authorization,
      String? nextAction,
      String? gatewayResponse,
      String? channel,
      String? ipAddress,
      Map<String, dynamic>? metadata,
      DateTime? createdAt,
      DateTime? updatedAt});

  $ChargeAuthorizationCopyWith<$Res>? get authorization;
}

/// @nodoc
class _$ChargeResponseCopyWithImpl<$Res, $Val extends ChargeResponse>
    implements $ChargeResponseCopyWith<$Res> {
  _$ChargeResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChargeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reference = freezed,
    Object? status = freezed,
    Object? amount = freezed,
    Object? currency = freezed,
    Object? email = freezed,
    Object? authorizationUrl = freezed,
    Object? accessCode = freezed,
    Object? message = freezed,
    Object? authorization = freezed,
    Object? nextAction = freezed,
    Object? gatewayResponse = freezed,
    Object? channel = freezed,
    Object? ipAddress = freezed,
    Object? metadata = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      authorizationUrl: freezed == authorizationUrl
          ? _value.authorizationUrl
          : authorizationUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      accessCode: freezed == accessCode
          ? _value.accessCode
          : accessCode // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      authorization: freezed == authorization
          ? _value.authorization
          : authorization // ignore: cast_nullable_to_non_nullable
              as ChargeAuthorization?,
      nextAction: freezed == nextAction
          ? _value.nextAction
          : nextAction // ignore: cast_nullable_to_non_nullable
              as String?,
      gatewayResponse: freezed == gatewayResponse
          ? _value.gatewayResponse
          : gatewayResponse // ignore: cast_nullable_to_non_nullable
              as String?,
      channel: freezed == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String?,
      ipAddress: freezed == ipAddress
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of ChargeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChargeAuthorizationCopyWith<$Res>? get authorization {
    if (_value.authorization == null) {
      return null;
    }

    return $ChargeAuthorizationCopyWith<$Res>(_value.authorization!, (value) {
      return _then(_value.copyWith(authorization: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChargeResponseImplCopyWith<$Res>
    implements $ChargeResponseCopyWith<$Res> {
  factory _$$ChargeResponseImplCopyWith(_$ChargeResponseImpl value,
          $Res Function(_$ChargeResponseImpl) then) =
      __$$ChargeResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? reference,
      bool? status,
      int? amount,
      String? currency,
      String? email,
      String? authorizationUrl,
      String? accessCode,
      String? message,
      ChargeAuthorization? authorization,
      String? nextAction,
      String? gatewayResponse,
      String? channel,
      String? ipAddress,
      Map<String, dynamic>? metadata,
      DateTime? createdAt,
      DateTime? updatedAt});

  @override
  $ChargeAuthorizationCopyWith<$Res>? get authorization;
}

/// @nodoc
class __$$ChargeResponseImplCopyWithImpl<$Res>
    extends _$ChargeResponseCopyWithImpl<$Res, _$ChargeResponseImpl>
    implements _$$ChargeResponseImplCopyWith<$Res> {
  __$$ChargeResponseImplCopyWithImpl(
      _$ChargeResponseImpl _value, $Res Function(_$ChargeResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChargeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reference = freezed,
    Object? status = freezed,
    Object? amount = freezed,
    Object? currency = freezed,
    Object? email = freezed,
    Object? authorizationUrl = freezed,
    Object? accessCode = freezed,
    Object? message = freezed,
    Object? authorization = freezed,
    Object? nextAction = freezed,
    Object? gatewayResponse = freezed,
    Object? channel = freezed,
    Object? ipAddress = freezed,
    Object? metadata = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ChargeResponseImpl(
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      authorizationUrl: freezed == authorizationUrl
          ? _value.authorizationUrl
          : authorizationUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      accessCode: freezed == accessCode
          ? _value.accessCode
          : accessCode // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      authorization: freezed == authorization
          ? _value.authorization
          : authorization // ignore: cast_nullable_to_non_nullable
              as ChargeAuthorization?,
      nextAction: freezed == nextAction
          ? _value.nextAction
          : nextAction // ignore: cast_nullable_to_non_nullable
              as String?,
      gatewayResponse: freezed == gatewayResponse
          ? _value.gatewayResponse
          : gatewayResponse // ignore: cast_nullable_to_non_nullable
              as String?,
      channel: freezed == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String?,
      ipAddress: freezed == ipAddress
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChargeResponseImpl implements _ChargeResponse {
  const _$ChargeResponseImpl(
      {required this.reference,
      required this.status,
      required this.amount,
      this.currency = 'NGN',
      required this.email,
      this.authorizationUrl,
      this.accessCode,
      required this.message,
      this.authorization,
      this.nextAction,
      required this.gatewayResponse,
      required this.channel,
      this.ipAddress,
      final Map<String, dynamic>? metadata,
      required this.createdAt,
      required this.updatedAt})
      : _metadata = metadata;

  factory _$ChargeResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChargeResponseImplFromJson(json);

  /// Unique identifier for the transaction
  @override
  final String? reference;

  /// Status of the charge (success, pending, failed)
  @override
  final bool? status;

  /// Transaction amount in lowest currency unit
  @override
  final int? amount;

  /// Currency of the transaction
  @override
  @JsonKey()
  final String? currency;

  /// Email of the customer
  @override
  final String? email;

  /// Authorization URL for completing the transaction
  @override
  final String? authorizationUrl;

  /// Access code for the transaction
  @override
  final String? accessCode;

  /// Message describing the status
  @override
  final String? message;

  /// Authorization details if successful
  @override
  final ChargeAuthorization? authorization;

  /// Next action required (pin, otp, phone, birthday, redirect)
  @override
  final String? nextAction;

  /// Gateway response message
  @override
  final String? gatewayResponse;

  /// Channel used for the transaction
  @override
  final String? channel;

  /// IP address of the request
  @override
  final String? ipAddress;

  /// Metadata associated with the charge
  final Map<String, dynamic>? _metadata;

  /// Metadata associated with the charge
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Creation timestamp
  @override
  final DateTime? createdAt;

  /// Last update timestamp
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'ChargeResponse(reference: $reference, status: $status, amount: $amount, currency: $currency, email: $email, authorizationUrl: $authorizationUrl, accessCode: $accessCode, message: $message, authorization: $authorization, nextAction: $nextAction, gatewayResponse: $gatewayResponse, channel: $channel, ipAddress: $ipAddress, metadata: $metadata, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChargeResponseImpl &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.authorizationUrl, authorizationUrl) ||
                other.authorizationUrl == authorizationUrl) &&
            (identical(other.accessCode, accessCode) ||
                other.accessCode == accessCode) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.authorization, authorization) ||
                other.authorization == authorization) &&
            (identical(other.nextAction, nextAction) ||
                other.nextAction == nextAction) &&
            (identical(other.gatewayResponse, gatewayResponse) ||
                other.gatewayResponse == gatewayResponse) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.ipAddress, ipAddress) ||
                other.ipAddress == ipAddress) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      reference,
      status,
      amount,
      currency,
      email,
      authorizationUrl,
      accessCode,
      message,
      authorization,
      nextAction,
      gatewayResponse,
      channel,
      ipAddress,
      const DeepCollectionEquality().hash(_metadata),
      createdAt,
      updatedAt);

  /// Create a copy of ChargeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChargeResponseImplCopyWith<_$ChargeResponseImpl> get copyWith =>
      __$$ChargeResponseImplCopyWithImpl<_$ChargeResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChargeResponseImplToJson(
      this,
    );
  }
}

abstract class _ChargeResponse implements ChargeResponse {
  const factory _ChargeResponse(
      {required final String? reference,
      required final bool? status,
      required final int? amount,
      final String? currency,
      required final String? email,
      final String? authorizationUrl,
      final String? accessCode,
      required final String? message,
      final ChargeAuthorization? authorization,
      final String? nextAction,
      required final String? gatewayResponse,
      required final String? channel,
      final String? ipAddress,
      final Map<String, dynamic>? metadata,
      required final DateTime? createdAt,
      required final DateTime? updatedAt}) = _$ChargeResponseImpl;

  factory _ChargeResponse.fromJson(Map<String, dynamic> json) =
      _$ChargeResponseImpl.fromJson;

  /// Unique identifier for the transaction
  @override
  String? get reference;

  /// Status of the charge (success, pending, failed)
  @override
  bool? get status;

  /// Transaction amount in lowest currency unit
  @override
  int? get amount;

  /// Currency of the transaction
  @override
  String? get currency;

  /// Email of the customer
  @override
  String? get email;

  /// Authorization URL for completing the transaction
  @override
  String? get authorizationUrl;

  /// Access code for the transaction
  @override
  String? get accessCode;

  /// Message describing the status
  @override
  String? get message;

  /// Authorization details if successful
  @override
  ChargeAuthorization? get authorization;

  /// Next action required (pin, otp, phone, birthday, redirect)
  @override
  String? get nextAction;

  /// Gateway response message
  @override
  String? get gatewayResponse;

  /// Channel used for the transaction
  @override
  String? get channel;

  /// IP address of the request
  @override
  String? get ipAddress;

  /// Metadata associated with the charge
  @override
  Map<String, dynamic>? get metadata;

  /// Creation timestamp
  @override
  DateTime? get createdAt;

  /// Last update timestamp
  @override
  DateTime? get updatedAt;

  /// Create a copy of ChargeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChargeResponseImplCopyWith<_$ChargeResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
