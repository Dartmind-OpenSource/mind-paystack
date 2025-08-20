// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'timeline_event.dart';

class TimelineEventMapper extends ClassMapperBase<TimelineEvent> {
  TimelineEventMapper._();

  static TimelineEventMapper? _instance;
  static TimelineEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TimelineEventMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'TimelineEvent';

  static String? _$type(TimelineEvent v) => v.type;
  static const Field<TimelineEvent, String> _f$type =
      Field('type', _$type, opt: true);
  static String? _$message(TimelineEvent v) => v.message;
  static const Field<TimelineEvent, String> _f$message =
      Field('message', _$message, opt: true);
  static int? _$time(TimelineEvent v) => v.time;
  static const Field<TimelineEvent, int> _f$time =
      Field('time', _$time, opt: true);
  static String? _$status(TimelineEvent v) => v.status;
  static const Field<TimelineEvent, String> _f$status =
      Field('status', _$status, opt: true);
  static dynamic _$data(TimelineEvent v) => v.data;
  static const Field<TimelineEvent, dynamic> _f$data =
      Field('data', _$data, opt: true);

  @override
  final MappableFields<TimelineEvent> fields = const {
    #type: _f$type,
    #message: _f$message,
    #time: _f$time,
    #status: _f$status,
    #data: _f$data,
  };

  static TimelineEvent _instantiate(DecodingData data) {
    return TimelineEvent(
        type: data.dec(_f$type),
        message: data.dec(_f$message),
        time: data.dec(_f$time),
        status: data.dec(_f$status),
        data: data.dec(_f$data));
  }

  @override
  final Function instantiate = _instantiate;

  static TimelineEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TimelineEvent>(map);
  }

  static TimelineEvent fromJson(String json) {
    return ensureInitialized().decodeJson<TimelineEvent>(json);
  }
}

mixin TimelineEventMappable {
  String toJson() {
    return TimelineEventMapper.ensureInitialized()
        .encodeJson<TimelineEvent>(this as TimelineEvent);
  }

  Map<String, dynamic> toMap() {
    return TimelineEventMapper.ensureInitialized()
        .encodeMap<TimelineEvent>(this as TimelineEvent);
  }

  TimelineEventCopyWith<TimelineEvent, TimelineEvent, TimelineEvent>
      get copyWith => _TimelineEventCopyWithImpl<TimelineEvent, TimelineEvent>(
          this as TimelineEvent, $identity, $identity);
  @override
  String toString() {
    return TimelineEventMapper.ensureInitialized()
        .stringifyValue(this as TimelineEvent);
  }

  @override
  bool operator ==(Object other) {
    return TimelineEventMapper.ensureInitialized()
        .equalsValue(this as TimelineEvent, other);
  }

  @override
  int get hashCode {
    return TimelineEventMapper.ensureInitialized()
        .hashValue(this as TimelineEvent);
  }
}

extension TimelineEventValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TimelineEvent, $Out> {
  TimelineEventCopyWith<$R, TimelineEvent, $Out> get $asTimelineEvent =>
      $base.as((v, t, t2) => _TimelineEventCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TimelineEventCopyWith<$R, $In extends TimelineEvent, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? type, String? message, int? time, String? status, dynamic data});
  TimelineEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TimelineEventCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TimelineEvent, $Out>
    implements TimelineEventCopyWith<$R, TimelineEvent, $Out> {
  _TimelineEventCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TimelineEvent> $mapper =
      TimelineEventMapper.ensureInitialized();
  @override
  $R call(
          {Object? type = $none,
          Object? message = $none,
          Object? time = $none,
          Object? status = $none,
          Object? data = $none}) =>
      $apply(FieldCopyWithData({
        if (type != $none) #type: type,
        if (message != $none) #message: message,
        if (time != $none) #time: time,
        if (status != $none) #status: status,
        if (data != $none) #data: data
      }));
  @override
  TimelineEvent $make(CopyWithData data) => TimelineEvent(
      type: data.get(#type, or: $value.type),
      message: data.get(#message, or: $value.message),
      time: data.get(#time, or: $value.time),
      status: data.get(#status, or: $value.status),
      data: data.get(#data, or: $value.data));

  @override
  TimelineEventCopyWith<$R2, TimelineEvent, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TimelineEventCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
