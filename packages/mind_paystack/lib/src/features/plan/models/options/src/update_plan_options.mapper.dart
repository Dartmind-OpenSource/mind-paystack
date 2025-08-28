// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'update_plan_options.dart';

class UpdatePlanOptionsMapper extends ClassMapperBase<UpdatePlanOptions> {
  UpdatePlanOptionsMapper._();

  static UpdatePlanOptionsMapper? _instance;
  static UpdatePlanOptionsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UpdatePlanOptionsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UpdatePlanOptions';

  static String? _$name(UpdatePlanOptions v) => v.name;
  static const Field<UpdatePlanOptions, String> _f$name =
      Field('name', _$name, opt: true);
  static int? _$amount(UpdatePlanOptions v) => v.amount;
  static const Field<UpdatePlanOptions, int> _f$amount =
      Field('amount', _$amount, opt: true);
  static String? _$description(UpdatePlanOptions v) => v.description;
  static const Field<UpdatePlanOptions, String> _f$description =
      Field('description', _$description, opt: true);
  static String? _$currency(UpdatePlanOptions v) => v.currency;
  static const Field<UpdatePlanOptions, String> _f$currency =
      Field('currency', _$currency, opt: true);
  static int? _$invoiceLimit(UpdatePlanOptions v) => v.invoiceLimit;
  static const Field<UpdatePlanOptions, int> _f$invoiceLimit =
      Field('invoiceLimit', _$invoiceLimit, key: r'invoice_limit', opt: true);
  static bool? _$sendInvoices(UpdatePlanOptions v) => v.sendInvoices;
  static const Field<UpdatePlanOptions, bool> _f$sendInvoices =
      Field('sendInvoices', _$sendInvoices, key: r'send_invoices', opt: true);
  static bool? _$sendSms(UpdatePlanOptions v) => v.sendSms;
  static const Field<UpdatePlanOptions, bool> _f$sendSms =
      Field('sendSms', _$sendSms, key: r'send_sms', opt: true);

  @override
  final MappableFields<UpdatePlanOptions> fields = const {
    #name: _f$name,
    #amount: _f$amount,
    #description: _f$description,
    #currency: _f$currency,
    #invoiceLimit: _f$invoiceLimit,
    #sendInvoices: _f$sendInvoices,
    #sendSms: _f$sendSms,
  };

  static UpdatePlanOptions _instantiate(DecodingData data) {
    return UpdatePlanOptions(
        name: data.dec(_f$name),
        amount: data.dec(_f$amount),
        description: data.dec(_f$description),
        currency: data.dec(_f$currency),
        invoiceLimit: data.dec(_f$invoiceLimit),
        sendInvoices: data.dec(_f$sendInvoices),
        sendSms: data.dec(_f$sendSms));
  }

  @override
  final Function instantiate = _instantiate;

  static UpdatePlanOptions fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UpdatePlanOptions>(map);
  }

  static UpdatePlanOptions fromJson(String json) {
    return ensureInitialized().decodeJson<UpdatePlanOptions>(json);
  }
}

mixin UpdatePlanOptionsMappable {
  String toJson() {
    return UpdatePlanOptionsMapper.ensureInitialized()
        .encodeJson<UpdatePlanOptions>(this as UpdatePlanOptions);
  }

  Map<String, dynamic> toMap() {
    return UpdatePlanOptionsMapper.ensureInitialized()
        .encodeMap<UpdatePlanOptions>(this as UpdatePlanOptions);
  }

  UpdatePlanOptionsCopyWith<UpdatePlanOptions, UpdatePlanOptions,
          UpdatePlanOptions>
      get copyWith =>
          _UpdatePlanOptionsCopyWithImpl<UpdatePlanOptions, UpdatePlanOptions>(
              this as UpdatePlanOptions, $identity, $identity);
  @override
  String toString() {
    return UpdatePlanOptionsMapper.ensureInitialized()
        .stringifyValue(this as UpdatePlanOptions);
  }

  @override
  bool operator ==(Object other) {
    return UpdatePlanOptionsMapper.ensureInitialized()
        .equalsValue(this as UpdatePlanOptions, other);
  }

  @override
  int get hashCode {
    return UpdatePlanOptionsMapper.ensureInitialized()
        .hashValue(this as UpdatePlanOptions);
  }
}

extension UpdatePlanOptionsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UpdatePlanOptions, $Out> {
  UpdatePlanOptionsCopyWith<$R, UpdatePlanOptions, $Out>
      get $asUpdatePlanOptions => $base
          .as((v, t, t2) => _UpdatePlanOptionsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UpdatePlanOptionsCopyWith<$R, $In extends UpdatePlanOptions,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? name,
      int? amount,
      String? description,
      String? currency,
      int? invoiceLimit,
      bool? sendInvoices,
      bool? sendSms});
  UpdatePlanOptionsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UpdatePlanOptionsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UpdatePlanOptions, $Out>
    implements UpdatePlanOptionsCopyWith<$R, UpdatePlanOptions, $Out> {
  _UpdatePlanOptionsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UpdatePlanOptions> $mapper =
      UpdatePlanOptionsMapper.ensureInitialized();
  @override
  $R call(
          {Object? name = $none,
          Object? amount = $none,
          Object? description = $none,
          Object? currency = $none,
          Object? invoiceLimit = $none,
          Object? sendInvoices = $none,
          Object? sendSms = $none}) =>
      $apply(FieldCopyWithData({
        if (name != $none) #name: name,
        if (amount != $none) #amount: amount,
        if (description != $none) #description: description,
        if (currency != $none) #currency: currency,
        if (invoiceLimit != $none) #invoiceLimit: invoiceLimit,
        if (sendInvoices != $none) #sendInvoices: sendInvoices,
        if (sendSms != $none) #sendSms: sendSms
      }));
  @override
  UpdatePlanOptions $make(CopyWithData data) => UpdatePlanOptions(
      name: data.get(#name, or: $value.name),
      amount: data.get(#amount, or: $value.amount),
      description: data.get(#description, or: $value.description),
      currency: data.get(#currency, or: $value.currency),
      invoiceLimit: data.get(#invoiceLimit, or: $value.invoiceLimit),
      sendInvoices: data.get(#sendInvoices, or: $value.sendInvoices),
      sendSms: data.get(#sendSms, or: $value.sendSms));

  @override
  UpdatePlanOptionsCopyWith<$R2, UpdatePlanOptions, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UpdatePlanOptionsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
