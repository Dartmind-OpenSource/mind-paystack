// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'charge.dart';

class ChargeDataMapper extends ClassMapperBase<ChargeData> {
  ChargeDataMapper._();

  static ChargeDataMapper? _instance;
  static ChargeDataMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChargeDataMapper._());
      AuthorizationDataMapper.ensureInitialized();
      CustomerMapper.ensureInitialized();
      PlanMapper.ensureInitialized();
      SplitMapper.ensureInitialized();
      FeesBreakdownMapper.ensureInitialized();
      SubaccountMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ChargeData';

  static DateTime _$createdAt(ChargeData v) => v.createdAt;
  static const Field<ChargeData, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt, key: r'created_at');
  static String _$channel(ChargeData v) => v.channel;
  static const Field<ChargeData, String> _f$channel =
      Field('channel', _$channel);
  static String _$currency(ChargeData v) => v.currency;
  static const Field<ChargeData, String> _f$currency =
      Field('currency', _$currency);
  static int _$id(ChargeData v) => v.id;
  static const Field<ChargeData, int> _f$id = Field('id', _$id);
  static String _$domain(ChargeData v) => v.domain;
  static const Field<ChargeData, String> _f$domain = Field('domain', _$domain);
  static String _$status(ChargeData v) => v.status;
  static const Field<ChargeData, String> _f$status = Field('status', _$status);
  static String _$reference(ChargeData v) => v.reference;
  static const Field<ChargeData, String> _f$reference =
      Field('reference', _$reference);
  static int _$amount(ChargeData v) => v.amount;
  static const Field<ChargeData, int> _f$amount = Field('amount', _$amount);
  static String _$gatewayResponse(ChargeData v) => v.gatewayResponse;
  static const Field<ChargeData, String> _f$gatewayResponse =
      Field('gatewayResponse', _$gatewayResponse, key: r'gateway_response');
  static int _$requestedAmount(ChargeData v) => v.requestedAmount;
  static const Field<ChargeData, int> _f$requestedAmount =
      Field('requestedAmount', _$requestedAmount, key: r'requested_amount');
  static DateTime _$transactionDate(ChargeData v) => v.transactionDate;
  static const Field<ChargeData, DateTime> _f$transactionDate =
      Field('transactionDate', _$transactionDate, key: r'transaction_date');
  static AuthorizationData _$authorization(ChargeData v) => v.authorization;
  static const Field<ChargeData, AuthorizationData> _f$authorization =
      Field('authorization', _$authorization);
  static Customer _$customer(ChargeData v) => v.customer;
  static const Field<ChargeData, Customer> _f$customer =
      Field('customer', _$customer);
  static String? _$message(ChargeData v) => v.message;
  static const Field<ChargeData, String> _f$message =
      Field('message', _$message, opt: true);
  static DateTime? _$paidAt(ChargeData v) => v.paidAt;
  static const Field<ChargeData, DateTime> _f$paidAt =
      Field('paidAt', _$paidAt, key: r'paid_at', opt: true);
  static String? _$ipAddress(ChargeData v) => v.ipAddress;
  static const Field<ChargeData, String> _f$ipAddress =
      Field('ipAddress', _$ipAddress, key: r'ip_address', opt: true);
  static String? _$metadata(ChargeData v) => v.metadata;
  static const Field<ChargeData, String> _f$metadata =
      Field('metadata', _$metadata, opt: true);
  static dynamic _$log(ChargeData v) => v.log;
  static const Field<ChargeData, dynamic> _f$log =
      Field('log', _$log, opt: true);
  static int? _$fees(ChargeData v) => v.fees;
  static const Field<ChargeData, int> _f$fees =
      Field('fees', _$fees, opt: true);
  static dynamic _$feesSplit(ChargeData v) => v.feesSplit;
  static const Field<ChargeData, dynamic> _f$feesSplit =
      Field('feesSplit', _$feesSplit, key: r'fees_split', opt: true);
  static Plan? _$plan(ChargeData v) => v.plan;
  static const Field<ChargeData, Plan> _f$plan =
      Field('plan', _$plan, opt: true);
  static Split? _$splitDetail(ChargeData v) => v.splitDetail;
  static const Field<ChargeData, Split> _f$splitDetail =
      Field('splitDetail', _$splitDetail, key: r'split', opt: true);
  static String? _$orderId(ChargeData v) => v.orderId;
  static const Field<ChargeData, String> _f$orderId =
      Field('orderId', _$orderId, key: r'order_id', opt: true);
  static DateTime? _$paidAtAlt(ChargeData v) => v.paidAtAlt;
  static const Field<ChargeData, DateTime> _f$paidAtAlt =
      Field('paidAtAlt', _$paidAtAlt, key: r'paidAt', opt: true);
  static DateTime? _$createdAtAlt(ChargeData v) => v.createdAtAlt;
  static const Field<ChargeData, DateTime> _f$createdAtAlt =
      Field('createdAtAlt', _$createdAtAlt, key: r'createdAt', opt: true);
  static dynamic _$posTransactionData(ChargeData v) => v.posTransactionData;
  static const Field<ChargeData, dynamic> _f$posTransactionData = Field(
      'posTransactionData', _$posTransactionData,
      key: r'pos_transaction_data', opt: true);
  static dynamic _$source(ChargeData v) => v.source;
  static const Field<ChargeData, dynamic> _f$source =
      Field('source', _$source, opt: true);
  static FeesBreakdown? _$feesBreakdown(ChargeData v) => v.feesBreakdown;
  static const Field<ChargeData, FeesBreakdown> _f$feesBreakdown = Field(
      'feesBreakdown', _$feesBreakdown,
      key: r'fees_breakdown', opt: true);
  static Plan? _$planObject(ChargeData v) => v.planObject;
  static const Field<ChargeData, Plan> _f$planObject =
      Field('planObject', _$planObject, key: r'plan_object', opt: true);
  static Subaccount? _$subaccountDetail(ChargeData v) => v.subaccountDetail;
  static const Field<ChargeData, Subaccount> _f$subaccountDetail = Field(
      'subaccountDetail', _$subaccountDetail,
      key: r'subaccount', opt: true);

  @override
  final MappableFields<ChargeData> fields = const {
    #createdAt: _f$createdAt,
    #channel: _f$channel,
    #currency: _f$currency,
    #id: _f$id,
    #domain: _f$domain,
    #status: _f$status,
    #reference: _f$reference,
    #amount: _f$amount,
    #gatewayResponse: _f$gatewayResponse,
    #requestedAmount: _f$requestedAmount,
    #transactionDate: _f$transactionDate,
    #authorization: _f$authorization,
    #customer: _f$customer,
    #message: _f$message,
    #paidAt: _f$paidAt,
    #ipAddress: _f$ipAddress,
    #metadata: _f$metadata,
    #log: _f$log,
    #fees: _f$fees,
    #feesSplit: _f$feesSplit,
    #plan: _f$plan,
    #splitDetail: _f$splitDetail,
    #orderId: _f$orderId,
    #paidAtAlt: _f$paidAtAlt,
    #createdAtAlt: _f$createdAtAlt,
    #posTransactionData: _f$posTransactionData,
    #source: _f$source,
    #feesBreakdown: _f$feesBreakdown,
    #planObject: _f$planObject,
    #subaccountDetail: _f$subaccountDetail,
  };

  static ChargeData _instantiate(DecodingData data) {
    return ChargeData(
        createdAt: data.dec(_f$createdAt),
        channel: data.dec(_f$channel),
        currency: data.dec(_f$currency),
        id: data.dec(_f$id),
        domain: data.dec(_f$domain),
        status: data.dec(_f$status),
        reference: data.dec(_f$reference),
        amount: data.dec(_f$amount),
        gatewayResponse: data.dec(_f$gatewayResponse),
        requestedAmount: data.dec(_f$requestedAmount),
        transactionDate: data.dec(_f$transactionDate),
        authorization: data.dec(_f$authorization),
        customer: data.dec(_f$customer),
        message: data.dec(_f$message),
        paidAt: data.dec(_f$paidAt),
        ipAddress: data.dec(_f$ipAddress),
        metadata: data.dec(_f$metadata),
        log: data.dec(_f$log),
        fees: data.dec(_f$fees),
        feesSplit: data.dec(_f$feesSplit),
        plan: data.dec(_f$plan),
        splitDetail: data.dec(_f$splitDetail),
        orderId: data.dec(_f$orderId),
        paidAtAlt: data.dec(_f$paidAtAlt),
        createdAtAlt: data.dec(_f$createdAtAlt),
        posTransactionData: data.dec(_f$posTransactionData),
        source: data.dec(_f$source),
        feesBreakdown: data.dec(_f$feesBreakdown),
        planObject: data.dec(_f$planObject),
        subaccountDetail: data.dec(_f$subaccountDetail));
  }

  @override
  final Function instantiate = _instantiate;

  static ChargeData fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ChargeData>(map);
  }

  static ChargeData fromJson(String json) {
    return ensureInitialized().decodeJson<ChargeData>(json);
  }
}

