// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'qr.dart';

class QrMapper extends ClassMapperBase<Qr> {
  QrMapper._();

  static QrMapper? _instance;
  static QrMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = QrMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Qr';

  static String _$provider(Qr v) => v.provider;
  static const Field<Qr, String> _f$provider = Field('provider', _$provider);

  @override
  final MappableFields<Qr> fields = const {
    #provider: _f$provider,
  };

  static Qr _instantiate(DecodingData data) {
    return Qr(provider: data.dec(_f$provider));
  }

  @override
  final Function instantiate = _instantiate;

  static Qr fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Qr>(map);
  }

  static Qr fromJson(String json) {
    return ensureInitialized().decodeJson<Qr>(json);
  }
}

mixin QrMappable {
  String toJson() {
    return QrMapper.ensureInitialized().encodeJson<Qr>(this as Qr);
  }

  Map<String, dynamic> toMap() {
    return QrMapper.ensureInitialized().encodeMap<Qr>(this as Qr);
  }

  QrCopyWith<Qr, Qr, Qr> get copyWith =>
      _QrCopyWithImpl<Qr, Qr>(this as Qr, $identity, $identity);
  @override
  String toString() {
    return QrMapper.ensureInitialized().stringifyValue(this as Qr);
  }

  @override
  bool operator ==(Object other) {
    return QrMapper.ensureInitialized().equalsValue(this as Qr, other);
  }

  @override
  int get hashCode {
    return QrMapper.ensureInitialized().hashValue(this as Qr);
  }
}

extension QrValueCopy<$R, $Out> on ObjectCopyWith<$R, Qr, $Out> {
  QrCopyWith<$R, Qr, $Out> get $asQr =>
      $base.as((v, t, t2) => _QrCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class QrCopyWith<$R, $In extends Qr, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? provider});
  QrCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _QrCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Qr, $Out>
    implements QrCopyWith<$R, Qr, $Out> {
  _QrCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Qr> $mapper = QrMapper.ensureInitialized();
  @override
  $R call({String? provider}) =>
      $apply(FieldCopyWithData({if (provider != null) #provider: provider}));
  @override
  Qr $make(CopyWithData data) =>
      Qr(provider: data.get(#provider, or: $value.provider));

  @override
  QrCopyWith<$R2, Qr, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _QrCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
