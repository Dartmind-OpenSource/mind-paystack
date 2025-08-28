// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'create_plan_options.dart';

class CreatePlanOptionsMapper extends ClassMapperBase<CreatePlanOptions> {
  CreatePlanOptionsMapper._();

  static CreatePlanOptionsMapper? _instance;
  static CreatePlanOptionsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CreatePlanOptionsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CreatePlanOptions';

  static String _$name(CreatePlanOptions v) => v.name;
  static const Field<CreatePlanOptions, String> _f$name = Field('name', _$name);
  static int _$amount(CreatePlanOptions v) => v.amount;
  static const Field<CreatePlanOptions, int> _f$amount =
      Field('amount', _$amount);
  static String _$interval(CreatePlanOptions v) => v.interval;
  static const Field<CreatePlanOptions, String> _f$interval =
      Field('interval', _$interval);
  static String? _$description(CreatePlanOptions v) => v.description;
  static const Field<CreatePlanOptions, String> _f$description =
      Field('description', _$description, opt: true);
  static String? _$currency(CreatePlanOptions v) => v.currency;
  static const Field<CreatePlanOptions, String> _f$currency =
      Field('currency', _$currency, opt: true);
  static int? _$invoiceLimit(CreatePlanOptions v) => v.invoiceLimit;
  static const Field<CreatePlanOptions, int> _f$invoiceLimit =
      Field('invoiceLimit', _$invoiceLimit, key: r'invoice_limit', opt: true);
  static bool? _$sendInvoices(CreatePlanOptions v) => v.sendInvoices;
  static const Field<CreatePlanOptions, bool> _f$sendInvoices =
      Field('sendInvoices', _$sendInvoices, key: r'send_invoices', opt: true);
  static bool? _$sendSms(CreatePlanOptions v) => v.sendSms;
  static const Field<CreatePlanOptions, bool> _f$sendSms =
      Field('sendSms', _$sendSms, key: r'send_sms', opt: true);

  @override
  final MappableFields<CreatePlanOptions> fields = const {
    #name: _f$name,
    #amount: _f$amount,
    #interval: _f$interval,
    #description: _f$description,
    #currency: _f$currency,
    #invoiceLimit: _f$invoiceLimit,
    #sendInvoices: _f$sendInvoices,
    #sendSms: _f$sendSms,
  };

  static CreatePlanOptions _instantiate(DecodingData data) {
    return CreatePlanOptions(
        name: data.dec(_f$name),
        amount: data.dec(_f$amount),
        interval: data.dec(_f$interval),
        description: data.dec(_f$description),
        currency: data.dec(_f$currency),
        invoiceLimit: data.dec(_f$invoiceLimit),
        sendInvoices: data.dec(_f$sendInvoices),
        sendSms: data.dec(_f$sendSms));
  }

  @override
  final Function instantiate = _instantiate;

  static CreatePlanOptions fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CreatePlanOptions>(map);
  }

  static CreatePlanOptions fromJson(String json) {
    return ensureInitialized().decodeJson<CreatePlanOptions>(json);
  }
}

mixin CreatePlanOptionsMappable {
  String toJson() {
    return CreatePlanOptionsMapper.ensureInitialized()
        .encodeJson<CreatePlanOptions>(this as CreatePlanOptions);
  }

  Map<String, dynamic> toMap() {
    return CreatePlanOptionsMapper.ensureInitialized()
        .encodeMap<CreatePlanOptions>(this as CreatePlanOptions);
  }

  CreatePlanOptionsCopyWith<CreatePlanOptions, CreatePlanOptions,
          CreatePlanOptions>
      get copyWith =>
          _CreatePlanOptionsCopyWithImpl<CreatePlanOptions, CreatePlanOptions>(
              this as CreatePlanOptions, $identity, $identity);
  @override
  String toString() {
    return CreatePlanOptionsMapper.ensureInitialized()
        .stringifyValue(this as CreatePlanOptions);
  }

  @override
  bool operator ==(Object other) {
    return CreatePlanOptionsMapper.ensureInitialized()
        .equalsValue(this as CreatePlanOptions, other);
  }

  @override
  int get hashCode {
    return CreatePlanOptionsMapper.ensureInitialized()
        .hashValue(this as CreatePlanOptions);
  }
}

extension CreatePlanOptionsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CreatePlanOptions, $Out> {
  CreatePlanOptionsCopyWith<$R, CreatePlanOptions, $Out>
      get $asCreatePlanOptions => $base
          .as((v, t, t2) => _CreatePlanOptionsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CreatePlanOptionsCopyWith<$R, $In extends CreatePlanOptions,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? name,
      int? amount,
      String? interval,
      String? description,
      String? currency,
      int? invoiceLimit,
      bool? sendInvoices,
      bool? sendSms});
  CreatePlanOptionsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _CreatePlanOptionsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CreatePlanOptions, $Out>
    implements CreatePlanOptionsCopyWith<$R, CreatePlanOptions, $Out> {
  _CreatePlanOptionsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CreatePlanOptions> $mapper =
      CreatePlanOptionsMapper.ensureInitialized();
  @override
  $R call(
          {String? name,
          int? amount,
          String? interval,
          Object? description = $none,
          Object? currency = $none,
          Object? invoiceLimit = $none,
          Object? sendInvoices = $none,
          Object? sendSms = $none}) =>
      $apply(FieldCopyWithData({
        if (name != null) #name: name,
        if (amount != null) #amount: amount,
        if (interval != null) #interval: interval,
        if (description != $none) #description: description,
        if (currency != $none) #currency: currency,
        if (invoiceLimit != $none) #invoiceLimit: invoiceLimit,
        if (sendInvoices != $none) #sendInvoices: sendInvoices,
        if (sendSms != $none) #sendSms: sendSms
      }));
  @override
  CreatePlanOptions $make(CopyWithData data) => CreatePlanOptions(
      name: data.get(#name, or: $value.name),
      amount: data.get(#amount, or: $value.amount),
      interval: data.get(#interval, or: $value.interval),
      description: data.get(#description, or: $value.description),
      currency: data.get(#currency, or: $value.currency),
      invoiceLimit: data.get(#invoiceLimit, or: $value.invoiceLimit),
      sendInvoices: data.get(#sendInvoices, or: $value.sendInvoices),
      sendSms: data.get(#sendSms, or: $value.sendSms));

  @override
  CreatePlanOptionsCopyWith<$R2, CreatePlanOptions, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CreatePlanOptionsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
