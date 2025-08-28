// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'subscription.dart';

class SubscriptionMapper extends ClassMapperBase<Subscription> {
  SubscriptionMapper._();

  static SubscriptionMapper? _instance;
  static SubscriptionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SubscriptionMapper._());
      PlanMapper.ensureInitialized();
      SubscriptionAuthorizationMapper.ensureInitialized();
      SubscriptionCustomerMapper.ensureInitialized();
      SubscriptionInvoiceMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Subscription';

  static int? _$id(Subscription v) => v.id;
  static const Field<Subscription, int> _f$id = Field('id', _$id, opt: true);
  static String? _$subscriptionCode(Subscription v) => v.subscriptionCode;
  static const Field<Subscription, String> _f$subscriptionCode = Field(
      'subscriptionCode', _$subscriptionCode,
      key: r'subscription_code', opt: true);
  static String? _$emailToken(Subscription v) => v.emailToken;
  static const Field<Subscription, String> _f$emailToken =
      Field('emailToken', _$emailToken, key: r'email_token', opt: true);
  static int? _$amount(Subscription v) => v.amount;
  static const Field<Subscription, int> _f$amount =
      Field('amount', _$amount, opt: true);
  static String? _$cron(Subscription v) => v.cron;
  static const Field<Subscription, String> _f$cron =
      Field('cron', _$cron, opt: true);
  static DateTime? _$nextPaymentDate(Subscription v) => v.nextPaymentDate;
  static const Field<Subscription, DateTime> _f$nextPaymentDate = Field(
      'nextPaymentDate', _$nextPaymentDate,
      key: r'next_payment_date', opt: true);
  static String? _$openInvoice(Subscription v) => v.openInvoice;
  static const Field<Subscription, String> _f$openInvoice =
      Field('openInvoice', _$openInvoice, key: r'open_invoice', opt: true);
  static DateTime? _$createdAt(Subscription v) => v.createdAt;
  static const Field<Subscription, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt, key: r'created_at', opt: true);
  static Plan? _$plan(Subscription v) => v.plan;
  static const Field<Subscription, Plan> _f$plan =
      Field('plan', _$plan, opt: true);
  static SubscriptionAuthorization? _$authorization(Subscription v) =>
      v.authorization;
  static const Field<Subscription, SubscriptionAuthorization> _f$authorization =
      Field('authorization', _$authorization, opt: true);
  static SubscriptionCustomer? _$customer(Subscription v) => v.customer;
  static const Field<Subscription, SubscriptionCustomer> _f$customer =
      Field('customer', _$customer, opt: true);
  static String? _$status(Subscription v) => v.status;
  static const Field<Subscription, String> _f$status =
      Field('status', _$status, opt: true);
  static int? _$quantity(Subscription v) => v.quantity;
  static const Field<Subscription, int> _f$quantity =
      Field('quantity', _$quantity, opt: true);
  static SubscriptionInvoice? _$mostRecentInvoice(Subscription v) =>
      v.mostRecentInvoice;
  static const Field<Subscription, SubscriptionInvoice> _f$mostRecentInvoice =
      Field('mostRecentInvoice', _$mostRecentInvoice,
          key: r'most_recent_invoice', opt: true);

  @override
  final MappableFields<Subscription> fields = const {
    #id: _f$id,
    #subscriptionCode: _f$subscriptionCode,
    #emailToken: _f$emailToken,
    #amount: _f$amount,
    #cron: _f$cron,
    #nextPaymentDate: _f$nextPaymentDate,
    #openInvoice: _f$openInvoice,
    #createdAt: _f$createdAt,
    #plan: _f$plan,
    #authorization: _f$authorization,
    #customer: _f$customer,
    #status: _f$status,
    #quantity: _f$quantity,
    #mostRecentInvoice: _f$mostRecentInvoice,
  };

  static Subscription _instantiate(DecodingData data) {
    return Subscription(
        id: data.dec(_f$id),
        subscriptionCode: data.dec(_f$subscriptionCode),
        emailToken: data.dec(_f$emailToken),
        amount: data.dec(_f$amount),
        cron: data.dec(_f$cron),
        nextPaymentDate: data.dec(_f$nextPaymentDate),
        openInvoice: data.dec(_f$openInvoice),
        createdAt: data.dec(_f$createdAt),
        plan: data.dec(_f$plan),
        authorization: data.dec(_f$authorization),
        customer: data.dec(_f$customer),
        status: data.dec(_f$status),
        quantity: data.dec(_f$quantity),
        mostRecentInvoice: data.dec(_f$mostRecentInvoice));
  }

  @override
  final Function instantiate = _instantiate;

  static Subscription fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Subscription>(map);
  }

  static Subscription fromJson(String json) {
    return ensureInitialized().decodeJson<Subscription>(json);
  }
}

