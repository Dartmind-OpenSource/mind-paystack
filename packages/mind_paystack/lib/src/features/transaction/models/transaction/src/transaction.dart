import 'package:dart_mappable/dart_mappable.dart';
import 'package:mind_paystack/src/features/transaction/models/transaction/src/authorization_data.dart';
import 'package:mind_paystack/src/features/transaction/models/transaction/src/customer.dart';
import 'package:mind_paystack/src/features/transaction/models/transaction/src/timeline_log.dart';
part 'transaction.mapper.dart';

@MappableClass()
class Transaction with TransactionMappable {

  const Transaction({
    required this.id,
    required this.domain,
    required this.status,
    required this.reference,
    required this.amount, required this.createdAt, required this.channel, required this.currency, this.receiptNumber,
    this.gatewayResponse,
    this.paidAt,
    this.ipAddress,
    this.metadata,
    this.log,
    this.fees,
    this.feesSplit,
    this.authorization,
    this.customer,
    this.plan,
    this.split,
    this.orderId,
    this.requestedAmount,
    this.posTransactionData,
    this.source,
    this.feesBreakdown,
    this.connect,
    this.transactionDate,
    this.planObject,
    this.subaccount,
  });
  final int id;
  final String domain; // e.g. test/live
  final String status; // e.g. success, failed, abandoned, reversed
  final String reference;
  @MappableField(key: 'receipt_number')
  final String? receiptNumber;
  final int amount; // subunits
  @MappableField(key: 'gateway_response')
  final String? gatewayResponse;
  @MappableField(key: 'paid_at')
  final DateTime? paidAt;
  @MappableField(key: 'created_at')
  final DateTime createdAt;
  final String channel; // e.g. card, bank, ussd
  final String currency; // NGN, GHS, etc.
  @MappableField(key: 'ip_address')
  final String? ipAddress;
  final dynamic metadata;
  final TimelineLog? log;
  final int? fees;
  @MappableField(key: 'fees_split')
  final Map<String, dynamic>? feesSplit;
  final AuthorizationData? authorization;
  final Customer? customer;
  final String? plan; // plan code string if present
  final Map<String, dynamic>? split; // split object if present
  @MappableField(key: 'order_id')
  final String? orderId;
  @MappableField(key: 'requested_amount')
  final int? requestedAmount;
  @MappableField(key: 'pos_transaction_data')
  final Map<String, dynamic>? posTransactionData;
  final dynamic source; // keep flexible
  @MappableField(key: 'fees_breakdown')
  final dynamic feesBreakdown;
  final dynamic connect;
  @MappableField(key: 'transaction_date')
  final DateTime? transactionDate;
  @MappableField(key: 'plan_object')
  final Map<String, dynamic>? planObject;
  final Map<String, dynamic>? subaccount;
}
