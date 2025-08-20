// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'customer.dart';

class CustomerMapper extends ClassMapperBase<Customer> {
  CustomerMapper._();

  static CustomerMapper? _instance;
  static CustomerMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CustomerMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Customer';

  static int _$id(Customer v) => v.id;
  static const Field<Customer, int> _f$id = Field('id', _$id);
  static String? _$firstName(Customer v) => v.firstName;
  static const Field<Customer, String> _f$firstName =
      Field('firstName', _$firstName, opt: true);
  static String? _$lastName(Customer v) => v.lastName;
  static const Field<Customer, String> _f$lastName =
      Field('lastName', _$lastName, opt: true);
  static String _$email(Customer v) => v.email;
  static const Field<Customer, String> _f$email = Field('email', _$email);
  static String _$customerCode(Customer v) => v.customerCode;
  static const Field<Customer, String> _f$customerCode =
      Field('customerCode', _$customerCode, key: r'customer_code');
  static String? _$phone(Customer v) => v.phone;
  static const Field<Customer, String> _f$phone =
      Field('phone', _$phone, opt: true);
  static dynamic _$metadata(Customer v) => v.metadata;
  static const Field<Customer, dynamic> _f$metadata =
      Field('metadata', _$metadata, opt: true);
  static String? _$riskAction(Customer v) => v.riskAction;
  static const Field<Customer, String> _f$riskAction =
      Field('riskAction', _$riskAction, key: r'risk_action', opt: true);

  @override
  final MappableFields<Customer> fields = const {
    #id: _f$id,
    #firstName: _f$firstName,
    #lastName: _f$lastName,
    #email: _f$email,
    #customerCode: _f$customerCode,
    #phone: _f$phone,
    #metadata: _f$metadata,
    #riskAction: _f$riskAction,
  };

  static Customer _instantiate(DecodingData data) {
    return Customer(
        id: data.dec(_f$id),
        firstName: data.dec(_f$firstName),
        lastName: data.dec(_f$lastName),
        email: data.dec(_f$email),
        customerCode: data.dec(_f$customerCode),
        phone: data.dec(_f$phone),
        metadata: data.dec(_f$metadata),
        riskAction: data.dec(_f$riskAction));
  }

  @override
  final Function instantiate = _instantiate;

  static Customer fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Customer>(map);
  }

  static Customer fromJson(String json) {
    return ensureInitialized().decodeJson<Customer>(json);
  }
}

mixin CustomerMappable {
  String toJson() {
    return CustomerMapper.ensureInitialized()
        .encodeJson<Customer>(this as Customer);
  }

  Map<String, dynamic> toMap() {
    return CustomerMapper.ensureInitialized()
        .encodeMap<Customer>(this as Customer);
  }

  CustomerCopyWith<Customer, Customer, Customer> get copyWith =>
      _CustomerCopyWithImpl<Customer, Customer>(
          this as Customer, $identity, $identity);
  @override
  String toString() {
    return CustomerMapper.ensureInitialized().stringifyValue(this as Customer);
  }

  @override
  bool operator ==(Object other) {
    return CustomerMapper.ensureInitialized()
        .equalsValue(this as Customer, other);
  }

  @override
  int get hashCode {
    return CustomerMapper.ensureInitialized().hashValue(this as Customer);
  }
}

extension CustomerValueCopy<$R, $Out> on ObjectCopyWith<$R, Customer, $Out> {
  CustomerCopyWith<$R, Customer, $Out> get $asCustomer =>
      $base.as((v, t, t2) => _CustomerCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CustomerCopyWith<$R, $In extends Customer, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? id,
      String? firstName,
      String? lastName,
      String? email,
      String? customerCode,
      String? phone,
      dynamic metadata,
      String? riskAction});
  CustomerCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CustomerCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Customer, $Out>
    implements CustomerCopyWith<$R, Customer, $Out> {
  _CustomerCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Customer> $mapper =
      CustomerMapper.ensureInitialized();
  @override
  $R call(
          {int? id,
          Object? firstName = $none,
          Object? lastName = $none,
          String? email,
          String? customerCode,
          Object? phone = $none,
          Object? metadata = $none,
          Object? riskAction = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (firstName != $none) #firstName: firstName,
        if (lastName != $none) #lastName: lastName,
        if (email != null) #email: email,
        if (customerCode != null) #customerCode: customerCode,
        if (phone != $none) #phone: phone,
        if (metadata != $none) #metadata: metadata,
        if (riskAction != $none) #riskAction: riskAction
      }));
  @override
  Customer $make(CopyWithData data) => Customer(
      id: data.get(#id, or: $value.id),
      firstName: data.get(#firstName, or: $value.firstName),
      lastName: data.get(#lastName, or: $value.lastName),
      email: data.get(#email, or: $value.email),
      customerCode: data.get(#customerCode, or: $value.customerCode),
      phone: data.get(#phone, or: $value.phone),
      metadata: data.get(#metadata, or: $value.metadata),
      riskAction: data.get(#riskAction, or: $value.riskAction));

  @override
  CustomerCopyWith<$R2, Customer, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CustomerCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
