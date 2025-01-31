import 'package:mind_paystack/mind_paystack.dart';
import 'package:mind_paystack/src/core/errors/models/error_metadata.dart';
import 'package:mind_paystack/src/core/network/http_client.dart';
import 'package:mind_paystack/src/features/charge/models/charge_response.dart';
import 'package:mind_paystack/src/features/charge/models/charge_status.dart';

/// Repository handling charge operations
class ChargeRepository {
  ChargeRepository(this._httpClient);

  final HttpClient _httpClient;
  static const _baseEndpoint = '/charge';

  /// Initiates a new charge
  Future<ChargeResponse> charge({
    required int amount,
    required String email,
    required String currency,
    String? authorizationCode,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      final response = await _httpClient.post<Map<String, dynamic>>(
        _baseEndpoint,
        data: {
          'amount': amount,
          'email': email,
          'currency': currency,
          if (authorizationCode != null)
            'authorization_code': authorizationCode,
          if (metadata != null) 'metadata': metadata,
        },
      );

      return ChargeResponse.fromJson(
        response.data?['data'] as Map<String, dynamic>? ?? {},
      );
    } catch (e) {
      throw _handleError(e, 'Failed to initiate charge');
    }
  }

  /// Submits PIN for charge authorization
  Future<ChargeResponse> submitPin({
    required String reference,
    required String pin,
  }) async {
    try {
      final response = await _httpClient.post<Map<String, dynamic>>(
        '$_baseEndpoint/submit_pin',
        data: {
          'reference': reference,
          'pin': pin,
        },
      );

      return ChargeResponse.fromJson(
        response.data?['data'] as Map<String, dynamic>? ?? {},
      );
    } catch (e) {
      throw _handleError(e, 'Failed to submit PIN');
    }
  }

  /// Submits OTP for charge authorization
  Future<ChargeResponse> submitOtp({
    required String reference,
    required String otp,
  }) async {
    try {
      final response = await _httpClient.post<Map<String, dynamic>>(
        '$_baseEndpoint/submit_otp',
        data: {
          'reference': reference,
          'otp': otp,
        },
      );

      return ChargeResponse.fromJson(
        response.data?['data'] as Map<String, dynamic>? ?? {},
      );
    } catch (e) {
      throw _handleError(e, 'Failed to submit OTP');
    }
  }

  /// Submits phone for charge authorization
  Future<ChargeResponse> submitPhone({
    required String reference,
    required String phone,
  }) async {
    try {
      final response = await _httpClient.post<Map<String, dynamic>>(
        '$_baseEndpoint/submit_phone',
        data: {
          'reference': reference,
          'phone': phone,
        },
      );

      return ChargeResponse.fromJson(
        response.data?['data'] as Map<String, dynamic>? ?? {},
      );
    } catch (e) {
      throw _handleError(e, 'Failed to submit phone');
    }
  }

  /// Submits birthday for charge authorization
  Future<ChargeResponse> submitBirthday({
    required String reference,
    required String birthday,
  }) async {
    try {
      final response = await _httpClient.post<Map<String, dynamic>>(
        '$_baseEndpoint/submit_birthday',
        data: {
          'reference': reference,
          'birthday': birthday,
        },
      );

      return ChargeResponse.fromJson(
        response.data?['data'] as Map<String, dynamic>? ?? {},
      );
    } catch (e) {
      throw _handleError(e, 'Failed to submit birthday');
    }
  }

  /// Validates charge with address verification
  Future<ChargeResponse> submitAddress({
    required String reference,
    required String address,
    required String zipCode,
    required String city,
    required String state,
  }) async {
    try {
      final response = await _httpClient.post<Map<String, dynamic>>(
        '$_baseEndpoint/submit_address',
        data: {
          'reference': reference,
          'address': address,
          'zip_code': zipCode,
          'city': city,
          'state': state,
        },
      );

      return ChargeResponse.fromJson(
        response.data?['data'] as Map<String, dynamic>? ?? {},
      );
    } catch (e) {
      throw _handleError(e, 'Failed to submit address');
    }
  }

  /// Checks charge status
  Future<ChargeStatus> checkChargeStatus(String reference) async {
    try {
      final response = await _httpClient.get<Map<String, dynamic>>(
        '$_baseEndpoint/$reference',
      );

      return ChargeStatus.fromJson(
        response.data?['data'] as Map<String, dynamic>? ?? {},
      );
    } catch (e) {
      throw _handleError(e, 'Failed to check charge status');
    }
  }

  /// Creates partial debit charge
  Future<ChargeResponse> createPartialDebit({
    required int amount,
    required String email,
    required String authorizationCode,
    required String currency,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      final response = await _httpClient.post<Map<String, dynamic>>(
        '$_baseEndpoint/partial_debit',
        data: {
          'amount': amount,
          'email': email,
          'authorization_code': authorizationCode,
          'currency': currency,
          if (metadata != null) 'metadata': metadata,
        },
      );

      return ChargeResponse.fromJson(
        response.data?['data'] as Map<String, dynamic>? ?? {},
      );
    } catch (e) {
      throw _handleError(e, 'Failed to create partial debit');
    }
  }

  /// Handles error transformation
  MindException _handleError(dynamic error, String message) {
    if (error is MindException) return error;

    return MindException(
      message: message,
      code: 'charge_error',
      technicalMessage: error.toString(),
      metadata: ErrorMetadata(
        timestamp: DateTime.now(),
        originalError: error.toString(),
      ),
    );
  }
}
