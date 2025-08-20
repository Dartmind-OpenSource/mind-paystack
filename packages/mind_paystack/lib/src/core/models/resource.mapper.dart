// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'resource.dart';

class ResourceMapper extends ClassMapperBase<Resource> {
  ResourceMapper._();

  static ResourceMapper? _instance;
  static ResourceMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ResourceMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Resource';
  @override
  Function get typeFactory => <T>(f) => f<Resource<T>>();

  static bool _$status(Resource v) => v.status;
  static const Field<Resource, bool> _f$status = Field('status', _$status);
  static String? _$message(Resource v) => v.message;
  static const Field<Resource, String> _f$message =
      Field('message', _$message, opt: true);
  static dynamic _$data(Resource v) => v.data;
  static dynamic _arg$data<T>(f) => f<T>();
  static const Field<Resource, dynamic> _f$data =
      Field('data', _$data, opt: true, arg: _arg$data);
  static dynamic _$meta(Resource v) => v.meta;
  static const Field<Resource, dynamic> _f$meta =
      Field('meta', _$meta, opt: true);

  @override
  final MappableFields<Resource> fields = const {
    #status: _f$status,
    #message: _f$message,
    #data: _f$data,
    #meta: _f$meta,
  };

  static Resource<T> _instantiate<T>(DecodingData data) {
    return Resource(
        status: data.dec(_f$status),
        message: data.dec(_f$message),
        data: data.dec(_f$data),
        meta: data.dec(_f$meta));
  }

  @override
  final Function instantiate = _instantiate;

  static Resource<T> fromMap<T>(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Resource<T>>(map);
  }

  static Resource<T> fromJson<T>(String json) {
    return ensureInitialized().decodeJson<Resource<T>>(json);
  }
}

mixin ResourceMappable<T> {
  String toJson() {
    return ResourceMapper.ensureInitialized()
        .encodeJson<Resource<T>>(this as Resource<T>);
  }

  Map<String, dynamic> toMap() {
    return ResourceMapper.ensureInitialized()
        .encodeMap<Resource<T>>(this as Resource<T>);
  }

  ResourceCopyWith<Resource<T>, Resource<T>, Resource<T>, T> get copyWith =>
      _ResourceCopyWithImpl<Resource<T>, Resource<T>, T>(
          this as Resource<T>, $identity, $identity);
  @override
  String toString() {
    return ResourceMapper.ensureInitialized()
        .stringifyValue(this as Resource<T>);
  }

  @override
  bool operator ==(Object other) {
    return ResourceMapper.ensureInitialized()
        .equalsValue(this as Resource<T>, other);
  }

  @override
  int get hashCode {
    return ResourceMapper.ensureInitialized().hashValue(this as Resource<T>);
  }
}

extension ResourceValueCopy<$R, $Out, T>
    on ObjectCopyWith<$R, Resource<T>, $Out> {
  ResourceCopyWith<$R, Resource<T>, $Out, T> get $asResource =>
      $base.as((v, t, t2) => _ResourceCopyWithImpl<$R, $Out, T>(v, t, t2));
}

abstract class ResourceCopyWith<$R, $In extends Resource<T>, $Out, T>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({bool? status, String? message, T? data, dynamic meta});
  ResourceCopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ResourceCopyWithImpl<$R, $Out, T>
    extends ClassCopyWithBase<$R, Resource<T>, $Out>
    implements ResourceCopyWith<$R, Resource<T>, $Out, T> {
  _ResourceCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Resource> $mapper =
      ResourceMapper.ensureInitialized();
  @override
  $R call(
          {bool? status,
          Object? message = $none,
          Object? data = $none,
          Object? meta = $none}) =>
      $apply(FieldCopyWithData({
        if (status != null) #status: status,
        if (message != $none) #message: message,
        if (data != $none) #data: data,
        if (meta != $none) #meta: meta
      }));
  @override
  Resource<T> $make(CopyWithData data) => Resource(
      status: data.get(#status, or: $value.status),
      message: data.get(#message, or: $value.message),
      data: data.get(#data, or: $value.data),
      meta: data.get(#meta, or: $value.meta));

  @override
  ResourceCopyWith<$R2, Resource<T>, $Out2, T> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ResourceCopyWithImpl<$R2, $Out2, T>($value, $cast, t);
}
