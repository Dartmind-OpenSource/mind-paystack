// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'pagination_meta.dart';

class PaginationMetaMapper extends ClassMapperBase<PaginationMeta> {
  PaginationMetaMapper._();

  static PaginationMetaMapper? _instance;
  static PaginationMetaMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PaginationMetaMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'PaginationMeta';

  static int? _$total(PaginationMeta v) => v.total;
  static const Field<PaginationMeta, int> _f$total =
      Field('total', _$total, opt: true);
  static int? _$page(PaginationMeta v) => v.page;
  static const Field<PaginationMeta, int> _f$page =
      Field('page', _$page, opt: true);
  static int? _$perPage(PaginationMeta v) => v.perPage;
  static const Field<PaginationMeta, int> _f$perPage =
      Field('perPage', _$perPage, key: r'per_page', opt: true);
  static int? _$pageCount(PaginationMeta v) => v.pageCount;
  static const Field<PaginationMeta, int> _f$pageCount =
      Field('pageCount', _$pageCount, opt: true);

  @override
  final MappableFields<PaginationMeta> fields = const {
    #total: _f$total,
    #page: _f$page,
    #perPage: _f$perPage,
    #pageCount: _f$pageCount,
  };

  static PaginationMeta _instantiate(DecodingData data) {
    return PaginationMeta(
        total: data.dec(_f$total),
        page: data.dec(_f$page),
        perPage: data.dec(_f$perPage),
        pageCount: data.dec(_f$pageCount));
  }

  @override
  final Function instantiate = _instantiate;

  static PaginationMeta fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PaginationMeta>(map);
  }

  static PaginationMeta fromJson(String json) {
    return ensureInitialized().decodeJson<PaginationMeta>(json);
  }
}

mixin PaginationMetaMappable {
  String toJson() {
    return PaginationMetaMapper.ensureInitialized()
        .encodeJson<PaginationMeta>(this as PaginationMeta);
  }

  Map<String, dynamic> toMap() {
    return PaginationMetaMapper.ensureInitialized()
        .encodeMap<PaginationMeta>(this as PaginationMeta);
  }

  PaginationMetaCopyWith<PaginationMeta, PaginationMeta, PaginationMeta>
      get copyWith =>
          _PaginationMetaCopyWithImpl<PaginationMeta, PaginationMeta>(
              this as PaginationMeta, $identity, $identity);
  @override
  String toString() {
    return PaginationMetaMapper.ensureInitialized()
        .stringifyValue(this as PaginationMeta);
  }

  @override
  bool operator ==(Object other) {
    return PaginationMetaMapper.ensureInitialized()
        .equalsValue(this as PaginationMeta, other);
  }

  @override
  int get hashCode {
    return PaginationMetaMapper.ensureInitialized()
        .hashValue(this as PaginationMeta);
  }
}

extension PaginationMetaValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PaginationMeta, $Out> {
  PaginationMetaCopyWith<$R, PaginationMeta, $Out> get $asPaginationMeta =>
      $base.as((v, t, t2) => _PaginationMetaCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class PaginationMetaCopyWith<$R, $In extends PaginationMeta, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? total, int? page, int? perPage, int? pageCount});
  PaginationMetaCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _PaginationMetaCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PaginationMeta, $Out>
    implements PaginationMetaCopyWith<$R, PaginationMeta, $Out> {
  _PaginationMetaCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PaginationMeta> $mapper =
      PaginationMetaMapper.ensureInitialized();
  @override
  $R call(
          {Object? total = $none,
          Object? page = $none,
          Object? perPage = $none,
          Object? pageCount = $none}) =>
      $apply(FieldCopyWithData({
        if (total != $none) #total: total,
        if (page != $none) #page: page,
        if (perPage != $none) #perPage: perPage,
        if (pageCount != $none) #pageCount: pageCount
      }));
  @override
  PaginationMeta $make(CopyWithData data) => PaginationMeta(
      total: data.get(#total, or: $value.total),
      page: data.get(#page, or: $value.page),
      perPage: data.get(#perPage, or: $value.perPage),
      pageCount: data.get(#pageCount, or: $value.pageCount));

  @override
  PaginationMetaCopyWith<$R2, PaginationMeta, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PaginationMetaCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
