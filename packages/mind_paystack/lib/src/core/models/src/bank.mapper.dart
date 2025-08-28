// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'bank.dart';

class BankDetailsMapper extends ClassMapperBase<BankDetails> {
  BankDetailsMapper._();

  static BankDetailsMapper? _instance;
  static BankDetailsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BankDetailsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'BankDetails';

  static String _$code(BankDetails v) => v.code;
  static const Field<BankDetails, String> _f$code = Field('code', _$code);
  static String _$accountNumber(BankDetails v) => v.accountNumber;
  static const Field<BankDetails, String> _f$accountNumber =
      Field('accountNumber', _$accountNumber);

  @override
  final MappableFields<BankDetails> fields = const {
    #code: _f$code,
    #accountNumber: _f$accountNumber,
  };

  static BankDetails _instantiate(DecodingData data) {
    return BankDetails(
        code: data.dec(_f$code), accountNumber: data.dec(_f$accountNumber));
  }

  @override
  final Function instantiate = _instantiate;

  static BankDetails fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<BankDetails>(map);
  }

  static BankDetails fromJson(String json) {
    return ensureInitialized().decodeJson<BankDetails>(json);
  }
}

mixin BankDetailsMappable {
  String toJson() {
    return BankDetailsMapper.ensureInitialized()
        .encodeJson<BankDetails>(this as BankDetails);
  }

  Map<String, dynamic> toMap() {
    return BankDetailsMapper.ensureInitialized()
        .encodeMap<BankDetails>(this as BankDetails);
  }

  BankDetailsCopyWith<BankDetails, BankDetails, BankDetails> get copyWith =>
      _BankDetailsCopyWithImpl<BankDetails, BankDetails>(
          this as BankDetails, $identity, $identity);
  @override
  String toString() {
    return BankDetailsMapper.ensureInitialized()
        .stringifyValue(this as BankDetails);
  }

  @override
  bool operator ==(Object other) {
    return BankDetailsMapper.ensureInitialized()
        .equalsValue(this as BankDetails, other);
  }

  @override
  int get hashCode {
    return BankDetailsMapper.ensureInitialized().hashValue(this as BankDetails);
  }
}

extension BankDetailsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, BankDetails, $Out> {
  BankDetailsCopyWith<$R, BankDetails, $Out> get $asBankDetails =>
      $base.as((v, t, t2) => _BankDetailsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class BankDetailsCopyWith<$R, $In extends BankDetails, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? code, String? accountNumber});
  BankDetailsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _BankDetailsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, BankDetails, $Out>
    implements BankDetailsCopyWith<$R, BankDetails, $Out> {
  _BankDetailsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<BankDetails> $mapper =
      BankDetailsMapper.ensureInitialized();
  @override
  $R call({String? code, String? accountNumber}) => $apply(FieldCopyWithData({
        if (code != null) #code: code,
        if (accountNumber != null) #accountNumber: accountNumber
      }));
  @override
  BankDetails $make(CopyWithData data) => BankDetails(
      code: data.get(#code, or: $value.code),
      accountNumber: data.get(#accountNumber, or: $value.accountNumber));

  @override
  BankDetailsCopyWith<$R2, BankDetails, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _BankDetailsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
