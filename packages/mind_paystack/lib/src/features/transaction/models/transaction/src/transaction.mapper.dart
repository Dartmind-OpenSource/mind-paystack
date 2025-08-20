// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'transaction.dart';

class TransactionMapper extends ClassMapperBase<Transaction> {
  TransactionMapper._();

  static TransactionMapper? _instance;
  static TransactionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TransactionMapper._());
      TimelineLogMapper.ensureInitialized();
      AuthorizationDataMapper.ensureInitialized();
      CustomerMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Transaction';

  static int _$id(Transaction v) => v.id;
  static const Field<Transaction, int> _f$id = Field('id', _$id);
  static String _$domain(Transaction v) => v.domain;
  static const Field<Transaction, String> _f$domain = Field('domain', _$domain);
  static String _$status(Transaction v) => v.status;
  static const Field<Transaction, String> _f$status = Field('status', _$status);
  static String _$reference(Transaction v) => v.reference;
  static const Field<Transaction, String> _f$reference =
      Field('reference', _$reference);
  static String? _$receiptNumber(Transaction v) => v.receiptNumber;
  static const Field<Transaction, String> _f$receiptNumber = Field(
      'receiptNumber', _$receiptNumber,
      key: r'receipt_number', opt: true);
  static int _$amount(Transaction v) => v.amount;
  static const Field<Transaction, int> _f$amount = Field('amount', _$amount);
  static String? _$gatewayResponse(Transaction v) => v.gatewayResponse;
  static const Field<Transaction, String> _f$gatewayResponse = Field(
      'gatewayResponse', _$gatewayResponse,
      key: r'gateway_response', opt: true);
  static DateTime? _$paidAt(Transaction v) => v.paidAt;
  static const Field<Transaction, DateTime> _f$paidAt =
      Field('paidAt', _$paidAt, key: r'paid_at', opt: true);
  static DateTime _$createdAt(Transaction v) => v.createdAt;
  static const Field<Transaction, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt, key: r'created_at');
  static String _$channel(Transaction v) => v.channel;
  static const Field<Transaction, String> _f$channel =
      Field('channel', _$channel);
  static String _$currency(Transaction v) => v.currency;
  static const Field<Transaction, String> _f$currency =
      Field('currency', _$currency);
  static String? _$ipAddress(Transaction v) => v.ipAddress;
  static const Field<Transaction, String> _f$ipAddress =
      Field('ipAddress', _$ipAddress, key: r'ip_address', opt: true);
  static dynamic _$metadata(Transaction v) => v.metadata;
  static const Field<Transaction, dynamic> _f$metadata =
      Field('metadata', _$metadata, opt: true);
  static TimelineLog? _$log(Transaction v) => v.log;
  static const Field<Transaction, TimelineLog> _f$log =
      Field('log', _$log, opt: true);
  static int? _$fees(Transaction v) => v.fees;
  static const Field<Transaction, int> _f$fees =
      Field('fees', _$fees, opt: true);
  static Map<String, dynamic>? _$feesSplit(Transaction v) => v.feesSplit;
  static const Field<Transaction, Map<String, dynamic>> _f$feesSplit =
      Field('feesSplit', _$feesSplit, key: r'fees_split', opt: true);
  static AuthorizationData? _$authorization(Transaction v) => v.authorization;
  static const Field<Transaction, AuthorizationData> _f$authorization =
      Field('authorization', _$authorization, opt: true);
  static Customer? _$customer(Transaction v) => v.customer;
  static const Field<Transaction, Customer> _f$customer =
      Field('customer', _$customer, opt: true);
  static String? _$plan(Transaction v) => v.plan;
  static const Field<Transaction, String> _f$plan =
      Field('plan', _$plan, opt: true);
  static Map<String, dynamic>? _$split(Transaction v) => v.split;
  static const Field<Transaction, Map<String, dynamic>> _f$split =
      Field('split', _$split, opt: true);
  static String? _$orderId(Transaction v) => v.orderId;
  static const Field<Transaction, String> _f$orderId =
      Field('orderId', _$orderId, key: r'order_id', opt: true);
  static int? _$requestedAmount(Transaction v) => v.requestedAmount;
  static const Field<Transaction, int> _f$requestedAmount = Field(
      'requestedAmount', _$requestedAmount,
      key: r'requested_amount', opt: true);
  static Map<String, dynamic>? _$posTransactionData(Transaction v) =>
      v.posTransactionData;
  static const Field<Transaction, Map<String, dynamic>> _f$posTransactionData =
      Field('posTransactionData', _$posTransactionData,
          key: r'pos_transaction_data', opt: true);
  static dynamic _$source(Transaction v) => v.source;
  static const Field<Transaction, dynamic> _f$source =
      Field('source', _$source, opt: true);
  static dynamic _$feesBreakdown(Transaction v) => v.feesBreakdown;
  static const Field<Transaction, dynamic> _f$feesBreakdown = Field(
      'feesBreakdown', _$feesBreakdown,
      key: r'fees_breakdown', opt: true);
  static dynamic _$connect(Transaction v) => v.connect;
  static const Field<Transaction, dynamic> _f$connect =
      Field('connect', _$connect, opt: true);
  static DateTime? _$transactionDate(Transaction v) => v.transactionDate;
  static const Field<Transaction, DateTime> _f$transactionDate = Field(
      'transactionDate', _$transactionDate,
      key: r'transaction_date', opt: true);
  static Map<String, dynamic>? _$planObject(Transaction v) => v.planObject;
  static const Field<Transaction, Map<String, dynamic>> _f$planObject =
      Field('planObject', _$planObject, key: r'plan_object', opt: true);
  static Map<String, dynamic>? _$subaccount(Transaction v) => v.subaccount;
  static const Field<Transaction, Map<String, dynamic>> _f$subaccount =
      Field('subaccount', _$subaccount, opt: true);

  @override
  final MappableFields<Transaction> fields = const {
    #id: _f$id,
    #domain: _f$domain,
    #status: _f$status,
    #reference: _f$reference,
    #receiptNumber: _f$receiptNumber,
    #amount: _f$amount,
    #gatewayResponse: _f$gatewayResponse,
    #paidAt: _f$paidAt,
    #createdAt: _f$createdAt,
    #channel: _f$channel,
    #currency: _f$currency,
    #ipAddress: _f$ipAddress,
    #metadata: _f$metadata,
    #log: _f$log,
    #fees: _f$fees,
    #feesSplit: _f$feesSplit,
    #authorization: _f$authorization,
    #customer: _f$customer,
    #plan: _f$plan,
    #split: _f$split,
    #orderId: _f$orderId,
    #requestedAmount: _f$requestedAmount,
    #posTransactionData: _f$posTransactionData,
    #source: _f$source,
    #feesBreakdown: _f$feesBreakdown,
    #connect: _f$connect,
    #transactionDate: _f$transactionDate,
    #planObject: _f$planObject,
    #subaccount: _f$subaccount,
  };

  static Transaction _instantiate(DecodingData data) {
    return Transaction(
        id: data.dec(_f$id),
        domain: data.dec(_f$domain),
        status: data.dec(_f$status),
        reference: data.dec(_f$reference),
        receiptNumber: data.dec(_f$receiptNumber),
        amount: data.dec(_f$amount),
        gatewayResponse: data.dec(_f$gatewayResponse),
        paidAt: data.dec(_f$paidAt),
        createdAt: data.dec(_f$createdAt),
        channel: data.dec(_f$channel),
        currency: data.dec(_f$currency),
        ipAddress: data.dec(_f$ipAddress),
        metadata: data.dec(_f$metadata),
        log: data.dec(_f$log),
        fees: data.dec(_f$fees),
        feesSplit: data.dec(_f$feesSplit),
        authorization: data.dec(_f$authorization),
        customer: data.dec(_f$customer),
        plan: data.dec(_f$plan),
        split: data.dec(_f$split),
        orderId: data.dec(_f$orderId),
        requestedAmount: data.dec(_f$requestedAmount),
        posTransactionData: data.dec(_f$posTransactionData),
        source: data.dec(_f$source),
        feesBreakdown: data.dec(_f$feesBreakdown),
        connect: data.dec(_f$connect),
        transactionDate: data.dec(_f$transactionDate),
        planObject: data.dec(_f$planObject),
        subaccount: data.dec(_f$subaccount));
  }

  @override
  final Function instantiate = _instantiate;

  static Transaction fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Transaction>(map);
  }

  static Transaction fromJson(String json) {
    return ensureInitialized().decodeJson<Transaction>(json);
  }
}

