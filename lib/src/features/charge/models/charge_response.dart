import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mind_paystack/src/features/charge/models/charge_authorization.dart';

part 'charge_response.freezed.dart';
part 'charge_response.g.dart';

/// Represents a charge response from the Paystack system
@freezed
class ChargeResponse with _$ChargeResponse {
  const factory ChargeResponse({
    /// Unique identifier for the transaction
    required String reference,

    /// Status of the charge (success, pending, failed)
    required String status,

    /// Transaction amount in lowest currency unit
    required int amount,

    /// Currency of the transaction
    @Default('NGN') String currency,

    /// Email of the customer
    required String email,

    /// Authorization URL for completing the transaction
    String? authorizationUrl,

    /// Access code for the transaction
    String? accessCode,

    /// Message describing the status
    required String message,

    /// Authorization details if successful
    ChargeAuthorization? authorization,

    /// Next action required (pin, otp, phone, birthday, redirect)
    String? nextAction,

    /// Gateway response message
    required String gatewayResponse,

    /// Channel used for the transaction
    required String channel,

    /// IP address of the request
    String? ipAddress,

    /// Metadata associated with the charge
    Map<String, dynamic>? metadata,

    /// Creation timestamp
    required DateTime createdAt,

    /// Last update timestamp
    required DateTime updatedAt,
  }) = _ChargeResponse;

  factory ChargeResponse.fromJson(Map<String, dynamic> json) =>
      _$ChargeResponseFromJson(json);
}
