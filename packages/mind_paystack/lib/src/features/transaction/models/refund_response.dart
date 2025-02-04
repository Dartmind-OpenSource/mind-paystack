import 'package:freezed_annotation/freezed_annotation.dart';
part 'refund_response.freezed.dart';
part 'refund_response.g.dart';

@freezed
class RefundResponse with _$RefundResponse {
  const factory RefundResponse({
    required String reference,
    required String status,
    required int amount,
    required String currency,
    required String transactionReference,
    String? customerNote,
    String? merchantNote,
    required DateTime createdAt,
  }) = _RefundResponse;

  factory RefundResponse.fromJson(Map<String, dynamic> json) =>
      _$RefundResponseFromJson(json);
}
