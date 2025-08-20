// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'initialize_transaction_options.dart';

class InitializeTransactionOptionsMapper
    extends ClassMapperBase<InitializeTransactionOptions> {
  InitializeTransactionOptionsMapper._();

  static InitializeTransactionOptionsMapper? _instance;
  static InitializeTransactionOptionsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = InitializeTransactionOptionsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'InitializeTransactionOptions';

  static String _$email(InitializeTransactionOptions v) => v.email;
  static const Field<InitializeTransactionOptions, String> _f$email =
      Field('email', _$email);
  static String _$amount(InitializeTransactionOptions v) => v.amount;
  static const Field<InitializeTransactionOptions, String> _f$amount =
      Field('amount', _$amount);
  static String? _$currency(InitializeTransactionOptions v) => v.currency;
  static const Field<InitializeTransactionOptions, String> _f$currency =
      Field('currency', _$currency, opt: true);
  static String? _$reference(InitializeTransactionOptions v) => v.reference;
  static const Field<InitializeTransactionOptions, String> _f$reference =
      Field('reference', _$reference, opt: true);
  static String? _$callbackUrl(InitializeTransactionOptions v) => v.callbackUrl;
  static const Field<InitializeTransactionOptions, String> _f$callbackUrl =
      Field('callbackUrl', _$callbackUrl, key: r'callback_url', opt: true);
  static String? _$plan(InitializeTransactionOptions v) => v.plan;
  static const Field<InitializeTransactionOptions, String> _f$plan =
      Field('plan', _$plan, opt: true);
  static int? _$invoiceLimit(InitializeTransactionOptions v) => v.invoiceLimit;
  static const Field<InitializeTransactionOptions, int> _f$invoiceLimit =
      Field('invoiceLimit', _$invoiceLimit, key: r'invoice_limit', opt: true);
  static Map<String, dynamic>? _$metadata(InitializeTransactionOptions v) =>
      v.metadata;
  static const Field<InitializeTransactionOptions, Map<String, dynamic>>
      _f$metadata = Field('metadata', _$metadata, opt: true);
  static List<String>? _$channels(InitializeTransactionOptions v) => v.channels;
  static const Field<InitializeTransactionOptions, List<String>> _f$channels =
      Field('channels', _$channels, opt: true);
  static String? _$splitCode(InitializeTransactionOptions v) => v.splitCode;
  static const Field<InitializeTransactionOptions, String> _f$splitCode =
      Field('splitCode', _$splitCode, key: r'split_code', opt: true);
  static String? _$subaccount(InitializeTransactionOptions v) => v.subaccount;
  static const Field<InitializeTransactionOptions, String> _f$subaccount =
      Field('subaccount', _$subaccount, opt: true);
  static int? _$transactionCharge(InitializeTransactionOptions v) =>
      v.transactionCharge;
  static const Field<InitializeTransactionOptions, int> _f$transactionCharge =
      Field('transactionCharge', _$transactionCharge,
          key: r'transaction_charge', opt: true);
  static String? _$bearer(InitializeTransactionOptions v) => v.bearer;
  static const Field<InitializeTransactionOptions, String> _f$bearer =
      Field('bearer', _$bearer, opt: true);

  @override
  final MappableFields<InitializeTransactionOptions> fields = const {
    #email: _f$email,
    #amount: _f$amount,
    #currency: _f$currency,
    #reference: _f$reference,
    #callbackUrl: _f$callbackUrl,
    #plan: _f$plan,
    #invoiceLimit: _f$invoiceLimit,
    #metadata: _f$metadata,
    #channels: _f$channels,
    #splitCode: _f$splitCode,
    #subaccount: _f$subaccount,
    #transactionCharge: _f$transactionCharge,
    #bearer: _f$bearer,
  };

  static InitializeTransactionOptions _instantiate(DecodingData data) {
    return InitializeTransactionOptions(
        email: data.dec(_f$email),
        amount: data.dec(_f$amount),
        currency: data.dec(_f$currency),
        reference: data.dec(_f$reference),
        callbackUrl: data.dec(_f$callbackUrl),
        plan: data.dec(_f$plan),
        invoiceLimit: data.dec(_f$invoiceLimit),
        metadata: data.dec(_f$metadata),
        channels: data.dec(_f$channels),
        splitCode: data.dec(_f$splitCode),
        subaccount: data.dec(_f$subaccount),
        transactionCharge: data.dec(_f$transactionCharge),
        bearer: data.dec(_f$bearer));
  }

  @override
  final Function instantiate = _instantiate;

  static InitializeTransactionOptions fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<InitializeTransactionOptions>(map);
  }

  static InitializeTransactionOptions fromJson(String json) {
    return ensureInitialized().decodeJson<InitializeTransactionOptions>(json);
  }
}

