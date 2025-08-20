import 'package:dart_mappable/dart_mappable.dart';
part 'pagination_meta.mapper.dart';

@MappableClass()
class PaginationMeta with PaginationMetaMappable {
  const PaginationMeta({
    this.total,
    this.page,
    this.perPage,
    this.pageCount,
  });
  final int? total;
  final int? page;
  @MappableField(key: 'per_page')
  final int? perPage; // some payloads use snake_case
  final int? pageCount;
}
