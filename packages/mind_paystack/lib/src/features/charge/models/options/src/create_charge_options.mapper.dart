// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'create_charge_options.dart';

class CreateChargeOptionsMapper extends ClassMapperBase<CreateChargeOptions> {
  CreateChargeOptionsMapper._();

  static CreateChargeOptionsMapper? _instance;
  static CreateChargeOptionsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CreateChargeOptionsMapper._());
      CardMapper.ensureInitialized();
      BankDetailsMapper.ensureInitialized();
      BankTransferMapper.ensureInitialized();
      UssdMapper.ensureInitialized();
      MobileMoneyMapper.ensureInitialized();
      QrMapper.ensureInitialized();
      PaymentMetadataMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CreateChargeOptions';

  static String _$email(CreateChargeOptions v) => v.email;
  static const Field<CreateChargeOptions, String> _f$email =
      Field('email', _$email);
  static String _$amount(CreateChargeOptions v) => v.amount;
  static const Field<CreateChargeOptions, String> _f$amount =
      Field('amount', _$amount);
  static String? _$splitCode(CreateChargeOptions v) => v.splitCode;
  static const Field<CreateChargeOptions, String> _f$splitCode =
      Field('splitCode', _$splitCode, opt: true);
  static String? _$subaccount(CreateChargeOptions v) => v.subaccount;
  static const Field<CreateChargeOptions, String> _f$subaccount =
      Field('subaccount', _$subaccount, opt: true);
  static int? _$transactionCharge(CreateChargeOptions v) => v.transactionCharge;
  static const Field<CreateChargeOptions, int> _f$transactionCharge =
      Field('transactionCharge', _$transactionCharge, opt: true);
  static String? _$bearer(CreateChargeOptions v) => v.bearer;
  static const Field<CreateChargeOptions, String> _f$bearer =
      Field('bearer', _$bearer, opt: true);
  static Card? _$card(CreateChargeOptions v) => v.card;
  static const Field<CreateChargeOptions, Card> _f$card =
      Field('card', _$card, opt: true);
  static BankDetails? _$bank(CreateChargeOptions v) => v.bank;
  static const Field<CreateChargeOptions, BankDetails> _f$bank =
      Field('bank', _$bank, opt: true);
  static BankTransfer? _$bankTransfer(CreateChargeOptions v) => v.bankTransfer;
  static const Field<CreateChargeOptions, BankTransfer> _f$bankTransfer =
      Field('bankTransfer', _$bankTransfer, key: r'bank_transfer', opt: true);
  static Ussd? _$ussd(CreateChargeOptions v) => v.ussd;
  static const Field<CreateChargeOptions, Ussd> _f$ussd =
      Field('ussd', _$ussd, opt: true);
  static MobileMoney? _$mobileMoney(CreateChargeOptions v) => v.mobileMoney;
  static const Field<CreateChargeOptions, MobileMoney> _f$mobileMoney =
      Field('mobileMoney', _$mobileMoney, key: r'mobile_money', opt: true);
  static Qr? _$qr(CreateChargeOptions v) => v.qr;
  static const Field<CreateChargeOptions, Qr> _f$qr =
      Field('qr', _$qr, opt: true);
  static String? _$authorizationCode(CreateChargeOptions v) =>
      v.authorizationCode;
  static const Field<CreateChargeOptions, String> _f$authorizationCode =
      Field('authorizationCode', _$authorizationCode, opt: true);
  static String? _$pin(CreateChargeOptions v) => v.pin;
  static const Field<CreateChargeOptions, String> _f$pin =
      Field('pin', _$pin, opt: true);
  static PaymentMetadata? _$metadata(CreateChargeOptions v) => v.metadata;
  static const Field<CreateChargeOptions, PaymentMetadata> _f$metadata =
      Field('metadata', _$metadata, opt: true);
  static String? _$reference(CreateChargeOptions v) => v.reference;
  static const Field<CreateChargeOptions, String> _f$reference =
      Field('reference', _$reference, opt: true);
  static String? _$deviceId(CreateChargeOptions v) => v.deviceId;
  static const Field<CreateChargeOptions, String> _f$deviceId =
      Field('deviceId', _$deviceId, opt: true);

  @override
  final MappableFields<CreateChargeOptions> fields = const {
    #email: _f$email,
    #amount: _f$amount,
    #splitCode: _f$splitCode,
    #subaccount: _f$subaccount,
    #transactionCharge: _f$transactionCharge,
    #bearer: _f$bearer,
    #card: _f$card,
    #bank: _f$bank,
    #bankTransfer: _f$bankTransfer,
    #ussd: _f$ussd,
    #mobileMoney: _f$mobileMoney,
    #qr: _f$qr,
    #authorizationCode: _f$authorizationCode,
    #pin: _f$pin,
    #metadata: _f$metadata,
    #reference: _f$reference,
    #deviceId: _f$deviceId,
  };

  static CreateChargeOptions _instantiate(DecodingData data) {
    return CreateChargeOptions(
        email: data.dec(_f$email),
        amount: data.dec(_f$amount),
        splitCode: data.dec(_f$splitCode),
        subaccount: data.dec(_f$subaccount),
        transactionCharge: data.dec(_f$transactionCharge),
        bearer: data.dec(_f$bearer),
        card: data.dec(_f$card),
        bank: data.dec(_f$bank),
        bankTransfer: data.dec(_f$bankTransfer),
        ussd: data.dec(_f$ussd),
        mobileMoney: data.dec(_f$mobileMoney),
        qr: data.dec(_f$qr),
        authorizationCode: data.dec(_f$authorizationCode),
        pin: data.dec(_f$pin),
        metadata: data.dec(_f$metadata),
        reference: data.dec(_f$reference),
        deviceId: data.dec(_f$deviceId));
  }

  @override
  final Function instantiate = _instantiate;

  static CreateChargeOptions fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CreateChargeOptions>(map);
  }

  static CreateChargeOptions fromJson(String json) {
    return ensureInitialized().decodeJson<CreateChargeOptions>(json);
  }
}

