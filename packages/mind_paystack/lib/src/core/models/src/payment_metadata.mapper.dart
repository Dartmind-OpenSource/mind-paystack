// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'payment_metadata.dart';

class PaymentMetadataMapper extends ClassMapperBase<PaymentMetadata> {
  PaymentMetadataMapper._();

  static PaymentMetadataMapper? _instance;
  static PaymentMetadataMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PaymentMetadataMapper._());
      CustomFieldMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PaymentMetadata';

  static List<CustomField>? _$customFields(PaymentMetadata v) => v.customFields;
  static const Field<PaymentMetadata, List<CustomField>> _f$customFields =
      Field('customFields', _$customFields, opt: true);
  static String? _$narration(PaymentMetadata v) => v.narration;
  static const Field<PaymentMetadata, String> _f$narration =
      Field('narration', _$narration, opt: true);

  @override
  final MappableFields<PaymentMetadata> fields = const {
    #customFields: _f$customFields,
    #narration: _f$narration,
  };

  static PaymentMetadata _instantiate(DecodingData data) {
    return PaymentMetadata(
        customFields: data.dec(_f$customFields),
        narration: data.dec(_f$narration));
  }

  @override
  final Function instantiate = _instantiate;

  static PaymentMetadata fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PaymentMetadata>(map);
  }

  static PaymentMetadata fromJson(String json) {
    return ensureInitialized().decodeJson<PaymentMetadata>(json);
  }
}

mixin PaymentMetadataMappable {
  String toJson() {
    return PaymentMetadataMapper.ensureInitialized()
        .encodeJson<PaymentMetadata>(this as PaymentMetadata);
  }

  Map<String, dynamic> toMap() {
    return PaymentMetadataMapper.ensureInitialized()
        .encodeMap<PaymentMetadata>(this as PaymentMetadata);
  }

  PaymentMetadataCopyWith<PaymentMetadata, PaymentMetadata, PaymentMetadata>
      get copyWith =>
          _PaymentMetadataCopyWithImpl<PaymentMetadata, PaymentMetadata>(
              this as PaymentMetadata, $identity, $identity);
  @override
  String toString() {
    return PaymentMetadataMapper.ensureInitialized()
        .stringifyValue(this as PaymentMetadata);
  }

  @override
  bool operator ==(Object other) {
    return PaymentMetadataMapper.ensureInitialized()
        .equalsValue(this as PaymentMetadata, other);
  }

  @override
  int get hashCode {
    return PaymentMetadataMapper.ensureInitialized()
        .hashValue(this as PaymentMetadata);
  }
}

extension PaymentMetadataValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PaymentMetadata, $Out> {
  PaymentMetadataCopyWith<$R, PaymentMetadata, $Out> get $asPaymentMetadata =>
      $base.as((v, t, t2) => _PaymentMetadataCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class PaymentMetadataCopyWith<$R, $In extends PaymentMetadata, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, CustomField,
      CustomFieldCopyWith<$R, CustomField, CustomField>>? get customFields;
  $R call({List<CustomField>? customFields, String? narration});
  PaymentMetadataCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _PaymentMetadataCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PaymentMetadata, $Out>
    implements PaymentMetadataCopyWith<$R, PaymentMetadata, $Out> {
  _PaymentMetadataCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PaymentMetadata> $mapper =
      PaymentMetadataMapper.ensureInitialized();
  @override
  ListCopyWith<$R, CustomField,
          CustomFieldCopyWith<$R, CustomField, CustomField>>?
      get customFields => $value.customFields != null
          ? ListCopyWith($value.customFields!, (v, t) => v.copyWith.$chain(t),
              (v) => call(customFields: v))
          : null;
  @override
  $R call({Object? customFields = $none, Object? narration = $none}) =>
      $apply(FieldCopyWithData({
        if (customFields != $none) #customFields: customFields,
        if (narration != $none) #narration: narration
      }));
  @override
  PaymentMetadata $make(CopyWithData data) => PaymentMetadata(
      customFields: data.get(#customFields, or: $value.customFields),
      narration: data.get(#narration, or: $value.narration));

  @override
  PaymentMetadataCopyWith<$R2, PaymentMetadata, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PaymentMetadataCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
