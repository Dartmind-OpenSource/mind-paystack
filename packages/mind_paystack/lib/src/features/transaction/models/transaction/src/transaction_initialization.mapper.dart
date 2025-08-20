// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'transaction_initialization.dart';

class TransactionInitializationMapper
    extends ClassMapperBase<TransactionInitialization> {
  TransactionInitializationMapper._();

  static TransactionInitializationMapper? _instance;
  static TransactionInitializationMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = TransactionInitializationMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'TransactionInitialization';

  static String _$authorizationUrl(TransactionInitialization v) =>
      v.authorizationUrl;
  static const Field<TransactionInitialization, String> _f$authorizationUrl =
      Field('authorizationUrl', _$authorizationUrl, key: r'authorization_url');
  static String _$accessCode(TransactionInitialization v) => v.accessCode;
  static const Field<TransactionInitialization, String> _f$accessCode =
      Field('accessCode', _$accessCode, key: r'access_code');
  static String _$reference(TransactionInitialization v) => v.reference;
  static const Field<TransactionInitialization, String> _f$reference =
      Field('reference', _$reference);

  @override
  final MappableFields<TransactionInitialization> fields = const {
    #authorizationUrl: _f$authorizationUrl,
    #accessCode: _f$accessCode,
    #reference: _f$reference,
  };

  static TransactionInitialization _instantiate(DecodingData data) {
    return TransactionInitialization(
        authorizationUrl: data.dec(_f$authorizationUrl),
        accessCode: data.dec(_f$accessCode),
        reference: data.dec(_f$reference));
  }

  @override
  final Function instantiate = _instantiate;

  static TransactionInitialization fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TransactionInitialization>(map);
  }

  static TransactionInitialization fromJson(String json) {
    return ensureInitialized().decodeJson<TransactionInitialization>(json);
  }
}

mixin TransactionInitializationMappable {
  String toJson() {
    return TransactionInitializationMapper.ensureInitialized()
        .encodeJson<TransactionInitialization>(
            this as TransactionInitialization);
  }

  Map<String, dynamic> toMap() {
    return TransactionInitializationMapper.ensureInitialized()
        .encodeMap<TransactionInitialization>(
            this as TransactionInitialization);
  }

  TransactionInitializationCopyWith<TransactionInitialization,
          TransactionInitialization, TransactionInitialization>
      get copyWith => _TransactionInitializationCopyWithImpl<
              TransactionInitialization, TransactionInitialization>(
          this as TransactionInitialization, $identity, $identity);
  @override
  String toString() {
    return TransactionInitializationMapper.ensureInitialized()
        .stringifyValue(this as TransactionInitialization);
  }

  @override
  bool operator ==(Object other) {
    return TransactionInitializationMapper.ensureInitialized()
        .equalsValue(this as TransactionInitialization, other);
  }

  @override
  int get hashCode {
    return TransactionInitializationMapper.ensureInitialized()
        .hashValue(this as TransactionInitialization);
  }
}

extension TransactionInitializationValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TransactionInitialization, $Out> {
  TransactionInitializationCopyWith<$R, TransactionInitialization, $Out>
      get $asTransactionInitialization => $base.as((v, t, t2) =>
          _TransactionInitializationCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TransactionInitializationCopyWith<
    $R,
    $In extends TransactionInitialization,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? authorizationUrl, String? accessCode, String? reference});
  TransactionInitializationCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TransactionInitializationCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TransactionInitialization, $Out>
    implements
        TransactionInitializationCopyWith<$R, TransactionInitialization, $Out> {
  _TransactionInitializationCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TransactionInitialization> $mapper =
      TransactionInitializationMapper.ensureInitialized();
  @override
  $R call({String? authorizationUrl, String? accessCode, String? reference}) =>
      $apply(FieldCopyWithData({
        if (authorizationUrl != null) #authorizationUrl: authorizationUrl,
        if (accessCode != null) #accessCode: accessCode,
        if (reference != null) #reference: reference
      }));
  @override
  TransactionInitialization $make(CopyWithData data) =>
      TransactionInitialization(
          authorizationUrl:
              data.get(#authorizationUrl, or: $value.authorizationUrl),
          accessCode: data.get(#accessCode, or: $value.accessCode),
          reference: data.get(#reference, or: $value.reference));

  @override
  TransactionInitializationCopyWith<$R2, TransactionInitialization, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _TransactionInitializationCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
