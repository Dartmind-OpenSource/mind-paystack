// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'charge_authorization_options.dart';

class ChargeAuthorizationOptionsMapper
    extends ClassMapperBase<ChargeAuthorizationOptions> {
  ChargeAuthorizationOptionsMapper._();

  static ChargeAuthorizationOptionsMapper? _instance;
  static ChargeAuthorizationOptionsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ChargeAuthorizationOptionsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ChargeAuthorizationOptions';

  static String _$email(ChargeAuthorizationOptions v) => v.email;
  static const Field<ChargeAuthorizationOptions, String> _f$email =
      Field('email', _$email);
  static String _$amount(ChargeAuthorizationOptions v) => v.amount;
  static const Field<ChargeAuthorizationOptions, String> _f$amount =
      Field('amount', _$amount);
  static String _$authorizationCode(ChargeAuthorizationOptions v) =>
      v.authorizationCode;
  static const Field<ChargeAuthorizationOptions, String> _f$authorizationCode =
      Field('authorizationCode', _$authorizationCode);
  static String? _$reference(ChargeAuthorizationOptions v) => v.reference;
  static const Field<ChargeAuthorizationOptions, String> _f$reference =
      Field('reference', _$reference, opt: true);
  static String? _$currency(ChargeAuthorizationOptions v) => v.currency;
  static const Field<ChargeAuthorizationOptions, String> _f$currency =
      Field('currency', _$currency, opt: true);
  static Map<String, dynamic>? _$metadata(ChargeAuthorizationOptions v) =>
      v.metadata;
  static const Field<ChargeAuthorizationOptions, Map<String, dynamic>>
      _f$metadata = Field('metadata', _$metadata, opt: true);
  static List<String>? _$channels(ChargeAuthorizationOptions v) => v.channels;
  static const Field<ChargeAuthorizationOptions, List<String>> _f$channels =
      Field('channels', _$channels, opt: true);
  static String? _$subaccount(ChargeAuthorizationOptions v) => v.subaccount;
  static const Field<ChargeAuthorizationOptions, String> _f$subaccount =
      Field('subaccount', _$subaccount, opt: true);
  static int? _$transactionCharge(ChargeAuthorizationOptions v) =>
      v.transactionCharge;
  static const Field<ChargeAuthorizationOptions, int> _f$transactionCharge =
      Field('transactionCharge', _$transactionCharge, opt: true);
  static String? _$bearer(ChargeAuthorizationOptions v) => v.bearer;
  static const Field<ChargeAuthorizationOptions, String> _f$bearer =
      Field('bearer', _$bearer, opt: true);
  static bool? _$queue(ChargeAuthorizationOptions v) => v.queue;
  static const Field<ChargeAuthorizationOptions, bool> _f$queue =
      Field('queue', _$queue, opt: true);

  @override
  final MappableFields<ChargeAuthorizationOptions> fields = const {
    #email: _f$email,
    #amount: _f$amount,
    #authorizationCode: _f$authorizationCode,
    #reference: _f$reference,
    #currency: _f$currency,
    #metadata: _f$metadata,
    #channels: _f$channels,
    #subaccount: _f$subaccount,
    #transactionCharge: _f$transactionCharge,
    #bearer: _f$bearer,
    #queue: _f$queue,
  };

  static ChargeAuthorizationOptions _instantiate(DecodingData data) {
    return ChargeAuthorizationOptions(
        email: data.dec(_f$email),
        amount: data.dec(_f$amount),
        authorizationCode: data.dec(_f$authorizationCode),
        reference: data.dec(_f$reference),
        currency: data.dec(_f$currency),
        metadata: data.dec(_f$metadata),
        channels: data.dec(_f$channels),
        subaccount: data.dec(_f$subaccount),
        transactionCharge: data.dec(_f$transactionCharge),
        bearer: data.dec(_f$bearer),
        queue: data.dec(_f$queue));
  }

  @override
  final Function instantiate = _instantiate;

  static ChargeAuthorizationOptions fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ChargeAuthorizationOptions>(map);
  }

  static ChargeAuthorizationOptions fromJson(String json) {
    return ensureInitialized().decodeJson<ChargeAuthorizationOptions>(json);
  }
}

