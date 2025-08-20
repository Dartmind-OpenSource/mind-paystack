// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'view_transaction_timeline_options.dart';

class TransactionTimelineOptionsMapper
    extends ClassMapperBase<TransactionTimelineOptions> {
  TransactionTimelineOptionsMapper._();

  static TransactionTimelineOptionsMapper? _instance;
  static TransactionTimelineOptionsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = TransactionTimelineOptionsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'TransactionTimelineOptions';

  static String _$idOrReference(TransactionTimelineOptions v) =>
      v.idOrReference;
  static const Field<TransactionTimelineOptions, String> _f$idOrReference =
      Field('idOrReference', _$idOrReference);

  @override
  final MappableFields<TransactionTimelineOptions> fields = const {
    #idOrReference: _f$idOrReference,
  };

  static TransactionTimelineOptions _instantiate(DecodingData data) {
    return TransactionTimelineOptions(
        idOrReference: data.dec(_f$idOrReference));
  }

  @override
  final Function instantiate = _instantiate;

  static TransactionTimelineOptions fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TransactionTimelineOptions>(map);
  }

  static TransactionTimelineOptions fromJson(String json) {
    return ensureInitialized().decodeJson<TransactionTimelineOptions>(json);
  }
}

mixin TransactionTimelineOptionsMappable {
  String toJson() {
    return TransactionTimelineOptionsMapper.ensureInitialized()
        .encodeJson<TransactionTimelineOptions>(
            this as TransactionTimelineOptions);
  }

  Map<String, dynamic> toMap() {
    return TransactionTimelineOptionsMapper.ensureInitialized()
        .encodeMap<TransactionTimelineOptions>(
            this as TransactionTimelineOptions);
  }

  TransactionTimelineOptionsCopyWith<TransactionTimelineOptions,
          TransactionTimelineOptions, TransactionTimelineOptions>
      get copyWith => _TransactionTimelineOptionsCopyWithImpl<
              TransactionTimelineOptions, TransactionTimelineOptions>(
          this as TransactionTimelineOptions, $identity, $identity);
  @override
  String toString() {
    return TransactionTimelineOptionsMapper.ensureInitialized()
        .stringifyValue(this as TransactionTimelineOptions);
  }

  @override
  bool operator ==(Object other) {
    return TransactionTimelineOptionsMapper.ensureInitialized()
        .equalsValue(this as TransactionTimelineOptions, other);
  }

  @override
  int get hashCode {
    return TransactionTimelineOptionsMapper.ensureInitialized()
        .hashValue(this as TransactionTimelineOptions);
  }
}

extension TransactionTimelineOptionsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TransactionTimelineOptions, $Out> {
  TransactionTimelineOptionsCopyWith<$R, TransactionTimelineOptions, $Out>
      get $asTransactionTimelineOptions => $base.as((v, t, t2) =>
          _TransactionTimelineOptionsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TransactionTimelineOptionsCopyWith<
    $R,
    $In extends TransactionTimelineOptions,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? idOrReference});
  TransactionTimelineOptionsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TransactionTimelineOptionsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TransactionTimelineOptions, $Out>
    implements
        TransactionTimelineOptionsCopyWith<$R, TransactionTimelineOptions,
            $Out> {
  _TransactionTimelineOptionsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TransactionTimelineOptions> $mapper =
      TransactionTimelineOptionsMapper.ensureInitialized();
  @override
  $R call({String? idOrReference}) => $apply(FieldCopyWithData(
      {if (idOrReference != null) #idOrReference: idOrReference}));
  @override
  TransactionTimelineOptions $make(CopyWithData data) =>
      TransactionTimelineOptions(
          idOrReference: data.get(#idOrReference, or: $value.idOrReference));

  @override
  TransactionTimelineOptionsCopyWith<$R2, TransactionTimelineOptions, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _TransactionTimelineOptionsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
