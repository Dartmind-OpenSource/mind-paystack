// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'authorization_data.dart';

class AuthorizationDataMapper extends ClassMapperBase<AuthorizationData> {
  AuthorizationDataMapper._();

  static AuthorizationDataMapper? _instance;
  static AuthorizationDataMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AuthorizationDataMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AuthorizationData';

  static String _$authorizationCode(AuthorizationData v) => v.authorizationCode;
  static const Field<AuthorizationData, String> _f$authorizationCode = Field(
      'authorizationCode', _$authorizationCode,
      key: r'authorization_code');
  static String? _$bin(AuthorizationData v) => v.bin;
  static const Field<AuthorizationData, String> _f$bin =
      Field('bin', _$bin, opt: true);
  static String? _$last4(AuthorizationData v) => v.last4;
  static const Field<AuthorizationData, String> _f$last4 =
      Field('last4', _$last4, opt: true);
  static String? _$expMonth(AuthorizationData v) => v.expMonth;
  static const Field<AuthorizationData, String> _f$expMonth =
      Field('expMonth', _$expMonth, key: r'exp_month', opt: true);
  static String? _$expYear(AuthorizationData v) => v.expYear;
  static const Field<AuthorizationData, String> _f$expYear =
      Field('expYear', _$expYear, key: r'exp_year', opt: true);
  static String? _$channel(AuthorizationData v) => v.channel;
  static const Field<AuthorizationData, String> _f$channel =
      Field('channel', _$channel, opt: true);
  static String? _$cardType(AuthorizationData v) => v.cardType;
  static const Field<AuthorizationData, String> _f$cardType =
      Field('cardType', _$cardType, key: r'card_type', opt: true);
  static String? _$bank(AuthorizationData v) => v.bank;
  static const Field<AuthorizationData, String> _f$bank =
      Field('bank', _$bank, opt: true);
  static String? _$countryCode(AuthorizationData v) => v.countryCode;
  static const Field<AuthorizationData, String> _f$countryCode =
      Field('countryCode', _$countryCode, key: r'country_code', opt: true);
  static String? _$brand(AuthorizationData v) => v.brand;
  static const Field<AuthorizationData, String> _f$brand =
      Field('brand', _$brand, opt: true);
  static String? _$signature(AuthorizationData v) => v.signature;
  static const Field<AuthorizationData, String> _f$signature =
      Field('signature', _$signature, opt: true);
  static bool? _$reusable(AuthorizationData v) => v.reusable;
  static const Field<AuthorizationData, bool> _f$reusable =
      Field('reusable', _$reusable, opt: true);
  static String? _$accountName(AuthorizationData v) => v.accountName;
  static const Field<AuthorizationData, String> _f$accountName =
      Field('accountName', _$accountName, key: r'account_name', opt: true);

  @override
  final MappableFields<AuthorizationData> fields = const {
    #authorizationCode: _f$authorizationCode,
    #bin: _f$bin,
    #last4: _f$last4,
    #expMonth: _f$expMonth,
    #expYear: _f$expYear,
    #channel: _f$channel,
    #cardType: _f$cardType,
    #bank: _f$bank,
    #countryCode: _f$countryCode,
    #brand: _f$brand,
    #signature: _f$signature,
    #reusable: _f$reusable,
    #accountName: _f$accountName,
  };

  static AuthorizationData _instantiate(DecodingData data) {
    return AuthorizationData(
        authorizationCode: data.dec(_f$authorizationCode),
        bin: data.dec(_f$bin),
        last4: data.dec(_f$last4),
        expMonth: data.dec(_f$expMonth),
        expYear: data.dec(_f$expYear),
        channel: data.dec(_f$channel),
        cardType: data.dec(_f$cardType),
        bank: data.dec(_f$bank),
        countryCode: data.dec(_f$countryCode),
        brand: data.dec(_f$brand),
        signature: data.dec(_f$signature),
        reusable: data.dec(_f$reusable),
        accountName: data.dec(_f$accountName));
  }

  @override
  final Function instantiate = _instantiate;

  static AuthorizationData fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AuthorizationData>(map);
  }

  static AuthorizationData fromJson(String json) {
    return ensureInitialized().decodeJson<AuthorizationData>(json);
  }
}

