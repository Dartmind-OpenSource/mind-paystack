// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'create_subscription_options.dart';

class CreateSubscriptionOptionsMapper
    extends ClassMapperBase<CreateSubscriptionOptions> {
  CreateSubscriptionOptionsMapper._();

  static CreateSubscriptionOptionsMapper? _instance;
  static CreateSubscriptionOptionsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = CreateSubscriptionOptionsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CreateSubscriptionOptions';

  static String _$customer(CreateSubscriptionOptions v) => v.customer;
  static const Field<CreateSubscriptionOptions, String> _f$customer =
      Field('customer', _$customer);
  static String _$plan(CreateSubscriptionOptions v) => v.plan;
  static const Field<CreateSubscriptionOptions, String> _f$plan =
      Field('plan', _$plan);
  static String? _$authorization(CreateSubscriptionOptions v) =>
      v.authorization;
  static const Field<CreateSubscriptionOptions, String> _f$authorization =
      Field('authorization', _$authorization, opt: true);
  static DateTime? _$startDate(CreateSubscriptionOptions v) => v.startDate;
  static const Field<CreateSubscriptionOptions, DateTime> _f$startDate =
      Field('startDate', _$startDate, key: r'start_date', opt: true);
  static int? _$quantity(CreateSubscriptionOptions v) => v.quantity;
  static const Field<CreateSubscriptionOptions, int> _f$quantity =
      Field('quantity', _$quantity, opt: true);
  static Map<String, dynamic>? _$metadata(CreateSubscriptionOptions v) =>
      v.metadata;
  static const Field<CreateSubscriptionOptions, Map<String, dynamic>>
      _f$metadata = Field('metadata', _$metadata, opt: true);

  @override
  final MappableFields<CreateSubscriptionOptions> fields = const {
    #customer: _f$customer,
    #plan: _f$plan,
    #authorization: _f$authorization,
    #startDate: _f$startDate,
    #quantity: _f$quantity,
    #metadata: _f$metadata,
  };

  static CreateSubscriptionOptions _instantiate(DecodingData data) {
    return CreateSubscriptionOptions(
        customer: data.dec(_f$customer),
        plan: data.dec(_f$plan),
        authorization: data.dec(_f$authorization),
        startDate: data.dec(_f$startDate),
        quantity: data.dec(_f$quantity),
        metadata: data.dec(_f$metadata));
  }

  @override
  final Function instantiate = _instantiate;

  static CreateSubscriptionOptions fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CreateSubscriptionOptions>(map);
  }

  static CreateSubscriptionOptions fromJson(String json) {
    return ensureInitialized().decodeJson<CreateSubscriptionOptions>(json);
  }
}

mixin CreateSubscriptionOptionsMappable {
  String toJson() {
    return CreateSubscriptionOptionsMapper.ensureInitialized()
        .encodeJson<CreateSubscriptionOptions>(
            this as CreateSubscriptionOptions);
  }

  Map<String, dynamic> toMap() {
    return CreateSubscriptionOptionsMapper.ensureInitialized()
        .encodeMap<CreateSubscriptionOptions>(
            this as CreateSubscriptionOptions);
  }

  CreateSubscriptionOptionsCopyWith<CreateSubscriptionOptions,
          CreateSubscriptionOptions, CreateSubscriptionOptions>
      get copyWith => _CreateSubscriptionOptionsCopyWithImpl<
              CreateSubscriptionOptions, CreateSubscriptionOptions>(
          this as CreateSubscriptionOptions, $identity, $identity);
  @override
  String toString() {
    return CreateSubscriptionOptionsMapper.ensureInitialized()
        .stringifyValue(this as CreateSubscriptionOptions);
  }

  @override
  bool operator ==(Object other) {
    return CreateSubscriptionOptionsMapper.ensureInitialized()
        .equalsValue(this as CreateSubscriptionOptions, other);
  }

  @override
  int get hashCode {
    return CreateSubscriptionOptionsMapper.ensureInitialized()
        .hashValue(this as CreateSubscriptionOptions);
  }
}

extension CreateSubscriptionOptionsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CreateSubscriptionOptions, $Out> {
  CreateSubscriptionOptionsCopyWith<$R, CreateSubscriptionOptions, $Out>
      get $asCreateSubscriptionOptions => $base.as((v, t, t2) =>
          _CreateSubscriptionOptionsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CreateSubscriptionOptionsCopyWith<
    $R,
    $In extends CreateSubscriptionOptions,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
      get metadata;
  $R call(
      {String? customer,
      String? plan,
      String? authorization,
      DateTime? startDate,
      int? quantity,
      Map<String, dynamic>? metadata});
  CreateSubscriptionOptionsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _CreateSubscriptionOptionsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CreateSubscriptionOptions, $Out>
    implements
        CreateSubscriptionOptionsCopyWith<$R, CreateSubscriptionOptions, $Out> {
  _CreateSubscriptionOptionsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CreateSubscriptionOptions> $mapper =
      CreateSubscriptionOptionsMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
      get metadata => $value.metadata != null
          ? MapCopyWith(
              $value.metadata!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(metadata: v))
          : null;
  @override
  $R call(
          {String? customer,
          String? plan,
          Object? authorization = $none,
          Object? startDate = $none,
          Object? quantity = $none,
          Object? metadata = $none}) =>
      $apply(FieldCopyWithData({
        if (customer != null) #customer: customer,
        if (plan != null) #plan: plan,
        if (authorization != $none) #authorization: authorization,
        if (startDate != $none) #startDate: startDate,
        if (quantity != $none) #quantity: quantity,
        if (metadata != $none) #metadata: metadata
      }));
  @override
  CreateSubscriptionOptions $make(CopyWithData data) =>
      CreateSubscriptionOptions(
          customer: data.get(#customer, or: $value.customer),
          plan: data.get(#plan, or: $value.plan),
          authorization: data.get(#authorization, or: $value.authorization),
          startDate: data.get(#startDate, or: $value.startDate),
          quantity: data.get(#quantity, or: $value.quantity),
          metadata: data.get(#metadata, or: $value.metadata));

  @override
  CreateSubscriptionOptionsCopyWith<$R2, CreateSubscriptionOptions, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _CreateSubscriptionOptionsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
