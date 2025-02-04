import 'package:freezed_annotation/freezed_annotation.dart';
part 'charge_status.freezed.dart';
part 'charge_status.g.dart';

@freezed
class ChargeStatus with _$ChargeStatus {
  const factory ChargeStatus({
    /// Transaction reference
    required String reference,

    /// Current status (success, pending, failed)
    required String status,

    /// Whether transaction requires verification
    @Default(false) bool requiresVerification,

    /// Next required action (pin, otp, phone, birthday, redirect)
    String? nextAction,

    /// Detailed status message
    required String message,

    /// Gateway response message
    required String gatewayResponse,

    /// Last check timestamp
    required DateTime checkedAt,
  }) = _ChargeStatus;

  factory ChargeStatus.fromJson(Map<String, dynamic> json) =>
      _$ChargeStatusFromJson(json);
}
