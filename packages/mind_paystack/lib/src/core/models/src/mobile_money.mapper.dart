// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'mobile_money.dart';

class MobileMoneyMapper extends ClassMapperBase<MobileMoney> {
  MobileMoneyMapper._();

  static MobileMoneyMapper? _instance;
  static MobileMoneyMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MobileMoneyMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'MobileMoney';

  static String _$provider(MobileMoney v) => v.provider;
  static const Field<MobileMoney, String> _f$provider =
      Field('provider', _$provider);
  static String _$phone(MobileMoney v) => v.phone;
  static const Field<MobileMoney, String> _f$phone = Field('phone', _$phone);

  @override
  final MappableFields<MobileMoney> fields = const {
    #provider: _f$provider,
    #phone: _f$phone,
  };

  static MobileMoney _instantiate(DecodingData data) {
    return MobileMoney(
        provider: data.dec(_f$provider), phone: data.dec(_f$phone));
  }

  @override
  final Function instantiate = _instantiate;

  static MobileMoney fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MobileMoney>(map);
  }

  static MobileMoney fromJson(String json) {
    return ensureInitialized().decodeJson<MobileMoney>(json);
  }
}

mixin MobileMoneyMappable {
  String toJson() {
    return MobileMoneyMapper.ensureInitialized()
        .encodeJson<MobileMoney>(this as MobileMoney);
  }

  Map<String, dynamic> toMap() {
    return MobileMoneyMapper.ensureInitialized()
        .encodeMap<MobileMoney>(this as MobileMoney);
  }

  MobileMoneyCopyWith<MobileMoney, MobileMoney, MobileMoney> get copyWith =>
      _MobileMoneyCopyWithImpl<MobileMoney, MobileMoney>(
          this as MobileMoney, $identity, $identity);
  @override
  String toString() {
    return MobileMoneyMapper.ensureInitialized()
        .stringifyValue(this as MobileMoney);
  }

  @override
  bool operator ==(Object other) {
    return MobileMoneyMapper.ensureInitialized()
        .equalsValue(this as MobileMoney, other);
  }

  @override
  int get hashCode {
    return MobileMoneyMapper.ensureInitialized().hashValue(this as MobileMoney);
  }
}

extension MobileMoneyValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MobileMoney, $Out> {
  MobileMoneyCopyWith<$R, MobileMoney, $Out> get $asMobileMoney =>
      $base.as((v, t, t2) => _MobileMoneyCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class MobileMoneyCopyWith<$R, $In extends MobileMoney, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? provider, String? phone});
  MobileMoneyCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MobileMoneyCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MobileMoney, $Out>
    implements MobileMoneyCopyWith<$R, MobileMoney, $Out> {
  _MobileMoneyCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MobileMoney> $mapper =
      MobileMoneyMapper.ensureInitialized();
  @override
  $R call({String? provider, String? phone}) => $apply(FieldCopyWithData({
        if (provider != null) #provider: provider,
        if (phone != null) #phone: phone
      }));
  @override
  MobileMoney $make(CopyWithData data) => MobileMoney(
      provider: data.get(#provider, or: $value.provider),
      phone: data.get(#phone, or: $value.phone));

  @override
  MobileMoneyCopyWith<$R2, MobileMoney, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MobileMoneyCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
