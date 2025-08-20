import 'package:freezed_annotation/freezed_annotation.dart';
part 'payment_channel.freezed.dart';
part 'payment_channel.g.dart';

@freezed
class PaymentChannel with _$PaymentChannel {
  const factory PaymentChannel({
    /// Unique identifier for the channel
    required String id,

    /// Name of the channel
    required String name,

    /// Channel code/slug
    required String code,

    /// Channel type (card, bank, ussd, etc)
    required String type,

    /// Currency supported by the channel
    required String currency,

    /// Country where channel is available
    required String country, /// Creation timestamp
    required DateTime createdAt, /// Last update timestamp
    required DateTime updatedAt, /// Minimum amount allowed
    int? minimumAmount,

    /// Maximum amount allowed
    int? maximumAmount,

    /// Channel configuration
    Map<String, dynamic>? configuration,

    /// Whether channel is currently active
    @Default(true) bool isActive,

    /// Whether channel supports recurring payments
    @Default(false) bool supportsRecurring,
  }) = _PaymentChannel;

  factory PaymentChannel.fromJson(Map<String, dynamic> json) =>
      _$PaymentChannelFromJson(json);
}
