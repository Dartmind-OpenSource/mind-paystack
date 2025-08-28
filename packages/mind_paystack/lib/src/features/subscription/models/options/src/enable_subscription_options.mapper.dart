// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'enable_subscription_options.dart';

class EnableSubscriptionOptionsMapper
    extends ClassMapperBase<EnableSubscriptionOptions> {
  EnableSubscriptionOptionsMapper._();

  static EnableSubscriptionOptionsMapper? _instance;
  static EnableSubscriptionOptionsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = EnableSubscriptionOptionsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'EnableSubscriptionOptions';

  static String? _$token(EnableSubscriptionOptions v) => v.token;
  static const Field<EnableSubscriptionOptions, String> _f$token =
      Field('token', _$token, opt: true);

  @override
  final MappableFields<EnableSubscriptionOptions> fields = const {
    #token: _f$token,
  };

  static EnableSubscriptionOptions _instantiate(DecodingData data) {
    return EnableSubscriptionOptions(token: data.dec(_f$token));
  }

  @override
  final Function instantiate = _instantiate;

  static EnableSubscriptionOptions fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<EnableSubscriptionOptions>(map);
  }

  static EnableSubscriptionOptions fromJson(String json) {
    return ensureInitialized().decodeJson<EnableSubscriptionOptions>(json);
  }
}

mixin EnableSubscriptionOptionsMappable {
  String toJson() {
    return EnableSubscriptionOptionsMapper.ensureInitialized()
        .encodeJson<EnableSubscriptionOptions>(
            this as EnableSubscriptionOptions);
  }

  Map<String, dynamic> toMap() {
    return EnableSubscriptionOptionsMapper.ensureInitialized()
        .encodeMap<EnableSubscriptionOptions>(
            this as EnableSubscriptionOptions);
  }

  EnableSubscriptionOptionsCopyWith<EnableSubscriptionOptions,
          EnableSubscriptionOptions, EnableSubscriptionOptions>
      get copyWith => _EnableSubscriptionOptionsCopyWithImpl<
              EnableSubscriptionOptions, EnableSubscriptionOptions>(
          this as EnableSubscriptionOptions, $identity, $identity);
  @override
  String toString() {
    return EnableSubscriptionOptionsMapper.ensureInitialized()
        .stringifyValue(this as EnableSubscriptionOptions);
  }

  @override
  bool operator ==(Object other) {
    return EnableSubscriptionOptionsMapper.ensureInitialized()
        .equalsValue(this as EnableSubscriptionOptions, other);
  }

  @override
  int get hashCode {
    return EnableSubscriptionOptionsMapper.ensureInitialized()
        .hashValue(this as EnableSubscriptionOptions);
  }
}

extension EnableSubscriptionOptionsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, EnableSubscriptionOptions, $Out> {
  EnableSubscriptionOptionsCopyWith<$R, EnableSubscriptionOptions, $Out>
      get $asEnableSubscriptionOptions => $base.as((v, t, t2) =>
          _EnableSubscriptionOptionsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class EnableSubscriptionOptionsCopyWith<
    $R,
    $In extends EnableSubscriptionOptions,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? token});
  EnableSubscriptionOptionsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _EnableSubscriptionOptionsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, EnableSubscriptionOptions, $Out>
    implements
        EnableSubscriptionOptionsCopyWith<$R, EnableSubscriptionOptions, $Out> {
  _EnableSubscriptionOptionsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<EnableSubscriptionOptions> $mapper =
      EnableSubscriptionOptionsMapper.ensureInitialized();
  @override
  $R call({Object? token = $none}) =>
      $apply(FieldCopyWithData({if (token != $none) #token: token}));
  @override
  EnableSubscriptionOptions $make(CopyWithData data) =>
      EnableSubscriptionOptions(token: data.get(#token, or: $value.token));

  @override
  EnableSubscriptionOptionsCopyWith<$R2, EnableSubscriptionOptions, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _EnableSubscriptionOptionsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
