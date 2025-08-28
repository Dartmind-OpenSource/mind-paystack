// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'plan_list.dart';

class PlanListMapper extends ClassMapperBase<PlanList> {
  PlanListMapper._();

  static PlanListMapper? _instance;
  static PlanListMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PlanListMapper._());
      PlanMapper.ensureInitialized();
      PaginationMetaMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PlanList';

  static bool _$status(PlanList v) => v.status;
  static const Field<PlanList, bool> _f$status = Field('status', _$status);
  static String _$message(PlanList v) => v.message;
  static const Field<PlanList, String> _f$message = Field('message', _$message);
  static List<Plan> _$data(PlanList v) => v.data;
  static const Field<PlanList, List<Plan>> _f$data = Field('data', _$data);
  static PaginationMeta _$meta(PlanList v) => v.meta;
  static const Field<PlanList, PaginationMeta> _f$meta = Field('meta', _$meta);

  @override
  final MappableFields<PlanList> fields = const {
    #status: _f$status,
    #message: _f$message,
    #data: _f$data,
    #meta: _f$meta,
  };

  static PlanList _instantiate(DecodingData data) {
    return PlanList(
        status: data.dec(_f$status),
        message: data.dec(_f$message),
        data: data.dec(_f$data),
        meta: data.dec(_f$meta));
  }

  @override
  final Function instantiate = _instantiate;

  static PlanList fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PlanList>(map);
  }

  static PlanList fromJson(String json) {
    return ensureInitialized().decodeJson<PlanList>(json);
  }
}

mixin PlanListMappable {
  String toJson() {
    return PlanListMapper.ensureInitialized()
        .encodeJson<PlanList>(this as PlanList);
  }

  Map<String, dynamic> toMap() {
    return PlanListMapper.ensureInitialized()
        .encodeMap<PlanList>(this as PlanList);
  }

  PlanListCopyWith<PlanList, PlanList, PlanList> get copyWith =>
      _PlanListCopyWithImpl<PlanList, PlanList>(
          this as PlanList, $identity, $identity);
  @override
  String toString() {
    return PlanListMapper.ensureInitialized().stringifyValue(this as PlanList);
  }

  @override
  bool operator ==(Object other) {
    return PlanListMapper.ensureInitialized()
        .equalsValue(this as PlanList, other);
  }

  @override
  int get hashCode {
    return PlanListMapper.ensureInitialized().hashValue(this as PlanList);
  }
}

extension PlanListValueCopy<$R, $Out> on ObjectCopyWith<$R, PlanList, $Out> {
  PlanListCopyWith<$R, PlanList, $Out> get $asPlanList =>
      $base.as((v, t, t2) => _PlanListCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class PlanListCopyWith<$R, $In extends PlanList, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Plan, PlanCopyWith<$R, Plan, Plan>> get data;
  PaginationMetaCopyWith<$R, PaginationMeta, PaginationMeta> get meta;
  $R call(
      {bool? status, String? message, List<Plan>? data, PaginationMeta? meta});
  PlanListCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PlanListCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PlanList, $Out>
    implements PlanListCopyWith<$R, PlanList, $Out> {
  _PlanListCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PlanList> $mapper =
      PlanListMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Plan, PlanCopyWith<$R, Plan, Plan>> get data => ListCopyWith(
      $value.data, (v, t) => v.copyWith.$chain(t), (v) => call(data: v));
  @override
  PaginationMetaCopyWith<$R, PaginationMeta, PaginationMeta> get meta =>
      $value.meta.copyWith.$chain((v) => call(meta: v));
  @override
  $R call(
          {bool? status,
          String? message,
          List<Plan>? data,
          PaginationMeta? meta}) =>
      $apply(FieldCopyWithData({
        if (status != null) #status: status,
        if (message != null) #message: message,
        if (data != null) #data: data,
        if (meta != null) #meta: meta
      }));
  @override
  PlanList $make(CopyWithData data) => PlanList(
      status: data.get(#status, or: $value.status),
      message: data.get(#message, or: $value.message),
      data: data.get(#data, or: $value.data),
      meta: data.get(#meta, or: $value.meta));

  @override
  PlanListCopyWith<$R2, PlanList, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PlanListCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

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

  static int _$total(PaginationMeta v) => v.total;
  static const Field<PaginationMeta, int> _f$total = Field('total', _$total);
  static int _$skipped(PaginationMeta v) => v.skipped;
  static const Field<PaginationMeta, int> _f$skipped =
      Field('skipped', _$skipped);
  static int _$perPage(PaginationMeta v) => v.perPage;
  static const Field<PaginationMeta, int> _f$perPage =
      Field('perPage', _$perPage, key: r'per_page');
  static int _$page(PaginationMeta v) => v.page;
  static const Field<PaginationMeta, int> _f$page = Field('page', _$page);
  static int _$pageCount(PaginationMeta v) => v.pageCount;
  static const Field<PaginationMeta, int> _f$pageCount =
      Field('pageCount', _$pageCount, key: r'page_count');

  @override
  final MappableFields<PaginationMeta> fields = const {
    #total: _f$total,
    #skipped: _f$skipped,
    #perPage: _f$perPage,
    #page: _f$page,
    #pageCount: _f$pageCount,
  };

  static PaginationMeta _instantiate(DecodingData data) {
    return PaginationMeta(
        total: data.dec(_f$total),
        skipped: data.dec(_f$skipped),
        perPage: data.dec(_f$perPage),
        page: data.dec(_f$page),
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
  $R call({int? total, int? skipped, int? perPage, int? page, int? pageCount});
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
          {int? total,
          int? skipped,
          int? perPage,
          int? page,
          int? pageCount}) =>
      $apply(FieldCopyWithData({
        if (total != null) #total: total,
        if (skipped != null) #skipped: skipped,
        if (perPage != null) #perPage: perPage,
        if (page != null) #page: page,
        if (pageCount != null) #pageCount: pageCount
      }));
  @override
  PaginationMeta $make(CopyWithData data) => PaginationMeta(
      total: data.get(#total, or: $value.total),
      skipped: data.get(#skipped, or: $value.skipped),
      perPage: data.get(#perPage, or: $value.perPage),
      page: data.get(#page, or: $value.page),
      pageCount: data.get(#pageCount, or: $value.pageCount));

  @override
  PaginationMetaCopyWith<$R2, PaginationMeta, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PaginationMetaCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