mixin InitializeTransactionOptionsMappable {
  String toJson() {
    return InitializeTransactionOptionsMapper.ensureInitialized()
        .encodeJson<InitializeTransactionOptions>(
            this as InitializeTransactionOptions);
  }

  Map<String, dynamic> toMap() {
    return InitializeTransactionOptionsMapper.ensureInitialized()
        .encodeMap<InitializeTransactionOptions>(
            this as InitializeTransactionOptions);
  }

  InitializeTransactionOptionsCopyWith<InitializeTransactionOptions,
          InitializeTransactionOptions, InitializeTransactionOptions>
      get copyWith => _InitializeTransactionOptionsCopyWithImpl<
              InitializeTransactionOptions, InitializeTransactionOptions>(
          this as InitializeTransactionOptions, $identity, $identity);
  @override
  String toString() {
    return InitializeTransactionOptionsMapper.ensureInitialized()
        .stringifyValue(this as InitializeTransactionOptions);
  }

  @override
  bool operator ==(Object other) {
    return InitializeTransactionOptionsMapper.ensureInitialized()
        .equalsValue(this as InitializeTransactionOptions, other);
  }

  @override
  int get hashCode {
    return InitializeTransactionOptionsMapper.ensureInitialized()
        .hashValue(this as InitializeTransactionOptions);
  }
}

extension InitializeTransactionOptionsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, InitializeTransactionOptions, $Out> {
  InitializeTransactionOptionsCopyWith<$R, InitializeTransactionOptions, $Out>
      get $asInitializeTransactionOptions => $base.as((v, t, t2) =>
          _InitializeTransactionOptionsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class InitializeTransactionOptionsCopyWith<
    $R,
    $In extends InitializeTransactionOptions,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
      get metadata;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get channels;
  $R call(
      {String? email,
      String? amount,
      String? currency,
      String? reference,
      String? callbackUrl,
      String? plan,
      int? invoiceLimit,
      Map<String, dynamic>? metadata,
      List<String>? channels,
      String? splitCode,
      String? subaccount,
      int? transactionCharge,
      String? bearer});
  InitializeTransactionOptionsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _InitializeTransactionOptionsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, InitializeTransactionOptions, $Out>
    implements
        InitializeTransactionOptionsCopyWith<$R, InitializeTransactionOptions,
            $Out> {
  _InitializeTransactionOptionsCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<InitializeTransactionOptions> $mapper =
      InitializeTransactionOptionsMapper.ensureInitialized();
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
          Object? currency = $none,
          Object? reference = $none,
          Object? callbackUrl = $none,
          Object? plan = $none,
          Object? invoiceLimit = $none,
          Object? metadata = $none,
          Object? channels = $none,
          Object? splitCode = $none,
          Object? subaccount = $none,
          Object? transactionCharge = $none,
          Object? bearer = $none}) =>
      $apply(FieldCopyWithData({
        if (email != null) #email: email,
        if (amount != null) #amount: amount,
        if (currency != $none) #currency: currency,
        if (reference != $none) #reference: reference,
        if (callbackUrl != $none) #callbackUrl: callbackUrl,
        if (plan != $none) #plan: plan,
        if (invoiceLimit != $none) #invoiceLimit: invoiceLimit,
        if (metadata != $none) #metadata: metadata,
        if (channels != $none) #channels: channels,
        if (splitCode != $none) #splitCode: splitCode,
        if (subaccount != $none) #subaccount: subaccount,
        if (transactionCharge != $none) #transactionCharge: transactionCharge,
        if (bearer != $none) #bearer: bearer
      }));
  @override
  InitializeTransactionOptions $make(CopyWithData data) =>
      InitializeTransactionOptions(
          email: data.get(#email, or: $value.email),
          amount: data.get(#amount, or: $value.amount),
          currency: data.get(#currency, or: $value.currency),
          reference: data.get(#reference, or: $value.reference),
          callbackUrl: data.get(#callbackUrl, or: $value.callbackUrl),
          plan: data.get(#plan, or: $value.plan),
          invoiceLimit: data.get(#invoiceLimit, or: $value.invoiceLimit),
          metadata: data.get(#metadata, or: $value.metadata),
          channels: data.get(#channels, or: $value.channels),
          splitCode: data.get(#splitCode, or: $value.splitCode),
          subaccount: data.get(#subaccount, or: $value.subaccount),
          transactionCharge:
              data.get(#transactionCharge, or: $value.transactionCharge),
          bearer: data.get(#bearer, or: $value.bearer));

  @override
  InitializeTransactionOptionsCopyWith<$R2, InitializeTransactionOptions, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _InitializeTransactionOptionsCopyWithImpl<$R2, $Out2>(
              $value, $cast, t);
}
