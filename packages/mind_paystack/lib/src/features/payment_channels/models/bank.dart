import 'package:freezed_annotation/freezed_annotation.dart';
part 'bank.freezed.dart';
part 'bank.g.dart';

@freezed
class Bank with _$Bank {
  const factory Bank({
    /// Bank code
    required String code,

    /// Bank name
    required String name,

    /// Bank slug
    required String slug,

    /// Bank USSD code
    String? ussdCode,

    /// Bank logo URL
    String? logoUrl,

    /// Supported payment types
    List<String>? supportedPaymentTypes,

    /// Whether bank is active
    @Default(true) bool isActive,

    /// Country where bank operates
    required String country,

    /// Bank type (commercial, microfinance, etc)
    String? type,

    /// Gateway identifier
    String? gateway,

    /// Creation timestamp
    required DateTime createdAt,
  }) = _Bank;

  factory Bank.fromJson(Map<String, dynamic> json) => _$BankFromJson(json);
}
