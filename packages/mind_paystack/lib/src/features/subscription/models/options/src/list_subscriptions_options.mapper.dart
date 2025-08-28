// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'list_subscriptions_options.dart';

class ListSubscriptionsOptionsMapper
    extends ClassMapperBase<ListSubscriptionsOptions> {
  ListSubscriptionsOptionsMapper._();

  static ListSubscriptionsOptionsMapper? _instance;
  static ListSubscriptionsOptionsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ListSubscriptionsOptionsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ListSubscriptionsOptions';

  static int? _$perPage(ListSubscriptionsOptions v) => v.perPage;
  static const Field<ListSubscriptionsOptions, int> _f$perPage =
      Field('perPage', _$perPage, key: r'per_page', opt: true);
  static int? _$page(ListSubscriptionsOptions v) => v.page;
  static const Field<ListSubscriptionsOptions, int> _f$page =
      Field('page', _$page, opt: true);
  static String? _$customer(ListSubscriptionsOptions v) => v.customer;
  static const Field<ListSubscriptionsOptions, String> _f$customer =
      Field('customer', _$customer, opt: true);
  static String? _$plan(ListSubscriptionsOptions v) => v.plan;
  static const Field<ListSubscriptionsOptions, String> _f$plan =
      Field('plan', _$plan, opt: true);
  static String? _$status(ListSubscriptionsOptions v) => v.status;
  static const Field<ListSubscriptionsOptions, String> _f$status =
      Field('status', _$status, opt: true);
  static DateTime? _$from(ListSubscriptionsOptions v) => v.from;
  static const Field<ListSubscriptionsOptions, DateTime> _f$from =
      Field('from', _$from, opt: true);
  static DateTime? _$to(ListSubscriptionsOptions v) => v.to;
  static const Field<ListSubscriptionsOptions, DateTime> _f$to =
      Field('to', _$to, opt: true);

  @override
  final MappableFields<ListSubscriptionsOptions> fields = const {
    #perPage: _f$perPage,
    #page: _f$page,
    #customer: _f$customer,
    #plan: _f$plan,
    #status: _f$status,
    #from: _f$from,
    #to: _f$to,
  };

  static ListSubscriptionsOptions _instantiate(DecodingData data) {
    return ListSubscriptionsOptions(
        perPage: data.dec(_f$perPage),
        page: data.dec(_f$page),
        customer: data.dec(_f$customer),
        plan: data.dec(_f$plan),
        status: data.dec(_f$status),
        from: data.dec(_f$from),
        to: data.dec(_f$to));
  }

  @override
  final Function instantiate = _instantiate;

  static ListSubscriptionsOptions fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ListSubscriptionsOptions>(map);
  }

  static ListSubscriptionsOptions fromJson(String json) {
    return ensureInitialized().decodeJson<ListSubscriptionsOptions>(json);
  }
}

mixin ListSubscriptionsOptionsMappable {
  String toJson() {
    return ListSubscriptionsOptionsMapper.ensureInitialized()
        .encodeJson<ListSubscriptionsOptions>(this as ListSubscriptionsOptions);
  }

  Map<String, dynamic> toMap() {
    return ListSubscriptionsOptionsMapper.ensureInitialized()
        .encodeMap<ListSubscriptionsOptions>(this as ListSubscriptionsOptions);
  }

  ListSubscriptionsOptionsCopyWith<ListSubscriptionsOptions,
          ListSubscriptionsOptions, ListSubscriptionsOptions>
      get copyWith => _ListSubscriptionsOptionsCopyWithImpl<
              ListSubscriptionsOptions, ListSubscriptionsOptions>(
          this as ListSubscriptionsOptions, $identity, $identity);
  @override
  String toString() {
    return ListSubscriptionsOptionsMapper.ensureInitialized()
        .stringifyValue(this as ListSubscriptionsOptions);
  }

  @override
  bool operator ==(Object other) {
    return ListSubscriptionsOptionsMapper.ensureInitialized()
        .equalsValue(this as ListSubscriptionsOptions, other);
  }

  @override
  int get hashCode {
    return ListSubscriptionsOptionsMapper.ensureInitialized()
        .hashValue(this as ListSubscriptionsOptions);
  }
}

extension ListSubscriptionsOptionsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ListSubscriptionsOptions, $Out> {
  ListSubscriptionsOptionsCopyWith<$R, ListSubscriptionsOptions, $Out>
      get $asListSubscriptionsOptions => $base.as((v, t, t2) =>
          _ListSubscriptionsOptionsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ListSubscriptionsOptionsCopyWith<
    $R,
    $In extends ListSubscriptionsOptions,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? perPage,
      int? page,
      String? customer,
      String? plan,
      String? status,
      DateTime? from,
      DateTime? to});
  ListSubscriptionsOptionsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ListSubscriptionsOptionsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ListSubscriptionsOptions, $Out>
    implements
        ListSubscriptionsOptionsCopyWith<$R, ListSubscriptionsOptions, $Out> {
  _ListSubscriptionsOptionsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ListSubscriptionsOptions> $mapper =
      ListSubscriptionsOptionsMapper.ensureInitialized();
  @override
  $R call(
          {Object? perPage = $none,
          Object? page = $none,
          Object? customer = $none,
          Object? plan = $none,
          Object? status = $none,
          Object? from = $none,
          Object? to = $none}) =>
      $apply(FieldCopyWithData({
        if (perPage != $none) #perPage: perPage,
        if (page != $none) #page: page,
        if (customer != $none) #customer: customer,
        if (plan != $none) #plan: plan,
        if (status != $none) #status: status,
        if (from != $none) #from: from,
        if (to != $none) #to: to
      }));
  @override
  ListSubscriptionsOptions $make(CopyWithData data) => ListSubscriptionsOptions(
      perPage: data.get(#perPage, or: $value.perPage),
      page: data.get(#page, or: $value.page),
      customer: data.get(#customer, or: $value.customer),
      plan: data.get(#plan, or: $value.plan),
      status: data.get(#status, or: $value.status),
      from: data.get(#from, or: $value.from),
      to: data.get(#to, or: $value.to));

  @override
  ListSubscriptionsOptionsCopyWith<$R2, ListSubscriptionsOptions, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ListSubscriptionsOptionsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
