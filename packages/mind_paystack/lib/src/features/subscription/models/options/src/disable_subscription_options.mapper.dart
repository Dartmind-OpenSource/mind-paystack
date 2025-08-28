// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'disable_subscription_options.dart';

class DisableSubscriptionOptionsMapper
    extends ClassMapperBase<DisableSubscriptionOptions> {
  DisableSubscriptionOptionsMapper._();

  static DisableSubscriptionOptionsMapper? _instance;
  static DisableSubscriptionOptionsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = DisableSubscriptionOptionsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'DisableSubscriptionOptions';

  static String? _$token(DisableSubscriptionOptions v) => v.token;
  static const Field<DisableSubscriptionOptions, String> _f$token =
      Field('token', _$token, opt: true);

  @override
  final MappableFields<DisableSubscriptionOptions> fields = const {
    #token: _f$token,
  };

  static DisableSubscriptionOptions _instantiate(DecodingData data) {
    return DisableSubscriptionOptions(token: data.dec(_f$token));
  }

  @override
  final Function instantiate = _instantiate;

  static DisableSubscriptionOptions fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DisableSubscriptionOptions>(map);
  }

  static DisableSubscriptionOptions fromJson(String json) {
    return ensureInitialized().decodeJson<DisableSubscriptionOptions>(json);
  }
}

mixin DisableSubscriptionOptionsMappable {
  String toJson() {
    return DisableSubscriptionOptionsMapper.ensureInitialized()
        .encodeJson<DisableSubscriptionOptions>(
            this as DisableSubscriptionOptions);
  }

  Map<String, dynamic> toMap() {
    return DisableSubscriptionOptionsMapper.ensureInitialized()
        .encodeMap<DisableSubscriptionOptions>(
            this as DisableSubscriptionOptions);
  }

  DisableSubscriptionOptionsCopyWith<DisableSubscriptionOptions,
          DisableSubscriptionOptions, DisableSubscriptionOptions>
      get copyWith => _DisableSubscriptionOptionsCopyWithImpl<
              DisableSubscriptionOptions, DisableSubscriptionOptions>(
          this as DisableSubscriptionOptions, $identity, $identity);
  @override
  String toString() {
    return DisableSubscriptionOptionsMapper.ensureInitialized()
        .stringifyValue(this as DisableSubscriptionOptions);
  }

  @override
  bool operator ==(Object other) {
    return DisableSubscriptionOptionsMapper.ensureInitialized()
        .equalsValue(this as DisableSubscriptionOptions, other);
  }

  @override
  int get hashCode {
    return DisableSubscriptionOptionsMapper.ensureInitialized()
        .hashValue(this as DisableSubscriptionOptions);
  }
}

extension DisableSubscriptionOptionsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DisableSubscriptionOptions, $Out> {
  DisableSubscriptionOptionsCopyWith<$R, DisableSubscriptionOptions, $Out>
      get $asDisableSubscriptionOptions => $base.as((v, t, t2) =>
          _DisableSubscriptionOptionsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class DisableSubscriptionOptionsCopyWith<
    $R,
    $In extends DisableSubscriptionOptions,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? token});
  DisableSubscriptionOptionsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _DisableSubscriptionOptionsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DisableSubscriptionOptions, $Out>
    implements
        DisableSubscriptionOptionsCopyWith<$R, DisableSubscriptionOptions,
            $Out> {
  _DisableSubscriptionOptionsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DisableSubscriptionOptions> $mapper =
      DisableSubscriptionOptionsMapper.ensureInitialized();
  @override
  $R call({Object? token = $none}) =>
      $apply(FieldCopyWithData({if (token != $none) #token: token}));
  @override
  DisableSubscriptionOptions $make(CopyWithData data) =>
      DisableSubscriptionOptions(token: data.get(#token, or: $value.token));

  @override
  DisableSubscriptionOptionsCopyWith<$R2, DisableSubscriptionOptions, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _DisableSubscriptionOptionsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
