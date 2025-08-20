// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'transaction_totals.dart';

class TransactionTotalsMapper extends ClassMapperBase<TransactionTotals> {
  TransactionTotalsMapper._();

  static TransactionTotalsMapper? _instance;
  static TransactionTotalsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TransactionTotalsMapper._());
      CurrencyAmountMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TransactionTotals';

  static int? _$totalTransactions(TransactionTotals v) => v.totalTransactions;
  static const Field<TransactionTotals, int> _f$totalTransactions = Field(
      'totalTransactions', _$totalTransactions,
      key: r'total_transactions', opt: true);
  static int? _$uniqueCustomers(TransactionTotals v) => v.uniqueCustomers;
  static const Field<TransactionTotals, int> _f$uniqueCustomers = Field(
      'uniqueCustomers', _$uniqueCustomers,
      key: r'unique_customers', opt: true);
  static int? _$totalVolume(TransactionTotals v) => v.totalVolume;
  static const Field<TransactionTotals, int> _f$totalVolume =
      Field('totalVolume', _$totalVolume, key: r'total_volume', opt: true);
  static List<CurrencyAmount>? _$totalVolumeByCurrency(TransactionTotals v) =>
      v.totalVolumeByCurrency;
  static const Field<TransactionTotals, List<CurrencyAmount>>
      _f$totalVolumeByCurrency = Field(
          'totalVolumeByCurrency', _$totalVolumeByCurrency,
          key: r'total_volume_by_currency', opt: true);
  static int? _$pendingTransfers(TransactionTotals v) => v.pendingTransfers;
  static const Field<TransactionTotals, int> _f$pendingTransfers = Field(
      'pendingTransfers', _$pendingTransfers,
      key: r'pending_transfers', opt: true);
  static int? _$pendingTransactions(TransactionTotals v) =>
      v.pendingTransactions;
  static const Field<TransactionTotals, int> _f$pendingTransactions = Field(
      'pendingTransactions', _$pendingTransactions,
      key: r'pending_transactions', opt: true);
  static int? _$disabledTransactions(TransactionTotals v) =>
      v.disabledTransactions;
  static const Field<TransactionTotals, int> _f$disabledTransactions = Field(
      'disabledTransactions', _$disabledTransactions,
      key: r'disabled_transactions', opt: true);

  @override
  final MappableFields<TransactionTotals> fields = const {
    #totalTransactions: _f$totalTransactions,
    #uniqueCustomers: _f$uniqueCustomers,
    #totalVolume: _f$totalVolume,
    #totalVolumeByCurrency: _f$totalVolumeByCurrency,
    #pendingTransfers: _f$pendingTransfers,
    #pendingTransactions: _f$pendingTransactions,
    #disabledTransactions: _f$disabledTransactions,
  };

  static TransactionTotals _instantiate(DecodingData data) {
    return TransactionTotals(
        totalTransactions: data.dec(_f$totalTransactions),
        uniqueCustomers: data.dec(_f$uniqueCustomers),
        totalVolume: data.dec(_f$totalVolume),
        totalVolumeByCurrency: data.dec(_f$totalVolumeByCurrency),
        pendingTransfers: data.dec(_f$pendingTransfers),
        pendingTransactions: data.dec(_f$pendingTransactions),
        disabledTransactions: data.dec(_f$disabledTransactions));
  }

  @override
  final Function instantiate = _instantiate;

  static TransactionTotals fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TransactionTotals>(map);
  }

  static TransactionTotals fromJson(String json) {
    return ensureInitialized().decodeJson<TransactionTotals>(json);
  }
}

