// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'check_pending_charge_options.dart';

class CheckPendingChargeOptionsMapper
    extends ClassMapperBase<CheckPendingChargeOptions> {
  CheckPendingChargeOptionsMapper._();

  static CheckPendingChargeOptionsMapper? _instance;
  static CheckPendingChargeOptionsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = CheckPendingChargeOptionsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CheckPendingChargeOptions';

  static String _$reference(CheckPendingChargeOptions v) => v.reference;
  static const Field<CheckPendingChargeOptions, String> _f$reference =
      Field('reference', _$reference);

  @override
  final MappableFields<CheckPendingChargeOptions> fields = const {
    #reference: _f$reference,
  };

  static CheckPendingChargeOptions _instantiate(DecodingData data) {
    return CheckPendingChargeOptions(reference: data.dec(_f$reference));
  }

  @override
  final Function instantiate = _instantiate;

  static CheckPendingChargeOptions fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CheckPendingChargeOptions>(map);
  }

  static CheckPendingChargeOptions fromJson(String json) {
    return ensureInitialized().decodeJson<CheckPendingChargeOptions>(json);
  }
}

mixin CheckPendingChargeOptionsMappable {
  String toJson() {
    return CheckPendingChargeOptionsMapper.ensureInitialized()
        .encodeJson<CheckPendingChargeOptions>(
            this as CheckPendingChargeOptions);
  }

  Map<String, dynamic> toMap() {
    return CheckPendingChargeOptionsMapper.ensureInitialized()
        .encodeMap<CheckPendingChargeOptions>(
            this as CheckPendingChargeOptions);
  }

  CheckPendingChargeOptionsCopyWith<CheckPendingChargeOptions,
          CheckPendingChargeOptions, CheckPendingChargeOptions>
      get copyWith => _CheckPendingChargeOptionsCopyWithImpl<
              CheckPendingChargeOptions, CheckPendingChargeOptions>(
          this as CheckPendingChargeOptions, $identity, $identity);
  @override
  String toString() {
    return CheckPendingChargeOptionsMapper.ensureInitialized()
        .stringifyValue(this as CheckPendingChargeOptions);
  }

  @override
  bool operator ==(Object other) {
    return CheckPendingChargeOptionsMapper.ensureInitialized()
        .equalsValue(this as CheckPendingChargeOptions, other);
  }

  @override
  int get hashCode {
    return CheckPendingChargeOptionsMapper.ensureInitialized()
        .hashValue(this as CheckPendingChargeOptions);
  }
}

extension CheckPendingChargeOptionsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CheckPendingChargeOptions, $Out> {
  CheckPendingChargeOptionsCopyWith<$R, CheckPendingChargeOptions, $Out>
      get $asCheckPendingChargeOptions => $base.as((v, t, t2) =>
          _CheckPendingChargeOptionsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CheckPendingChargeOptionsCopyWith<
    $R,
    $In extends CheckPendingChargeOptions,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? reference});
  CheckPendingChargeOptionsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _CheckPendingChargeOptionsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CheckPendingChargeOptions, $Out>
    implements
        CheckPendingChargeOptionsCopyWith<$R, CheckPendingChargeOptions, $Out> {
  _CheckPendingChargeOptionsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CheckPendingChargeOptions> $mapper =
      CheckPendingChargeOptionsMapper.ensureInitialized();
  @override
  $R call({String? reference}) =>
      $apply(FieldCopyWithData({if (reference != null) #reference: reference}));
  @override
  CheckPendingChargeOptions $make(CopyWithData data) =>
      CheckPendingChargeOptions(
          reference: data.get(#reference, or: $value.reference));

  @override
  CheckPendingChargeOptionsCopyWith<$R2, CheckPendingChargeOptions, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _CheckPendingChargeOptionsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
