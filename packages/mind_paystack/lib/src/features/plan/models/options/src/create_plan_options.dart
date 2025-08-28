import 'package:dart_mappable/dart_mappable.dart';
part 'create_plan_options.mapper.dart';

/// Options for creating a new subscription plan.
///
/// This class provides the required and optional parameters for
/// creating a subscription plan on Paystack. Plans define the structure
/// for recurring billing including amount, billing frequency, and
/// identification details.
///
/// Example usage:
/// ```dart
/// final createOptions = CreatePlanOptions(
///   name: 'Premium Monthly',
///   amount: 500000, // ₦5,000 in kobo
///   interval: 'monthly',
///   planCode: 'premium_monthly',
///   currency: 'NGN',
/// );
/// ```
@MappableClass()
class CreatePlanOptions with CreatePlanOptionsMappable {
  /// Creates a new CreatePlanOptions instance.
  ///
  /// [name], [amount], and [interval] are required parameters.
  /// All other parameters are optional and will use Paystack defaults if not
  ///  provided.
  const CreatePlanOptions({
    required this.name,
    required this.amount,
    required this.interval,
    // this.planCode,
    this.description,
    this.currency,
    this.invoiceLimit,
    this.sendInvoices,
    this.sendSms,
  });

  /// Human-readable name for the plan.
  ///
  /// This will be displayed to customers when selecting subscription options.
  /// Example: "Premium Monthly", "Basic Yearly", "Pro Plan"
  final String name;

  /// Amount to charge for each billing cycle (in smallest currency unit).
  ///
  /// For NGN currency, this should be in kobo.
  /// Example: 500000 for ₦5,000.00
  final int amount;

  /// Billing frequency interval.
  ///
  /// Supported values: "daily", "weekly", "monthly", "biannually", "annually"
  /// Example: "monthly", "yearly"
  final String interval;

  /// Unique plan code used for identification and API calls.
  ///
  /// If not provided, Paystack will auto-generate one.
  /// Should be unique across your account.
  /// Example: "premium_monthly", "basic_yearly"
  // @MappableField(key: 'plan_code')
  // final String? planCode;

  /// Optional description for the plan.
  ///
  /// Additional details about what the plan includes.
  /// Example: "Access to premium features, priority support"
  final String? description;

  /// Currency for the plan amount.
  ///
  /// Defaults to NGN if not specified.
  /// Supported currencies depend on your Paystack account settings.
  final String? currency;

  /// Maximum number of invoices to generate for subscriptions on this plan.
  ///
  /// After this limit, subscriptions will be marked as complete.
  /// If not set, subscriptions will continue indefinitely.
  @MappableField(key: 'invoice_limit')
  final int? invoiceLimit;

  /// Whether to send email invoices to customers.
  ///
  /// Defaults to true if not specified.
  @MappableField(key: 'send_invoices')
  final bool? sendInvoices;

  /// Whether to send SMS notifications for invoices.
  ///
  /// Defaults to true if not specified.
  @MappableField(key: 'send_sms')
  final bool? sendSms;
}
