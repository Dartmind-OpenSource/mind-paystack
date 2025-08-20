import 'package:freezed_annotation/freezed_annotation.dart';
part 'card_bin_info.freezed.dart';
part 'card_bin_info.g.dart';

@freezed
class CardBinInfo with _$CardBinInfo {
  const factory CardBinInfo({
    /// BIN/IIN number
    required String bin,

    /// Card brand
    required String brand,

    /// Country code
    required String countryCode, /// Card type (debit, credit)
    required String cardType, /// Sub brand
    String? subBrand,

    /// Bank name
    String? bankName,

    /// Card category (classic, platinum etc)
    String? cardCategory,

    /// Whether card is international
    @Default(false) bool international,
  }) = _CardBinInfo;

  factory CardBinInfo.fromJson(Map<String, dynamic> json) =>
      _$CardBinInfoFromJson(json);
}
