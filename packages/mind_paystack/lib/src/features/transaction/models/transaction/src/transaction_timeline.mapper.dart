// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'transaction_timeline.dart';

class TransactionTimelineMapper extends ClassMapperBase<TransactionTimeline> {
  TransactionTimelineMapper._();

  static TransactionTimelineMapper? _instance;
  static TransactionTimelineMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TransactionTimelineMapper._());
      TimelineLogMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TransactionTimeline';

  static String _$idOrReference(TransactionTimeline v) => v.idOrReference;
  static const Field<TransactionTimeline, String> _f$idOrReference =
      Field('idOrReference', _$idOrReference);
  static TimelineLog _$log(TransactionTimeline v) => v.log;
  static const Field<TransactionTimeline, TimelineLog> _f$log =
      Field('log', _$log);

  @override
  final MappableFields<TransactionTimeline> fields = const {
    #idOrReference: _f$idOrReference,
    #log: _f$log,
  };

  static TransactionTimeline _instantiate(DecodingData data) {
    return TransactionTimeline(
        idOrReference: data.dec(_f$idOrReference), log: data.dec(_f$log));
  }

  @override
  final Function instantiate = _instantiate;

  static TransactionTimeline fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TransactionTimeline>(map);
  }

  static TransactionTimeline fromJson(String json) {
    return ensureInitialized().decodeJson<TransactionTimeline>(json);
  }
}

mixin TransactionTimelineMappable {
  String toJson() {
    return TransactionTimelineMapper.ensureInitialized()
        .encodeJson<TransactionTimeline>(this as TransactionTimeline);
  }

  Map<String, dynamic> toMap() {
    return TransactionTimelineMapper.ensureInitialized()
        .encodeMap<TransactionTimeline>(this as TransactionTimeline);
  }

  TransactionTimelineCopyWith<TransactionTimeline, TransactionTimeline,
      TransactionTimeline> get copyWith => _TransactionTimelineCopyWithImpl<
          TransactionTimeline, TransactionTimeline>(
      this as TransactionTimeline, $identity, $identity);
  @override
  String toString() {
    return TransactionTimelineMapper.ensureInitialized()
        .stringifyValue(this as TransactionTimeline);
  }

  @override
  bool operator ==(Object other) {
    return TransactionTimelineMapper.ensureInitialized()
        .equalsValue(this as TransactionTimeline, other);
  }

  @override
  int get hashCode {
    return TransactionTimelineMapper.ensureInitialized()
        .hashValue(this as TransactionTimeline);
  }
}

extension TransactionTimelineValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TransactionTimeline, $Out> {
  TransactionTimelineCopyWith<$R, TransactionTimeline, $Out>
      get $asTransactionTimeline => $base.as(
          (v, t, t2) => _TransactionTimelineCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TransactionTimelineCopyWith<$R, $In extends TransactionTimeline,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  TimelineLogCopyWith<$R, TimelineLog, TimelineLog> get log;
  $R call({String? idOrReference, TimelineLog? log});
  TransactionTimelineCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TransactionTimelineCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TransactionTimeline, $Out>
    implements TransactionTimelineCopyWith<$R, TransactionTimeline, $Out> {
  _TransactionTimelineCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TransactionTimeline> $mapper =
      TransactionTimelineMapper.ensureInitialized();
  @override
  TimelineLogCopyWith<$R, TimelineLog, TimelineLog> get log =>
      $value.log.copyWith.$chain((v) => call(log: v));
  @override
  $R call({String? idOrReference, TimelineLog? log}) =>
      $apply(FieldCopyWithData({
        if (idOrReference != null) #idOrReference: idOrReference,
        if (log != null) #log: log
      }));
  @override
  TransactionTimeline $make(CopyWithData data) => TransactionTimeline(
      idOrReference: data.get(#idOrReference, or: $value.idOrReference),
      log: data.get(#log, or: $value.log));

  @override
  TransactionTimelineCopyWith<$R2, TransactionTimeline, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _TransactionTimelineCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
