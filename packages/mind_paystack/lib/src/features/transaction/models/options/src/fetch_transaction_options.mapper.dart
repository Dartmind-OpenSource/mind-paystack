// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'fetch_transaction_options.dart';

class FetchTransactionOptionsMapper
    extends ClassMapperBase<FetchTransactionOptions> {
  FetchTransactionOptionsMapper._();

  static FetchTransactionOptionsMapper? _instance;
  static FetchTransactionOptionsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = FetchTransactionOptionsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'FetchTransactionOptions';

  static int _$id(FetchTransactionOptions v) => v.id;
  static const Field<FetchTransactionOptions, int> _f$id = Field('id', _$id);

  @override
  final MappableFields<FetchTransactionOptions> fields = const {
    #id: _f$id,
  };

  static FetchTransactionOptions _instantiate(DecodingData data) {
    return FetchTransactionOptions(id: data.dec(_f$id));
  }

  @override
  final Function instantiate = _instantiate;

  static FetchTransactionOptions fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FetchTransactionOptions>(map);
  }

  static FetchTransactionOptions fromJson(String json) {
    return ensureInitialized().decodeJson<FetchTransactionOptions>(json);
  }
}

mixin FetchTransactionOptionsMappable {
  String toJson() {
    return FetchTransactionOptionsMapper.ensureInitialized()
        .encodeJson<FetchTransactionOptions>(this as FetchTransactionOptions);
  }

  Map<String, dynamic> toMap() {
    return FetchTransactionOptionsMapper.ensureInitialized()
        .encodeMap<FetchTransactionOptions>(this as FetchTransactionOptions);
  }

  FetchTransactionOptionsCopyWith<FetchTransactionOptions,
          FetchTransactionOptions, FetchTransactionOptions>
      get copyWith => _FetchTransactionOptionsCopyWithImpl<
              FetchTransactionOptions, FetchTransactionOptions>(
          this as FetchTransactionOptions, $identity, $identity);
  @override
  String toString() {
    return FetchTransactionOptionsMapper.ensureInitialized()
        .stringifyValue(this as FetchTransactionOptions);
  }

  @override
  bool operator ==(Object other) {
    return FetchTransactionOptionsMapper.ensureInitialized()
        .equalsValue(this as FetchTransactionOptions, other);
  }

  @override
  int get hashCode {
    return FetchTransactionOptionsMapper.ensureInitialized()
        .hashValue(this as FetchTransactionOptions);
  }
}

extension FetchTransactionOptionsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FetchTransactionOptions, $Out> {
  FetchTransactionOptionsCopyWith<$R, FetchTransactionOptions, $Out>
      get $asFetchTransactionOptions => $base.as((v, t, t2) =>
          _FetchTransactionOptionsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class FetchTransactionOptionsCopyWith<
    $R,
    $In extends FetchTransactionOptions,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id});
  FetchTransactionOptionsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _FetchTransactionOptionsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FetchTransactionOptions, $Out>
    implements
        FetchTransactionOptionsCopyWith<$R, FetchTransactionOptions, $Out> {
  _FetchTransactionOptionsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FetchTransactionOptions> $mapper =
      FetchTransactionOptionsMapper.ensureInitialized();
  @override
  $R call({int? id}) => $apply(FieldCopyWithData({if (id != null) #id: id}));
  @override
  FetchTransactionOptions $make(CopyWithData data) =>
      FetchTransactionOptions(id: data.get(#id, or: $value.id));

  @override
  FetchTransactionOptionsCopyWith<$R2, FetchTransactionOptions, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _FetchTransactionOptionsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
