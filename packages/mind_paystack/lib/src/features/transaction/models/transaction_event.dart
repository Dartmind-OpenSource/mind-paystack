import 'package:freezed_annotation/freezed_annotation.dart';
part 'transaction_event.freezed.dart';
part 'transaction_event.g.dart';

@freezed
class TransactionEvent with _$TransactionEvent {
  const factory TransactionEvent({
    required String time,
    required String type,
    required String message,
    Map<String, dynamic>? data,
  }) = _TransactionEvent;

  factory TransactionEvent.fromJson(Map<String, dynamic> json) =>
      _$TransactionEventFromJson(json);
}