mixin AuthorizationDataMappable {
  String toJson() {
    return AuthorizationDataMapper.ensureInitialized()
        .encodeJson<AuthorizationData>(this as AuthorizationData);
  }

  Map<String, dynamic> toMap() {
    return AuthorizationDataMapper.ensureInitialized()
        .encodeMap<AuthorizationData>(this as AuthorizationData);
  }

  AuthorizationDataCopyWith<AuthorizationData, AuthorizationData,
          AuthorizationData>
      get copyWith =>
          _AuthorizationDataCopyWithImpl<AuthorizationData, AuthorizationData>(
              this as AuthorizationData, $identity, $identity);
  @override
  String toString() {
    return AuthorizationDataMapper.ensureInitialized()
        .stringifyValue(this as AuthorizationData);
  }

  @override
  bool operator ==(Object other) {
    return AuthorizationDataMapper.ensureInitialized()
        .equalsValue(this as AuthorizationData, other);
  }

  @override
  int get hashCode {
    return AuthorizationDataMapper.ensureInitialized()
        .hashValue(this as AuthorizationData);
  }
}

extension AuthorizationDataValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AuthorizationData, $Out> {
  AuthorizationDataCopyWith<$R, AuthorizationData, $Out>
      get $asAuthorizationData => $base
          .as((v, t, t2) => _AuthorizationDataCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AuthorizationDataCopyWith<$R, $In extends AuthorizationData,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? authorizationCode,
      String? bin,
      String? last4,
      String? expMonth,
      String? expYear,
      String? channel,
      String? cardType,
      String? bank,
      String? countryCode,
      String? brand,
      String? signature,
      bool? reusable,
      String? accountName});
  AuthorizationDataCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AuthorizationDataCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AuthorizationData, $Out>
    implements AuthorizationDataCopyWith<$R, AuthorizationData, $Out> {
  _AuthorizationDataCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AuthorizationData> $mapper =
      AuthorizationDataMapper.ensureInitialized();
  @override
  $R call(
          {String? authorizationCode,
          Object? bin = $none,
          Object? last4 = $none,
          Object? expMonth = $none,
          Object? expYear = $none,
          Object? channel = $none,
          Object? cardType = $none,
          Object? bank = $none,
          Object? countryCode = $none,
          Object? brand = $none,
          Object? signature = $none,
          Object? reusable = $none,
          Object? accountName = $none}) =>
      $apply(FieldCopyWithData({
        if (authorizationCode != null) #authorizationCode: authorizationCode,
        if (bin != $none) #bin: bin,
        if (last4 != $none) #last4: last4,
        if (expMonth != $none) #expMonth: expMonth,
        if (expYear != $none) #expYear: expYear,
        if (channel != $none) #channel: channel,
        if (cardType != $none) #cardType: cardType,
        if (bank != $none) #bank: bank,
        if (countryCode != $none) #countryCode: countryCode,
        if (brand != $none) #brand: brand,
        if (signature != $none) #signature: signature,
        if (reusable != $none) #reusable: reusable,
        if (accountName != $none) #accountName: accountName
      }));
  @override
  AuthorizationData $make(CopyWithData data) => AuthorizationData(
      authorizationCode:
          data.get(#authorizationCode, or: $value.authorizationCode),
      bin: data.get(#bin, or: $value.bin),
      last4: data.get(#last4, or: $value.last4),
      expMonth: data.get(#expMonth, or: $value.expMonth),
      expYear: data.get(#expYear, or: $value.expYear),
      channel: data.get(#channel, or: $value.channel),
      cardType: data.get(#cardType, or: $value.cardType),
      bank: data.get(#bank, or: $value.bank),
      countryCode: data.get(#countryCode, or: $value.countryCode),
      brand: data.get(#brand, or: $value.brand),
      signature: data.get(#signature, or: $value.signature),
      reusable: data.get(#reusable, or: $value.reusable),
      accountName: data.get(#accountName, or: $value.accountName));

  @override
  AuthorizationDataCopyWith<$R2, AuthorizationData, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AuthorizationDataCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
