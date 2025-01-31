import 'package:freezed_annotation/freezed_annotation.dart';
part 'transaction_session.freezed.dart';
part 'transaction_session.g.dart';

@freezed
class TransactionSession with _$TransactionSession {
  const factory TransactionSession({
    required String id,
    required String reference,
    required String status,
    required String deviceId,
    required String clientData,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _TransactionSession;

  factory TransactionSession.fromJson(Map<String, dynamic> json) =>
      _$TransactionSessionFromJson(json);
}
