// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'transaction_list.dart';

class TransactionListMapper extends ClassMapperBase<TransactionList> {
  TransactionListMapper._();

  static TransactionListMapper? _instance;
  static TransactionListMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TransactionListMapper._());
      TransactionMapper.ensureInitialized();
      PaginationMetaMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TransactionList';

  static List<Transaction> _$data(TransactionList v) => v.data;
  static const Field<TransactionList, List<Transaction>> _f$data =
      Field('data', _$data);
  static PaginationMeta? _$meta(TransactionList v) => v.meta;
  static const Field<TransactionList, PaginationMeta> _f$meta =
      Field('meta', _$meta, opt: true);

  @override
  final MappableFields<TransactionList> fields = const {
    #data: _f$data,
    #meta: _f$meta,
  };

  static TransactionList _instantiate(DecodingData data) {
    return TransactionList(data: data.dec(_f$data), meta: data.dec(_f$meta));
  }

  @override
  final Function instantiate = _instantiate;

  static TransactionList fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TransactionList>(map);
  }

  static TransactionList fromJson(String json) {
    return ensureInitialized().decodeJson<TransactionList>(json);
  }
}

mixin TransactionListMappable {
  String toJson() {
    return TransactionListMapper.ensureInitialized()
        .encodeJson<TransactionList>(this as TransactionList);
  }

  Map<String, dynamic> toMap() {
    return TransactionListMapper.ensureInitialized()
        .encodeMap<TransactionList>(this as TransactionList);
  }

  TransactionListCopyWith<TransactionList, TransactionList, TransactionList>
      get copyWith =>
          _TransactionListCopyWithImpl<TransactionList, TransactionList>(
              this as TransactionList, $identity, $identity);
  @override
  String toString() {
    return TransactionListMapper.ensureInitialized()
        .stringifyValue(this as TransactionList);
  }

  @override
  bool operator ==(Object other) {
    return TransactionListMapper.ensureInitialized()
        .equalsValue(this as TransactionList, other);
  }

  @override
  int get hashCode {
    return TransactionListMapper.ensureInitialized()
        .hashValue(this as TransactionList);
  }
}

extension TransactionListValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TransactionList, $Out> {
  TransactionListCopyWith<$R, TransactionList, $Out> get $asTransactionList =>
      $base.as((v, t, t2) => _TransactionListCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TransactionListCopyWith<$R, $In extends TransactionList, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Transaction,
      TransactionCopyWith<$R, Transaction, Transaction>> get data;
  PaginationMetaCopyWith<$R, PaginationMeta, PaginationMeta>? get meta;
  $R call({List<Transaction>? data, PaginationMeta? meta});
  TransactionListCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TransactionListCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TransactionList, $Out>
    implements TransactionListCopyWith<$R, TransactionList, $Out> {
  _TransactionListCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TransactionList> $mapper =
      TransactionListMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Transaction,
          TransactionCopyWith<$R, Transaction, Transaction>>
      get data => ListCopyWith(
          $value.data, (v, t) => v.copyWith.$chain(t), (v) => call(data: v));
  @override
  PaginationMetaCopyWith<$R, PaginationMeta, PaginationMeta>? get meta =>
      $value.meta?.copyWith.$chain((v) => call(meta: v));
  @override
  $R call({List<Transaction>? data, Object? meta = $none}) =>
      $apply(FieldCopyWithData(
          {if (data != null) #data: data, if (meta != $none) #meta: meta}));
  @override
  TransactionList $make(CopyWithData data) => TransactionList(
      data: data.get(#data, or: $value.data),
      meta: data.get(#meta, or: $value.meta));

  @override
  TransactionListCopyWith<$R2, TransactionList, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TransactionListCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
