// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'export_transactions_options.dart';

class ExportTransactionsOptionsMapper
    extends ClassMapperBase<ExportTransactionsOptions> {
  ExportTransactionsOptionsMapper._();

  static ExportTransactionsOptionsMapper? _instance;
  static ExportTransactionsOptionsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ExportTransactionsOptionsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ExportTransactionsOptions';

  static int? _$perPage(ExportTransactionsOptions v) => v.perPage;
  static const Field<ExportTransactionsOptions, int> _f$perPage =
      Field('perPage', _$perPage, opt: true);
  static int? _$page(ExportTransactionsOptions v) => v.page;
  static const Field<ExportTransactionsOptions, int> _f$page =
      Field('page', _$page, opt: true);
  static DateTime? _$from(ExportTransactionsOptions v) => v.from;
  static const Field<ExportTransactionsOptions, DateTime> _f$from =
      Field('from', _$from, opt: true);
  static DateTime? _$to(ExportTransactionsOptions v) => v.to;
  static const Field<ExportTransactionsOptions, DateTime> _f$to =
      Field('to', _$to, opt: true);
  static int? _$customer(ExportTransactionsOptions v) => v.customer;
  static const Field<ExportTransactionsOptions, int> _f$customer =
      Field('customer', _$customer, opt: true);
  static String? _$status(ExportTransactionsOptions v) => v.status;
  static const Field<ExportTransactionsOptions, String> _f$status =
      Field('status', _$status, opt: true);
  static String? _$currency(ExportTransactionsOptions v) => v.currency;
  static const Field<ExportTransactionsOptions, String> _f$currency =
      Field('currency', _$currency, opt: true);
  static int? _$amount(ExportTransactionsOptions v) => v.amount;
  static const Field<ExportTransactionsOptions, int> _f$amount =
      Field('amount', _$amount, opt: true);
  static bool? _$settled(ExportTransactionsOptions v) => v.settled;
  static const Field<ExportTransactionsOptions, bool> _f$settled =
      Field('settled', _$settled, opt: true);
  static int? _$settlement(ExportTransactionsOptions v) => v.settlement;
  static const Field<ExportTransactionsOptions, int> _f$settlement =
      Field('settlement', _$settlement, opt: true);
  static int? _$paymentPage(ExportTransactionsOptions v) => v.paymentPage;
  static const Field<ExportTransactionsOptions, int> _f$paymentPage =
      Field('paymentPage', _$paymentPage, opt: true);

  @override
  final MappableFields<ExportTransactionsOptions> fields = const {
    #perPage: _f$perPage,
    #page: _f$page,
    #from: _f$from,
    #to: _f$to,
    #customer: _f$customer,
    #status: _f$status,
    #currency: _f$currency,
    #amount: _f$amount,
    #settled: _f$settled,
    #settlement: _f$settlement,
    #paymentPage: _f$paymentPage,
  };

  static ExportTransactionsOptions _instantiate(DecodingData data) {
    return ExportTransactionsOptions(
        perPage: data.dec(_f$perPage),
        page: data.dec(_f$page),
        from: data.dec(_f$from),
        to: data.dec(_f$to),
        customer: data.dec(_f$customer),
        status: data.dec(_f$status),
        currency: data.dec(_f$currency),
        amount: data.dec(_f$amount),
        settled: data.dec(_f$settled),
        settlement: data.dec(_f$settlement),
        paymentPage: data.dec(_f$paymentPage));
  }

  @override
  final Function instantiate = _instantiate;

  static ExportTransactionsOptions fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ExportTransactionsOptions>(map);
  }

  static ExportTransactionsOptions fromJson(String json) {
    return ensureInitialized().decodeJson<ExportTransactionsOptions>(json);
  }
}

mixin ExportTransactionsOptionsMappable {
  String toJson() {
    return ExportTransactionsOptionsMapper.ensureInitialized()
        .encodeJson<ExportTransactionsOptions>(
            this as ExportTransactionsOptions);
  }

  Map<String, dynamic> toMap() {
    return ExportTransactionsOptionsMapper.ensureInitialized()
        .encodeMap<ExportTransactionsOptions>(
            this as ExportTransactionsOptions);
  }

  ExportTransactionsOptionsCopyWith<ExportTransactionsOptions,
          ExportTransactionsOptions, ExportTransactionsOptions>
      get copyWith => _ExportTransactionsOptionsCopyWithImpl<
              ExportTransactionsOptions, ExportTransactionsOptions>(
          this as ExportTransactionsOptions, $identity, $identity);
  @override
  String toString() {
    return ExportTransactionsOptionsMapper.ensureInitialized()
        .stringifyValue(this as ExportTransactionsOptions);
  }

  @override
  bool operator ==(Object other) {
    return ExportTransactionsOptionsMapper.ensureInitialized()
        .equalsValue(this as ExportTransactionsOptions, other);
  }

  @override
  int get hashCode {
    return ExportTransactionsOptionsMapper.ensureInitialized()
        .hashValue(this as ExportTransactionsOptions);
  }
}

extension ExportTransactionsOptionsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ExportTransactionsOptions, $Out> {
  ExportTransactionsOptionsCopyWith<$R, ExportTransactionsOptions, $Out>
      get $asExportTransactionsOptions => $base.as((v, t, t2) =>
          _ExportTransactionsOptionsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ExportTransactionsOptionsCopyWith<
    $R,
    $In extends ExportTransactionsOptions,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? perPage,
      int? page,
      DateTime? from,
      DateTime? to,
      int? customer,
      String? status,
      String? currency,
      int? amount,
      bool? settled,
      int? settlement,
      int? paymentPage});
  ExportTransactionsOptionsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ExportTransactionsOptionsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ExportTransactionsOptions, $Out>
    implements
        ExportTransactionsOptionsCopyWith<$R, ExportTransactionsOptions, $Out> {
  _ExportTransactionsOptionsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ExportTransactionsOptions> $mapper =
      ExportTransactionsOptionsMapper.ensureInitialized();
  @override
  $R call(
          {Object? perPage = $none,
          Object? page = $none,
          Object? from = $none,
          Object? to = $none,
          Object? customer = $none,
          Object? status = $none,
          Object? currency = $none,
          Object? amount = $none,
          Object? settled = $none,
          Object? settlement = $none,
          Object? paymentPage = $none}) =>
      $apply(FieldCopyWithData({
        if (perPage != $none) #perPage: perPage,
        if (page != $none) #page: page,
        if (from != $none) #from: from,
        if (to != $none) #to: to,
        if (customer != $none) #customer: customer,
        if (status != $none) #status: status,
        if (currency != $none) #currency: currency,
        if (amount != $none) #amount: amount,
        if (settled != $none) #settled: settled,
        if (settlement != $none) #settlement: settlement,
        if (paymentPage != $none) #paymentPage: paymentPage
      }));
  @override
  ExportTransactionsOptions $make(CopyWithData data) =>
      ExportTransactionsOptions(
          perPage: data.get(#perPage, or: $value.perPage),
          page: data.get(#page, or: $value.page),
          from: data.get(#from, or: $value.from),
          to: data.get(#to, or: $value.to),
          customer: data.get(#customer, or: $value.customer),
          status: data.get(#status, or: $value.status),
          currency: data.get(#currency, or: $value.currency),
          amount: data.get(#amount, or: $value.amount),
          settled: data.get(#settled, or: $value.settled),
          settlement: data.get(#settlement, or: $value.settlement),
          paymentPage: data.get(#paymentPage, or: $value.paymentPage));

  @override
  ExportTransactionsOptionsCopyWith<$R2, ExportTransactionsOptions, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ExportTransactionsOptionsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
