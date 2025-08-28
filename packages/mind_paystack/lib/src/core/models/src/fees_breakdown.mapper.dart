// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'fees_breakdown.dart';

class FeesBreakdownMapper extends ClassMapperBase<FeesBreakdown> {
  FeesBreakdownMapper._();

  static FeesBreakdownMapper? _instance;
  static FeesBreakdownMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FeesBreakdownMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'FeesBreakdown';

  static int? _$fixedFee(FeesBreakdown v) => v.fixedFee;
  static const Field<FeesBreakdown, int> _f$fixedFee =
      Field('fixedFee', _$fixedFee, key: r'fixed_fee', opt: true);
  static double? _$percentageFee(FeesBreakdown v) => v.percentageFee;
  static const Field<FeesBreakdown, double> _f$percentageFee = Field(
      'percentageFee', _$percentageFee,
      key: r'percentage_fee', opt: true);
  static int? _$totalFee(FeesBreakdown v) => v.totalFee;
  static const Field<FeesBreakdown, int> _f$totalFee =
      Field('totalFee', _$totalFee, key: r'total_fee', opt: true);

  @override
  final MappableFields<FeesBreakdown> fields = const {
    #fixedFee: _f$fixedFee,
    #percentageFee: _f$percentageFee,
    #totalFee: _f$totalFee,
  };

  static FeesBreakdown _instantiate(DecodingData data) {
    return FeesBreakdown(
        fixedFee: data.dec(_f$fixedFee),
        percentageFee: data.dec(_f$percentageFee),
        totalFee: data.dec(_f$totalFee));
  }

  @override
  final Function instantiate = _instantiate;

  static FeesBreakdown fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FeesBreakdown>(map);
  }

  static FeesBreakdown fromJson(String json) {
    return ensureInitialized().decodeJson<FeesBreakdown>(json);
  }
}

mixin FeesBreakdownMappable {
  String toJson() {
    return FeesBreakdownMapper.ensureInitialized()
        .encodeJson<FeesBreakdown>(this as FeesBreakdown);
  }

  Map<String, dynamic> toMap() {
    return FeesBreakdownMapper.ensureInitialized()
        .encodeMap<FeesBreakdown>(this as FeesBreakdown);
  }

  FeesBreakdownCopyWith<FeesBreakdown, FeesBreakdown, FeesBreakdown>
      get copyWith => _FeesBreakdownCopyWithImpl<FeesBreakdown, FeesBreakdown>(
          this as FeesBreakdown, $identity, $identity);
  @override
  String toString() {
    return FeesBreakdownMapper.ensureInitialized()
        .stringifyValue(this as FeesBreakdown);
  }

  @override
  bool operator ==(Object other) {
    return FeesBreakdownMapper.ensureInitialized()
        .equalsValue(this as FeesBreakdown, other);
  }

  @override
  int get hashCode {
    return FeesBreakdownMapper.ensureInitialized()
        .hashValue(this as FeesBreakdown);
  }
}

extension FeesBreakdownValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FeesBreakdown, $Out> {
  FeesBreakdownCopyWith<$R, FeesBreakdown, $Out> get $asFeesBreakdown =>
      $base.as((v, t, t2) => _FeesBreakdownCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class FeesBreakdownCopyWith<$R, $In extends FeesBreakdown, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? fixedFee, double? percentageFee, int? totalFee});
  FeesBreakdownCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _FeesBreakdownCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FeesBreakdown, $Out>
    implements FeesBreakdownCopyWith<$R, FeesBreakdown, $Out> {
  _FeesBreakdownCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FeesBreakdown> $mapper =
      FeesBreakdownMapper.ensureInitialized();
  @override
  $R call(
          {Object? fixedFee = $none,
          Object? percentageFee = $none,
          Object? totalFee = $none}) =>
      $apply(FieldCopyWithData({
        if (fixedFee != $none) #fixedFee: fixedFee,
        if (percentageFee != $none) #percentageFee: percentageFee,
        if (totalFee != $none) #totalFee: totalFee
      }));
  @override
  FeesBreakdown $make(CopyWithData data) => FeesBreakdown(
      fixedFee: data.get(#fixedFee, or: $value.fixedFee),
      percentageFee: data.get(#percentageFee, or: $value.percentageFee),
      totalFee: data.get(#totalFee, or: $value.totalFee));

  @override
  FeesBreakdownCopyWith<$R2, FeesBreakdown, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _FeesBreakdownCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
