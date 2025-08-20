// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'partial_debit.dart';

class PartialDebitMapper extends ClassMapperBase<PartialDebit> {
  PartialDebitMapper._();

  static PartialDebitMapper? _instance;
  static PartialDebitMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PartialDebitMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'PartialDebit';

  static String _$reference(PartialDebit v) => v.reference;
  static const Field<PartialDebit, String> _f$reference =
      Field('reference', _$reference);
  static String _$status(PartialDebit v) => v.status;
  static const Field<PartialDebit, String> _f$status =
      Field('status', _$status);
  static int _$amount(PartialDebit v) => v.amount;
  static const Field<PartialDebit, int> _f$amount = Field('amount', _$amount);
  static String _$currency(PartialDebit v) => v.currency;
  static const Field<PartialDebit, String> _f$currency =
      Field('currency', _$currency);

  @override
  final MappableFields<PartialDebit> fields = const {
    #reference: _f$reference,
    #status: _f$status,
    #amount: _f$amount,
    #currency: _f$currency,
  };

  static PartialDebit _instantiate(DecodingData data) {
    return PartialDebit(
        reference: data.dec(_f$reference),
        status: data.dec(_f$status),
        amount: data.dec(_f$amount),
        currency: data.dec(_f$currency));
  }

  @override
  final Function instantiate = _instantiate;

  static PartialDebit fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PartialDebit>(map);
  }

  static PartialDebit fromJson(String json) {
    return ensureInitialized().decodeJson<PartialDebit>(json);
  }
}

mixin PartialDebitMappable {
  String toJson() {
    return PartialDebitMapper.ensureInitialized()
        .encodeJson<PartialDebit>(this as PartialDebit);
  }

  Map<String, dynamic> toMap() {
    return PartialDebitMapper.ensureInitialized()
        .encodeMap<PartialDebit>(this as PartialDebit);
  }

  PartialDebitCopyWith<PartialDebit, PartialDebit, PartialDebit> get copyWith =>
      _PartialDebitCopyWithImpl<PartialDebit, PartialDebit>(
          this as PartialDebit, $identity, $identity);
  @override
  String toString() {
    return PartialDebitMapper.ensureInitialized()
        .stringifyValue(this as PartialDebit);
  }

  @override
  bool operator ==(Object other) {
    return PartialDebitMapper.ensureInitialized()
        .equalsValue(this as PartialDebit, other);
  }

  @override
  int get hashCode {
    return PartialDebitMapper.ensureInitialized()
        .hashValue(this as PartialDebit);
  }
}

extension PartialDebitValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PartialDebit, $Out> {
  PartialDebitCopyWith<$R, PartialDebit, $Out> get $asPartialDebit =>
      $base.as((v, t, t2) => _PartialDebitCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class PartialDebitCopyWith<$R, $In extends PartialDebit, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? reference, String? status, int? amount, String? currency});
  PartialDebitCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PartialDebitCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PartialDebit, $Out>
    implements PartialDebitCopyWith<$R, PartialDebit, $Out> {
  _PartialDebitCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PartialDebit> $mapper =
      PartialDebitMapper.ensureInitialized();
  @override
  $R call({String? reference, String? status, int? amount, String? currency}) =>
      $apply(FieldCopyWithData({
        if (reference != null) #reference: reference,
        if (status != null) #status: status,
        if (amount != null) #amount: amount,
        if (currency != null) #currency: currency
      }));
  @override
  PartialDebit $make(CopyWithData data) => PartialDebit(
      reference: data.get(#reference, or: $value.reference),
      status: data.get(#status, or: $value.status),
      amount: data.get(#amount, or: $value.amount),
      currency: data.get(#currency, or: $value.currency));

  @override
  PartialDebitCopyWith<$R2, PartialDebit, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PartialDebitCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
