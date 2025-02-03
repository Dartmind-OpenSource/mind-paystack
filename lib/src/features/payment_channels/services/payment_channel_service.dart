import 'package:mind_paystack/src/features/charge/models/charge_response.dart';
import 'package:mind_paystack/src/features/payment_channels/interfaces/i_payment_channel.dart';
import 'package:mind_paystack/src/features/payment_channels/models/account_resolution.dart';
import 'package:mind_paystack/src/features/payment_channels/models/bank.dart';
import 'package:mind_paystack/src/features/payment_channels/models/bin_resolution.dart';
import 'package:mind_paystack/src/features/payment_channels/models/card_bin_info.dart';
import 'package:mind_paystack/src/features/payment_channels/models/channel_fees.dart';
import 'package:mind_paystack/src/features/payment_channels/models/mobile_money.dart';
import 'package:mind_paystack/src/features/payment_channels/models/payment_channel.dart';
import 'package:mind_paystack/src/features/payment_channels/repositories/payment_channel_repository.dart';
import 'package:mind_paystack/src/utils/logger.dart';

/// Service implementation for payment channel operations
class PaymentChannelService implements IPaymentChannels {
  PaymentChannelService(this._repository);

  final PaymentChannelRepository _repository;

  @override
  Future<List<PaymentChannel>> listPaymentChannels({
    String? country,
    String? currency,
    int? amount,
  }) async {
    try {
      MPLogger.info('Listing payment channels');
      return await _repository.listPaymentChannels(
        country: country,
        currency: currency,
        amount: amount,
      );
    } catch (e) {
      MPLogger.error('Failed to list payment channels', error: e);
      rethrow;
    }
  }

  @override
  Future<PaymentChannel> getPaymentChannel(String identifier) async {
    try {
      MPLogger.info('Getting payment channel: $identifier');
      return await _repository.getPaymentChannel(identifier);
    } catch (e) {
      MPLogger.error('Failed to get payment channel', error: e);
      rethrow;
    }
  }

  @override
  Future<List<Bank>> listBanks({
    String? country,
    String? currency,
    bool? payWithBank = false,
    bool? useBankTransfer = false,
    int page = 1,
    int perPage = 50,
  }) async {
    try {
      MPLogger.info('Listing banks');
      return await _repository.listBanks(
        country: country,
        currency: currency,
        payWithBank: payWithBank,
        useBankTransfer: useBankTransfer,
        page: page,
        perPage: perPage,
      );
    } catch (e) {
      MPLogger.error('Failed to list banks', error: e);
      rethrow;
    }
  }

  @override
  Future<List<MobileMoney>> listMobileMoneyProviders({
    required String country,
    int page = 1,
    int perPage = 50,
  }) async {
    try {
      MPLogger.info('Listing mobile money providers for country: $country');
      return await _repository.listMobileMoneyProviders(
        country: country,
        page: page,
        perPage: perPage,
      );
    } catch (e) {
      MPLogger.error('Failed to list mobile money providers', error: e);
      rethrow;
    }
  }

  @override
  Future<CardBinInfo> getCardBinInfo(String bin) async {
    try {
      MPLogger.info('Getting card BIN info: $bin');
      return await _repository.getCardBinInfo(bin);
    } catch (e) {
      MPLogger.error('Failed to get card BIN info', error: e);
      rethrow;
    }
  }

  @override
  Future<ChannelFees> getChannelFees({
    required String channel,
    required int amount,
    String? currency,
    String? paymentType,
  }) async {
    try {
      MPLogger.info('Getting channel fees for: $channel');
      return await _repository.getChannelFees(
        channel: channel,
        amount: amount,
        currency: currency,
        paymentType: paymentType,
      );
    } catch (e) {
      MPLogger.error('Failed to get channel fees', error: e);
      rethrow;
    }
  }

  @override
  Future<AccountResolution> resolveAccountNumber({
    required String accountNumber,
    required String bankCode,
  }) async {
    try {
      MPLogger.info('Resolving account number: $accountNumber');
      return await _repository.resolveAccountNumber(
        accountNumber: accountNumber,
        bankCode: bankCode,
      );
    } catch (e) {
      MPLogger.error('Failed to resolve account number', error: e);
      rethrow;
    }
  }

