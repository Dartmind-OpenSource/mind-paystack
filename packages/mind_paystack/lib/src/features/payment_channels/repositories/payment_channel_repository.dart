import 'package:mind_paystack/mind_paystack.dart';
import 'package:mind_paystack/src/core/errors/models/error_metadata.dart';
import 'package:mind_paystack/src/core/network/http_client.dart';
import 'package:mind_paystack/src/features/charge/models/charge_response.dart';
import 'package:mind_paystack/src/features/payment_channels/models/account_resolution.dart';
import 'package:mind_paystack/src/features/payment_channels/models/bank.dart';
import 'package:mind_paystack/src/features/payment_channels/models/bin_resolution.dart';
import 'package:mind_paystack/src/features/payment_channels/models/card_bin_info.dart';
import 'package:mind_paystack/src/features/payment_channels/models/channel_fees.dart';
import 'package:mind_paystack/src/features/payment_channels/models/mobile_money.dart';
import 'package:mind_paystack/src/features/payment_channels/models/payment_channel.dart';

/// Repository handling payment channel operations
class PaymentChannelRepository {
  PaymentChannelRepository(this._httpClient);

  final HttpClient _httpClient;
  static const _baseEndpoint = '/charge';

  /// Lists all available payment channels
  Future<List<PaymentChannel>> listPaymentChannels({
    String? country,
    String? currency,
    int? amount,
  }) async {
    try {
      final response = await _httpClient.get<Map<String, dynamic>>(
        _baseEndpoint,
        queryParameters: {
          if (country != null) 'country': country,
          if (currency != null) 'currency': currency,
          if (amount != null) 'amount': amount.toString(),
        },
      );

      final data = response.data?['data'] as List;
      return data
          .map((json) => PaymentChannel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw _handleError(e, 'Failed to list payment channels');
    }
  }

  /// Gets payment channel by ID or code
  Future<PaymentChannel> getPaymentChannel(String identifier) async {
    try {
      final response = await _httpClient.get<Map<String, dynamic>>(
        '$_baseEndpoint/$identifier',
      );

      return PaymentChannel.fromJson(
        response.data?['data'] as Map<String, dynamic>,
      );
    } catch (e) {
      throw _handleError(e, 'Failed to get payment channel');
    }
  }

  /// Lists bank payment channels
  Future<List<Bank>> listBanks({
    String? country,
    String? currency,
    bool? payWithBank = false,
    bool? useBankTransfer = false,
    int page = 1,
    int perPage = 50,
  }) async {
    try {
      final response = await _httpClient.get<Map<String, dynamic>>(
        '$_baseEndpoint/banks',
        queryParameters: {
          if (country != null) 'country': country,
          if (currency != null) 'currency': currency,
          if (payWithBank != null) 'pay_with_bank': payWithBank.toString(),
          if (useBankTransfer != null)
            'use_bank_transfer': useBankTransfer.toString(),
          'page': page.toString(),
          'per_page': perPage.toString(),
        },
      );

      final data = response.data?['data'] as List;
      return data
          .map((json) => Bank.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw _handleError(e, 'Failed to list banks');
    }
  }

  /// Lists mobile money providers
  Future<List<MobileMoney>> listMobileMoneyProviders({
    required String country,
    int page = 1,
    int perPage = 50,
  }) async {
    try {
      final response = await _httpClient.get<Map<String, dynamic>>(
        '$_baseEndpoint/mobile_money',
        queryParameters: {
          'country': country,
          'page': page.toString(),
          'per_page': perPage.toString(),
        },
      );

      final data = response.data?['data'] as List;
      return data
          .map((json) => MobileMoney.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw _handleError(e, 'Failed to list mobile money providers');
    }
  }

  /// Gets card BIN information
  Future<CardBinInfo> getCardBinInfo(String bin) async {
    try {
      final response = await _httpClient.get<Map<String, dynamic>>(
        '$_baseEndpoint/card_bins/$bin',
      );

      return CardBinInfo.fromJson(
        response.data?['data'] as Map<String, dynamic>,
      );
    } catch (e) {
      throw _handleError(e, 'Failed to get card BIN info');
    }
  }

  /// Gets channel fees
  Future<ChannelFees> getChannelFees({
    required String channel,
    required int amount,
    String? currency,
    String? paymentType,
  }) async {
    try {
      final response = await _httpClient.get<Map<String, dynamic>>(
        '$_baseEndpoint/fees',
        queryParameters: {
          'channel': channel,
          'amount': amount.toString(),
          if (currency != null) 'currency': currency,
          if (paymentType != null) 'payment_type': paymentType,
        },
      );

      return ChannelFees.fromJson(
        response.data?['data'] as Map<String, dynamic>,
      );
    } catch (e) {
      throw _handleError(e, 'Failed to get channel fees');
    }
  }

  /// Resolves account number
  Future<AccountResolution> resolveAccountNumber({
    required String accountNumber,
    required String bankCode,
  }) async {
    try {
      final response = await _httpClient.get<Map<String, dynamic>>(
        '$_baseEndpoint/resolve_account',
        queryParameters: {
          'account_number': accountNumber,
          'bank_code': bankCode,
        },
      );

      return AccountResolution.fromJson(
        response.data?['data'] as Map<String, dynamic>,
      );
    } catch (e) {
      throw _handleError(e, 'Failed to resolve account number');
    }
  }

  /// Resolves card BIN
  Future<BinResolution> resolveCardBin(String bin) async {
    try {
      final response = await _httpClient.get<Map<String, dynamic>>(
        '$_baseEndpoint/resolve_bin/$bin',
      );

      return BinResolution.fromJson(
        response.data?['data'] as Map<String, dynamic>,
      );
    } catch (e) {
      throw _handleError(e, 'Failed to resolve card BIN');
    }
  }

  /// Updates channel configuration
  Future<PaymentChannel> updateChannelConfiguration({
    required String channel,
    required Map<String, dynamic> configuration,
  }) async {
    try {
      final response = await _httpClient.put<Map<String, dynamic>>(
        '$_baseEndpoint/$channel/configure',
        data: configuration,
      );

      return PaymentChannel.fromJson(
        response.data?['data'] as Map<String, dynamic>,
      );
    } catch (e) {
      throw _handleError(e, 'Failed to update channel configuration');
    }
  }

  /// Charge card payment channel
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
      final response = await _httpClient.post<Map<String, dynamic>>(
        '$_baseEndpoint',
        data: {
          'amount': amount,
          'email': email,
          'card': {
            'number': cardNumber,
            'cvv': cvv,
            'expiry_month': expiryMonth,
            'expiry_year': expiryYear,
          },
        },
      );

      return ChargeResponse.fromJson(
        response.data ?? {},
      );
    } catch (e, s) {
      throw _handleError(e, 'Failed to charge card');
    }
  }

  /// Charge bank payment channel
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
      final response = await _httpClient.post<Map<String, dynamic>>(
        '$_baseEndpoint/bank/charge',
        data: {
          'amount': amount,
          'email': email,
          'bank_code': bankCode,
          'account_number': accountNumber,
          if (currency != null) 'currency': currency,
          if (accountName != null) 'account_name': accountName,
          if (metadata != null) 'metadata': metadata,
        },
      );

      return ChargeResponse.fromJson(
        response.data?['data'] as Map<String, dynamic>,
      );
    } catch (e) {
      throw _handleError(e, 'Failed to charge bank account');
    }
  }

  /// Charge USSD payment channel
  Future<ChargeResponse> chargeUssd({
    required int amount,
    required String email,
    required String bankCode,
    String? currency,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      final response = await _httpClient.post<Map<String, dynamic>>(
        '$_baseEndpoint/ussd/charge',
        data: {
          'amount': amount,
          'email': email,
          'bank_code': bankCode,
          if (currency != null) 'currency': currency,
          if (metadata != null) 'metadata': metadata,
        },
      );

      return ChargeResponse.fromJson(
        response.data?['data'] as Map<String, dynamic>,
      );
    } catch (e) {
      throw _handleError(e, 'Failed to charge USSD');
    }
  }

  /// Charge QR payment channel
  Future<ChargeResponse> chargeQr({
    required int amount,
    required String email,
    required String provider,
    String? currency,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      final response = await _httpClient.post<Map<String, dynamic>>(
        '$_baseEndpoint/qr/charge',
        data: {
          'amount': amount,
          'email': email,
          'provider': provider,
          if (currency != null) 'currency': currency,
          if (metadata != null) 'metadata': metadata,
        },
      );

      return ChargeResponse.fromJson(
        response.data?['data'] as Map<String, dynamic>,
      );
    } catch (e) {
      throw _handleError(e, 'Failed to charge QR');
    }
  }

  /// Charge mobile money channel
  Future<ChargeResponse> chargeMobileMoney({
    required int amount,
    required String email,
    required String provider,
    required String phoneNumber,
    String? currency,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      final response = await _httpClient.post<Map<String, dynamic>>(
        '$_baseEndpoint/mobile_money/charge',
        data: {
          'amount': amount,
          'email': email,
          'provider': provider,
          'phone_number': phoneNumber,
          if (currency != null) 'currency': currency,
          if (metadata != null) 'metadata': metadata,
        },
      );

      return ChargeResponse.fromJson(
        response.data?['data'] as Map<String, dynamic>,
      );
    } catch (e) {
      throw _handleError(e, 'Failed to charge mobile money');
    }
  }

  /// Charge bank transfer channel
  Future<ChargeResponse> chargeBankTransfer({
    required int amount,
    required String email,
    String? currency,
    Duration? expiresIn,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      final response = await _httpClient.post<Map<String, dynamic>>(
        '$_baseEndpoint/bank_transfer/charge',
        data: {
          'amount': amount,
          'email': email,
          if (currency != null) 'currency': currency,
          if (expiresIn != null) 'expires_in': expiresIn.inSeconds,
          if (metadata != null) 'metadata': metadata,
        },
      );

      return ChargeResponse.fromJson(
        response.data?['data'] as Map<String, dynamic>,
      );
    } catch (e) {
      throw _handleError(e, 'Failed to charge bank transfer');
    }
  }

  /// Submit additional charge information
  Future<ChargeResponse> submitChannelCharge({
    required String reference,
    required String type,
    required String value,
  }) async {
    try {
      final response = await _httpClient.post<Map<String, dynamic>>(
        '$_baseEndpoint/submit_charge',
        data: {
          'reference': reference,
          'type': type,
          'value': value,
        },
      );

      return ChargeResponse.fromJson(
        response.data?['data'] as Map<String, dynamic>,
      );
    } catch (e) {
      throw _handleError(e, 'Failed to submit charge information');
    }
  }

  /// Validate channel charge
  Future<ChargeResponse> validateChannelCharge({
    required String reference,
    Map<String, dynamic>? validation,
  }) async {
    try {
      final response = await _httpClient.post<Map<String, dynamic>>(
        '$_baseEndpoint/validate_charge',
        data: {
          'reference': reference,
          if (validation != null) ...validation,
        },
      );

      return ChargeResponse.fromJson(
        response.data?['data'] as Map<String, dynamic>,
      );
    } catch (e) {
      throw _handleError(e, 'Failed to validate charge');
    }
  }

  /// Handles error transformation
  MindException _handleError(dynamic error, String message) {
    if (error is MindException) return error;

    return MindException(
      message: message,
      code: 'payment_channel_error',
      technicalMessage: error.toString(),
      metadata: ErrorMetadata(
        timestamp: DateTime.now(),
        originalError: error.toString(),
      ),
    );
  }
}
