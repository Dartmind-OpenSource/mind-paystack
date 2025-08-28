// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'submit_charge_options.dart';

class SubmitChargeOptionsMapper extends ClassMapperBase<SubmitChargeOptions> {
  SubmitChargeOptionsMapper._();

  static SubmitChargeOptionsMapper? _instance;
  static SubmitChargeOptionsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SubmitChargeOptionsMapper._());
      SubmitPinOptionsMapper.ensureInitialized();
      SubmitOtpOptionsMapper.ensureInitialized();
      SubmitPhoneOptionsMapper.ensureInitialized();
      SubmitBirthdayOptionsMapper.ensureInitialized();
      SubmitAddressOptionsMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SubmitChargeOptions';

  @override
  final MappableFields<SubmitChargeOptions> fields = const {};

  static SubmitChargeOptions _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'SubmitChargeOptions', 'type', '${data.value['type']}');
  }

  @override
  final Function instantiate = _instantiate;

  static SubmitChargeOptions fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SubmitChargeOptions>(map);
  }

  static SubmitChargeOptions fromJson(String json) {
    return ensureInitialized().decodeJson<SubmitChargeOptions>(json);
  }
}

mixin SubmitChargeOptionsMappable {
  String toJson();
  Map<String, dynamic> toMap();
  SubmitChargeOptionsCopyWith<SubmitChargeOptions, SubmitChargeOptions,
      SubmitChargeOptions> get copyWith;
}

abstract class SubmitChargeOptionsCopyWith<$R, $In extends SubmitChargeOptions,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  SubmitChargeOptionsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class SubmitPinOptionsMapper extends SubClassMapperBase<SubmitPinOptions> {
  SubmitPinOptionsMapper._();

  static SubmitPinOptionsMapper? _instance;
  static SubmitPinOptionsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SubmitPinOptionsMapper._());
      SubmitChargeOptionsMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'SubmitPinOptions';

  static String _$pin(SubmitPinOptions v) => v.pin;
  static const Field<SubmitPinOptions, String> _f$pin = Field('pin', _$pin);
  static String _$reference(SubmitPinOptions v) => v.reference;
  static const Field<SubmitPinOptions, String> _f$reference =
      Field('reference', _$reference);

  @override
  final MappableFields<SubmitPinOptions> fields = const {
    #pin: _f$pin,
    #reference: _f$reference,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'SubmitPinOptions';
  @override
  late final ClassMapperBase superMapper =
      SubmitChargeOptionsMapper.ensureInitialized();

  static SubmitPinOptions _instantiate(DecodingData data) {
    return SubmitPinOptions(
        pin: data.dec(_f$pin), reference: data.dec(_f$reference));
  }

  @override
  final Function instantiate = _instantiate;

  static SubmitPinOptions fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SubmitPinOptions>(map);
  }

  static SubmitPinOptions fromJson(String json) {
    return ensureInitialized().decodeJson<SubmitPinOptions>(json);
  }
}

mixin SubmitPinOptionsMappable {
  String toJson() {
    return SubmitPinOptionsMapper.ensureInitialized()
        .encodeJson<SubmitPinOptions>(this as SubmitPinOptions);
  }

  Map<String, dynamic> toMap() {
    return SubmitPinOptionsMapper.ensureInitialized()
        .encodeMap<SubmitPinOptions>(this as SubmitPinOptions);
  }

  SubmitPinOptionsCopyWith<SubmitPinOptions, SubmitPinOptions, SubmitPinOptions>
      get copyWith =>
          _SubmitPinOptionsCopyWithImpl<SubmitPinOptions, SubmitPinOptions>(
              this as SubmitPinOptions, $identity, $identity);
  @override
  String toString() {
    return SubmitPinOptionsMapper.ensureInitialized()
        .stringifyValue(this as SubmitPinOptions);
  }

  @override
  bool operator ==(Object other) {
    return SubmitPinOptionsMapper.ensureInitialized()
        .equalsValue(this as SubmitPinOptions, other);
  }

  @override
  int get hashCode {
    return SubmitPinOptionsMapper.ensureInitialized()
        .hashValue(this as SubmitPinOptions);
  }
}

