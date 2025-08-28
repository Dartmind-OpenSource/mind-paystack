import 'package:dart_mappable/dart_mappable.dart';
part 'qr.mapper.dart';

/// Represents QR code payment configuration details
///
/// This model specifies the QR code payment provider to use for generating
/// QR codes that customers can scan to make payments. Different providers
/// support different QR code standards and payment networks.
@MappableClass()
class Qr with QrMappable {
  /// Creates a new [Qr] instance
  ///
  /// * [provider] - QR code provider type ("scan-to-pay" or "visa")
  const Qr({
    required this.provider,
  });

  /// Provider value: "scan-to-pay" or "visa"
  final String provider;
}
