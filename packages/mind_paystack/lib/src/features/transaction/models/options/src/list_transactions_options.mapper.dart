// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'list_transactions_options.dart';

class ListTransactionsOptionsMapper
    extends ClassMapperBase<ListTransactionsOptions> {
  ListTransactionsOptionsMapper._();

  static ListTransactionsOptionsMapper? _instance;
  static ListTransactionsOptionsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ListTransactionsOptionsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ListTransactionsOptions';

  static int? _$perPage(ListTransactionsOptions v) => v.perPage;
  static const Field<ListTransactionsOptions, int> _f$perPage =
      Field('perPage', _$perPage, opt: true);
  static int? _$page(ListTransactionsOptions v) => v.page;
  static const Field<ListTransactionsOptions, int> _f$page =
      Field('page', _$page, opt: true);
  static int? _$customer(ListTransactionsOptions v) => v.customer;
  static const Field<ListTransactionsOptions, int> _f$customer =
      Field('customer', _$customer, opt: true);
  static String? _$terminalId(ListTransactionsOptions v) => v.terminalId;
  static const Field<ListTransactionsOptions, String> _f$terminalId =
      Field('terminalId', _$terminalId, opt: true);
  static String? _$status(ListTransactionsOptions v) => v.status;
  static const Field<ListTransactionsOptions, String> _f$status =
      Field('status', _$status, opt: true);
  static DateTime? _$from(ListTransactionsOptions v) => v.from;
  static const Field<ListTransactionsOptions, DateTime> _f$from =
      Field('from', _$from, opt: true);
  static DateTime? _$to(ListTransactionsOptions v) => v.to;
  static const Field<ListTransactionsOptions, DateTime> _f$to =
      Field('to', _$to, opt: true);
  static int? _$amount(ListTransactionsOptions v) => v.amount;
  static const Field<ListTransactionsOptions, int> _f$amount =
      Field('amount', _$amount, opt: true);

  @override
  final MappableFields<ListTransactionsOptions> fields = const {
    #perPage: _f$perPage,
    #page: _f$page,
    #customer: _f$customer,
    #terminalId: _f$terminalId,
    #status: _f$status,
    #from: _f$from,
    #to: _f$to,
    #amount: _f$amount,
  };

  static ListTransactionsOptions _instantiate(DecodingData data) {
    return ListTransactionsOptions(
        perPage: data.dec(_f$perPage),
        page: data.dec(_f$page),
        customer: data.dec(_f$customer),
        terminalId: data.dec(_f$terminalId),
        status: data.dec(_f$status),
        from: data.dec(_f$from),
        to: data.dec(_f$to),
        amount: data.dec(_f$amount));
  }

  @override
  final Function instantiate = _instantiate;

  static ListTransactionsOptions fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ListTransactionsOptions>(map);
  }

  static ListTransactionsOptions fromJson(String json) {
    return ensureInitialized().decodeJson<ListTransactionsOptions>(json);
  }
}

mixin ListTransactionsOptionsMappable {
  String toJson() {
    return ListTransactionsOptionsMapper.ensureInitialized()
        .encodeJson<ListTransactionsOptions>(this as ListTransactionsOptions);
  }

  Map<String, dynamic> toMap() {
    return ListTransactionsOptionsMapper.ensureInitialized()
        .encodeMap<ListTransactionsOptions>(this as ListTransactionsOptions);
  }

  ListTransactionsOptionsCopyWith<ListTransactionsOptions,
          ListTransactionsOptions, ListTransactionsOptions>
      get copyWith => _ListTransactionsOptionsCopyWithImpl<
              ListTransactionsOptions, ListTransactionsOptions>(
          this as ListTransactionsOptions, $identity, $identity);
  @override
  String toString() {
    return ListTransactionsOptionsMapper.ensureInitialized()
        .stringifyValue(this as ListTransactionsOptions);
  }

  @override
  bool operator ==(Object other) {
    return ListTransactionsOptionsMapper.ensureInitialized()
        .equalsValue(this as ListTransactionsOptions, other);
  }

  @override
  int get hashCode {
    return ListTransactionsOptionsMapper.ensureInitialized()
        .hashValue(this as ListTransactionsOptions);
  }
}

extension ListTransactionsOptionsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ListTransactionsOptions, $Out> {
  ListTransactionsOptionsCopyWith<$R, ListTransactionsOptions, $Out>
      get $asListTransactionsOptions => $base.as((v, t, t2) =>
          _ListTransactionsOptionsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ListTransactionsOptionsCopyWith<
    $R,
    $In extends ListTransactionsOptions,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? perPage,
      int? page,
      int? customer,
      String? terminalId,
      String? status,
      DateTime? from,
      DateTime? to,
      int? amount});
  ListTransactionsOptionsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ListTransactionsOptionsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ListTransactionsOptions, $Out>
    implements
        ListTransactionsOptionsCopyWith<$R, ListTransactionsOptions, $Out> {
  _ListTransactionsOptionsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ListTransactionsOptions> $mapper =
      ListTransactionsOptionsMapper.ensureInitialized();
  @override
  $R call(
          {Object? perPage = $none,
          Object? page = $none,
          Object? customer = $none,
          Object? terminalId = $none,
          Object? status = $none,
          Object? from = $none,
          Object? to = $none,
          Object? amount = $none}) =>
      $apply(FieldCopyWithData({
        if (perPage != $none) #perPage: perPage,
        if (page != $none) #page: page,
        if (customer != $none) #customer: customer,
        if (terminalId != $none) #terminalId: terminalId,
        if (status != $none) #status: status,
        if (from != $none) #from: from,
        if (to != $none) #to: to,
        if (amount != $none) #amount: amount
      }));
  @override
  ListTransactionsOptions $make(CopyWithData data) => ListTransactionsOptions(
      perPage: data.get(#perPage, or: $value.perPage),
      page: data.get(#page, or: $value.page),
      customer: data.get(#customer, or: $value.customer),
      terminalId: data.get(#terminalId, or: $value.terminalId),
      status: data.get(#status, or: $value.status),
      from: data.get(#from, or: $value.from),
      to: data.get(#to, or: $value.to),
      amount: data.get(#amount, or: $value.amount));

  @override
  ListTransactionsOptionsCopyWith<$R2, ListTransactionsOptions, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ListTransactionsOptionsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
