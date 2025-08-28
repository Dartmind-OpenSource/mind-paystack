// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'list_plans_options.dart';

class ListPlansOptionsMapper extends ClassMapperBase<ListPlansOptions> {
  ListPlansOptionsMapper._();

  static ListPlansOptionsMapper? _instance;
  static ListPlansOptionsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ListPlansOptionsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ListPlansOptions';

  static int? _$perPage(ListPlansOptions v) => v.perPage;
  static const Field<ListPlansOptions, int> _f$perPage =
      Field('perPage', _$perPage, key: r'per_page', opt: true);
  static int? _$page(ListPlansOptions v) => v.page;
  static const Field<ListPlansOptions, int> _f$page =
      Field('page', _$page, opt: true);
  static String? _$status(ListPlansOptions v) => v.status;
  static const Field<ListPlansOptions, String> _f$status =
      Field('status', _$status, opt: true);
  static String? _$interval(ListPlansOptions v) => v.interval;
  static const Field<ListPlansOptions, String> _f$interval =
      Field('interval', _$interval, opt: true);
  static int? _$amount(ListPlansOptions v) => v.amount;
  static const Field<ListPlansOptions, int> _f$amount =
      Field('amount', _$amount, opt: true);
  static String? _$currency(ListPlansOptions v) => v.currency;
  static const Field<ListPlansOptions, String> _f$currency =
      Field('currency', _$currency, opt: true);

  @override
  final MappableFields<ListPlansOptions> fields = const {
    #perPage: _f$perPage,
    #page: _f$page,
    #status: _f$status,
    #interval: _f$interval,
    #amount: _f$amount,
    #currency: _f$currency,
  };

  static ListPlansOptions _instantiate(DecodingData data) {
    return ListPlansOptions(
        perPage: data.dec(_f$perPage),
        page: data.dec(_f$page),
        status: data.dec(_f$status),
        interval: data.dec(_f$interval),
        amount: data.dec(_f$amount),
        currency: data.dec(_f$currency));
  }

  @override
  final Function instantiate = _instantiate;

  static ListPlansOptions fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ListPlansOptions>(map);
  }

  static ListPlansOptions fromJson(String json) {
    return ensureInitialized().decodeJson<ListPlansOptions>(json);
  }
}

mixin ListPlansOptionsMappable {
  String toJson() {
    return ListPlansOptionsMapper.ensureInitialized()
        .encodeJson<ListPlansOptions>(this as ListPlansOptions);
  }

  Map<String, dynamic> toMap() {
    return ListPlansOptionsMapper.ensureInitialized()
        .encodeMap<ListPlansOptions>(this as ListPlansOptions);
  }

  ListPlansOptionsCopyWith<ListPlansOptions, ListPlansOptions, ListPlansOptions>
      get copyWith =>
          _ListPlansOptionsCopyWithImpl<ListPlansOptions, ListPlansOptions>(
              this as ListPlansOptions, $identity, $identity);
  @override
  String toString() {
    return ListPlansOptionsMapper.ensureInitialized()
        .stringifyValue(this as ListPlansOptions);
  }

  @override
  bool operator ==(Object other) {
    return ListPlansOptionsMapper.ensureInitialized()
        .equalsValue(this as ListPlansOptions, other);
  }

  @override
  int get hashCode {
    return ListPlansOptionsMapper.ensureInitialized()
        .hashValue(this as ListPlansOptions);
  }
}

extension ListPlansOptionsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ListPlansOptions, $Out> {
  ListPlansOptionsCopyWith<$R, ListPlansOptions, $Out>
      get $asListPlansOptions => $base
          .as((v, t, t2) => _ListPlansOptionsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ListPlansOptionsCopyWith<$R, $In extends ListPlansOptions, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? perPage,
      int? page,
      String? status,
      String? interval,
      int? amount,
      String? currency});
  ListPlansOptionsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ListPlansOptionsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ListPlansOptions, $Out>
    implements ListPlansOptionsCopyWith<$R, ListPlansOptions, $Out> {
  _ListPlansOptionsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ListPlansOptions> $mapper =
      ListPlansOptionsMapper.ensureInitialized();
  @override
  $R call(
          {Object? perPage = $none,
          Object? page = $none,
          Object? status = $none,
          Object? interval = $none,
          Object? amount = $none,
          Object? currency = $none}) =>
      $apply(FieldCopyWithData({
        if (perPage != $none) #perPage: perPage,
        if (page != $none) #page: page,
        if (status != $none) #status: status,
        if (interval != $none) #interval: interval,
        if (amount != $none) #amount: amount,
        if (currency != $none) #currency: currency
      }));
  @override
  ListPlansOptions $make(CopyWithData data) => ListPlansOptions(
      perPage: data.get(#perPage, or: $value.perPage),
      page: data.get(#page, or: $value.page),
      status: data.get(#status, or: $value.status),
      interval: data.get(#interval, or: $value.interval),
      amount: data.get(#amount, or: $value.amount),
      currency: data.get(#currency, or: $value.currency));

  @override
  ListPlansOptionsCopyWith<$R2, ListPlansOptions, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ListPlansOptionsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
