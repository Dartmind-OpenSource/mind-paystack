import 'package:freezed_annotation/freezed_annotation.dart';
part 'mobile_money.freezed.dart';
part 'mobile_money.g.dart';

@freezed
class MobileMoney with _$MobileMoney {
  const factory MobileMoney({
    /// Provider code
    required String code,

    /// Provider name
    required String name,

    /// Country of operation
    required String country, /// Creation timestamp
    required DateTime createdAt, /// Provider logo URL
    String? logoUrl,

    /// Supported currencies
    List<String>? currencies,

    /// Whether provider is active
    @Default(true) bool isActive,

    /// Payment type
    @Default('mobile_money') String type,
  }) = _MobileMoney;

  factory MobileMoney.fromJson(Map<String, dynamic> json) =>
      _$MobileMoneyFromJson(json);
}