mixin TransactionMappable {
  String toJson() {
    return TransactionMapper.ensureInitialized()
        .encodeJson<Transaction>(this as Transaction);
  }

  Map<String, dynamic> toMap() {
    return TransactionMapper.ensureInitialized()
        .encodeMap<Transaction>(this as Transaction);
  }

  TransactionCopyWith<Transaction, Transaction, Transaction> get copyWith =>
      _TransactionCopyWithImpl<Transaction, Transaction>(
          this as Transaction, $identity, $identity);
  @override
  String toString() {
    return TransactionMapper.ensureInitialized()
        .stringifyValue(this as Transaction);
  }

  @override
  bool operator ==(Object other) {
    return TransactionMapper.ensureInitialized()
        .equalsValue(this as Transaction, other);
  }

  @override
  int get hashCode {
    return TransactionMapper.ensureInitialized().hashValue(this as Transaction);
  }
}

extension TransactionValueCopy<$R, $Out>
    on ObjectCopyWith<$R, Transaction, $Out> {
  TransactionCopyWith<$R, Transaction, $Out> get $asTransaction =>
      $base.as((v, t, t2) => _TransactionCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TransactionCopyWith<$R, $In extends Transaction, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  TimelineLogCopyWith<$R, TimelineLog, TimelineLog>? get log;
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
      get feesSplit;
  AuthorizationDataCopyWith<$R, AuthorizationData, AuthorizationData>?
      get authorization;
  CustomerCopyWith<$R, Customer, Customer>? get customer;
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
      get split;
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
      get posTransactionData;
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
      get planObject;
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
      get subaccount;
  $R call(
      {int? id,
      String? domain,
      String? status,
      String? reference,
      String? receiptNumber,
      int? amount,
      String? gatewayResponse,
      DateTime? paidAt,
      DateTime? createdAt,
      String? channel,
      String? currency,
      String? ipAddress,
      dynamic metadata,
      TimelineLog? log,
      int? fees,
      Map<String, dynamic>? feesSplit,
      AuthorizationData? authorization,
      Customer? customer,
      String? plan,
      Map<String, dynamic>? split,
      String? orderId,
      int? requestedAmount,
      Map<String, dynamic>? posTransactionData,
      dynamic source,
      dynamic feesBreakdown,
      dynamic connect,
      DateTime? transactionDate,
      Map<String, dynamic>? planObject,
      Map<String, dynamic>? subaccount});
  TransactionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TransactionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Transaction, $Out>
    implements TransactionCopyWith<$R, Transaction, $Out> {
  _TransactionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Transaction> $mapper =
      TransactionMapper.ensureInitialized();
  @override
  TimelineLogCopyWith<$R, TimelineLog, TimelineLog>? get log =>
      $value.log?.copyWith.$chain((v) => call(log: v));
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
      get feesSplit => $value.feesSplit != null
          ? MapCopyWith(
              $value.feesSplit!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(feesSplit: v))
          : null;
  @override
  AuthorizationDataCopyWith<$R, AuthorizationData, AuthorizationData>?
      get authorization =>
          $value.authorization?.copyWith.$chain((v) => call(authorization: v));
  @override
  CustomerCopyWith<$R, Customer, Customer>? get customer =>
      $value.customer?.copyWith.$chain((v) => call(customer: v));
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
      get split => $value.split != null
          ? MapCopyWith($value.split!,
              (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(split: v))
          : null;
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
      get posTransactionData => $value.posTransactionData != null
          ? MapCopyWith(
              $value.posTransactionData!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(posTransactionData: v))
          : null;
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
      get planObject => $value.planObject != null
          ? MapCopyWith(
              $value.planObject!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(planObject: v))
          : null;
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
      get subaccount => $value.subaccount != null
          ? MapCopyWith(
              $value.subaccount!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(subaccount: v))
          : null;
  @override
  $R call(
          {int? id,
          String? domain,
          String? status,
          String? reference,
          Object? receiptNumber = $none,
          int? amount,
          Object? gatewayResponse = $none,
          Object? paidAt = $none,
          DateTime? createdAt,
          String? channel,
          String? currency,
          Object? ipAddress = $none,
          Object? metadata = $none,
          Object? log = $none,
          Object? fees = $none,
          Object? feesSplit = $none,
          Object? authorization = $none,
          Object? customer = $none,
          Object? plan = $none,
          Object? split = $none,
          Object? orderId = $none,
          Object? requestedAmount = $none,
          Object? posTransactionData = $none,
          Object? source = $none,
          Object? feesBreakdown = $none,
          Object? connect = $none,
          Object? transactionDate = $none,
          Object? planObject = $none,
          Object? subaccount = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (domain != null) #domain: domain,
        if (status != null) #status: status,
        if (reference != null) #reference: reference,
        if (receiptNumber != $none) #receiptNumber: receiptNumber,
        if (amount != null) #amount: amount,
        if (gatewayResponse != $none) #gatewayResponse: gatewayResponse,
        if (paidAt != $none) #paidAt: paidAt,
        if (createdAt != null) #createdAt: createdAt,
        if (channel != null) #channel: channel,
        if (currency != null) #currency: currency,
        if (ipAddress != $none) #ipAddress: ipAddress,
        if (metadata != $none) #metadata: metadata,
        if (log != $none) #log: log,
        if (fees != $none) #fees: fees,
        if (feesSplit != $none) #feesSplit: feesSplit,
        if (authorization != $none) #authorization: authorization,
        if (customer != $none) #customer: customer,
        if (plan != $none) #plan: plan,
        if (split != $none) #split: split,
        if (orderId != $none) #orderId: orderId,
        if (requestedAmount != $none) #requestedAmount: requestedAmount,
        if (posTransactionData != $none)
          #posTransactionData: posTransactionData,
        if (source != $none) #source: source,
        if (feesBreakdown != $none) #feesBreakdown: feesBreakdown,
        if (connect != $none) #connect: connect,
        if (transactionDate != $none) #transactionDate: transactionDate,
        if (planObject != $none) #planObject: planObject,
        if (subaccount != $none) #subaccount: subaccount
      }));
  @override
  Transaction $make(CopyWithData data) => Transaction(
      id: data.get(#id, or: $value.id),
      domain: data.get(#domain, or: $value.domain),
      status: data.get(#status, or: $value.status),
      reference: data.get(#reference, or: $value.reference),
      receiptNumber: data.get(#receiptNumber, or: $value.receiptNumber),
      amount: data.get(#amount, or: $value.amount),
      gatewayResponse: data.get(#gatewayResponse, or: $value.gatewayResponse),
      paidAt: data.get(#paidAt, or: $value.paidAt),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      channel: data.get(#channel, or: $value.channel),
      currency: data.get(#currency, or: $value.currency),
      ipAddress: data.get(#ipAddress, or: $value.ipAddress),
      metadata: data.get(#metadata, or: $value.metadata),
      log: data.get(#log, or: $value.log),
      fees: data.get(#fees, or: $value.fees),
      feesSplit: data.get(#feesSplit, or: $value.feesSplit),
      authorization: data.get(#authorization, or: $value.authorization),
      customer: data.get(#customer, or: $value.customer),
      plan: data.get(#plan, or: $value.plan),
      split: data.get(#split, or: $value.split),
      orderId: data.get(#orderId, or: $value.orderId),
      requestedAmount: data.get(#requestedAmount, or: $value.requestedAmount),
      posTransactionData:
          data.get(#posTransactionData, or: $value.posTransactionData),
      source: data.get(#source, or: $value.source),
      feesBreakdown: data.get(#feesBreakdown, or: $value.feesBreakdown),
      connect: data.get(#connect, or: $value.connect),
      transactionDate: data.get(#transactionDate, or: $value.transactionDate),
      planObject: data.get(#planObject, or: $value.planObject),
      subaccount: data.get(#subaccount, or: $value.subaccount));

  @override
  TransactionCopyWith<$R2, Transaction, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TransactionCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
