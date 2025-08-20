import 'package:dart_mappable/dart_mappable.dart';
part 'initialize_transaction_options.mapper.dart';

@MappableClass()
class InitializeTransactionOptions with InitializeTransactionOptionsMappable {
  final String email;
  final String amount; // in subunits
  final String? currency;
  final String? reference;
  @MappableField(key: 'callback_url')
  final String? callbackUrl;
  final String? plan;
  @MappableField(key: 'invoice_limit')
  final int? invoiceLimit;
  final Map<String, dynamic>? metadata;
  final List<String>? channels;

  @MappableField(key: 'split_code')
  final String? splitCode;
  final String? subaccount;
  @MappableField(key: 'transaction_charge')
  final int? transactionCharge;
  final String? bearer;

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
}
