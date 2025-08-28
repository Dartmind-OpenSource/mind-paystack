import 'package:dart_mappable/dart_mappable.dart';
part 'update_plan_options.mapper.dart';

/// Options for updating an existing subscription plan.
///
/// This class provides the updatable parameters for modifying
/// a subscription plan on Paystack. Only the fields you want to update
/// need to be provided - all parameters are optional.
///
/// Note: Some fields like interval may not be updateable depending on
/// Paystack's API restrictions and existing subscriptions on the plan.
///
/// Example usage:
/// ```dart
/// final updateOptions = UpdatePlanOptions(
///   name: 'Premium Monthly (Updated)',
///   amount: 600000, // ₦6,000 in kobo
///   description: 'Updated premium features',
/// );
/// ```
@MappableClass()
class UpdatePlanOptions with UpdatePlanOptionsMappable {
  /// Creates a new UpdatePlanOptions instance.
  ///
  /// All parameters are optional. Only provide the fields you want to update.
  const UpdatePlanOptions({
    this.name,
    this.amount,
    this.description,
    this.currency,
    this.invoiceLimit,
    this.sendInvoices,
    this.sendSms,
  });

  /// Updated human-readable name for the plan.
  /// 
  /// This will be displayed to customers when selecting subscription options.
  /// Example: "Premium Monthly (Updated)", "Enhanced Pro Plan"
  final String? name;

  /// Updated amount to charge for each billing cycle (in smallest currency unit).
  /// 
  /// For NGN currency, this should be in kobo.
  /// Example: 600000 for ₦6,000.00
  /// 
  /// Note: Changing plan amount may affect existing subscriptions differently
  /// depending on Paystack's policies.
  final int? amount;

  /// Updated description for the plan.
  /// 
  /// Additional details about what the plan includes.
  /// Example: "Enhanced features, 24/7 support, priority processing"
  final String? description;

  /// Updated currency for the plan amount.
  /// 
  /// Note: Currency changes may not be allowed for plans with active subscriptions.
  /// Supported currencies depend on your Paystack account settings.
  final String? currency;

  /// Updated maximum number of invoices for subscriptions on this plan.
  /// 
  /// After this limit, subscriptions will be marked as complete.
  /// Set to null to allow unlimited invoices.
  @MappableField(key: 'invoice_limit')
  final int? invoiceLimit;

  /// Updated preference for sending email invoices to customers.
  @MappableField(key: 'send_invoices')
  final bool? sendInvoices;

  /// Updated preference for sending SMS notifications for invoices.
  @MappableField(key: 'send_sms')
  final bool? sendSms;
}