  @override
  Future<BinResolution> resolveCardBin(String bin) async {
    try {
      MPLogger.info('Resolving card BIN: $bin');
      return await _repository.resolveCardBin(bin);
    } catch (e) {
      MPLogger.error('Failed to resolve card BIN', error: e);
      rethrow;
    }
  }

  @override
  Future<PaymentChannel> updateChannelConfiguration({
    required String channel,
    required Map<String, dynamic> configuration,
  }) async {
    try {
      MPLogger.info('Updating channel configuration for: $channel');
      return await _repository.updateChannelConfiguration(
        channel: channel,
        configuration: configuration,
      );
    } catch (e) {
      MPLogger.error('Failed to update channel configuration', error: e);
      rethrow;
    }
  }

  @override
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
  }) async {
    try {
      MPLogger.info('Charging card for email: $email');
      return await _repository.chargeCard(
        amount: amount,
        email: email,
        cardNumber: cardNumber,
        cvv: cvv,
        expiryMonth: expiryMonth,
        expiryYear: expiryYear,
        pin: pin,
        currency: currency,
        metadata: metadata,
      );
    } catch (e) {
      MPLogger.error('Failed to charge card', error: e);
      rethrow;
    }
  }

  @override
  Future<ChargeResponse> chargeBank({
    required int amount,
    required String email,
    required String bankCode,
    required String accountNumber,
    String? currency,
    String? accountName,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      MPLogger.info('Charging bank account for email: $email');
      return await _repository.chargeBank(
        amount: amount,
        email: email,
        bankCode: bankCode,
        accountNumber: accountNumber,
        currency: currency,
        accountName: accountName,
        metadata: metadata,
      );
    } catch (e) {
      MPLogger.error('Failed to charge bank account', error: e);
      rethrow;
    }
  }

  @override
  Future<ChargeResponse> chargeUssd({
    required int amount,
    required String email,
    required String bankCode,
    String? currency,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      MPLogger.info('Charging USSD for email: $email');
      return await _repository.chargeUssd(
        amount: amount,
        email: email,
        bankCode: bankCode,
        currency: currency,
        metadata: metadata,
      );
    } catch (e) {
      MPLogger.error('Failed to charge USSD', error: e);
      rethrow;
    }
  }

  @override
  Future<ChargeResponse> chargeQr({
    required int amount,
    required String email,
    required String provider,
    String? currency,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      MPLogger.info('Charging QR for email: $email');
      return await _repository.chargeQr(
        amount: amount,
        email: email,
        provider: provider,
        currency: currency,
        metadata: metadata,
      );
    } catch (e) {
      MPLogger.error('Failed to charge QR', error: e);
      rethrow;
    }
  }

  @override
  Future<ChargeResponse> chargeMobileMoney({
    required int amount,
    required String email,
    required String provider,
    required String phoneNumber,
    String? currency,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      MPLogger.info('Charging mobile money for email: $email');
      return await _repository.chargeMobileMoney(
        amount: amount,
        email: email,
        provider: provider,
        phoneNumber: phoneNumber,
        currency: currency,
        metadata: metadata,
      );
    } catch (e) {
      MPLogger.error('Failed to charge mobile money', error: e);
      rethrow;
    }
  }

  @override
  Future<ChargeResponse> chargeBankTransfer({
    required int amount,
    required String email,
    String? currency,
    Duration? expiresIn,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      MPLogger.info('Charging bank transfer for email: $email');
      return await _repository.chargeBankTransfer(
        amount: amount,
        email: email,
        currency: currency,
        expiresIn: expiresIn,
        metadata: metadata,
      );
    } catch (e) {
      MPLogger.error('Failed to charge bank transfer', error: e);
      rethrow;
    }
  }

  @override
  Future<ChargeResponse> submitChannelCharge({
    required String reference,
    required String type,
    required String value,
  }) async {
    try {
      MPLogger.info('Submitting charge info for reference: $reference');
      return await _repository.submitChannelCharge(
        reference: reference,
        type: type,
        value: value,
      );
    } catch (e) {
      MPLogger.error('Failed to submit charge info', error: e);
      rethrow;
    }
  }

  @override
  Future<ChargeResponse> validateChannelCharge({
    required String reference,
    Map<String, dynamic>? validation,
  }) async {
    try {
      MPLogger.info('Validating charge for reference: $reference');
      return await _repository.validateChannelCharge(
        reference: reference,
        validation: validation,
      );
    } catch (e) {
      MPLogger.error('Failed to validate charge', error: e);
      rethrow;
    }
  }
}
