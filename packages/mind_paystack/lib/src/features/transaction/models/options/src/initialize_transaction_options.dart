import 'package:dart_mappable/dart_mappable.dart';
part 'initialize_transaction_options.mapper.dart';

/// Options for initializing a new payment transaction.
/// 
/// This class contains all the parameters needed to create a new transaction
/// on Paystack. The customer will be redirected to complete payment after
/// successful initialization.
/// 
/// Example usage:
/// ```dart
/// final options = InitializeTransactionOptions(
///   email: 'customer@example.com',
///   amount: '50000', // ₦500.00 in kobo
///   currency: 'NGN',
///   reference: 'tx_123456',
///   callbackUrl: 'https://example.com/callback',
/// );
/// ```
@MappableClass()
class InitializeTransactionOptions with InitializeTransactionOptionsMappable {
  /// Creates a new InitializeTransactionOptions instance.
  /// 
  /// [email] and [amount] are required fields. The [amount] should be
  /// provided as a string representing the value in the smallest currency unit.
  const InitializeTransactionOptions({
    required this.email,
    required this.amount,
    this.currency,
    this.reference,
    this.callbackUrl,
    this.plan,
    this.invoiceLimit,
    this.metadata,
    this.channels,
    this.splitCode,
    this.subaccount,
    this.transactionCharge,
    this.bearer,
  });
  /// Customer's email address for the transaction.
  /// 
  /// This email will be used for transaction notifications and receipts.
  final String email;
  
  /// Transaction amount in the smallest currency unit (as string).
  /// 
  /// For NGN: amount in kobo (e.g., '50000' for ₦500.00)
  /// For USD: amount in cents (e.g., '1000' for $10.00)
  final String amount;
  
  /// Currency code for the transaction.
  /// 
  /// Defaults to 'NGN' if not specified.
  /// Examples: 'NGN', 'USD', 'GHS'.
  final String? currency;
  
  /// Unique reference for this transaction.
  /// 
  /// If not provided, Paystack will generate one automatically.
  /// Must be unique across all transactions.
  final String? reference;
  
  /// URL to redirect customer after payment completion.
  /// 
  /// The customer will be redirected here with transaction status.
  @MappableField(key: 'callback_url')
  final String? callbackUrl;
  
  /// Subscription plan code if this is a subscription transaction.
  final String? plan;
  
  /// Number of times to charge customer during subscription.
  /// 
  /// Only applicable when [plan] is specified.
  @MappableField(key: 'invoice_limit')
  final int? invoiceLimit;
  
  /// Additional data to store with the transaction.
  /// 
  /// Can contain any custom information relevant to your application.
  final Map<String, dynamic>? metadata;
  
  /// List of payment channels to enable for this transaction.
  /// 
  /// Examples: ['card', 'bank', 'ussd', 'qr', 'mobile_money']
  /// If not provided, all available channels will be enabled.
  final List<String>? channels;
  
  /// Split payment code for distributing transaction amount.
  /// 
  /// Used for marketplace or multi-party transactions.
  @MappableField(key: 'split_code')
  final String? splitCode;
  
  /// Subaccount code to credit with part of the transaction.
  /// 
  /// Alternative to split payments for simpler revenue sharing.
  final String? subaccount;
  
  /// Additional charge to add to the transaction (in smallest unit).
  /// 
  /// This charge will be added on top of the main amount.
  @MappableField(key: 'transaction_charge')
  final int? transactionCharge;
  
  /// Who bears the Paystack transaction charges.
  /// 
  /// Values: 'account' (merchant pays) or 'subaccount' (subaccount pays).
  /// Defaults to 'account'.
  final String? bearer;
}