mixin ChargeAuthorizationOptionsMappable {
  String toJson() {
    return ChargeAuthorizationOptionsMapper.ensureInitialized()
        .encodeJson<ChargeAuthorizationOptions>(
            this as ChargeAuthorizationOptions);
  }

  Map<String, dynamic> toMap() {
    return ChargeAuthorizationOptionsMapper.ensureInitialized()
        .encodeMap<ChargeAuthorizationOptions>(
            this as ChargeAuthorizationOptions);
  }

  ChargeAuthorizationOptionsCopyWith<ChargeAuthorizationOptions,
          ChargeAuthorizationOptions, ChargeAuthorizationOptions>
      get copyWith => _ChargeAuthorizationOptionsCopyWithImpl<
              ChargeAuthorizationOptions, ChargeAuthorizationOptions>(
          this as ChargeAuthorizationOptions, $identity, $identity);
  @override
  String toString() {
    return ChargeAuthorizationOptionsMapper.ensureInitialized()
        .stringifyValue(this as ChargeAuthorizationOptions);
  }

  @override
  bool operator ==(Object other) {
    return ChargeAuthorizationOptionsMapper.ensureInitialized()
        .equalsValue(this as ChargeAuthorizationOptions, other);
  }

  @override
  int get hashCode {
    return ChargeAuthorizationOptionsMapper.ensureInitialized()
        .hashValue(this as ChargeAuthorizationOptions);
  }
}

extension ChargeAuthorizationOptionsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ChargeAuthorizationOptions, $Out> {
  ChargeAuthorizationOptionsCopyWith<$R, ChargeAuthorizationOptions, $Out>
      get $asChargeAuthorizationOptions => $base.as((v, t, t2) =>
          _ChargeAuthorizationOptionsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ChargeAuthorizationOptionsCopyWith<
    $R,
    $In extends ChargeAuthorizationOptions,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
      get metadata;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get channels;
  $R call(
      {String? email,
      String? amount,
      String? authorizationCode,
      String? reference,
      String? currency,
      Map<String, dynamic>? metadata,
      List<String>? channels,
      String? subaccount,
      int? transactionCharge,
      String? bearer,
      bool? queue});
  ChargeAuthorizationOptionsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ChargeAuthorizationOptionsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ChargeAuthorizationOptions, $Out>
    implements
        ChargeAuthorizationOptionsCopyWith<$R, ChargeAuthorizationOptions,
            $Out> {
  _ChargeAuthorizationOptionsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ChargeAuthorizationOptions> $mapper =
      ChargeAuthorizationOptionsMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
      get metadata => $value.metadata != null
          ? MapCopyWith(
              $value.metadata!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(metadata: v))
          : null;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get channels =>
      $value.channels != null
          ? ListCopyWith(
              $value.channels!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(channels: v))
          : null;
  @override
  $R call(
          {String? email,
          String? amount,
          String? authorizationCode,
          Object? reference = $none,
          Object? currency = $none,
          Object? metadata = $none,
          Object? channels = $none,
          Object? subaccount = $none,
          Object? transactionCharge = $none,
          Object? bearer = $none,
          Object? queue = $none}) =>
      $apply(FieldCopyWithData({
        if (email != null) #email: email,
        if (amount != null) #amount: amount,
        if (authorizationCode != null) #authorizationCode: authorizationCode,
        if (reference != $none) #reference: reference,
        if (currency != $none) #currency: currency,
        if (metadata != $none) #metadata: metadata,
        if (channels != $none) #channels: channels,
        if (subaccount != $none) #subaccount: subaccount,
        if (transactionCharge != $none) #transactionCharge: transactionCharge,
        if (bearer != $none) #bearer: bearer,
        if (queue != $none) #queue: queue
      }));
  @override
  ChargeAuthorizationOptions $make(
          CopyWithData data) =>
      ChargeAuthorizationOptions(
          email: data.get(#email, or: $value.email),
          amount: data.get(#amount, or: $value.amount),
          authorizationCode:
              data.get(#authorizationCode, or: $value.authorizationCode),
          reference: data.get(#reference, or: $value.reference),
          currency: data.get(#currency, or: $value.currency),
          metadata: data.get(#metadata, or: $value.metadata),
          channels: data.get(#channels, or: $value.channels),
          subaccount: data.get(#subaccount, or: $value.subaccount),
          transactionCharge:
              data.get(#transactionCharge, or: $value.transactionCharge),
          bearer: data.get(#bearer, or: $value.bearer),
          queue: data.get(#queue, or: $value.queue));

  @override
  ChargeAuthorizationOptionsCopyWith<$R2, ChargeAuthorizationOptions, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ChargeAuthorizationOptionsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
