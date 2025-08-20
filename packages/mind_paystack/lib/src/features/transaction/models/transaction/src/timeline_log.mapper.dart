// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'timeline_log.dart';

class TimelineLogMapper extends ClassMapperBase<TimelineLog> {
  TimelineLogMapper._();

  static TimelineLogMapper? _instance;
  static TimelineLogMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TimelineLogMapper._());
      TimelineEventMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TimelineLog';

  static int? _$timeSpent(TimelineLog v) => v.timeSpent;
  static const Field<TimelineLog, int> _f$timeSpent =
      Field('timeSpent', _$timeSpent, key: r'time_spent', opt: true);
  static int? _$attempts(TimelineLog v) => v.attempts;
  static const Field<TimelineLog, int> _f$attempts =
      Field('attempts', _$attempts, opt: true);
  static dynamic _$authentication(TimelineLog v) => v.authentication;
  static const Field<TimelineLog, dynamic> _f$authentication =
      Field('authentication', _$authentication, opt: true);
  static int? _$errors(TimelineLog v) => v.errors;
  static const Field<TimelineLog, int> _f$errors =
      Field('errors', _$errors, opt: true);
  static bool? _$success(TimelineLog v) => v.success;
  static const Field<TimelineLog, bool> _f$success =
      Field('success', _$success, opt: true);
  static bool? _$mobile(TimelineLog v) => v.mobile;
  static const Field<TimelineLog, bool> _f$mobile =
      Field('mobile', _$mobile, opt: true);
  static List<dynamic>? _$input(TimelineLog v) => v.input;
  static const Field<TimelineLog, List<dynamic>> _f$input =
      Field('input', _$input, opt: true);
  static String? _$channel(TimelineLog v) => v.channel;
  static const Field<TimelineLog, String> _f$channel =
      Field('channel', _$channel, opt: true);
  static List<TimelineEvent>? _$history(TimelineLog v) => v.history;
  static const Field<TimelineLog, List<TimelineEvent>> _f$history =
      Field('history', _$history, opt: true);

  @override
  final MappableFields<TimelineLog> fields = const {
    #timeSpent: _f$timeSpent,
    #attempts: _f$attempts,
    #authentication: _f$authentication,
    #errors: _f$errors,
    #success: _f$success,
    #mobile: _f$mobile,
    #input: _f$input,
    #channel: _f$channel,
    #history: _f$history,
  };

  static TimelineLog _instantiate(DecodingData data) {
    return TimelineLog(
        timeSpent: data.dec(_f$timeSpent),
        attempts: data.dec(_f$attempts),
        authentication: data.dec(_f$authentication),
        errors: data.dec(_f$errors),
        success: data.dec(_f$success),
        mobile: data.dec(_f$mobile),
        input: data.dec(_f$input),
        channel: data.dec(_f$channel),
        history: data.dec(_f$history));
  }

  @override
  final Function instantiate = _instantiate;

  static TimelineLog fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TimelineLog>(map);
  }

  static TimelineLog fromJson(String json) {
    return ensureInitialized().decodeJson<TimelineLog>(json);
  }
}

mixin TimelineLogMappable {
  String toJson() {
    return TimelineLogMapper.ensureInitialized()
        .encodeJson<TimelineLog>(this as TimelineLog);
  }

  Map<String, dynamic> toMap() {
    return TimelineLogMapper.ensureInitialized()
        .encodeMap<TimelineLog>(this as TimelineLog);
  }

  TimelineLogCopyWith<TimelineLog, TimelineLog, TimelineLog> get copyWith =>
      _TimelineLogCopyWithImpl<TimelineLog, TimelineLog>(
          this as TimelineLog, $identity, $identity);
  @override
  String toString() {
    return TimelineLogMapper.ensureInitialized()
        .stringifyValue(this as TimelineLog);
  }

  @override
  bool operator ==(Object other) {
    return TimelineLogMapper.ensureInitialized()
        .equalsValue(this as TimelineLog, other);
  }

  @override
  int get hashCode {
    return TimelineLogMapper.ensureInitialized().hashValue(this as TimelineLog);
  }
}

extension TimelineLogValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TimelineLog, $Out> {
  TimelineLogCopyWith<$R, TimelineLog, $Out> get $asTimelineLog =>
      $base.as((v, t, t2) => _TimelineLogCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TimelineLogCopyWith<$R, $In extends TimelineLog, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>? get input;
  ListCopyWith<$R, TimelineEvent,
      TimelineEventCopyWith<$R, TimelineEvent, TimelineEvent>>? get history;
  $R call(
      {int? timeSpent,
      int? attempts,
      dynamic authentication,
      int? errors,
      bool? success,
      bool? mobile,
      List<dynamic>? input,
      String? channel,
      List<TimelineEvent>? history});
  TimelineLogCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TimelineLogCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TimelineLog, $Out>
    implements TimelineLogCopyWith<$R, TimelineLog, $Out> {
  _TimelineLogCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TimelineLog> $mapper =
      TimelineLogMapper.ensureInitialized();
  @override
  ListCopyWith<$R, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>? get input =>
      $value.input != null
          ? ListCopyWith($value.input!,
              (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(input: v))
          : null;
  @override
  ListCopyWith<$R, TimelineEvent,
          TimelineEventCopyWith<$R, TimelineEvent, TimelineEvent>>?
      get history => $value.history != null
          ? ListCopyWith($value.history!, (v, t) => v.copyWith.$chain(t),
              (v) => call(history: v))
          : null;
  @override
  $R call(
          {Object? timeSpent = $none,
          Object? attempts = $none,
          Object? authentication = $none,
          Object? errors = $none,
          Object? success = $none,
          Object? mobile = $none,
          Object? input = $none,
          Object? channel = $none,
          Object? history = $none}) =>
      $apply(FieldCopyWithData({
        if (timeSpent != $none) #timeSpent: timeSpent,
        if (attempts != $none) #attempts: attempts,
        if (authentication != $none) #authentication: authentication,
        if (errors != $none) #errors: errors,
        if (success != $none) #success: success,
        if (mobile != $none) #mobile: mobile,
        if (input != $none) #input: input,
        if (channel != $none) #channel: channel,
        if (history != $none) #history: history
      }));
  @override
  TimelineLog $make(CopyWithData data) => TimelineLog(
      timeSpent: data.get(#timeSpent, or: $value.timeSpent),
      attempts: data.get(#attempts, or: $value.attempts),
      authentication: data.get(#authentication, or: $value.authentication),
      errors: data.get(#errors, or: $value.errors),
      success: data.get(#success, or: $value.success),
      mobile: data.get(#mobile, or: $value.mobile),
      input: data.get(#input, or: $value.input),
      channel: data.get(#channel, or: $value.channel),
      history: data.get(#history, or: $value.history));

  @override
  TimelineLogCopyWith<$R2, TimelineLog, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TimelineLogCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
