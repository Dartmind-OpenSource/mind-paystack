import 'package:dart_mappable/dart_mappable.dart';
import 'package:mind_paystack/src/core/models/src/plan.dart';
part 'subscription.mapper.dart';

/// Represents a subscription for recurring payments.
///
/// Subscriptions link customers to plans for automatic recurring billing.
/// They contain information about the customer, plan, payment authorization,
/// billing status, and payment history.
///
/// Example usage:
/// ```dart
/// final subscription = Subscription.fromJson(response);
/// print('Status: ${subscription.status}');
/// print('Next payment: ${subscription.nextPaymentDate}');
/// print('Customer: ${subscription.customer.email}');
/// ```
@MappableClass()
class Subscription with SubscriptionMappable {
  /// Creates a new Subscription instance.
  const Subscription({
    this.id,
    this.subscriptionCode,
    this.emailToken,
    this.amount,
    this.cron,
    this.nextPaymentDate,
    this.openInvoice,
    this.createdAt,
    this.plan,
    this.authorization,
    this.customer,
    this.status,
    this.quantity,
    this.mostRecentInvoice,
  });

  /// Unique identifier for the subscription.
  final int? id;

  /// Unique subscription code used for identification.
  @MappableField(key: 'subscription_code')
  final String? subscriptionCode;

  /// Email token for subscription management operations.
  @MappableField(key: 'email_token')
  final String? emailToken;

  /// Amount to be charged for each billing cycle (in kobo).
  final int? amount;

  /// Cron expression defining the billing schedule.
  final String? cron;

  /// Date and time of the next scheduled payment.
  @MappableField(key: 'next_payment_date')
  final DateTime? nextPaymentDate;

  /// Current open invoice ID if any.
  @MappableField(key: 'open_invoice')
  final String? openInvoice;

  /// Date and time when the subscription was created.
  @MappableField(key: 'created_at')
  final DateTime? createdAt;

  /// Plan associated with this subscription.
  final Plan? plan;

  /// Payment authorization details for recurring billing.
  final SubscriptionAuthorization? authorization;

  /// Customer information for this subscription.
  final SubscriptionCustomer? customer;

  /// Current status of the subscription.
  /// Common values: 'active', 'cancelled', 'attention'
  final String? status;

  /// Quantity of the subscription (for usage-based billing).
  final int? quantity;

  /// Details of the most recent invoice.
  @MappableField(key: 'most_recent_invoice')
  final SubscriptionInvoice? mostRecentInvoice;
}

/// Represents payment authorization details for a subscription.
@MappableClass()
class SubscriptionAuthorization with SubscriptionAuthorizationMappable {
  /// Creates a new SubscriptionAuthorization instance.
  const SubscriptionAuthorization({
    this.authorizationCode,
    this.bin,
    this.last4,
    this.expMonth,
    this.expYear,
    this.cardType,
    this.bank,
    this.countryCode,
    this.brand,
    this.reusable,
    this.signature,
    this.accountName,
  });

  /// Authorization code for recurring payments.
  @MappableField(key: 'authorization_code')
  final String? authorizationCode;

  /// Bank Identification Number of the card.
  final String? bin;

  /// Last 4 digits of the card number.
  final String? last4;

  /// Card expiration month.
  @MappableField(key: 'exp_month')
  final String? expMonth;

  /// Card expiration year.
  @MappableField(key: 'exp_year')
  final String? expYear;

  /// Type of card (debit/credit).
  @MappableField(key: 'card_type')
  final String? cardType;

  /// Issuing bank name.
  final String? bank;

  /// Country code of the card.
  @MappableField(key: 'country_code')
  final String? countryCode;

  /// Card brand (Visa, Mastercard, etc.).
  final String? brand;

  /// Whether the authorization can be reused.
  final bool? reusable;

  /// Authorization signature.
  final String? signature;

  /// Account holder name.
  @MappableField(key: 'account_name')
  final String? accountName;
}

/// Represents customer information for a subscription.
@MappableClass()
class SubscriptionCustomer with SubscriptionCustomerMappable {
  /// Creates a new SubscriptionCustomer instance.
  const SubscriptionCustomer({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.customerCode,
    this.phone,
    this.metadata,
  });

  /// Customer ID.
  final int? id;

  /// Customer's first name.
  @MappableField(key: 'first_name')
  final String? firstName;

  /// Customer's last name.
  @MappableField(key: 'last_name')
  final String? lastName;

  /// Customer's email address.
  final String? email;

  /// Unique customer code.
  @MappableField(key: 'customer_code')
  final String? customerCode;

  /// Customer's phone number.
  final String? phone;

  /// Additional customer metadata.
  final Map<String, dynamic>? metadata;
}

/// Represents invoice information for a subscription.
@MappableClass()
class SubscriptionInvoice with SubscriptionInvoiceMappable {
  /// Creates a new SubscriptionInvoice instance.
  const SubscriptionInvoice({
    this.id,
    this.amount,
    this.status,
    this.description,
    this.dueDate,
    this.paidAt,
  });

  /// Invoice ID.
  final int? id;

  /// Invoice amount (in kobo).
  final int? amount;

  /// Invoice status.
  final String? status;

  /// Invoice description.
  final String? description;

  /// Due date for the invoice.
  @MappableField(key: 'due_date')
  final DateTime? dueDate;

  /// Date when the invoice was paid.
  @MappableField(key: 'paid_at')
  final DateTime? paidAt;
}

/// Represents a subscription management link.
@MappableClass()
class SubscriptionLink with SubscriptionLinkMappable {
  /// Creates a new SubscriptionLink instance.
  const SubscriptionLink({
    this.link,
  });

  /// The subscription management link URL.
  final String? link;
}