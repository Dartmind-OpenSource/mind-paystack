import 'package:mind_paystack/src/features/charge/models/charge_response.dart';
import 'package:mind_paystack/src/features/payment_channels/models/account_resolution.dart';
import 'package:mind_paystack/src/features/payment_channels/models/bank.dart';
import 'package:mind_paystack/src/features/payment_channels/models/bin_resolution.dart';
import 'package:mind_paystack/src/features/payment_channels/models/card_bin_info.dart';
import 'package:mind_paystack/src/features/payment_channels/models/channel_fees.dart';
import 'package:mind_paystack/src/features/payment_channels/models/mobile_money.dart';
import 'package:mind_paystack/src/features/payment_channels/models/payment_channel.dart';

/// Interface defining the contract for payment channels operations
abstract class IPaymentChannels {
  /// Lists all available payment channels
  Future<List<PaymentChannel>> listPaymentChannels({
    String? country,
    String? currency,
    int? amount,
  });

  /// Gets payment channel by ID or code
  Future<PaymentChannel> getPaymentChannel(String identifier);

  /// Lists bank payment channels
  Future<List<Bank>> listBanks({
    String? country,
    String? currency,
    bool? payWithBank = false,
    bool? useBankTransfer = false,
    int page = 1,
    int perPage = 50,
  });

  /// Lists mobile money payment channels
  Future<List<MobileMoney>> listMobileMoneyProviders({
    required String country,
    int page = 1,
    int perPage = 50,
  });

  /// Lists card BIN information
  Future<CardBinInfo> getCardBinInfo(String bin);

  /// Gets fees applicable to a payment channel
  Future<ChannelFees> getChannelFees({
    required String channel,
    required int amount,
    String? currency,
    String? paymentType,
  });

  /// Resolves account number
  Future<AccountResolution> resolveAccountNumber({
    required String accountNumber,
    required String bankCode,
  });

  /// Resolves card BIN
  Future<BinResolution> resolveCardBin(String bin);

  /// Updates channel configuration
  Future<PaymentChannel> updateChannelConfiguration({
    required String channel,
    required Map<String, dynamic> configuration,
  });

  /// Charge Card Payment Channel
  Future<ChargeResponse> chargeCard({
    required int amount,
    required String email,
    required String cardNumber,
    required String cvv,
    required String expiryMonth,
    required String expiryYear,
    String? pin,
    String? currency,
    Map<String, dynamic>? metadata,
  });

  /// Charge Bank Payment Channel
  Future<ChargeResponse> chargeBank({
    required int amount,
    required String email,
    required String bankCode,
    required String accountNumber,
    String? currency,
    String? accountName,
    Map<String, dynamic>? metadata,
  });

  /// Charge USSD Payment Channel
  Future<ChargeResponse> chargeUssd({
    required int amount,
    required String email,
    required String bankCode,
    String? currency,
    Map<String, dynamic>? metadata,
  });

  /// Charge QR Payment Channel
  Future<ChargeResponse> chargeQr({
    required int amount,
    required String email,
    required String provider,
    String? currency,
    Map<String, dynamic>? metadata,
  });

  /// Charge Mobile Money Channel
  Future<ChargeResponse> chargeMobileMoney({
    required int amount,
    required String email,
    required String provider,
    required String phoneNumber,
    String? currency,
    Map<String, dynamic>? metadata,
  });

  /// Charge Bank Transfer Channel
  Future<ChargeResponse> chargeBankTransfer({
    required int amount,
    required String email,
    String? currency,
    Duration? expiresIn,
    Map<String, dynamic>? metadata,
  });

  /// Submit OTP/Phone/Birthday for channel charge
  Future<ChargeResponse> submitChannelCharge({
    required String reference,
    required String type,
    required String value,
  });

  /// Validate Channel Charge
  Future<ChargeResponse> validateChannelCharge({
    required String reference,
    Map<String, dynamic>? validation,
  });
}
