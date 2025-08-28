// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'split_sub_account.dart';

class SplitSubaccountMapper extends ClassMapperBase<SplitSubaccount> {
  SplitSubaccountMapper._();

  static SplitSubaccountMapper? _instance;
  static SplitSubaccountMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SplitSubaccountMapper._());
      SubaccountMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SplitSubaccount';

  static Subaccount _$subaccount(SplitSubaccount v) => v.subaccount;
  static const Field<SplitSubaccount, Subaccount> _f$subaccount =
      Field('subaccount', _$subaccount);
  static int _$share(SplitSubaccount v) => v.share;
  static const Field<SplitSubaccount, int> _f$share = Field('share', _$share);

  @override
  final MappableFields<SplitSubaccount> fields = const {
    #subaccount: _f$subaccount,
    #share: _f$share,
  };

  static SplitSubaccount _instantiate(DecodingData data) {
    return SplitSubaccount(
        subaccount: data.dec(_f$subaccount), share: data.dec(_f$share));
  }

  @override
  final Function instantiate = _instantiate;

  static SplitSubaccount fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SplitSubaccount>(map);
  }

  static SplitSubaccount fromJson(String json) {
    return ensureInitialized().decodeJson<SplitSubaccount>(json);
  }
}

mixin SplitSubaccountMappable {
  String toJson() {
    return SplitSubaccountMapper.ensureInitialized()
        .encodeJson<SplitSubaccount>(this as SplitSubaccount);
  }

  Map<String, dynamic> toMap() {
    return SplitSubaccountMapper.ensureInitialized()
        .encodeMap<SplitSubaccount>(this as SplitSubaccount);
  }

  SplitSubaccountCopyWith<SplitSubaccount, SplitSubaccount, SplitSubaccount>
      get copyWith =>
          _SplitSubaccountCopyWithImpl<SplitSubaccount, SplitSubaccount>(
              this as SplitSubaccount, $identity, $identity);
  @override
  String toString() {
    return SplitSubaccountMapper.ensureInitialized()
        .stringifyValue(this as SplitSubaccount);
  }

  @override
  bool operator ==(Object other) {
    return SplitSubaccountMapper.ensureInitialized()
        .equalsValue(this as SplitSubaccount, other);
  }

  @override
  int get hashCode {
    return SplitSubaccountMapper.ensureInitialized()
        .hashValue(this as SplitSubaccount);
  }
}

extension SplitSubaccountValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SplitSubaccount, $Out> {
  SplitSubaccountCopyWith<$R, SplitSubaccount, $Out> get $asSplitSubaccount =>
      $base.as((v, t, t2) => _SplitSubaccountCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SplitSubaccountCopyWith<$R, $In extends SplitSubaccount, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  SubaccountCopyWith<$R, Subaccount, Subaccount> get subaccount;
  $R call({Subaccount? subaccount, int? share});
  SplitSubaccountCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SplitSubaccountCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SplitSubaccount, $Out>
    implements SplitSubaccountCopyWith<$R, SplitSubaccount, $Out> {
  _SplitSubaccountCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SplitSubaccount> $mapper =
      SplitSubaccountMapper.ensureInitialized();
  @override
  SubaccountCopyWith<$R, Subaccount, Subaccount> get subaccount =>
      $value.subaccount.copyWith.$chain((v) => call(subaccount: v));
  @override
  $R call({Subaccount? subaccount, int? share}) => $apply(FieldCopyWithData({
        if (subaccount != null) #subaccount: subaccount,
        if (share != null) #share: share
      }));
  @override
  SplitSubaccount $make(CopyWithData data) => SplitSubaccount(
      subaccount: data.get(#subaccount, or: $value.subaccount),
      share: data.get(#share, or: $value.share));

  @override
  SplitSubaccountCopyWith<$R2, SplitSubaccount, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SplitSubaccountCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
