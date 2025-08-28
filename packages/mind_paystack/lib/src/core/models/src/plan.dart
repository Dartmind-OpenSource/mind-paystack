import 'package:dart_mappable/dart_mappable.dart';
part 'plan.mapper.dart';

/// Represents a subscription plan for recurring payments
///
/// Plans define the structure for recurring billing including amount,
/// billing frequency, and identification details. They are used to create
/// subscriptions for customers who want to pay regularly.
@MappableClass()
class Plan with PlanMappable {
  /// Creates a new [Plan] instance
  ///
  /// * [id] - Unique identifier for the plan
  /// * [name] - Human-readable name for the plan
  /// * [planCode] - Unique code to identify the plan
  /// * [amount] - Billing amount for each billing cycle (in kobo)
  /// * [interval] - Billing frequency (e.g., "monthly", "yearly")
  const Plan({
    this.id,
    this.name,
    this.planCode,
    this.amount,
    this.interval,
  });

  /// Unique identifier for the plan in Paystack's system
  final int? id;
  
  /// Human-readable name for the plan
  final String? name;
  
  /// Unique plan code used for identification and API calls
  @MappableField(key: 'plan_code')
  final String? planCode;
  
  /// Amount to charge for each billing cycle (in kobo)
  final int? amount;
  
  /// Billing frequency interval (e.g., "monthly", "quarterly", "yearly")
  final String? interval;
}
