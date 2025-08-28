import 'package:dart_mappable/dart_mappable.dart';
part 'mobile_money.mapper.dart';

/// Represents mobile money payment details for supported African markets
///
/// Mobile money is a digital payment service available in Ghana and Kenya,
/// allowing payments through mobile phone accounts. This model contains
/// the necessary information to process mobile money transactions.
///
/// Supported markets and providers:
/// - Ghana: MTN, Vodafone, AirtelTigo
/// - Kenya: M-Pesa (Safaricom)
@MappableClass()
class MobileMoney with MobileMoneyMappable {
  /// Creates a new [MobileMoney] instance
  ///
  /// * [provider] - Mobile money service provider 
  ///   (e.g., "mtn", "vodafone", "mpesa")
  /// * [phone] - Customer's mobile number registered with the provider
  const MobileMoney({
    required this.provider,
    required this.phone,
  });

  /// Mobile Money provider (e.g., "mtn", "vodafone")
  final String provider;

  /// Customer's mobile number
  final String phone;
}
