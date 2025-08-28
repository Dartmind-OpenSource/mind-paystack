// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'sub_account.dart';

class SubaccountMapper extends ClassMapperBase<Subaccount> {
  SubaccountMapper._();

  static SubaccountMapper? _instance;
  static SubaccountMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SubaccountMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Subaccount';

  static int? _$id(Subaccount v) => v.id;
  static const Field<Subaccount, int> _f$id = Field('id', _$id);
  static String? _$subaccountCode(Subaccount v) => v.subaccountCode;
  static const Field<Subaccount, String> _f$subaccountCode =
      Field('subaccountCode', _$subaccountCode, key: r'subaccount_code');
  static String? _$businessName(Subaccount v) => v.businessName;
  static const Field<Subaccount, String> _f$businessName =
      Field('businessName', _$businessName, key: r'business_name');
  static String? _$settlementBank(Subaccount v) => v.settlementBank;
  static const Field<Subaccount, String> _f$settlementBank =
      Field('settlementBank', _$settlementBank, key: r'settlement_bank');
  static String? _$accountNumber(Subaccount v) => v.accountNumber;
  static const Field<Subaccount, String> _f$accountNumber =
      Field('accountNumber', _$accountNumber, key: r'account_number');
  static num? _$percentageCharge(Subaccount v) => v.percentageCharge;
  static const Field<Subaccount, num> _f$percentageCharge =
      Field('percentageCharge', _$percentageCharge, key: r'percentage_charge');

  @override
  final MappableFields<Subaccount> fields = const {
    #id: _f$id,
    #subaccountCode: _f$subaccountCode,
    #businessName: _f$businessName,
    #settlementBank: _f$settlementBank,
    #accountNumber: _f$accountNumber,
    #percentageCharge: _f$percentageCharge,
  };

  static Subaccount _instantiate(DecodingData data) {
    return Subaccount(
        id: data.dec(_f$id),
        subaccountCode: data.dec(_f$subaccountCode),
        businessName: data.dec(_f$businessName),
        settlementBank: data.dec(_f$settlementBank),
        accountNumber: data.dec(_f$accountNumber),
        percentageCharge: data.dec(_f$percentageCharge));
  }

  @override
  final Function instantiate = _instantiate;

  static Subaccount fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Subaccount>(map);
  }

  static Subaccount fromJson(String json) {
    return ensureInitialized().decodeJson<Subaccount>(json);
  }
}

mixin SubaccountMappable {
  String toJson() {
    return SubaccountMapper.ensureInitialized()
        .encodeJson<Subaccount>(this as Subaccount);
  }

  Map<String, dynamic> toMap() {
    return SubaccountMapper.ensureInitialized()
        .encodeMap<Subaccount>(this as Subaccount);
  }

  SubaccountCopyWith<Subaccount, Subaccount, Subaccount> get copyWith =>
      _SubaccountCopyWithImpl<Subaccount, Subaccount>(
          this as Subaccount, $identity, $identity);
  @override
  String toString() {
    return SubaccountMapper.ensureInitialized()
        .stringifyValue(this as Subaccount);
  }

  @override
  bool operator ==(Object other) {
    return SubaccountMapper.ensureInitialized()
        .equalsValue(this as Subaccount, other);
  }

  @override
  int get hashCode {
    return SubaccountMapper.ensureInitialized().hashValue(this as Subaccount);
  }
}

extension SubaccountValueCopy<$R, $Out>
    on ObjectCopyWith<$R, Subaccount, $Out> {
  SubaccountCopyWith<$R, Subaccount, $Out> get $asSubaccount =>
      $base.as((v, t, t2) => _SubaccountCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SubaccountCopyWith<$R, $In extends Subaccount, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? id,
      String? subaccountCode,
      String? businessName,
      String? settlementBank,
      String? accountNumber,
      num? percentageCharge});
  SubaccountCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SubaccountCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Subaccount, $Out>
    implements SubaccountCopyWith<$R, Subaccount, $Out> {
  _SubaccountCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Subaccount> $mapper =
      SubaccountMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? subaccountCode = $none,
          Object? businessName = $none,
          Object? settlementBank = $none,
          Object? accountNumber = $none,
          Object? percentageCharge = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (subaccountCode != $none) #subaccountCode: subaccountCode,
        if (businessName != $none) #businessName: businessName,
        if (settlementBank != $none) #settlementBank: settlementBank,
        if (accountNumber != $none) #accountNumber: accountNumber,
        if (percentageCharge != $none) #percentageCharge: percentageCharge
      }));
  @override
  Subaccount $make(CopyWithData data) => Subaccount(
      id: data.get(#id, or: $value.id),
      subaccountCode: data.get(#subaccountCode, or: $value.subaccountCode),
      businessName: data.get(#businessName, or: $value.businessName),
      settlementBank: data.get(#settlementBank, or: $value.settlementBank),
      accountNumber: data.get(#accountNumber, or: $value.accountNumber),
      percentageCharge:
          data.get(#percentageCharge, or: $value.percentageCharge));

  @override
  SubaccountCopyWith<$R2, Subaccount, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SubaccountCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