mixin CreateChargeOptionsMappable {
  String toJson() {
    return CreateChargeOptionsMapper.ensureInitialized()
        .encodeJson<CreateChargeOptions>(this as CreateChargeOptions);
  }

  Map<String, dynamic> toMap() {
    return CreateChargeOptionsMapper.ensureInitialized()
        .encodeMap<CreateChargeOptions>(this as CreateChargeOptions);
  }

  CreateChargeOptionsCopyWith<CreateChargeOptions, CreateChargeOptions,
      CreateChargeOptions> get copyWith => _CreateChargeOptionsCopyWithImpl<
          CreateChargeOptions, CreateChargeOptions>(
      this as CreateChargeOptions, $identity, $identity);
  @override
  String toString() {
    return CreateChargeOptionsMapper.ensureInitialized()
        .stringifyValue(this as CreateChargeOptions);
  }

  @override
  bool operator ==(Object other) {
    return CreateChargeOptionsMapper.ensureInitialized()
        .equalsValue(this as CreateChargeOptions, other);
  }

  @override
  int get hashCode {
    return CreateChargeOptionsMapper.ensureInitialized()
        .hashValue(this as CreateChargeOptions);
  }
}

extension CreateChargeOptionsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CreateChargeOptions, $Out> {
  CreateChargeOptionsCopyWith<$R, CreateChargeOptions, $Out>
      get $asCreateChargeOptions => $base.as(
          (v, t, t2) => _CreateChargeOptionsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CreateChargeOptionsCopyWith<$R, $In extends CreateChargeOptions,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  CardCopyWith<$R, Card, Card>? get card;
  BankDetailsCopyWith<$R, BankDetails, BankDetails>? get bank;
  BankTransferCopyWith<$R, BankTransfer, BankTransfer>? get bankTransfer;
  UssdCopyWith<$R, Ussd, Ussd>? get ussd;
  MobileMoneyCopyWith<$R, MobileMoney, MobileMoney>? get mobileMoney;
  QrCopyWith<$R, Qr, Qr>? get qr;
  PaymentMetadataCopyWith<$R, PaymentMetadata, PaymentMetadata>? get metadata;
  $R call(
      {String? email,
      String? amount,
      String? splitCode,
      String? subaccount,
      int? transactionCharge,
      String? bearer,
      Card? card,
      BankDetails? bank,
      BankTransfer? bankTransfer,
      Ussd? ussd,
      MobileMoney? mobileMoney,
      Qr? qr,
      String? authorizationCode,
      String? pin,
      PaymentMetadata? metadata,
      String? reference,
      String? deviceId});
  CreateChargeOptionsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _CreateChargeOptionsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CreateChargeOptions, $Out>
    implements CreateChargeOptionsCopyWith<$R, CreateChargeOptions, $Out> {
  _CreateChargeOptionsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CreateChargeOptions> $mapper =
      CreateChargeOptionsMapper.ensureInitialized();
  @override
  CardCopyWith<$R, Card, Card>? get card =>
      $value.card?.copyWith.$chain((v) => call(card: v));
  @override
  BankDetailsCopyWith<$R, BankDetails, BankDetails>? get bank =>
      $value.bank?.copyWith.$chain((v) => call(bank: v));
  @override
  BankTransferCopyWith<$R, BankTransfer, BankTransfer>? get bankTransfer =>
      $value.bankTransfer?.copyWith.$chain((v) => call(bankTransfer: v));
  @override
  UssdCopyWith<$R, Ussd, Ussd>? get ussd =>
      $value.ussd?.copyWith.$chain((v) => call(ussd: v));
  @override
  MobileMoneyCopyWith<$R, MobileMoney, MobileMoney>? get mobileMoney =>
      $value.mobileMoney?.copyWith.$chain((v) => call(mobileMoney: v));
  @override
  QrCopyWith<$R, Qr, Qr>? get qr =>
      $value.qr?.copyWith.$chain((v) => call(qr: v));
  @override
  PaymentMetadataCopyWith<$R, PaymentMetadata, PaymentMetadata>? get metadata =>
      $value.metadata?.copyWith.$chain((v) => call(metadata: v));
  @override
  $R call(
          {String? email,
          String? amount,
          Object? splitCode = $none,
          Object? subaccount = $none,
          Object? transactionCharge = $none,
          Object? bearer = $none,
          Object? card = $none,
          Object? bank = $none,
          Object? bankTransfer = $none,
          Object? ussd = $none,
          Object? mobileMoney = $none,
          Object? qr = $none,
          Object? authorizationCode = $none,
          Object? pin = $none,
          Object? metadata = $none,
          Object? reference = $none,
          Object? deviceId = $none}) =>
      $apply(FieldCopyWithData({
        if (email != null) #email: email,
        if (amount != null) #amount: amount,
        if (splitCode != $none) #splitCode: splitCode,
        if (subaccount != $none) #subaccount: subaccount,
        if (transactionCharge != $none) #transactionCharge: transactionCharge,
        if (bearer != $none) #bearer: bearer,
        if (card != $none) #card: card,
        if (bank != $none) #bank: bank,
        if (bankTransfer != $none) #bankTransfer: bankTransfer,
        if (ussd != $none) #ussd: ussd,
        if (mobileMoney != $none) #mobileMoney: mobileMoney,
        if (qr != $none) #qr: qr,
        if (authorizationCode != $none) #authorizationCode: authorizationCode,
        if (pin != $none) #pin: pin,
        if (metadata != $none) #metadata: metadata,
        if (reference != $none) #reference: reference,
        if (deviceId != $none) #deviceId: deviceId
      }));
  @override
  CreateChargeOptions $make(CopyWithData data) => CreateChargeOptions(
      email: data.get(#email, or: $value.email),
      amount: data.get(#amount, or: $value.amount),
      splitCode: data.get(#splitCode, or: $value.splitCode),
      subaccount: data.get(#subaccount, or: $value.subaccount),
      transactionCharge:
          data.get(#transactionCharge, or: $value.transactionCharge),
      bearer: data.get(#bearer, or: $value.bearer),
      card: data.get(#card, or: $value.card),
      bank: data.get(#bank, or: $value.bank),
      bankTransfer: data.get(#bankTransfer, or: $value.bankTransfer),
      ussd: data.get(#ussd, or: $value.ussd),
      mobileMoney: data.get(#mobileMoney, or: $value.mobileMoney),
      qr: data.get(#qr, or: $value.qr),
      authorizationCode:
          data.get(#authorizationCode, or: $value.authorizationCode),
      pin: data.get(#pin, or: $value.pin),
      metadata: data.get(#metadata, or: $value.metadata),
      reference: data.get(#reference, or: $value.reference),
      deviceId: data.get(#deviceId, or: $value.deviceId));

  @override
  CreateChargeOptionsCopyWith<$R2, CreateChargeOptions, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _CreateChargeOptionsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
