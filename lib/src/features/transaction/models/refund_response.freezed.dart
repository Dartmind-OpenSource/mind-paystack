// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'refund_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RefundResponse _$RefundResponseFromJson(Map<String, dynamic> json) {
  return _RefundResponse.fromJson(json);
}

/// @nodoc
mixin _$RefundResponse {
  String get reference => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String get transactionReference => throw _privateConstructorUsedError;
  String? get customerNote => throw _privateConstructorUsedError;
  String? get merchantNote => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this RefundResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RefundResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RefundResponseCopyWith<RefundResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefundResponseCopyWith<$Res> {
  factory $RefundResponseCopyWith(
          RefundResponse value, $Res Function(RefundResponse) then) =
      _$RefundResponseCopyWithImpl<$Res, RefundResponse>;
  @useResult
  $Res call(
      {String reference,
      String status,
      int amount,
      String currency,
      String transactionReference,
      String? customerNote,
      String? merchantNote,
      DateTime createdAt});
}

/// @nodoc
class _$RefundResponseCopyWithImpl<$Res, $Val extends RefundResponse>
    implements $RefundResponseCopyWith<$Res> {
  _$RefundResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RefundResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reference = null,
    Object? status = null,
    Object? amount = null,
    Object? currency = null,
    Object? transactionReference = null,
    Object? customerNote = freezed,
    Object? merchantNote = freezed,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
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
      transactionReference: null == transactionReference
          ? _value.transactionReference
          : transactionReference // ignore: cast_nullable_to_non_nullable
              as String,
      customerNote: freezed == customerNote
          ? _value.customerNote
          : customerNote // ignore: cast_nullable_to_non_nullable
              as String?,
      merchantNote: freezed == merchantNote
          ? _value.merchantNote
          : merchantNote // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RefundResponseImplCopyWith<$Res>
    implements $RefundResponseCopyWith<$Res> {
  factory _$$RefundResponseImplCopyWith(_$RefundResponseImpl value,
          $Res Function(_$RefundResponseImpl) then) =
      __$$RefundResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String reference,
      String status,
      int amount,
      String currency,
      String transactionReference,
      String? customerNote,
      String? merchantNote,
      DateTime createdAt});
}

/// @nodoc
class __$$RefundResponseImplCopyWithImpl<$Res>
    extends _$RefundResponseCopyWithImpl<$Res, _$RefundResponseImpl>
    implements _$$RefundResponseImplCopyWith<$Res> {
  __$$RefundResponseImplCopyWithImpl(
      _$RefundResponseImpl _value, $Res Function(_$RefundResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of RefundResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reference = null,
    Object? status = null,
    Object? amount = null,
    Object? currency = null,
    Object? transactionReference = null,
    Object? customerNote = freezed,
    Object? merchantNote = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$RefundResponseImpl(
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
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
      transactionReference: null == transactionReference
          ? _value.transactionReference
          : transactionReference // ignore: cast_nullable_to_non_nullable
              as String,
      customerNote: freezed == customerNote
          ? _value.customerNote
          : customerNote // ignore: cast_nullable_to_non_nullable
              as String?,
      merchantNote: freezed == merchantNote
          ? _value.merchantNote
          : merchantNote // ignore: cast_nullable_to_non_nullable
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
class _$RefundResponseImpl implements _RefundResponse {
  const _$RefundResponseImpl(
      {required this.reference,
      required this.status,
      required this.amount,
      required this.currency,
      required this.transactionReference,
      this.customerNote,
      this.merchantNote,
      required this.createdAt});

  factory _$RefundResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RefundResponseImplFromJson(json);

  @override
  final String reference;
  @override
  final String status;
  @override
  final int amount;
  @override
  final String currency;
  @override
  final String transactionReference;
  @override
  final String? customerNote;
  @override
  final String? merchantNote;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'RefundResponse(reference: $reference, status: $status, amount: $amount, currency: $currency, transactionReference: $transactionReference, customerNote: $customerNote, merchantNote: $merchantNote, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefundResponseImpl &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.transactionReference, transactionReference) ||
                other.transactionReference == transactionReference) &&
            (identical(other.customerNote, customerNote) ||
                other.customerNote == customerNote) &&
            (identical(other.merchantNote, merchantNote) ||
                other.merchantNote == merchantNote) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, reference, status, amount,
      currency, transactionReference, customerNote, merchantNote, createdAt);

  /// Create a copy of RefundResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefundResponseImplCopyWith<_$RefundResponseImpl> get copyWith =>
      __$$RefundResponseImplCopyWithImpl<_$RefundResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RefundResponseImplToJson(
      this,
    );
  }
}

abstract class _RefundResponse implements RefundResponse {
  const factory _RefundResponse(
      {required final String reference,
      required final String status,
      required final int amount,
      required final String currency,
      required final String transactionReference,
      final String? customerNote,
      final String? merchantNote,
      required final DateTime createdAt}) = _$RefundResponseImpl;

  factory _RefundResponse.fromJson(Map<String, dynamic> json) =
      _$RefundResponseImpl.fromJson;

  @override
  String get reference;
  @override
  String get status;
  @override
  int get amount;
  @override
  String get currency;
  @override
  String get transactionReference;
  @override
  String? get customerNote;
  @override
  String? get merchantNote;
  @override
  DateTime get createdAt;

  /// Create a copy of RefundResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefundResponseImplCopyWith<_$RefundResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
