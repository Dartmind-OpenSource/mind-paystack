import 'package:dart_mappable/dart_mappable.dart';
part 'pagination_meta.mapper.dart';

/// Contains pagination metadata for paginated API responses.
/// 
/// This model provides information about pagination state, including
/// total record count, current page, records per page, and total page count.
/// Used with list endpoints that support pagination.
/// 
/// Example usage:
/// ```dart
/// final meta = PaginationMeta(
///   total: 150,
///   page: 2,
///   perPage: 20,
///   pageCount: 8,
/// );
/// ```
@MappableClass()
class PaginationMeta with PaginationMetaMappable {
  /// Creates a new PaginationMeta instance.
  /// 
  /// All fields are optional as different API endpoints may provide
  /// different levels of pagination information.
  const PaginationMeta({
    this.total,
    this.page,
    this.perPage,
    this.pageCount,
  });
  /// Total number of records available across all pages.
  final int? total;
  
  /// Current page number (1-based).
  final int? page;
  
  /// Number of records per page.
  @MappableField(key: 'per_page')
  final int? perPage;
  
  /// Total number of pages available.
  final int? pageCount;
}