extension SubmitPinOptionsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SubmitPinOptions, $Out> {
  SubmitPinOptionsCopyWith<$R, SubmitPinOptions, $Out>
      get $asSubmitPinOptions => $base
          .as((v, t, t2) => _SubmitPinOptionsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SubmitPinOptionsCopyWith<$R, $In extends SubmitPinOptions, $Out>
    implements SubmitChargeOptionsCopyWith<$R, $In, $Out> {
  @override
  $R call({String? pin, String? reference});
  SubmitPinOptionsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SubmitPinOptionsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SubmitPinOptions, $Out>
    implements SubmitPinOptionsCopyWith<$R, SubmitPinOptions, $Out> {
  _SubmitPinOptionsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SubmitPinOptions> $mapper =
      SubmitPinOptionsMapper.ensureInitialized();
  @override
  $R call({String? pin, String? reference}) => $apply(FieldCopyWithData({
        if (pin != null) #pin: pin,
        if (reference != null) #reference: reference
      }));
  @override
  SubmitPinOptions $make(CopyWithData data) => SubmitPinOptions(
      pin: data.get(#pin, or: $value.pin),
      reference: data.get(#reference, or: $value.reference));

  @override
  SubmitPinOptionsCopyWith<$R2, SubmitPinOptions, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SubmitPinOptionsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class SubmitOtpOptionsMapper extends SubClassMapperBase<SubmitOtpOptions> {
  SubmitOtpOptionsMapper._();

  static SubmitOtpOptionsMapper? _instance;
  static SubmitOtpOptionsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SubmitOtpOptionsMapper._());
      SubmitChargeOptionsMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'SubmitOtpOptions';

  static String _$otp(SubmitOtpOptions v) => v.otp;
  static const Field<SubmitOtpOptions, String> _f$otp = Field('otp', _$otp);
  static String _$reference(SubmitOtpOptions v) => v.reference;
  static const Field<SubmitOtpOptions, String> _f$reference =
      Field('reference', _$reference);

  @override
  final MappableFields<SubmitOtpOptions> fields = const {
    #otp: _f$otp,
    #reference: _f$reference,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'SubmitOtpOptions';
  @override
  late final ClassMapperBase superMapper =
      SubmitChargeOptionsMapper.ensureInitialized();

  static SubmitOtpOptions _instantiate(DecodingData data) {
    return SubmitOtpOptions(
        otp: data.dec(_f$otp), reference: data.dec(_f$reference));
  }

  @override
  final Function instantiate = _instantiate;

  static SubmitOtpOptions fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SubmitOtpOptions>(map);
  }

  static SubmitOtpOptions fromJson(String json) {
    return ensureInitialized().decodeJson<SubmitOtpOptions>(json);
  }
}

mixin SubmitOtpOptionsMappable {
  String toJson() {
    return SubmitOtpOptionsMapper.ensureInitialized()
        .encodeJson<SubmitOtpOptions>(this as SubmitOtpOptions);
  }

  Map<String, dynamic> toMap() {
    return SubmitOtpOptionsMapper.ensureInitialized()
        .encodeMap<SubmitOtpOptions>(this as SubmitOtpOptions);
  }

  SubmitOtpOptionsCopyWith<SubmitOtpOptions, SubmitOtpOptions, SubmitOtpOptions>
      get copyWith =>
          _SubmitOtpOptionsCopyWithImpl<SubmitOtpOptions, SubmitOtpOptions>(
              this as SubmitOtpOptions, $identity, $identity);
  @override
  String toString() {
    return SubmitOtpOptionsMapper.ensureInitialized()
        .stringifyValue(this as SubmitOtpOptions);
  }

  @override
  bool operator ==(Object other) {
    return SubmitOtpOptionsMapper.ensureInitialized()
        .equalsValue(this as SubmitOtpOptions, other);
  }

  @override
  int get hashCode {
    return SubmitOtpOptionsMapper.ensureInitialized()
        .hashValue(this as SubmitOtpOptions);
  }
}

extension SubmitOtpOptionsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SubmitOtpOptions, $Out> {
  SubmitOtpOptionsCopyWith<$R, SubmitOtpOptions, $Out>
      get $asSubmitOtpOptions => $base
          .as((v, t, t2) => _SubmitOtpOptionsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SubmitOtpOptionsCopyWith<$R, $In extends SubmitOtpOptions, $Out>
    implements SubmitChargeOptionsCopyWith<$R, $In, $Out> {
  @override
  $R call({String? otp, String? reference});
  SubmitOtpOptionsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SubmitOtpOptionsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SubmitOtpOptions, $Out>
    implements SubmitOtpOptionsCopyWith<$R, SubmitOtpOptions, $Out> {
  _SubmitOtpOptionsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SubmitOtpOptions> $mapper =
      SubmitOtpOptionsMapper.ensureInitialized();
  @override
  $R call({String? otp, String? reference}) => $apply(FieldCopyWithData({
        if (otp != null) #otp: otp,
        if (reference != null) #reference: reference
      }));
  @override
  SubmitOtpOptions $make(CopyWithData data) => SubmitOtpOptions(
      otp: data.get(#otp, or: $value.otp),
      reference: data.get(#reference, or: $value.reference));

  @override
  SubmitOtpOptionsCopyWith<$R2, SubmitOtpOptions, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SubmitOtpOptionsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class SubmitPhoneOptionsMapper extends SubClassMapperBase<SubmitPhoneOptions> {
  SubmitPhoneOptionsMapper._();

  static SubmitPhoneOptionsMapper? _instance;
  static SubmitPhoneOptionsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SubmitPhoneOptionsMapper._());
      SubmitChargeOptionsMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'SubmitPhoneOptions';

  static String _$phone(SubmitPhoneOptions v) => v.phone;
  static const Field<SubmitPhoneOptions, String> _f$phone =
      Field('phone', _$phone);
  static String _$reference(SubmitPhoneOptions v) => v.reference;
  static const Field<SubmitPhoneOptions, String> _f$reference =
      Field('reference', _$reference);

  @override
  final MappableFields<SubmitPhoneOptions> fields = const {
    #phone: _f$phone,
    #reference: _f$reference,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'SubmitPhoneOptions';
  @override
  late final ClassMapperBase superMapper =
      SubmitChargeOptionsMapper.ensureInitialized();

  static SubmitPhoneOptions _instantiate(DecodingData data) {
    return SubmitPhoneOptions(
        phone: data.dec(_f$phone), reference: data.dec(_f$reference));
  }

  @override
  final Function instantiate = _instantiate;

  static SubmitPhoneOptions fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SubmitPhoneOptions>(map);
  }

  static SubmitPhoneOptions fromJson(String json) {
    return ensureInitialized().decodeJson<SubmitPhoneOptions>(json);
  }
}

mixin SubmitPhoneOptionsMappable {
  String toJson() {
    return SubmitPhoneOptionsMapper.ensureInitialized()
        .encodeJson<SubmitPhoneOptions>(this as SubmitPhoneOptions);
  }

  Map<String, dynamic> toMap() {
    return SubmitPhoneOptionsMapper.ensureInitialized()
        .encodeMap<SubmitPhoneOptions>(this as SubmitPhoneOptions);
  }

  SubmitPhoneOptionsCopyWith<SubmitPhoneOptions, SubmitPhoneOptions,
          SubmitPhoneOptions>
      get copyWith => _SubmitPhoneOptionsCopyWithImpl<SubmitPhoneOptions,
          SubmitPhoneOptions>(this as SubmitPhoneOptions, $identity, $identity);
  @override
  String toString() {
    return SubmitPhoneOptionsMapper.ensureInitialized()
        .stringifyValue(this as SubmitPhoneOptions);
  }

  @override
  bool operator ==(Object other) {
    return SubmitPhoneOptionsMapper.ensureInitialized()
        .equalsValue(this as SubmitPhoneOptions, other);
  }

  @override
  int get hashCode {
    return SubmitPhoneOptionsMapper.ensureInitialized()
        .hashValue(this as SubmitPhoneOptions);
  }
}

extension SubmitPhoneOptionsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SubmitPhoneOptions, $Out> {
  SubmitPhoneOptionsCopyWith<$R, SubmitPhoneOptions, $Out>
      get $asSubmitPhoneOptions => $base.as(
          (v, t, t2) => _SubmitPhoneOptionsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SubmitPhoneOptionsCopyWith<$R, $In extends SubmitPhoneOptions,
    $Out> implements SubmitChargeOptionsCopyWith<$R, $In, $Out> {
  @override
  $R call({String? phone, String? reference});
  SubmitPhoneOptionsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SubmitPhoneOptionsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SubmitPhoneOptions, $Out>
    implements SubmitPhoneOptionsCopyWith<$R, SubmitPhoneOptions, $Out> {
  _SubmitPhoneOptionsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SubmitPhoneOptions> $mapper =
      SubmitPhoneOptionsMapper.ensureInitialized();
  @override
  $R call({String? phone, String? reference}) => $apply(FieldCopyWithData({
        if (phone != null) #phone: phone,
        if (reference != null) #reference: reference
      }));
  @override
  SubmitPhoneOptions $make(CopyWithData data) => SubmitPhoneOptions(
      phone: data.get(#phone, or: $value.phone),
      reference: data.get(#reference, or: $value.reference));

  @override
  SubmitPhoneOptionsCopyWith<$R2, SubmitPhoneOptions, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SubmitPhoneOptionsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class SubmitBirthdayOptionsMapper
    extends SubClassMapperBase<SubmitBirthdayOptions> {
  SubmitBirthdayOptionsMapper._();

  static SubmitBirthdayOptionsMapper? _instance;
  static SubmitBirthdayOptionsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SubmitBirthdayOptionsMapper._());
      SubmitChargeOptionsMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'SubmitBirthdayOptions';

  static String _$birthday(SubmitBirthdayOptions v) => v.birthday;
  static const Field<SubmitBirthdayOptions, String> _f$birthday =
      Field('birthday', _$birthday);
  static String _$reference(SubmitBirthdayOptions v) => v.reference;
  static const Field<SubmitBirthdayOptions, String> _f$reference =
      Field('reference', _$reference);

  @override
  final MappableFields<SubmitBirthdayOptions> fields = const {
    #birthday: _f$birthday,
    #reference: _f$reference,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'SubmitBirthdayOptions';
  @override
  late final ClassMapperBase superMapper =
      SubmitChargeOptionsMapper.ensureInitialized();

  static SubmitBirthdayOptions _instantiate(DecodingData data) {
    return SubmitBirthdayOptions(
        birthday: data.dec(_f$birthday), reference: data.dec(_f$reference));
  }

  @override
  final Function instantiate = _instantiate;

  static SubmitBirthdayOptions fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SubmitBirthdayOptions>(map);
  }

  static SubmitBirthdayOptions fromJson(String json) {
    return ensureInitialized().decodeJson<SubmitBirthdayOptions>(json);
  }
}

mixin SubmitBirthdayOptionsMappable {
  String toJson() {
    return SubmitBirthdayOptionsMapper.ensureInitialized()
        .encodeJson<SubmitBirthdayOptions>(this as SubmitBirthdayOptions);
  }

  Map<String, dynamic> toMap() {
    return SubmitBirthdayOptionsMapper.ensureInitialized()
        .encodeMap<SubmitBirthdayOptions>(this as SubmitBirthdayOptions);
  }

  SubmitBirthdayOptionsCopyWith<SubmitBirthdayOptions, SubmitBirthdayOptions,
      SubmitBirthdayOptions> get copyWith => _SubmitBirthdayOptionsCopyWithImpl<
          SubmitBirthdayOptions, SubmitBirthdayOptions>(
      this as SubmitBirthdayOptions, $identity, $identity);
  @override
  String toString() {
    return SubmitBirthdayOptionsMapper.ensureInitialized()
        .stringifyValue(this as SubmitBirthdayOptions);
  }

  @override
  bool operator ==(Object other) {
    return SubmitBirthdayOptionsMapper.ensureInitialized()
        .equalsValue(this as SubmitBirthdayOptions, other);
  }

  @override
  int get hashCode {
    return SubmitBirthdayOptionsMapper.ensureInitialized()
        .hashValue(this as SubmitBirthdayOptions);
  }
}

extension SubmitBirthdayOptionsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SubmitBirthdayOptions, $Out> {
  SubmitBirthdayOptionsCopyWith<$R, SubmitBirthdayOptions, $Out>
      get $asSubmitBirthdayOptions => $base.as(
          (v, t, t2) => _SubmitBirthdayOptionsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SubmitBirthdayOptionsCopyWith<
    $R,
    $In extends SubmitBirthdayOptions,
    $Out> implements SubmitChargeOptionsCopyWith<$R, $In, $Out> {
  @override
  $R call({String? birthday, String? reference});
  SubmitBirthdayOptionsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SubmitBirthdayOptionsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SubmitBirthdayOptions, $Out>
    implements SubmitBirthdayOptionsCopyWith<$R, SubmitBirthdayOptions, $Out> {
  _SubmitBirthdayOptionsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SubmitBirthdayOptions> $mapper =
      SubmitBirthdayOptionsMapper.ensureInitialized();
  @override
  $R call({String? birthday, String? reference}) => $apply(FieldCopyWithData({
        if (birthday != null) #birthday: birthday,
        if (reference != null) #reference: reference
      }));
  @override
  SubmitBirthdayOptions $make(CopyWithData data) => SubmitBirthdayOptions(
      birthday: data.get(#birthday, or: $value.birthday),
      reference: data.get(#reference, or: $value.reference));

  @override
  SubmitBirthdayOptionsCopyWith<$R2, SubmitBirthdayOptions, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _SubmitBirthdayOptionsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class SubmitAddressOptionsMapper
    extends SubClassMapperBase<SubmitAddressOptions> {
  SubmitAddressOptionsMapper._();

  static SubmitAddressOptionsMapper? _instance;
  static SubmitAddressOptionsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SubmitAddressOptionsMapper._());
      SubmitChargeOptionsMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'SubmitAddressOptions';

  static String _$address(SubmitAddressOptions v) => v.address;
  static const Field<SubmitAddressOptions, String> _f$address =
      Field('address', _$address);
  static String _$reference(SubmitAddressOptions v) => v.reference;
  static const Field<SubmitAddressOptions, String> _f$reference =
      Field('reference', _$reference);
  static String _$city(SubmitAddressOptions v) => v.city;
  static const Field<SubmitAddressOptions, String> _f$city =
      Field('city', _$city);
  static String _$state(SubmitAddressOptions v) => v.state;
  static const Field<SubmitAddressOptions, String> _f$state =
      Field('state', _$state);
  static String _$zipcode(SubmitAddressOptions v) => v.zipcode;
  static const Field<SubmitAddressOptions, String> _f$zipcode =
      Field('zipcode', _$zipcode);

  @override
  final MappableFields<SubmitAddressOptions> fields = const {
    #address: _f$address,
    #reference: _f$reference,
    #city: _f$city,
    #state: _f$state,
    #zipcode: _f$zipcode,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'SubmitAddressOptions';
  @override
  late final ClassMapperBase superMapper =
      SubmitChargeOptionsMapper.ensureInitialized();

  static SubmitAddressOptions _instantiate(DecodingData data) {
    return SubmitAddressOptions(
        address: data.dec(_f$address),
        reference: data.dec(_f$reference),
        city: data.dec(_f$city),
        state: data.dec(_f$state),
        zipcode: data.dec(_f$zipcode));
  }

  @override
  final Function instantiate = _instantiate;

  static SubmitAddressOptions fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SubmitAddressOptions>(map);
  }

  static SubmitAddressOptions fromJson(String json) {
    return ensureInitialized().decodeJson<SubmitAddressOptions>(json);
  }
}

mixin SubmitAddressOptionsMappable {
  String toJson() {
    return SubmitAddressOptionsMapper.ensureInitialized()
        .encodeJson<SubmitAddressOptions>(this as SubmitAddressOptions);
  }

  Map<String, dynamic> toMap() {
    return SubmitAddressOptionsMapper.ensureInitialized()
        .encodeMap<SubmitAddressOptions>(this as SubmitAddressOptions);
  }

  SubmitAddressOptionsCopyWith<SubmitAddressOptions, SubmitAddressOptions,
      SubmitAddressOptions> get copyWith => _SubmitAddressOptionsCopyWithImpl<
          SubmitAddressOptions, SubmitAddressOptions>(
      this as SubmitAddressOptions, $identity, $identity);
  @override
  String toString() {
    return SubmitAddressOptionsMapper.ensureInitialized()
        .stringifyValue(this as SubmitAddressOptions);
  }

  @override
  bool operator ==(Object other) {
    return SubmitAddressOptionsMapper.ensureInitialized()
        .equalsValue(this as SubmitAddressOptions, other);
  }

  @override
  int get hashCode {
    return SubmitAddressOptionsMapper.ensureInitialized()
        .hashValue(this as SubmitAddressOptions);
  }
}

extension SubmitAddressOptionsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SubmitAddressOptions, $Out> {
  SubmitAddressOptionsCopyWith<$R, SubmitAddressOptions, $Out>
      get $asSubmitAddressOptions => $base.as(
          (v, t, t2) => _SubmitAddressOptionsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SubmitAddressOptionsCopyWith<
    $R,
    $In extends SubmitAddressOptions,
    $Out> implements SubmitChargeOptionsCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {String? address,
      String? reference,
      String? city,
      String? state,
      String? zipcode});
  SubmitAddressOptionsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SubmitAddressOptionsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SubmitAddressOptions, $Out>
    implements SubmitAddressOptionsCopyWith<$R, SubmitAddressOptions, $Out> {
  _SubmitAddressOptionsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SubmitAddressOptions> $mapper =
      SubmitAddressOptionsMapper.ensureInitialized();
  @override
  $R call(
          {String? address,
          String? reference,
          String? city,
          String? state,
          String? zipcode}) =>
      $apply(FieldCopyWithData({
        if (address != null) #address: address,
        if (reference != null) #reference: reference,
        if (city != null) #city: city,
        if (state != null) #state: state,
        if (zipcode != null) #zipcode: zipcode
      }));
  @override
  SubmitAddressOptions $make(CopyWithData data) => SubmitAddressOptions(
      address: data.get(#address, or: $value.address),
      reference: data.get(#reference, or: $value.reference),
      city: data.get(#city, or: $value.city),
      state: data.get(#state, or: $value.state),
      zipcode: data.get(#zipcode, or: $value.zipcode));

  @override
  SubmitAddressOptionsCopyWith<$R2, SubmitAddressOptions, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _SubmitAddressOptionsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
