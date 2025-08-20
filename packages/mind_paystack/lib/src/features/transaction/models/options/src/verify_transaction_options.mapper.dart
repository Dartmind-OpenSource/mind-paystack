// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'verify_transaction_options.dart';

class VerifyTransactionOptionsMapper
    extends ClassMapperBase<VerifyTransactionOptions> {
  VerifyTransactionOptionsMapper._();

  static VerifyTransactionOptionsMapper? _instance;
  static VerifyTransactionOptionsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = VerifyTransactionOptionsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'VerifyTransactionOptions';

  static String _$reference(VerifyTransactionOptions v) => v.reference;
  static const Field<VerifyTransactionOptions, String> _f$reference =
      Field('reference', _$reference);

  @override
  final MappableFields<VerifyTransactionOptions> fields = const {
    #reference: _f$reference,
  };

  static VerifyTransactionOptions _instantiate(DecodingData data) {
    return VerifyTransactionOptions(reference: data.dec(_f$reference));
  }

  @override
  final Function instantiate = _instantiate;

  static VerifyTransactionOptions fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<VerifyTransactionOptions>(map);
  }

  static VerifyTransactionOptions fromJson(String json) {
    return ensureInitialized().decodeJson<VerifyTransactionOptions>(json);
  }
}

mixin VerifyTransactionOptionsMappable {
  String toJson() {
    return VerifyTransactionOptionsMapper.ensureInitialized()
        .encodeJson<VerifyTransactionOptions>(this as VerifyTransactionOptions);
  }

  Map<String, dynamic> toMap() {
    return VerifyTransactionOptionsMapper.ensureInitialized()
        .encodeMap<VerifyTransactionOptions>(this as VerifyTransactionOptions);
  }

  VerifyTransactionOptionsCopyWith<VerifyTransactionOptions,
          VerifyTransactionOptions, VerifyTransactionOptions>
      get copyWith => _VerifyTransactionOptionsCopyWithImpl<
              VerifyTransactionOptions, VerifyTransactionOptions>(
          this as VerifyTransactionOptions, $identity, $identity);
  @override
  String toString() {
    return VerifyTransactionOptionsMapper.ensureInitialized()
        .stringifyValue(this as VerifyTransactionOptions);
  }

  @override
  bool operator ==(Object other) {
    return VerifyTransactionOptionsMapper.ensureInitialized()
        .equalsValue(this as VerifyTransactionOptions, other);
  }

  @override
  int get hashCode {
    return VerifyTransactionOptionsMapper.ensureInitialized()
        .hashValue(this as VerifyTransactionOptions);
  }
}

extension VerifyTransactionOptionsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, VerifyTransactionOptions, $Out> {
  VerifyTransactionOptionsCopyWith<$R, VerifyTransactionOptions, $Out>
      get $asVerifyTransactionOptions => $base.as((v, t, t2) =>
          _VerifyTransactionOptionsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class VerifyTransactionOptionsCopyWith<
    $R,
    $In extends VerifyTransactionOptions,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? reference});
  VerifyTransactionOptionsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _VerifyTransactionOptionsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, VerifyTransactionOptions, $Out>
    implements
        VerifyTransactionOptionsCopyWith<$R, VerifyTransactionOptions, $Out> {
  _VerifyTransactionOptionsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<VerifyTransactionOptions> $mapper =
      VerifyTransactionOptionsMapper.ensureInitialized();
  @override
  $R call({String? reference}) =>
      $apply(FieldCopyWithData({if (reference != null) #reference: reference}));
  @override
  VerifyTransactionOptions $make(CopyWithData data) => VerifyTransactionOptions(
      reference: data.get(#reference, or: $value.reference));

  @override
  VerifyTransactionOptionsCopyWith<$R2, VerifyTransactionOptions, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _VerifyTransactionOptionsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