mixin TransactionTotalsMappable {
  String toJson() {
    return TransactionTotalsMapper.ensureInitialized()
        .encodeJson<TransactionTotals>(this as TransactionTotals);
  }

  Map<String, dynamic> toMap() {
    return TransactionTotalsMapper.ensureInitialized()
        .encodeMap<TransactionTotals>(this as TransactionTotals);
  }

  TransactionTotalsCopyWith<TransactionTotals, TransactionTotals,
          TransactionTotals>
      get copyWith =>
          _TransactionTotalsCopyWithImpl<TransactionTotals, TransactionTotals>(
              this as TransactionTotals, $identity, $identity);
  @override
  String toString() {
    return TransactionTotalsMapper.ensureInitialized()
        .stringifyValue(this as TransactionTotals);
  }

  @override
  bool operator ==(Object other) {
    return TransactionTotalsMapper.ensureInitialized()
        .equalsValue(this as TransactionTotals, other);
  }

  @override
  int get hashCode {
    return TransactionTotalsMapper.ensureInitialized()
        .hashValue(this as TransactionTotals);
  }
}

extension TransactionTotalsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TransactionTotals, $Out> {
  TransactionTotalsCopyWith<$R, TransactionTotals, $Out>
      get $asTransactionTotals => $base
          .as((v, t, t2) => _TransactionTotalsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TransactionTotalsCopyWith<$R, $In extends TransactionTotals,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, CurrencyAmount,
          CurrencyAmountCopyWith<$R, CurrencyAmount, CurrencyAmount>>?
      get totalVolumeByCurrency;
  $R call(
      {int? totalTransactions,
      int? uniqueCustomers,
      int? totalVolume,
      List<CurrencyAmount>? totalVolumeByCurrency,
      int? pendingTransfers,
      int? pendingTransactions,
      int? disabledTransactions});
  TransactionTotalsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TransactionTotalsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TransactionTotals, $Out>
    implements TransactionTotalsCopyWith<$R, TransactionTotals, $Out> {
  _TransactionTotalsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TransactionTotals> $mapper =
      TransactionTotalsMapper.ensureInitialized();
  @override
  ListCopyWith<$R, CurrencyAmount,
          CurrencyAmountCopyWith<$R, CurrencyAmount, CurrencyAmount>>?
      get totalVolumeByCurrency => $value.totalVolumeByCurrency != null
          ? ListCopyWith(
              $value.totalVolumeByCurrency!,
              (v, t) => v.copyWith.$chain(t),
              (v) => call(totalVolumeByCurrency: v))
          : null;
  @override
  $R call(
          {Object? totalTransactions = $none,
          Object? uniqueCustomers = $none,
          Object? totalVolume = $none,
          Object? totalVolumeByCurrency = $none,
          Object? pendingTransfers = $none,
          Object? pendingTransactions = $none,
          Object? disabledTransactions = $none}) =>
      $apply(FieldCopyWithData({
        if (totalTransactions != $none) #totalTransactions: totalTransactions,
        if (uniqueCustomers != $none) #uniqueCustomers: uniqueCustomers,
        if (totalVolume != $none) #totalVolume: totalVolume,
        if (totalVolumeByCurrency != $none)
          #totalVolumeByCurrency: totalVolumeByCurrency,
        if (pendingTransfers != $none) #pendingTransfers: pendingTransfers,
        if (pendingTransactions != $none)
          #pendingTransactions: pendingTransactions,
        if (disabledTransactions != $none)
          #disabledTransactions: disabledTransactions
      }));
  @override
  TransactionTotals $make(CopyWithData data) => TransactionTotals(
      totalTransactions:
          data.get(#totalTransactions, or: $value.totalTransactions),
      uniqueCustomers: data.get(#uniqueCustomers, or: $value.uniqueCustomers),
      totalVolume: data.get(#totalVolume, or: $value.totalVolume),
      totalVolumeByCurrency:
          data.get(#totalVolumeByCurrency, or: $value.totalVolumeByCurrency),
      pendingTransfers:
          data.get(#pendingTransfers, or: $value.pendingTransfers),
      pendingTransactions:
          data.get(#pendingTransactions, or: $value.pendingTransactions),
      disabledTransactions:
          data.get(#disabledTransactions, or: $value.disabledTransactions));

  @override
  TransactionTotalsCopyWith<$R2, TransactionTotals, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TransactionTotalsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
