// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'custom_field.dart';

class CustomFieldMapper extends ClassMapperBase<CustomField> {
  CustomFieldMapper._();

  static CustomFieldMapper? _instance;
  static CustomFieldMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CustomFieldMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CustomField';

  static String _$displayName(CustomField v) => v.displayName;
  static const Field<CustomField, String> _f$displayName =
      Field('displayName', _$displayName);
  static String _$value(CustomField v) => v.value;
  static const Field<CustomField, String> _f$value = Field('value', _$value);

  @override
  final MappableFields<CustomField> fields = const {
    #displayName: _f$displayName,
    #value: _f$value,
  };

  static CustomField _instantiate(DecodingData data) {
    return CustomField(
        displayName: data.dec(_f$displayName), value: data.dec(_f$value));
  }

  @override
  final Function instantiate = _instantiate;

  static CustomField fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CustomField>(map);
  }

  static CustomField fromJson(String json) {
    return ensureInitialized().decodeJson<CustomField>(json);
  }
}

mixin CustomFieldMappable {
  String toJson() {
    return CustomFieldMapper.ensureInitialized()
        .encodeJson<CustomField>(this as CustomField);
  }

  Map<String, dynamic> toMap() {
    return CustomFieldMapper.ensureInitialized()
        .encodeMap<CustomField>(this as CustomField);
  }

  CustomFieldCopyWith<CustomField, CustomField, CustomField> get copyWith =>
      _CustomFieldCopyWithImpl<CustomField, CustomField>(
          this as CustomField, $identity, $identity);
  @override
  String toString() {
    return CustomFieldMapper.ensureInitialized()
        .stringifyValue(this as CustomField);
  }

  @override
  bool operator ==(Object other) {
    return CustomFieldMapper.ensureInitialized()
        .equalsValue(this as CustomField, other);
  }

  @override
  int get hashCode {
    return CustomFieldMapper.ensureInitialized().hashValue(this as CustomField);
  }
}

extension CustomFieldValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CustomField, $Out> {
  CustomFieldCopyWith<$R, CustomField, $Out> get $asCustomField =>
      $base.as((v, t, t2) => _CustomFieldCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CustomFieldCopyWith<$R, $In extends CustomField, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? displayName, String? value});
  CustomFieldCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CustomFieldCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CustomField, $Out>
    implements CustomFieldCopyWith<$R, CustomField, $Out> {
  _CustomFieldCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CustomField> $mapper =
      CustomFieldMapper.ensureInitialized();
  @override
  $R call({String? displayName, String? value}) => $apply(FieldCopyWithData({
        if (displayName != null) #displayName: displayName,
        if (value != null) #value: value
      }));
  @override
  CustomField $make(CopyWithData data) => CustomField(
      displayName: data.get(#displayName, or: $value.displayName),
      value: data.get(#value, or: $value.value));

  @override
  CustomFieldCopyWith<$R2, CustomField, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CustomFieldCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
