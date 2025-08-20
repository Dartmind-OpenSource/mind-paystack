// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'partial_debit_options.dart';

class PartialDebitOptionsMapper extends ClassMapperBase<PartialDebitOptions> {
  PartialDebitOptionsMapper._();

  static PartialDebitOptionsMapper? _instance;
  static PartialDebitOptionsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PartialDebitOptionsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'PartialDebitOptions';

  static String _$authorizationCode(PartialDebitOptions v) =>
      v.authorizationCode;
  static const Field<PartialDebitOptions, String> _f$authorizationCode =
      Field('authorizationCode', _$authorizationCode);
  static String _$currency(PartialDebitOptions v) => v.currency;
  static const Field<PartialDebitOptions, String> _f$currency =
      Field('currency', _$currency);
  static String _$amount(PartialDebitOptions v) => v.amount;
  static const Field<PartialDebitOptions, String> _f$amount =
      Field('amount', _$amount);
  static String _$email(PartialDebitOptions v) => v.email;
  static const Field<PartialDebitOptions, String> _f$email =
      Field('email', _$email);
  static String? _$reference(PartialDebitOptions v) => v.reference;
  static const Field<PartialDebitOptions, String> _f$reference =
      Field('reference', _$reference, opt: true);
  static String? _$atLeast(PartialDebitOptions v) => v.atLeast;
  static const Field<PartialDebitOptions, String> _f$atLeast =
      Field('atLeast', _$atLeast, opt: true);

  @override
  final MappableFields<PartialDebitOptions> fields = const {
    #authorizationCode: _f$authorizationCode,
    #currency: _f$currency,
    #amount: _f$amount,
    #email: _f$email,
    #reference: _f$reference,
    #atLeast: _f$atLeast,
  };

  static PartialDebitOptions _instantiate(DecodingData data) {
    return PartialDebitOptions(
        authorizationCode: data.dec(_f$authorizationCode),
        currency: data.dec(_f$currency),
        amount: data.dec(_f$amount),
        email: data.dec(_f$email),
        reference: data.dec(_f$reference),
        atLeast: data.dec(_f$atLeast));
  }

  @override
  final Function instantiate = _instantiate;

  static PartialDebitOptions fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PartialDebitOptions>(map);
  }

  static PartialDebitOptions fromJson(String json) {
    return ensureInitialized().decodeJson<PartialDebitOptions>(json);
  }
}

mixin PartialDebitOptionsMappable {
  String toJson() {
    return PartialDebitOptionsMapper.ensureInitialized()
        .encodeJson<PartialDebitOptions>(this as PartialDebitOptions);
  }

  Map<String, dynamic> toMap() {
    return PartialDebitOptionsMapper.ensureInitialized()
        .encodeMap<PartialDebitOptions>(this as PartialDebitOptions);
  }

  PartialDebitOptionsCopyWith<PartialDebitOptions, PartialDebitOptions,
      PartialDebitOptions> get copyWith => _PartialDebitOptionsCopyWithImpl<
          PartialDebitOptions, PartialDebitOptions>(
      this as PartialDebitOptions, $identity, $identity);
  @override
  String toString() {
    return PartialDebitOptionsMapper.ensureInitialized()
        .stringifyValue(this as PartialDebitOptions);
  }

  @override
  bool operator ==(Object other) {
    return PartialDebitOptionsMapper.ensureInitialized()
        .equalsValue(this as PartialDebitOptions, other);
  }

  @override
  int get hashCode {
    return PartialDebitOptionsMapper.ensureInitialized()
        .hashValue(this as PartialDebitOptions);
  }
}

extension PartialDebitOptionsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PartialDebitOptions, $Out> {
  PartialDebitOptionsCopyWith<$R, PartialDebitOptions, $Out>
      get $asPartialDebitOptions => $base.as(
          (v, t, t2) => _PartialDebitOptionsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class PartialDebitOptionsCopyWith<$R, $In extends PartialDebitOptions,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? authorizationCode,
      String? currency,
      String? amount,
      String? email,
      String? reference,
      String? atLeast});
  PartialDebitOptionsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _PartialDebitOptionsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PartialDebitOptions, $Out>
    implements PartialDebitOptionsCopyWith<$R, PartialDebitOptions, $Out> {
  _PartialDebitOptionsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PartialDebitOptions> $mapper =
      PartialDebitOptionsMapper.ensureInitialized();
  @override
  $R call(
          {String? authorizationCode,
          String? currency,
          String? amount,
          String? email,
          Object? reference = $none,
          Object? atLeast = $none}) =>
      $apply(FieldCopyWithData({
        if (authorizationCode != null) #authorizationCode: authorizationCode,
        if (currency != null) #currency: currency,
        if (amount != null) #amount: amount,
        if (email != null) #email: email,
        if (reference != $none) #reference: reference,
        if (atLeast != $none) #atLeast: atLeast
      }));
  @override
  PartialDebitOptions $make(CopyWithData data) => PartialDebitOptions(
      authorizationCode:
          data.get(#authorizationCode, or: $value.authorizationCode),
      currency: data.get(#currency, or: $value.currency),
      amount: data.get(#amount, or: $value.amount),
      email: data.get(#email, or: $value.email),
      reference: data.get(#reference, or: $value.reference),
      atLeast: data.get(#atLeast, or: $value.atLeast));

  @override
  PartialDebitOptionsCopyWith<$R2, PartialDebitOptions, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _PartialDebitOptionsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
