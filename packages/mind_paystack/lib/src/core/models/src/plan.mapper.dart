// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'plan.dart';

class PlanMapper extends ClassMapperBase<Plan> {
  PlanMapper._();

  static PlanMapper? _instance;
  static PlanMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PlanMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Plan';

  static int? _$id(Plan v) => v.id;
  static const Field<Plan, int> _f$id = Field('id', _$id, opt: true);
  static String? _$name(Plan v) => v.name;
  static const Field<Plan, String> _f$name = Field('name', _$name, opt: true);
  static String? _$planCode(Plan v) => v.planCode;
  static const Field<Plan, String> _f$planCode =
      Field('planCode', _$planCode, key: r'plan_code', opt: true);
  static int? _$amount(Plan v) => v.amount;
  static const Field<Plan, int> _f$amount =
      Field('amount', _$amount, opt: true);
  static String? _$interval(Plan v) => v.interval;
  static const Field<Plan, String> _f$interval =
      Field('interval', _$interval, opt: true);

  @override
  final MappableFields<Plan> fields = const {
    #id: _f$id,
    #name: _f$name,
    #planCode: _f$planCode,
    #amount: _f$amount,
    #interval: _f$interval,
  };

  static Plan _instantiate(DecodingData data) {
    return Plan(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        planCode: data.dec(_f$planCode),
        amount: data.dec(_f$amount),
        interval: data.dec(_f$interval));
  }

  @override
  final Function instantiate = _instantiate;

  static Plan fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Plan>(map);
  }

  static Plan fromJson(String json) {
    return ensureInitialized().decodeJson<Plan>(json);
  }
}

mixin PlanMappable {
  String toJson() {
    return PlanMapper.ensureInitialized().encodeJson<Plan>(this as Plan);
  }

  Map<String, dynamic> toMap() {
    return PlanMapper.ensureInitialized().encodeMap<Plan>(this as Plan);
  }

  PlanCopyWith<Plan, Plan, Plan> get copyWith =>
      _PlanCopyWithImpl<Plan, Plan>(this as Plan, $identity, $identity);
  @override
  String toString() {
    return PlanMapper.ensureInitialized().stringifyValue(this as Plan);
  }

  @override
  bool operator ==(Object other) {
    return PlanMapper.ensureInitialized().equalsValue(this as Plan, other);
  }

  @override
  int get hashCode {
    return PlanMapper.ensureInitialized().hashValue(this as Plan);
  }
}

extension PlanValueCopy<$R, $Out> on ObjectCopyWith<$R, Plan, $Out> {
  PlanCopyWith<$R, Plan, $Out> get $asPlan =>
      $base.as((v, t, t2) => _PlanCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class PlanCopyWith<$R, $In extends Plan, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? id, String? name, String? planCode, int? amount, String? interval});
  PlanCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PlanCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Plan, $Out>
    implements PlanCopyWith<$R, Plan, $Out> {
  _PlanCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Plan> $mapper = PlanMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? name = $none,
          Object? planCode = $none,
          Object? amount = $none,
          Object? interval = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (name != $none) #name: name,
        if (planCode != $none) #planCode: planCode,
        if (amount != $none) #amount: amount,
        if (interval != $none) #interval: interval
      }));
  @override
  Plan $make(CopyWithData data) => Plan(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      planCode: data.get(#planCode, or: $value.planCode),
      amount: data.get(#amount, or: $value.amount),
      interval: data.get(#interval, or: $value.interval));

  @override
  PlanCopyWith<$R2, Plan, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _PlanCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
