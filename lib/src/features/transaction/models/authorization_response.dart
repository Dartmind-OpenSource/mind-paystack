import 'package:freezed_annotation/freezed_annotation.dart';
part 'authorization_response.freezed.dart';
part 'authorization_response.g.dart';

@freezed
class AuthorizationResponse with _$AuthorizationResponse {
  const factory AuthorizationResponse({
    required String authorizationCode,
    required String cardType,
    required String last4,
    required String expMonth,
    required String expYear,
    required String bin,
    required String bank,
    required String channel,
    required String signature,
    required String countryCode,
    required String brand,
    required bool reusable,
    Map<String, dynamic>? accountName,
  }) = _AuthorizationResponse;

  factory AuthorizationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthorizationResponseFromJson(json);
}
