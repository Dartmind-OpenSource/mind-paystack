// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_totals.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionTotals _$TransactionTotalsFromJson(Map<String, dynamic> json) {
  return _TransactionTotals.fromJson(json);
}

/// @nodoc
mixin _$TransactionTotals {
  int get totalTransactions => throw _privateConstructorUsedError;
  int get uniqueCustomers => throw _privateConstructorUsedError;
  int get totalVolume => throw _privateConstructorUsedError;
  int get totalSuccessful => throw _privateConstructorUsedError;
  int get totalFailed => throw _privateConstructorUsedError;
  int get pendingTransfers => throw _privateConstructorUsedError;
  Map<String, int> get volumeByChannel => throw _privateConstructorUsedError;
  Map<String, int> get volumeByCurrency => throw _privateConstructorUsedError;

  /// Serializes this TransactionTotals to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionTotals
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionTotalsCopyWith<TransactionTotals> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionTotalsCopyWith<$Res> {
  factory $TransactionTotalsCopyWith(
          TransactionTotals value, $Res Function(TransactionTotals) then) =
      _$TransactionTotalsCopyWithImpl<$Res, TransactionTotals>;
  @useResult
  $Res call(
      {int totalTransactions,
      int uniqueCustomers,
      int totalVolume,
      int totalSuccessful,
      int totalFailed,
      int pendingTransfers,
      Map<String, int> volumeByChannel,
      Map<String, int> volumeByCurrency});
}

/// @nodoc
class _$TransactionTotalsCopyWithImpl<$Res, $Val extends TransactionTotals>
    implements $TransactionTotalsCopyWith<$Res> {
  _$TransactionTotalsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionTotals
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalTransactions = null,
    Object? uniqueCustomers = null,
    Object? totalVolume = null,
    Object? totalSuccessful = null,
    Object? totalFailed = null,
    Object? pendingTransfers = null,
    Object? volumeByChannel = null,
    Object? volumeByCurrency = null,
  }) {
    return _then(_value.copyWith(
      totalTransactions: null == totalTransactions
          ? _value.totalTransactions
          : totalTransactions // ignore: cast_nullable_to_non_nullable
              as int,
      uniqueCustomers: null == uniqueCustomers
          ? _value.uniqueCustomers
          : uniqueCustomers // ignore: cast_nullable_to_non_nullable
              as int,
      totalVolume: null == totalVolume
          ? _value.totalVolume
          : totalVolume // ignore: cast_nullable_to_non_nullable
              as int,
      totalSuccessful: null == totalSuccessful
          ? _value.totalSuccessful
          : totalSuccessful // ignore: cast_nullable_to_non_nullable
              as int,
      totalFailed: null == totalFailed
          ? _value.totalFailed
          : totalFailed // ignore: cast_nullable_to_non_nullable
              as int,
      pendingTransfers: null == pendingTransfers
          ? _value.pendingTransfers
          : pendingTransfers // ignore: cast_nullable_to_non_nullable
              as int,
      volumeByChannel: null == volumeByChannel
          ? _value.volumeByChannel
          : volumeByChannel // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      volumeByCurrency: null == volumeByCurrency
          ? _value.volumeByCurrency
          : volumeByCurrency // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionTotalsImplCopyWith<$Res>
    implements $TransactionTotalsCopyWith<$Res> {
  factory _$$TransactionTotalsImplCopyWith(_$TransactionTotalsImpl value,
          $Res Function(_$TransactionTotalsImpl) then) =
      __$$TransactionTotalsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalTransactions,
      int uniqueCustomers,
      int totalVolume,
      int totalSuccessful,
      int totalFailed,
      int pendingTransfers,
      Map<String, int> volumeByChannel,
      Map<String, int> volumeByCurrency});
}

/// @nodoc
class __$$TransactionTotalsImplCopyWithImpl<$Res>
    extends _$TransactionTotalsCopyWithImpl<$Res, _$TransactionTotalsImpl>
    implements _$$TransactionTotalsImplCopyWith<$Res> {
  __$$TransactionTotalsImplCopyWithImpl(_$TransactionTotalsImpl _value,
      $Res Function(_$TransactionTotalsImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionTotals
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalTransactions = null,
    Object? uniqueCustomers = null,
    Object? totalVolume = null,
    Object? totalSuccessful = null,
    Object? totalFailed = null,
    Object? pendingTransfers = null,
    Object? volumeByChannel = null,
    Object? volumeByCurrency = null,
  }) {
    return _then(_$TransactionTotalsImpl(
      totalTransactions: null == totalTransactions
          ? _value.totalTransactions
          : totalTransactions // ignore: cast_nullable_to_non_nullable
              as int,
      uniqueCustomers: null == uniqueCustomers
          ? _value.uniqueCustomers
          : uniqueCustomers // ignore: cast_nullable_to_non_nullable
              as int,
      totalVolume: null == totalVolume
          ? _value.totalVolume
          : totalVolume // ignore: cast_nullable_to_non_nullable
              as int,
      totalSuccessful: null == totalSuccessful
          ? _value.totalSuccessful
          : totalSuccessful // ignore: cast_nullable_to_non_nullable
              as int,
      totalFailed: null == totalFailed
          ? _value.totalFailed
          : totalFailed // ignore: cast_nullable_to_non_nullable
              as int,
      pendingTransfers: null == pendingTransfers
          ? _value.pendingTransfers
          : pendingTransfers // ignore: cast_nullable_to_non_nullable
              as int,
      volumeByChannel: null == volumeByChannel
          ? _value._volumeByChannel
          : volumeByChannel // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      volumeByCurrency: null == volumeByCurrency
          ? _value._volumeByCurrency
          : volumeByCurrency // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionTotalsImpl implements _TransactionTotals {
  const _$TransactionTotalsImpl(
      {required this.totalTransactions,
      required this.uniqueCustomers,
      required this.totalVolume,
      required this.totalSuccessful,
      required this.totalFailed,
      required this.pendingTransfers,
      required final Map<String, int> volumeByChannel,
      required final Map<String, int> volumeByCurrency})
      : _volumeByChannel = volumeByChannel,
        _volumeByCurrency = volumeByCurrency;

  factory _$TransactionTotalsImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionTotalsImplFromJson(json);

  @override
  final int totalTransactions;
  @override
  final int uniqueCustomers;
  @override
  final int totalVolume;
  @override
  final int totalSuccessful;
  @override
  final int totalFailed;
  @override
  final int pendingTransfers;
  final Map<String, int> _volumeByChannel;
  @override
  Map<String, int> get volumeByChannel {
    if (_volumeByChannel is EqualUnmodifiableMapView) return _volumeByChannel;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_volumeByChannel);
  }

  final Map<String, int> _volumeByCurrency;
  @override
  Map<String, int> get volumeByCurrency {
    if (_volumeByCurrency is EqualUnmodifiableMapView) return _volumeByCurrency;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_volumeByCurrency);
  }

  @override
  String toString() {
    return 'TransactionTotals(totalTransactions: $totalTransactions, uniqueCustomers: $uniqueCustomers, totalVolume: $totalVolume, totalSuccessful: $totalSuccessful, totalFailed: $totalFailed, pendingTransfers: $pendingTransfers, volumeByChannel: $volumeByChannel, volumeByCurrency: $volumeByCurrency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionTotalsImpl &&
            (identical(other.totalTransactions, totalTransactions) ||
                other.totalTransactions == totalTransactions) &&
            (identical(other.uniqueCustomers, uniqueCustomers) ||
                other.uniqueCustomers == uniqueCustomers) &&
            (identical(other.totalVolume, totalVolume) ||
                other.totalVolume == totalVolume) &&
            (identical(other.totalSuccessful, totalSuccessful) ||
                other.totalSuccessful == totalSuccessful) &&
            (identical(other.totalFailed, totalFailed) ||
                other.totalFailed == totalFailed) &&
            (identical(other.pendingTransfers, pendingTransfers) ||
                other.pendingTransfers == pendingTransfers) &&
            const DeepCollectionEquality()
                .equals(other._volumeByChannel, _volumeByChannel) &&
            const DeepCollectionEquality()
                .equals(other._volumeByCurrency, _volumeByCurrency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalTransactions,
      uniqueCustomers,
      totalVolume,
      totalSuccessful,
      totalFailed,
      pendingTransfers,
      const DeepCollectionEquality().hash(_volumeByChannel),
      const DeepCollectionEquality().hash(_volumeByCurrency));

  /// Create a copy of TransactionTotals
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionTotalsImplCopyWith<_$TransactionTotalsImpl> get copyWith =>
      __$$TransactionTotalsImplCopyWithImpl<_$TransactionTotalsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionTotalsImplToJson(
      this,
    );
  }
}

abstract class _TransactionTotals implements TransactionTotals {
  const factory _TransactionTotals(
          {required final int totalTransactions,
          required final int uniqueCustomers,
          required final int totalVolume,
          required final int totalSuccessful,
          required final int totalFailed,
          required final int pendingTransfers,
          required final Map<String, int> volumeByChannel,
          required final Map<String, int> volumeByCurrency}) =
      _$TransactionTotalsImpl;

  factory _TransactionTotals.fromJson(Map<String, dynamic> json) =
      _$TransactionTotalsImpl.fromJson;

  @override
  int get totalTransactions;
  @override
  int get uniqueCustomers;
  @override
  int get totalVolume;
  @override
  int get totalSuccessful;
  @override
  int get totalFailed;
  @override
  int get pendingTransfers;
  @override
  Map<String, int> get volumeByChannel;
  @override
  Map<String, int> get volumeByCurrency;

  /// Create a copy of TransactionTotals
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionTotalsImplCopyWith<_$TransactionTotalsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
