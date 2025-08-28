// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'split.dart';

class SplitMapper extends ClassMapperBase<Split> {
  SplitMapper._();

  static SplitMapper? _instance;
  static SplitMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SplitMapper._());
      SplitSubaccountMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Split';

  static int? _$id(Split v) => v.id;
  static const Field<Split, int> _f$id = Field('id', _$id);
  static String? _$name(Split v) => v.name;
  static const Field<Split, String> _f$name = Field('name', _$name);
  static String? _$type(Split v) => v.type;
  static const Field<Split, String> _f$type = Field('type', _$type);
  static String? _$currency(Split v) => v.currency;
  static const Field<Split, String> _f$currency = Field('currency', _$currency);
  static String? _$splitCode(Split v) => v.splitCode;
  static const Field<Split, String> _f$splitCode =
      Field('splitCode', _$splitCode, key: r'split_code');
  static bool? _$active(Split v) => v.active;
  static const Field<Split, bool> _f$active = Field('active', _$active);
  static String? _$bearerType(Split v) => v.bearerType;
  static const Field<Split, String> _f$bearerType =
      Field('bearerType', _$bearerType, key: r'bearer_type');
  static String? _$bearerSubaccount(Split v) => v.bearerSubaccount;
  static const Field<Split, String> _f$bearerSubaccount = Field(
      'bearerSubaccount', _$bearerSubaccount,
      key: r'bearer_subaccount', opt: true);
  static List<SplitSubaccount>? _$subaccounts(Split v) => v.subaccounts;
  static const Field<Split, List<SplitSubaccount>> _f$subaccounts =
      Field('subaccounts', _$subaccounts);
  static int? _$totalSubaccounts(Split v) => v.totalSubaccounts;
  static const Field<Split, int> _f$totalSubaccounts =
      Field('totalSubaccounts', _$totalSubaccounts, key: r'total_subaccounts');

  @override
  final MappableFields<Split> fields = const {
    #id: _f$id,
    #name: _f$name,
    #type: _f$type,
    #currency: _f$currency,
    #splitCode: _f$splitCode,
    #active: _f$active,
    #bearerType: _f$bearerType,
    #bearerSubaccount: _f$bearerSubaccount,
    #subaccounts: _f$subaccounts,
    #totalSubaccounts: _f$totalSubaccounts,
  };

  static Split _instantiate(DecodingData data) {
    return Split(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        type: data.dec(_f$type),
        currency: data.dec(_f$currency),
        splitCode: data.dec(_f$splitCode),
        active: data.dec(_f$active),
        bearerType: data.dec(_f$bearerType),
        bearerSubaccount: data.dec(_f$bearerSubaccount),
        subaccounts: data.dec(_f$subaccounts),
        totalSubaccounts: data.dec(_f$totalSubaccounts));
  }

  @override
  final Function instantiate = _instantiate;

  static Split fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Split>(map);
  }

  static Split fromJson(String json) {
    return ensureInitialized().decodeJson<Split>(json);
  }
}

mixin SplitMappable {
  String toJson() {
    return SplitMapper.ensureInitialized().encodeJson<Split>(this as Split);
  }

  Map<String, dynamic> toMap() {
    return SplitMapper.ensureInitialized().encodeMap<Split>(this as Split);
  }

  SplitCopyWith<Split, Split, Split> get copyWith =>
      _SplitCopyWithImpl<Split, Split>(this as Split, $identity, $identity);
  @override
  String toString() {
    return SplitMapper.ensureInitialized().stringifyValue(this as Split);
  }

  @override
  bool operator ==(Object other) {
    return SplitMapper.ensureInitialized().equalsValue(this as Split, other);
  }

  @override
  int get hashCode {
    return SplitMapper.ensureInitialized().hashValue(this as Split);
  }
}

extension SplitValueCopy<$R, $Out> on ObjectCopyWith<$R, Split, $Out> {
  SplitCopyWith<$R, Split, $Out> get $asSplit =>
      $base.as((v, t, t2) => _SplitCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SplitCopyWith<$R, $In extends Split, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, SplitSubaccount,
          SplitSubaccountCopyWith<$R, SplitSubaccount, SplitSubaccount>>?
      get subaccounts;
  $R call(
      {int? id,
      String? name,
      String? type,
      String? currency,
      String? splitCode,
      bool? active,
      String? bearerType,
      String? bearerSubaccount,
      List<SplitSubaccount>? subaccounts,
      int? totalSubaccounts});
  SplitCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SplitCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Split, $Out>
    implements SplitCopyWith<$R, Split, $Out> {
  _SplitCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Split> $mapper = SplitMapper.ensureInitialized();
  @override
  ListCopyWith<$R, SplitSubaccount,
          SplitSubaccountCopyWith<$R, SplitSubaccount, SplitSubaccount>>?
      get subaccounts => $value.subaccounts != null
          ? ListCopyWith($value.subaccounts!, (v, t) => v.copyWith.$chain(t),
              (v) => call(subaccounts: v))
          : null;
  @override
  $R call(
          {Object? id = $none,
          Object? name = $none,
          Object? type = $none,
          Object? currency = $none,
          Object? splitCode = $none,
          Object? active = $none,
          Object? bearerType = $none,
          Object? bearerSubaccount = $none,
          Object? subaccounts = $none,
          Object? totalSubaccounts = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (name != $none) #name: name,
        if (type != $none) #type: type,
        if (currency != $none) #currency: currency,
        if (splitCode != $none) #splitCode: splitCode,
        if (active != $none) #active: active,
        if (bearerType != $none) #bearerType: bearerType,
        if (bearerSubaccount != $none) #bearerSubaccount: bearerSubaccount,
        if (subaccounts != $none) #subaccounts: subaccounts,
        if (totalSubaccounts != $none) #totalSubaccounts: totalSubaccounts
      }));
  @override
  Split $make(CopyWithData data) => Split(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      type: data.get(#type, or: $value.type),
      currency: data.get(#currency, or: $value.currency),
      splitCode: data.get(#splitCode, or: $value.splitCode),
      active: data.get(#active, or: $value.active),
      bearerType: data.get(#bearerType, or: $value.bearerType),
      bearerSubaccount:
          data.get(#bearerSubaccount, or: $value.bearerSubaccount),
      subaccounts: data.get(#subaccounts, or: $value.subaccounts),
      totalSubaccounts:
          data.get(#totalSubaccounts, or: $value.totalSubaccounts));

  @override
  SplitCopyWith<$R2, Split, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _SplitCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
