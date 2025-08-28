import 'package:dart_mappable/dart_mappable.dart';
import 'package:mind_paystack/src/core/models/src/plan.dart';
part 'plan_list.mapper.dart';

/// Represents a paginated list of subscription plans returned from Paystack API.
///
/// This model wraps the response from listing plans, providing both the plan data
/// and pagination metadata for implementing proper pagination in applications.
///
/// Example usage:
/// ```dart
/// final planList = PlanList.fromJson(response);
/// print('Total plans: ${planList.meta.total}');
/// 
/// for (final plan in planList.data) {
///   print('${plan.name}: ${plan.amount} every ${plan.interval}');
/// }
/// ```
@MappableClass()
class PlanList with PlanListMappable {
  /// Creates a new PlanList instance.
  const PlanList({
    required this.status,
    required this.message,
    required this.data,
    required this.meta,
  });

  /// Response status from Paystack API.
  final bool status;

  /// Response message from Paystack API.
  final String message;

  /// List of plan objects.
  final List<Plan> data;

  /// Pagination metadata.
  final PaginationMeta meta;
}

/// Represents pagination metadata for plan list responses.
@MappableClass()
class PaginationMeta with PaginationMetaMappable {
  /// Creates a new PaginationMeta instance.
  const PaginationMeta({
    required this.total,
    required this.skipped,
    required this.perPage,
    required this.page,
    required this.pageCount,
  });

  /// Total number of plans available.
  final int total;

  /// Number of plans skipped (for pagination).
  final int skipped;

  /// Number of plans per page.
  @MappableField(key: 'per_page')
  final int perPage;

  /// Current page number.
  final int page;

  /// Total number of pages available.
  @MappableField(key: 'page_count')
  final int pageCount;
}