// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'transaction_totals_options.dart';

class TransactionTotalsOptionsMapper
    extends ClassMapperBase<TransactionTotalsOptions> {
  TransactionTotalsOptionsMapper._();

  static TransactionTotalsOptionsMapper? _instance;
  static TransactionTotalsOptionsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = TransactionTotalsOptionsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'TransactionTotalsOptions';

  static int? _$perPage(TransactionTotalsOptions v) => v.perPage;
  static const Field<TransactionTotalsOptions, int> _f$perPage =
      Field('perPage', _$perPage, opt: true);
  static int? _$page(TransactionTotalsOptions v) => v.page;
  static const Field<TransactionTotalsOptions, int> _f$page =
      Field('page', _$page, opt: true);
  static DateTime? _$from(TransactionTotalsOptions v) => v.from;
  static const Field<TransactionTotalsOptions, DateTime> _f$from =
      Field('from', _$from, opt: true);
  static DateTime? _$to(TransactionTotalsOptions v) => v.to;
  static const Field<TransactionTotalsOptions, DateTime> _f$to =
      Field('to', _$to, opt: true);

  @override
  final MappableFields<TransactionTotalsOptions> fields = const {
    #perPage: _f$perPage,
    #page: _f$page,
    #from: _f$from,
    #to: _f$to,
  };

  static TransactionTotalsOptions _instantiate(DecodingData data) {
    return TransactionTotalsOptions(
        perPage: data.dec(_f$perPage),
        page: data.dec(_f$page),
        from: data.dec(_f$from),
        to: data.dec(_f$to));
  }

  @override
  final Function instantiate = _instantiate;

  static TransactionTotalsOptions fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TransactionTotalsOptions>(map);
  }

  static TransactionTotalsOptions fromJson(String json) {
    return ensureInitialized().decodeJson<TransactionTotalsOptions>(json);
  }
}

mixin TransactionTotalsOptionsMappable {
  String toJson() {
    return TransactionTotalsOptionsMapper.ensureInitialized()
        .encodeJson<TransactionTotalsOptions>(this as TransactionTotalsOptions);
  }

  Map<String, dynamic> toMap() {
    return TransactionTotalsOptionsMapper.ensureInitialized()
        .encodeMap<TransactionTotalsOptions>(this as TransactionTotalsOptions);
  }

  TransactionTotalsOptionsCopyWith<TransactionTotalsOptions,
          TransactionTotalsOptions, TransactionTotalsOptions>
      get copyWith => _TransactionTotalsOptionsCopyWithImpl<
              TransactionTotalsOptions, TransactionTotalsOptions>(
          this as TransactionTotalsOptions, $identity, $identity);
  @override
  String toString() {
    return TransactionTotalsOptionsMapper.ensureInitialized()
        .stringifyValue(this as TransactionTotalsOptions);
  }

  @override
  bool operator ==(Object other) {
    return TransactionTotalsOptionsMapper.ensureInitialized()
        .equalsValue(this as TransactionTotalsOptions, other);
  }

  @override
  int get hashCode {
    return TransactionTotalsOptionsMapper.ensureInitialized()
        .hashValue(this as TransactionTotalsOptions);
  }
}

extension TransactionTotalsOptionsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TransactionTotalsOptions, $Out> {
  TransactionTotalsOptionsCopyWith<$R, TransactionTotalsOptions, $Out>
      get $asTransactionTotalsOptions => $base.as((v, t, t2) =>
          _TransactionTotalsOptionsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TransactionTotalsOptionsCopyWith<
    $R,
    $In extends TransactionTotalsOptions,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? perPage, int? page, DateTime? from, DateTime? to});
  TransactionTotalsOptionsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TransactionTotalsOptionsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TransactionTotalsOptions, $Out>
    implements
        TransactionTotalsOptionsCopyWith<$R, TransactionTotalsOptions, $Out> {
  _TransactionTotalsOptionsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TransactionTotalsOptions> $mapper =
      TransactionTotalsOptionsMapper.ensureInitialized();
  @override
  $R call(
          {Object? perPage = $none,
          Object? page = $none,
          Object? from = $none,
          Object? to = $none}) =>
      $apply(FieldCopyWithData({
        if (perPage != $none) #perPage: perPage,
        if (page != $none) #page: page,
        if (from != $none) #from: from,
        if (to != $none) #to: to
      }));
  @override
  TransactionTotalsOptions $make(CopyWithData data) => TransactionTotalsOptions(
      perPage: data.get(#perPage, or: $value.perPage),
      page: data.get(#page, or: $value.page),
      from: data.get(#from, or: $value.from),
      to: data.get(#to, or: $value.to));

  @override
  TransactionTotalsOptionsCopyWith<$R2, TransactionTotalsOptions, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _TransactionTotalsOptionsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
