// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'transaction_export.dart';

class TransactionExportMapper extends ClassMapperBase<TransactionExport> {
  TransactionExportMapper._();

  static TransactionExportMapper? _instance;
  static TransactionExportMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TransactionExportMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'TransactionExport';

  static String _$path(TransactionExport v) => v.path;
  static const Field<TransactionExport, String> _f$path = Field('path', _$path);
  static DateTime? _$expiresAt(TransactionExport v) => v.expiresAt;
  static const Field<TransactionExport, DateTime> _f$expiresAt =
      Field('expiresAt', _$expiresAt, key: r'expires_at', opt: true);

  @override
  final MappableFields<TransactionExport> fields = const {
    #path: _f$path,
    #expiresAt: _f$expiresAt,
  };

  static TransactionExport _instantiate(DecodingData data) {
    return TransactionExport(
        path: data.dec(_f$path), expiresAt: data.dec(_f$expiresAt));
  }

  @override
  final Function instantiate = _instantiate;

  static TransactionExport fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TransactionExport>(map);
  }

  static TransactionExport fromJson(String json) {
    return ensureInitialized().decodeJson<TransactionExport>(json);
  }
}

mixin TransactionExportMappable {
  String toJson() {
    return TransactionExportMapper.ensureInitialized()
        .encodeJson<TransactionExport>(this as TransactionExport);
  }

  Map<String, dynamic> toMap() {
    return TransactionExportMapper.ensureInitialized()
        .encodeMap<TransactionExport>(this as TransactionExport);
  }

  TransactionExportCopyWith<TransactionExport, TransactionExport,
          TransactionExport>
      get copyWith =>
          _TransactionExportCopyWithImpl<TransactionExport, TransactionExport>(
              this as TransactionExport, $identity, $identity);
  @override
  String toString() {
    return TransactionExportMapper.ensureInitialized()
        .stringifyValue(this as TransactionExport);
  }

  @override
  bool operator ==(Object other) {
    return TransactionExportMapper.ensureInitialized()
        .equalsValue(this as TransactionExport, other);
  }

  @override
  int get hashCode {
    return TransactionExportMapper.ensureInitialized()
        .hashValue(this as TransactionExport);
  }
}

extension TransactionExportValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TransactionExport, $Out> {
  TransactionExportCopyWith<$R, TransactionExport, $Out>
      get $asTransactionExport => $base
          .as((v, t, t2) => _TransactionExportCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TransactionExportCopyWith<$R, $In extends TransactionExport,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? path, DateTime? expiresAt});
  TransactionExportCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TransactionExportCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TransactionExport, $Out>
    implements TransactionExportCopyWith<$R, TransactionExport, $Out> {
  _TransactionExportCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TransactionExport> $mapper =
      TransactionExportMapper.ensureInitialized();
  @override
  $R call({String? path, Object? expiresAt = $none}) =>
      $apply(FieldCopyWithData({
        if (path != null) #path: path,
        if (expiresAt != $none) #expiresAt: expiresAt
      }));
  @override
  TransactionExport $make(CopyWithData data) => TransactionExport(
      path: data.get(#path, or: $value.path),
      expiresAt: data.get(#expiresAt, or: $value.expiresAt));

  @override
  TransactionExportCopyWith<$R2, TransactionExport, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TransactionExportCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
