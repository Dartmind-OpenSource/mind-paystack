import 'package:dart_mappable/dart_mappable.dart';
part 'list_subscriptions_options.mapper.dart';

/// Options for listing and filtering subscriptions.
/// 
/// This class provides various filtering and pagination options for
/// retrieving subscription lists from Paystack. All parameters are optional
/// and can be combined to create specific queries.
/// 
/// Example usage:
/// ```dart
/// final listOptions = ListSubscriptionsOptions(
///   perPage: 20,
///   page: 1,
///   customer: 'CUS_xyz123',
///   plan: 'PLN_xyz123',
///   status: 'active',
/// );
/// ```
@MappableClass()
class ListSubscriptionsOptions with ListSubscriptionsOptionsMappable {
  /// Creates a new ListSubscriptionsOptions instance.
  /// 
  /// All parameters are optional and can be used to filter and
  /// paginate the subscription list.
  const ListSubscriptionsOptions({
    this.perPage,
    this.page,
    this.customer,
    this.plan,
    this.status,
    this.from,
    this.to,
  });

  /// Number of subscriptions to return per page.
  /// 
  /// Default is typically 50, maximum is usually 100.
  @MappableField(key: 'per_page')
  final int? perPage;
  
  /// Page number to retrieve (1-based).
  final int? page;
  
  /// Filter by specific customer ID or customer code.
  final String? customer;
  
  /// Filter by specific plan ID or plan code.
  final String? plan;
  
  /// Filter by subscription status.
  /// 
  /// Common values: 'active', 'cancelled', 'attention'
  final String? status;
  
  /// Start date for filtering subscriptions (inclusive).
  /// 
  /// Format: ISO 8601 date string (YYYY-MM-DD)
  final DateTime? from;
  
  /// End date for filtering subscriptions (inclusive).
  /// 
  /// Format: ISO 8601 date string (YYYY-MM-DD)  
  final DateTime? to;
}