mixin ChargeDataMappable {
  String toJson() {
    return ChargeDataMapper.ensureInitialized()
        .encodeJson<ChargeData>(this as ChargeData);
  }

  Map<String, dynamic> toMap() {
    return ChargeDataMapper.ensureInitialized()
        .encodeMap<ChargeData>(this as ChargeData);
  }

  ChargeDataCopyWith<ChargeData, ChargeData, ChargeData> get copyWith =>
      _ChargeDataCopyWithImpl<ChargeData, ChargeData>(
          this as ChargeData, $identity, $identity);
  @override
  String toString() {
    return ChargeDataMapper.ensureInitialized()
        .stringifyValue(this as ChargeData);
  }

  @override
  bool operator ==(Object other) {
    return ChargeDataMapper.ensureInitialized()
        .equalsValue(this as ChargeData, other);
  }

  @override
  int get hashCode {
    return ChargeDataMapper.ensureInitialized().hashValue(this as ChargeData);
  }
}

extension ChargeDataValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ChargeData, $Out> {
  ChargeDataCopyWith<$R, ChargeData, $Out> get $asChargeData =>
      $base.as((v, t, t2) => _ChargeDataCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ChargeDataCopyWith<$R, $In extends ChargeData, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  AuthorizationDataCopyWith<$R, AuthorizationData, AuthorizationData>
      get authorization;
  CustomerCopyWith<$R, Customer, Customer> get customer;
  PlanCopyWith<$R, Plan, Plan>? get plan;
  SplitCopyWith<$R, Split, Split>? get splitDetail;
  FeesBreakdownCopyWith<$R, FeesBreakdown, FeesBreakdown>? get feesBreakdown;
  PlanCopyWith<$R, Plan, Plan>? get planObject;
  SubaccountCopyWith<$R, Subaccount, Subaccount>? get subaccountDetail;
  $R call(
      {DateTime? createdAt,
      String? channel,
      String? currency,
      int? id,
      String? domain,
      String? status,
      String? reference,
      int? amount,
      String? gatewayResponse,
      int? requestedAmount,
      DateTime? transactionDate,
      AuthorizationData? authorization,
      Customer? customer,
      String? message,
      DateTime? paidAt,
      String? ipAddress,
      String? metadata,
      dynamic log,
      int? fees,
      dynamic feesSplit,
      Plan? plan,
      Split? splitDetail,
      String? orderId,
      DateTime? paidAtAlt,
      DateTime? createdAtAlt,
      dynamic posTransactionData,
      dynamic source,
      FeesBreakdown? feesBreakdown,
      Plan? planObject,
      Subaccount? subaccountDetail});
  ChargeDataCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ChargeDataCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ChargeData, $Out>
    implements ChargeDataCopyWith<$R, ChargeData, $Out> {
  _ChargeDataCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ChargeData> $mapper =
      ChargeDataMapper.ensureInitialized();
  @override
  AuthorizationDataCopyWith<$R, AuthorizationData, AuthorizationData>
      get authorization =>
          $value.authorization.copyWith.$chain((v) => call(authorization: v));
  @override
  CustomerCopyWith<$R, Customer, Customer> get customer =>
      $value.customer.copyWith.$chain((v) => call(customer: v));
  @override
  PlanCopyWith<$R, Plan, Plan>? get plan =>
      $value.plan?.copyWith.$chain((v) => call(plan: v));
  @override
  SplitCopyWith<$R, Split, Split>? get splitDetail =>
      $value.splitDetail?.copyWith.$chain((v) => call(splitDetail: v));
  @override
  FeesBreakdownCopyWith<$R, FeesBreakdown, FeesBreakdown>? get feesBreakdown =>
      $value.feesBreakdown?.copyWith.$chain((v) => call(feesBreakdown: v));
  @override
  PlanCopyWith<$R, Plan, Plan>? get planObject =>
      $value.planObject?.copyWith.$chain((v) => call(planObject: v));
  @override
  SubaccountCopyWith<$R, Subaccount, Subaccount>? get subaccountDetail =>
      $value.subaccountDetail?.copyWith
          .$chain((v) => call(subaccountDetail: v));
  @override
  $R call(
          {DateTime? createdAt,
          String? channel,
          String? currency,
          int? id,
          String? domain,
          String? status,
          String? reference,
          int? amount,
          String? gatewayResponse,
          int? requestedAmount,
          DateTime? transactionDate,
          AuthorizationData? authorization,
          Customer? customer,
          Object? message = $none,
          Object? paidAt = $none,
          Object? ipAddress = $none,
          Object? metadata = $none,
          Object? log = $none,
          Object? fees = $none,
          Object? feesSplit = $none,
          Object? plan = $none,
          Object? splitDetail = $none,
          Object? orderId = $none,
          Object? paidAtAlt = $none,
          Object? createdAtAlt = $none,
          Object? posTransactionData = $none,
          Object? source = $none,
          Object? feesBreakdown = $none,
          Object? planObject = $none,
          Object? subaccountDetail = $none}) =>
      $apply(FieldCopyWithData({
        if (createdAt != null) #createdAt: createdAt,
        if (channel != null) #channel: channel,
        if (currency != null) #currency: currency,
        if (id != null) #id: id,
        if (domain != null) #domain: domain,
        if (status != null) #status: status,
        if (reference != null) #reference: reference,
        if (amount != null) #amount: amount,
        if (gatewayResponse != null) #gatewayResponse: gatewayResponse,
        if (requestedAmount != null) #requestedAmount: requestedAmount,
        if (transactionDate != null) #transactionDate: transactionDate,
        if (authorization != null) #authorization: authorization,
        if (customer != null) #customer: customer,
        if (message != $none) #message: message,
        if (paidAt != $none) #paidAt: paidAt,
        if (ipAddress != $none) #ipAddress: ipAddress,
        if (metadata != $none) #metadata: metadata,
        if (log != $none) #log: log,
        if (fees != $none) #fees: fees,
        if (feesSplit != $none) #feesSplit: feesSplit,
        if (plan != $none) #plan: plan,
        if (splitDetail != $none) #splitDetail: splitDetail,
        if (orderId != $none) #orderId: orderId,
        if (paidAtAlt != $none) #paidAtAlt: paidAtAlt,
        if (createdAtAlt != $none) #createdAtAlt: createdAtAlt,
        if (posTransactionData != $none)
          #posTransactionData: posTransactionData,
        if (source != $none) #source: source,
        if (feesBreakdown != $none) #feesBreakdown: feesBreakdown,
        if (planObject != $none) #planObject: planObject,
        if (subaccountDetail != $none) #subaccountDetail: subaccountDetail
      }));
  @override
  ChargeData $make(CopyWithData data) => ChargeData(
      createdAt: data.get(#createdAt, or: $value.createdAt),
      channel: data.get(#channel, or: $value.channel),
      currency: data.get(#currency, or: $value.currency),
      id: data.get(#id, or: $value.id),
      domain: data.get(#domain, or: $value.domain),
      status: data.get(#status, or: $value.status),
      reference: data.get(#reference, or: $value.reference),
      amount: data.get(#amount, or: $value.amount),
      gatewayResponse: data.get(#gatewayResponse, or: $value.gatewayResponse),
      requestedAmount: data.get(#requestedAmount, or: $value.requestedAmount),
      transactionDate: data.get(#transactionDate, or: $value.transactionDate),
      authorization: data.get(#authorization, or: $value.authorization),
      customer: data.get(#customer, or: $value.customer),
      message: data.get(#message, or: $value.message),
      paidAt: data.get(#paidAt, or: $value.paidAt),
      ipAddress: data.get(#ipAddress, or: $value.ipAddress),
      metadata: data.get(#metadata, or: $value.metadata),
      log: data.get(#log, or: $value.log),
      fees: data.get(#fees, or: $value.fees),
      feesSplit: data.get(#feesSplit, or: $value.feesSplit),
      plan: data.get(#plan, or: $value.plan),
      splitDetail: data.get(#splitDetail, or: $value.splitDetail),
      orderId: data.get(#orderId, or: $value.orderId),
      paidAtAlt: data.get(#paidAtAlt, or: $value.paidAtAlt),
      createdAtAlt: data.get(#createdAtAlt, or: $value.createdAtAlt),
      posTransactionData:
          data.get(#posTransactionData, or: $value.posTransactionData),
      source: data.get(#source, or: $value.source),
      feesBreakdown: data.get(#feesBreakdown, or: $value.feesBreakdown),
      planObject: data.get(#planObject, or: $value.planObject),
      subaccountDetail:
          data.get(#subaccountDetail, or: $value.subaccountDetail));

  @override
  ChargeDataCopyWith<$R2, ChargeData, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ChargeDataCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
