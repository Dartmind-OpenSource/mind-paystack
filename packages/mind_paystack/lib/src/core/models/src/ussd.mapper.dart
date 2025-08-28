// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'ussd.dart';

class UssdMapper extends ClassMapperBase<Ussd> {
  UssdMapper._();

  static UssdMapper? _instance;
  static UssdMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UssdMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Ussd';

  static String _$type(Ussd v) => v.type;
  static const Field<Ussd, String> _f$type = Field('type', _$type);

  @override
  final MappableFields<Ussd> fields = const {
    #type: _f$type,
  };

  static Ussd _instantiate(DecodingData data) {
    return Ussd(type: data.dec(_f$type));
  }

  @override
  final Function instantiate = _instantiate;

  static Ussd fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Ussd>(map);
  }

  static Ussd fromJson(String json) {
    return ensureInitialized().decodeJson<Ussd>(json);
  }
}

mixin UssdMappable {
  String toJson() {
    return UssdMapper.ensureInitialized().encodeJson<Ussd>(this as Ussd);
  }

  Map<String, dynamic> toMap() {
    return UssdMapper.ensureInitialized().encodeMap<Ussd>(this as Ussd);
  }

  UssdCopyWith<Ussd, Ussd, Ussd> get copyWith =>
      _UssdCopyWithImpl<Ussd, Ussd>(this as Ussd, $identity, $identity);
  @override
  String toString() {
    return UssdMapper.ensureInitialized().stringifyValue(this as Ussd);
  }

  @override
  bool operator ==(Object other) {
    return UssdMapper.ensureInitialized().equalsValue(this as Ussd, other);
  }

  @override
  int get hashCode {
    return UssdMapper.ensureInitialized().hashValue(this as Ussd);
  }
}

extension UssdValueCopy<$R, $Out> on ObjectCopyWith<$R, Ussd, $Out> {
  UssdCopyWith<$R, Ussd, $Out> get $asUssd =>
      $base.as((v, t, t2) => _UssdCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UssdCopyWith<$R, $In extends Ussd, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? type});
  UssdCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UssdCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Ussd, $Out>
    implements UssdCopyWith<$R, Ussd, $Out> {
  _UssdCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Ussd> $mapper = UssdMapper.ensureInitialized();
  @override
  $R call({String? type}) =>
      $apply(FieldCopyWithData({if (type != null) #type: type}));
  @override
  Ussd $make(CopyWithData data) => Ussd(type: data.get(#type, or: $value.type));

  @override
  UssdCopyWith<$R2, Ussd, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _UssdCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
