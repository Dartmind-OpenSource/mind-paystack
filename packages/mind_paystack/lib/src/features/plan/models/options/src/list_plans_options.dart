import 'package:dart_mappable/dart_mappable.dart';
part 'list_plans_options.mapper.dart';

/// Options for listing and filtering subscription plans.
/// 
/// This class provides various filtering and pagination options for
/// retrieving plan lists from Paystack. All parameters are optional
/// and can be combined to create specific queries.
/// 
/// Example usage:
/// ```dart
/// final listOptions = ListPlansOptions(
///   status: 'active',
///   interval: 'monthly',
///   perPage: 50,
///   page: 1,
/// );
/// ```
@MappableClass()
class ListPlansOptions with ListPlansOptionsMappable {
  /// Creates a new ListPlansOptions instance.
  /// 
  /// All parameters are optional and can be used to filter and
  /// paginate the plan list.
  const ListPlansOptions({
    this.perPage,
    this.page,
    this.status,
    this.interval,
    this.amount,
    this.currency,
  });

  /// Number of plans to return per page.
  /// 
  /// Default is typically 50, maximum is usually 100.
  @MappableField(key: 'per_page')
  final int? perPage;
  
  /// Page number to retrieve (1-based).
  final int? page;
  
  /// Filter by plan status.
  /// 
  /// Common values: 'active', 'inactive'
  final String? status;
  
  /// Filter by billing interval.
  /// 
  /// Values: 'daily', 'weekly', 'monthly', 'biannually', 'annually'
  final String? interval;
  
  /// Filter by specific plan amount (in smallest currency unit).
  /// 
  /// For example: 50000 kobo for ₦500.00 plans.
  final int? amount;
  
  /// Filter by plan currency.
  /// 
  /// Example: 'NGN', 'USD', 'GHS'
  final String? currency;
}