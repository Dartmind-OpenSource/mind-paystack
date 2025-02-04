import 'package:freezed_annotation/freezed_annotation.dart';
part 'account_resolution.freezed.dart';
part 'account_resolution.g.dart';

@freezed
class AccountResolution with _$AccountResolution {
  const factory AccountResolution({
    /// Account number
    required String accountNumber,

    /// Account name
    required String accountName,

    /// Bank code
    required String bankCode,

    /// Bank name
    String? bankName,

    /// Account type
    String? accountType,

    /// BVN match status
    bool? bvnMatch,
  }) = _AccountResolution;

  factory AccountResolution.fromJson(Map<String, dynamic> json) =>
      _$AccountResolutionFromJson(json);
}
