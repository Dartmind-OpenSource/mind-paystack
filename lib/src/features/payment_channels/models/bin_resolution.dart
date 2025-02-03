import 'package:freezed_annotation/freezed_annotation.dart';
part 'bin_resolution.freezed.dart';
part 'bin_resolution.g.dart';

@freezed
class BinResolution with _$BinResolution {
  const factory BinResolution({
    /// BIN/IIN number
    required String bin,

    /// Card brand
    required String brand,

    /// Card type
    required String cardType,

    /// Bank name
    String? bankName,

    /// Country code
    required String countryCode,

    /// Card category
    String? category,

    /// Whether card is international
    @Default(false) bool international,
  }) = _BinResolution;

  factory BinResolution.fromJson(Map<String, dynamic> json) =>
      _$BinResolutionFromJson(json);
}
