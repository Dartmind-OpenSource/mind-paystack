import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mind_paystack/src/features/transaction/models/authorization_response.dart';
part 'transaction.freezed.dart';
part 'transaction.g.dart';

@freezed
class Transaction with _$Transaction {
  const factory Transaction({
    required String id,
    required String reference,
    required String domain,
    required String status,
    required int amount,
    required String currency,
    required DateTime createdAt,
    required String channel,
    required String gatewayResponse,
    required bool paidAt,
    String? description,
    String? customerId,
    Map<String, dynamic>? metadata,
    AuthorizationResponse? authorization,
    String? customerCode,
    String? customerEmail,
    String? plan,
    String? subaccount,
    int? fees,
    String? splitCode,
    required DateTime updatedAt,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
}
