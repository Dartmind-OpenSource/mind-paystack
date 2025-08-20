import 'package:freezed_annotation/freezed_annotation.dart';
part 'channel_fees.freezed.dart';
part 'channel_fees.g.dart';

@freezed
class ChannelFees with _$ChannelFees {
  const factory ChannelFees({
    /// Channel identifier
    required String channel,

    /// Fee amount
    required int amount,

    /// Fee percentage
    required double percentage,

    /// Currency
    required String currency, /// Cap on fees
    int? cap,

    /// Additional fees
    Map<String, int>? additionalFees,

    /// Fee breakdown
    Map<String, dynamic>? breakdown,
  }) = _ChannelFees;

  factory ChannelFees.fromJson(Map<String, dynamic> json) =>
      _$ChannelFeesFromJson(json);
}