mixin SubscriptionMappable {
  String toJson() {
    return SubscriptionMapper.ensureInitialized()
        .encodeJson<Subscription>(this as Subscription);
  }

  Map<String, dynamic> toMap() {
    return SubscriptionMapper.ensureInitialized()
        .encodeMap<Subscription>(this as Subscription);
  }

  SubscriptionCopyWith<Subscription, Subscription, Subscription> get copyWith =>
      _SubscriptionCopyWithImpl<Subscription, Subscription>(
          this as Subscription, $identity, $identity);
  @override
  String toString() {
    return SubscriptionMapper.ensureInitialized()
        .stringifyValue(this as Subscription);
  }

  @override
  bool operator ==(Object other) {
    return SubscriptionMapper.ensureInitialized()
        .equalsValue(this as Subscription, other);
  }

  @override
  int get hashCode {
    return SubscriptionMapper.ensureInitialized()
        .hashValue(this as Subscription);
  }
}

extension SubscriptionValueCopy<$R, $Out>
    on ObjectCopyWith<$R, Subscription, $Out> {
  SubscriptionCopyWith<$R, Subscription, $Out> get $asSubscription =>
      $base.as((v, t, t2) => _SubscriptionCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SubscriptionCopyWith<$R, $In extends Subscription, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  PlanCopyWith<$R, Plan, Plan>? get plan;
  SubscriptionAuthorizationCopyWith<$R, SubscriptionAuthorization,
      SubscriptionAuthorization>? get authorization;
  SubscriptionCustomerCopyWith<$R, SubscriptionCustomer, SubscriptionCustomer>?
      get customer;
  SubscriptionInvoiceCopyWith<$R, SubscriptionInvoice, SubscriptionInvoice>?
      get mostRecentInvoice;
  $R call(
      {int? id,
      String? subscriptionCode,
      String? emailToken,
      int? amount,
      String? cron,
      DateTime? nextPaymentDate,
      String? openInvoice,
      DateTime? createdAt,
      Plan? plan,
      SubscriptionAuthorization? authorization,
      SubscriptionCustomer? customer,
      String? status,
      int? quantity,
      SubscriptionInvoice? mostRecentInvoice});
  SubscriptionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SubscriptionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Subscription, $Out>
    implements SubscriptionCopyWith<$R, Subscription, $Out> {
  _SubscriptionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Subscription> $mapper =
      SubscriptionMapper.ensureInitialized();
  @override
  PlanCopyWith<$R, Plan, Plan>? get plan =>
      $value.plan?.copyWith.$chain((v) => call(plan: v));
  @override
  SubscriptionAuthorizationCopyWith<$R, SubscriptionAuthorization,
          SubscriptionAuthorization>?
      get authorization =>
          $value.authorization?.copyWith.$chain((v) => call(authorization: v));
  @override
  SubscriptionCustomerCopyWith<$R, SubscriptionCustomer, SubscriptionCustomer>?
      get customer =>
          $value.customer?.copyWith.$chain((v) => call(customer: v));
  @override
  SubscriptionInvoiceCopyWith<$R, SubscriptionInvoice, SubscriptionInvoice>?
      get mostRecentInvoice => $value.mostRecentInvoice?.copyWith
          .$chain((v) => call(mostRecentInvoice: v));
  @override
  $R call(
          {Object? id = $none,
          Object? subscriptionCode = $none,
          Object? emailToken = $none,
          Object? amount = $none,
          Object? cron = $none,
          Object? nextPaymentDate = $none,
          Object? openInvoice = $none,
          Object? createdAt = $none,
          Object? plan = $none,
          Object? authorization = $none,
          Object? customer = $none,
          Object? status = $none,
          Object? quantity = $none,
          Object? mostRecentInvoice = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (subscriptionCode != $none) #subscriptionCode: subscriptionCode,
        if (emailToken != $none) #emailToken: emailToken,
        if (amount != $none) #amount: amount,
        if (cron != $none) #cron: cron,
        if (nextPaymentDate != $none) #nextPaymentDate: nextPaymentDate,
        if (openInvoice != $none) #openInvoice: openInvoice,
        if (createdAt != $none) #createdAt: createdAt,
        if (plan != $none) #plan: plan,
        if (authorization != $none) #authorization: authorization,
        if (customer != $none) #customer: customer,
        if (status != $none) #status: status,
        if (quantity != $none) #quantity: quantity,
        if (mostRecentInvoice != $none) #mostRecentInvoice: mostRecentInvoice
      }));
  @override
  Subscription $make(CopyWithData data) => Subscription(
      id: data.get(#id, or: $value.id),
      subscriptionCode:
          data.get(#subscriptionCode, or: $value.subscriptionCode),
      emailToken: data.get(#emailToken, or: $value.emailToken),
      amount: data.get(#amount, or: $value.amount),
      cron: data.get(#cron, or: $value.cron),
      nextPaymentDate: data.get(#nextPaymentDate, or: $value.nextPaymentDate),
      openInvoice: data.get(#openInvoice, or: $value.openInvoice),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      plan: data.get(#plan, or: $value.plan),
      authorization: data.get(#authorization, or: $value.authorization),
      customer: data.get(#customer, or: $value.customer),
      status: data.get(#status, or: $value.status),
      quantity: data.get(#quantity, or: $value.quantity),
      mostRecentInvoice:
          data.get(#mostRecentInvoice, or: $value.mostRecentInvoice));

  @override
  SubscriptionCopyWith<$R2, Subscription, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SubscriptionCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class SubscriptionAuthorizationMapper
    extends ClassMapperBase<SubscriptionAuthorization> {
  SubscriptionAuthorizationMapper._();

  static SubscriptionAuthorizationMapper? _instance;
  static SubscriptionAuthorizationMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = SubscriptionAuthorizationMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'SubscriptionAuthorization';

  static String? _$authorizationCode(SubscriptionAuthorization v) =>
      v.authorizationCode;
  static const Field<SubscriptionAuthorization, String> _f$authorizationCode =
      Field('authorizationCode', _$authorizationCode,
          key: r'authorization_code', opt: true);
  static String? _$bin(SubscriptionAuthorization v) => v.bin;
  static const Field<SubscriptionAuthorization, String> _f$bin =
      Field('bin', _$bin, opt: true);
  static String? _$last4(SubscriptionAuthorization v) => v.last4;
  static const Field<SubscriptionAuthorization, String> _f$last4 =
      Field('last4', _$last4, opt: true);
  static String? _$expMonth(SubscriptionAuthorization v) => v.expMonth;
  static const Field<SubscriptionAuthorization, String> _f$expMonth =
      Field('expMonth', _$expMonth, key: r'exp_month', opt: true);
  static String? _$expYear(SubscriptionAuthorization v) => v.expYear;
  static const Field<SubscriptionAuthorization, String> _f$expYear =
      Field('expYear', _$expYear, key: r'exp_year', opt: true);
  static String? _$cardType(SubscriptionAuthorization v) => v.cardType;
  static const Field<SubscriptionAuthorization, String> _f$cardType =
      Field('cardType', _$cardType, key: r'card_type', opt: true);
  static String? _$bank(SubscriptionAuthorization v) => v.bank;
  static const Field<SubscriptionAuthorization, String> _f$bank =
      Field('bank', _$bank, opt: true);
  static String? _$countryCode(SubscriptionAuthorization v) => v.countryCode;
  static const Field<SubscriptionAuthorization, String> _f$countryCode =
      Field('countryCode', _$countryCode, key: r'country_code', opt: true);
  static String? _$brand(SubscriptionAuthorization v) => v.brand;
  static const Field<SubscriptionAuthorization, String> _f$brand =
      Field('brand', _$brand, opt: true);
  static bool? _$reusable(SubscriptionAuthorization v) => v.reusable;
  static const Field<SubscriptionAuthorization, bool> _f$reusable =
      Field('reusable', _$reusable, opt: true);
  static String? _$signature(SubscriptionAuthorization v) => v.signature;
  static const Field<SubscriptionAuthorization, String> _f$signature =
      Field('signature', _$signature, opt: true);
  static String? _$accountName(SubscriptionAuthorization v) => v.accountName;
  static const Field<SubscriptionAuthorization, String> _f$accountName =
      Field('accountName', _$accountName, key: r'account_name', opt: true);

  @override
  final MappableFields<SubscriptionAuthorization> fields = const {
    #authorizationCode: _f$authorizationCode,
    #bin: _f$bin,
    #last4: _f$last4,
    #expMonth: _f$expMonth,
    #expYear: _f$expYear,
    #cardType: _f$cardType,
    #bank: _f$bank,
    #countryCode: _f$countryCode,
    #brand: _f$brand,
    #reusable: _f$reusable,
    #signature: _f$signature,
    #accountName: _f$accountName,
  };

  static SubscriptionAuthorization _instantiate(DecodingData data) {
    return SubscriptionAuthorization(
        authorizationCode: data.dec(_f$authorizationCode),
        bin: data.dec(_f$bin),
        last4: data.dec(_f$last4),
        expMonth: data.dec(_f$expMonth),
        expYear: data.dec(_f$expYear),
        cardType: data.dec(_f$cardType),
        bank: data.dec(_f$bank),
        countryCode: data.dec(_f$countryCode),
        brand: data.dec(_f$brand),
        reusable: data.dec(_f$reusable),
        signature: data.dec(_f$signature),
        accountName: data.dec(_f$accountName));
  }

  @override
  final Function instantiate = _instantiate;

  static SubscriptionAuthorization fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SubscriptionAuthorization>(map);
  }

  static SubscriptionAuthorization fromJson(String json) {
    return ensureInitialized().decodeJson<SubscriptionAuthorization>(json);
  }
}

mixin SubscriptionAuthorizationMappable {
  String toJson() {
    return SubscriptionAuthorizationMapper.ensureInitialized()
        .encodeJson<SubscriptionAuthorization>(
            this as SubscriptionAuthorization);
  }

  Map<String, dynamic> toMap() {
    return SubscriptionAuthorizationMapper.ensureInitialized()
        .encodeMap<SubscriptionAuthorization>(
            this as SubscriptionAuthorization);
  }

  SubscriptionAuthorizationCopyWith<SubscriptionAuthorization,
          SubscriptionAuthorization, SubscriptionAuthorization>
      get copyWith => _SubscriptionAuthorizationCopyWithImpl<
              SubscriptionAuthorization, SubscriptionAuthorization>(
          this as SubscriptionAuthorization, $identity, $identity);
  @override
  String toString() {
    return SubscriptionAuthorizationMapper.ensureInitialized()
        .stringifyValue(this as SubscriptionAuthorization);
  }

  @override
  bool operator ==(Object other) {
    return SubscriptionAuthorizationMapper.ensureInitialized()
        .equalsValue(this as SubscriptionAuthorization, other);
  }

  @override
  int get hashCode {
    return SubscriptionAuthorizationMapper.ensureInitialized()
        .hashValue(this as SubscriptionAuthorization);
  }
}

extension SubscriptionAuthorizationValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SubscriptionAuthorization, $Out> {
  SubscriptionAuthorizationCopyWith<$R, SubscriptionAuthorization, $Out>
      get $asSubscriptionAuthorization => $base.as((v, t, t2) =>
          _SubscriptionAuthorizationCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SubscriptionAuthorizationCopyWith<
    $R,
    $In extends SubscriptionAuthorization,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? authorizationCode,
      String? bin,
      String? last4,
      String? expMonth,
      String? expYear,
      String? cardType,
      String? bank,
      String? countryCode,
      String? brand,
      bool? reusable,
      String? signature,
      String? accountName});
  SubscriptionAuthorizationCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SubscriptionAuthorizationCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SubscriptionAuthorization, $Out>
    implements
        SubscriptionAuthorizationCopyWith<$R, SubscriptionAuthorization, $Out> {
  _SubscriptionAuthorizationCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SubscriptionAuthorization> $mapper =
      SubscriptionAuthorizationMapper.ensureInitialized();
  @override
  $R call(
          {Object? authorizationCode = $none,
          Object? bin = $none,
          Object? last4 = $none,
          Object? expMonth = $none,
          Object? expYear = $none,
          Object? cardType = $none,
          Object? bank = $none,
          Object? countryCode = $none,
          Object? brand = $none,
          Object? reusable = $none,
          Object? signature = $none,
          Object? accountName = $none}) =>
      $apply(FieldCopyWithData({
        if (authorizationCode != $none) #authorizationCode: authorizationCode,
        if (bin != $none) #bin: bin,
        if (last4 != $none) #last4: last4,
        if (expMonth != $none) #expMonth: expMonth,
        if (expYear != $none) #expYear: expYear,
        if (cardType != $none) #cardType: cardType,
        if (bank != $none) #bank: bank,
        if (countryCode != $none) #countryCode: countryCode,
        if (brand != $none) #brand: brand,
        if (reusable != $none) #reusable: reusable,
        if (signature != $none) #signature: signature,
        if (accountName != $none) #accountName: accountName
      }));
  @override
  SubscriptionAuthorization $make(CopyWithData data) =>
      SubscriptionAuthorization(
          authorizationCode:
              data.get(#authorizationCode, or: $value.authorizationCode),
          bin: data.get(#bin, or: $value.bin),
          last4: data.get(#last4, or: $value.last4),
          expMonth: data.get(#expMonth, or: $value.expMonth),
          expYear: data.get(#expYear, or: $value.expYear),
          cardType: data.get(#cardType, or: $value.cardType),
          bank: data.get(#bank, or: $value.bank),
          countryCode: data.get(#countryCode, or: $value.countryCode),
          brand: data.get(#brand, or: $value.brand),
          reusable: data.get(#reusable, or: $value.reusable),
          signature: data.get(#signature, or: $value.signature),
          accountName: data.get(#accountName, or: $value.accountName));

  @override
  SubscriptionAuthorizationCopyWith<$R2, SubscriptionAuthorization, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _SubscriptionAuthorizationCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class SubscriptionCustomerMapper extends ClassMapperBase<SubscriptionCustomer> {
  SubscriptionCustomerMapper._();

  static SubscriptionCustomerMapper? _instance;
  static SubscriptionCustomerMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SubscriptionCustomerMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'SubscriptionCustomer';

  static int? _$id(SubscriptionCustomer v) => v.id;
  static const Field<SubscriptionCustomer, int> _f$id =
      Field('id', _$id, opt: true);
  static String? _$firstName(SubscriptionCustomer v) => v.firstName;
  static const Field<SubscriptionCustomer, String> _f$firstName =
      Field('firstName', _$firstName, key: r'first_name', opt: true);
  static String? _$lastName(SubscriptionCustomer v) => v.lastName;
  static const Field<SubscriptionCustomer, String> _f$lastName =
      Field('lastName', _$lastName, key: r'last_name', opt: true);
  static String? _$email(SubscriptionCustomer v) => v.email;
  static const Field<SubscriptionCustomer, String> _f$email =
      Field('email', _$email, opt: true);
  static String? _$customerCode(SubscriptionCustomer v) => v.customerCode;
  static const Field<SubscriptionCustomer, String> _f$customerCode =
      Field('customerCode', _$customerCode, key: r'customer_code', opt: true);
  static String? _$phone(SubscriptionCustomer v) => v.phone;
  static const Field<SubscriptionCustomer, String> _f$phone =
      Field('phone', _$phone, opt: true);
  static Map<String, dynamic>? _$metadata(SubscriptionCustomer v) => v.metadata;
  static const Field<SubscriptionCustomer, Map<String, dynamic>> _f$metadata =
      Field('metadata', _$metadata, opt: true);

  @override
  final MappableFields<SubscriptionCustomer> fields = const {
    #id: _f$id,
    #firstName: _f$firstName,
    #lastName: _f$lastName,
    #email: _f$email,
    #customerCode: _f$customerCode,
    #phone: _f$phone,
    #metadata: _f$metadata,
  };

  static SubscriptionCustomer _instantiate(DecodingData data) {
    return SubscriptionCustomer(
        id: data.dec(_f$id),
        firstName: data.dec(_f$firstName),
        lastName: data.dec(_f$lastName),
        email: data.dec(_f$email),
        customerCode: data.dec(_f$customerCode),
        phone: data.dec(_f$phone),
        metadata: data.dec(_f$metadata));
  }

  @override
  final Function instantiate = _instantiate;

  static SubscriptionCustomer fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SubscriptionCustomer>(map);
  }

  static SubscriptionCustomer fromJson(String json) {
    return ensureInitialized().decodeJson<SubscriptionCustomer>(json);
  }
}

mixin SubscriptionCustomerMappable {
  String toJson() {
    return SubscriptionCustomerMapper.ensureInitialized()
        .encodeJson<SubscriptionCustomer>(this as SubscriptionCustomer);
  }

  Map<String, dynamic> toMap() {
    return SubscriptionCustomerMapper.ensureInitialized()
        .encodeMap<SubscriptionCustomer>(this as SubscriptionCustomer);
  }

  SubscriptionCustomerCopyWith<SubscriptionCustomer, SubscriptionCustomer,
      SubscriptionCustomer> get copyWith => _SubscriptionCustomerCopyWithImpl<
          SubscriptionCustomer, SubscriptionCustomer>(
      this as SubscriptionCustomer, $identity, $identity);
  @override
  String toString() {
    return SubscriptionCustomerMapper.ensureInitialized()
        .stringifyValue(this as SubscriptionCustomer);
  }

  @override
  bool operator ==(Object other) {
    return SubscriptionCustomerMapper.ensureInitialized()
        .equalsValue(this as SubscriptionCustomer, other);
  }

  @override
  int get hashCode {
    return SubscriptionCustomerMapper.ensureInitialized()
        .hashValue(this as SubscriptionCustomer);
  }
}

extension SubscriptionCustomerValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SubscriptionCustomer, $Out> {
  SubscriptionCustomerCopyWith<$R, SubscriptionCustomer, $Out>
      get $asSubscriptionCustomer => $base.as(
          (v, t, t2) => _SubscriptionCustomerCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SubscriptionCustomerCopyWith<
    $R,
    $In extends SubscriptionCustomer,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
      get metadata;
  $R call(
      {int? id,
      String? firstName,
      String? lastName,
      String? email,
      String? customerCode,
      String? phone,
      Map<String, dynamic>? metadata});
  SubscriptionCustomerCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SubscriptionCustomerCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SubscriptionCustomer, $Out>
    implements SubscriptionCustomerCopyWith<$R, SubscriptionCustomer, $Out> {
  _SubscriptionCustomerCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SubscriptionCustomer> $mapper =
      SubscriptionCustomerMapper.ensureInitialized();
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
          {Object? id = $none,
          Object? firstName = $none,
          Object? lastName = $none,
          Object? email = $none,
          Object? customerCode = $none,
          Object? phone = $none,
          Object? metadata = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (firstName != $none) #firstName: firstName,
        if (lastName != $none) #lastName: lastName,
        if (email != $none) #email: email,
        if (customerCode != $none) #customerCode: customerCode,
        if (phone != $none) #phone: phone,
        if (metadata != $none) #metadata: metadata
      }));
  @override
  SubscriptionCustomer $make(CopyWithData data) => SubscriptionCustomer(
      id: data.get(#id, or: $value.id),
      firstName: data.get(#firstName, or: $value.firstName),
      lastName: data.get(#lastName, or: $value.lastName),
      email: data.get(#email, or: $value.email),
      customerCode: data.get(#customerCode, or: $value.customerCode),
      phone: data.get(#phone, or: $value.phone),
      metadata: data.get(#metadata, or: $value.metadata));

  @override
  SubscriptionCustomerCopyWith<$R2, SubscriptionCustomer, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _SubscriptionCustomerCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class SubscriptionInvoiceMapper extends ClassMapperBase<SubscriptionInvoice> {
  SubscriptionInvoiceMapper._();

  static SubscriptionInvoiceMapper? _instance;
  static SubscriptionInvoiceMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SubscriptionInvoiceMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'SubscriptionInvoice';

  static int? _$id(SubscriptionInvoice v) => v.id;
  static const Field<SubscriptionInvoice, int> _f$id =
      Field('id', _$id, opt: true);
  static int? _$amount(SubscriptionInvoice v) => v.amount;
  static const Field<SubscriptionInvoice, int> _f$amount =
      Field('amount', _$amount, opt: true);
  static String? _$status(SubscriptionInvoice v) => v.status;
  static const Field<SubscriptionInvoice, String> _f$status =
      Field('status', _$status, opt: true);
  static String? _$description(SubscriptionInvoice v) => v.description;
  static const Field<SubscriptionInvoice, String> _f$description =
      Field('description', _$description, opt: true);
  static DateTime? _$dueDate(SubscriptionInvoice v) => v.dueDate;
  static const Field<SubscriptionInvoice, DateTime> _f$dueDate =
      Field('dueDate', _$dueDate, key: r'due_date', opt: true);
  static DateTime? _$paidAt(SubscriptionInvoice v) => v.paidAt;
  static const Field<SubscriptionInvoice, DateTime> _f$paidAt =
      Field('paidAt', _$paidAt, key: r'paid_at', opt: true);

  @override
  final MappableFields<SubscriptionInvoice> fields = const {
    #id: _f$id,
    #amount: _f$amount,
    #status: _f$status,
    #description: _f$description,
    #dueDate: _f$dueDate,
    #paidAt: _f$paidAt,
  };

  static SubscriptionInvoice _instantiate(DecodingData data) {
    return SubscriptionInvoice(
        id: data.dec(_f$id),
        amount: data.dec(_f$amount),
        status: data.dec(_f$status),
        description: data.dec(_f$description),
        dueDate: data.dec(_f$dueDate),
        paidAt: data.dec(_f$paidAt));
  }

  @override
  final Function instantiate = _instantiate;

  static SubscriptionInvoice fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SubscriptionInvoice>(map);
  }

  static SubscriptionInvoice fromJson(String json) {
    return ensureInitialized().decodeJson<SubscriptionInvoice>(json);
  }
}

mixin SubscriptionInvoiceMappable {
  String toJson() {
    return SubscriptionInvoiceMapper.ensureInitialized()
        .encodeJson<SubscriptionInvoice>(this as SubscriptionInvoice);
  }

  Map<String, dynamic> toMap() {
    return SubscriptionInvoiceMapper.ensureInitialized()
        .encodeMap<SubscriptionInvoice>(this as SubscriptionInvoice);
  }

  SubscriptionInvoiceCopyWith<SubscriptionInvoice, SubscriptionInvoice,
      SubscriptionInvoice> get copyWith => _SubscriptionInvoiceCopyWithImpl<
          SubscriptionInvoice, SubscriptionInvoice>(
      this as SubscriptionInvoice, $identity, $identity);
  @override
  String toString() {
    return SubscriptionInvoiceMapper.ensureInitialized()
        .stringifyValue(this as SubscriptionInvoice);
  }

  @override
  bool operator ==(Object other) {
    return SubscriptionInvoiceMapper.ensureInitialized()
        .equalsValue(this as SubscriptionInvoice, other);
  }

  @override
  int get hashCode {
    return SubscriptionInvoiceMapper.ensureInitialized()
        .hashValue(this as SubscriptionInvoice);
  }
}

extension SubscriptionInvoiceValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SubscriptionInvoice, $Out> {
  SubscriptionInvoiceCopyWith<$R, SubscriptionInvoice, $Out>
      get $asSubscriptionInvoice => $base.as(
          (v, t, t2) => _SubscriptionInvoiceCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SubscriptionInvoiceCopyWith<$R, $In extends SubscriptionInvoice,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? id,
      int? amount,
      String? status,
      String? description,
      DateTime? dueDate,
      DateTime? paidAt});
  SubscriptionInvoiceCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SubscriptionInvoiceCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SubscriptionInvoice, $Out>
    implements SubscriptionInvoiceCopyWith<$R, SubscriptionInvoice, $Out> {
  _SubscriptionInvoiceCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SubscriptionInvoice> $mapper =
      SubscriptionInvoiceMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? amount = $none,
          Object? status = $none,
          Object? description = $none,
          Object? dueDate = $none,
          Object? paidAt = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (amount != $none) #amount: amount,
        if (status != $none) #status: status,
        if (description != $none) #description: description,
        if (dueDate != $none) #dueDate: dueDate,
        if (paidAt != $none) #paidAt: paidAt
      }));
  @override
  SubscriptionInvoice $make(CopyWithData data) => SubscriptionInvoice(
      id: data.get(#id, or: $value.id),
      amount: data.get(#amount, or: $value.amount),
      status: data.get(#status, or: $value.status),
      description: data.get(#description, or: $value.description),
      dueDate: data.get(#dueDate, or: $value.dueDate),
      paidAt: data.get(#paidAt, or: $value.paidAt));

  @override
  SubscriptionInvoiceCopyWith<$R2, SubscriptionInvoice, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _SubscriptionInvoiceCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class SubscriptionLinkMapper extends ClassMapperBase<SubscriptionLink> {
  SubscriptionLinkMapper._();

  static SubscriptionLinkMapper? _instance;
  static SubscriptionLinkMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SubscriptionLinkMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'SubscriptionLink';

  static String? _$link(SubscriptionLink v) => v.link;
  static const Field<SubscriptionLink, String> _f$link =
      Field('link', _$link, opt: true);

  @override
  final MappableFields<SubscriptionLink> fields = const {
    #link: _f$link,
  };

  static SubscriptionLink _instantiate(DecodingData data) {
    return SubscriptionLink(link: data.dec(_f$link));
  }

  @override
  final Function instantiate = _instantiate;

  static SubscriptionLink fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SubscriptionLink>(map);
  }

  static SubscriptionLink fromJson(String json) {
    return ensureInitialized().decodeJson<SubscriptionLink>(json);
  }
}

mixin SubscriptionLinkMappable {
  String toJson() {
    return SubscriptionLinkMapper.ensureInitialized()
        .encodeJson<SubscriptionLink>(this as SubscriptionLink);
  }

  Map<String, dynamic> toMap() {
    return SubscriptionLinkMapper.ensureInitialized()
        .encodeMap<SubscriptionLink>(this as SubscriptionLink);
  }

  SubscriptionLinkCopyWith<SubscriptionLink, SubscriptionLink, SubscriptionLink>
      get copyWith =>
          _SubscriptionLinkCopyWithImpl<SubscriptionLink, SubscriptionLink>(
              this as SubscriptionLink, $identity, $identity);
  @override
  String toString() {
    return SubscriptionLinkMapper.ensureInitialized()
        .stringifyValue(this as SubscriptionLink);
  }

  @override
  bool operator ==(Object other) {
    return SubscriptionLinkMapper.ensureInitialized()
        .equalsValue(this as SubscriptionLink, other);
  }

  @override
  int get hashCode {
    return SubscriptionLinkMapper.ensureInitialized()
        .hashValue(this as SubscriptionLink);
  }
}

extension SubscriptionLinkValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SubscriptionLink, $Out> {
  SubscriptionLinkCopyWith<$R, SubscriptionLink, $Out>
      get $asSubscriptionLink => $base
          .as((v, t, t2) => _SubscriptionLinkCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SubscriptionLinkCopyWith<$R, $In extends SubscriptionLink, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? link});
  SubscriptionLinkCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SubscriptionLinkCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SubscriptionLink, $Out>
    implements SubscriptionLinkCopyWith<$R, SubscriptionLink, $Out> {
  _SubscriptionLinkCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SubscriptionLink> $mapper =
      SubscriptionLinkMapper.ensureInitialized();
  @override
  $R call({Object? link = $none}) =>
      $apply(FieldCopyWithData({if (link != $none) #link: link}));
  @override
  SubscriptionLink $make(CopyWithData data) =>
      SubscriptionLink(link: data.get(#link, or: $value.link));

  @override
  SubscriptionLinkCopyWith<$R2, SubscriptionLink, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SubscriptionLinkCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
