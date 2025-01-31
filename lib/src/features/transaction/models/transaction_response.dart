import 'package:freezed_annotation/freezed_annotation.dart';
part 'transaction_response.freezed.dart';
part 'transaction_response.g.dart';

@freezed
class TransactionResponse with _$TransactionResponse {
  const factory TransactionResponse({
    String? reference,
    String? message,
    bool? status,
    String? authorizationUrl,
    String? accessCode,
    Map<String, dynamic>? data,
    DateTime? createdAt,
  }) = _TransactionResponse;

  factory TransactionResponse.fromJson(Map<String, dynamic> json) =>
      _$TransactionResponseFromJson(json);
}
