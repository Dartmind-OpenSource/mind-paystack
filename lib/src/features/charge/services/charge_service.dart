import 'package:mind_paystack/src/features/charge/interfaces/i_charge_service.dart';
import 'package:mind_paystack/src/features/charge/models/charge_response.dart';
import 'package:mind_paystack/src/features/charge/models/charge_status.dart';
import 'package:mind_paystack/src/features/charge/repositories/charge_repository.dart';
import 'package:mind_paystack/src/utils/logger.dart';

/// Service implementation for charge operations
class ChargeService implements IChargeService {
  const ChargeService(this._repository);

  final ChargeRepository _repository;

  @override
  Future<ChargeResponse> charge({
    required int amount,
    required String email,
    required String currency,
    String? authorizationCode,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      MPLogger.info('Initiating charge for email: $email');
      return await _repository.charge(
        amount: amount,
        email: email,
        currency: currency,
        authorizationCode: authorizationCode,
        metadata: metadata,
      );
    } catch (e) {
      MPLogger.error('Failed to initiate charge', error: e);
      rethrow;
    }
  }

  @override
  Future<ChargeResponse> submitPin({
    required String reference,
    required String pin,
  }) async {
    try {
      MPLogger.info('Submitting PIN for reference: $reference');
      return await _repository.submitPin(
        reference: reference,
        pin: pin,
      );
    } catch (e) {
      MPLogger.error('Failed to submit PIN', error: e);
      rethrow;
    }
  }

  @override
  Future<ChargeResponse> submitOtp({
    required String reference,
    required String otp,
  }) async {
    try {
      MPLogger.info('Submitting OTP for reference: $reference');
      return await _repository.submitOtp(
        reference: reference,
        otp: otp,
      );
    } catch (e) {
      MPLogger.error('Failed to submit OTP', error: e);
      rethrow;
    }
  }

  @override
  Future<ChargeResponse> submitPhone({
    required String reference,
    required String phone,
  }) async {
    try {
      MPLogger.info('Submitting phone for reference: $reference');
      return await _repository.submitPhone(
        reference: reference,
        phone: phone,
      );
    } catch (e) {
      MPLogger.error('Failed to submit phone', error: e);
      rethrow;
    }
  }

  @override
  Future<ChargeResponse> submitBirthday({
    required String reference,
    required String birthday,
  }) async {
    try {
      MPLogger.info('Submitting birthday for reference: $reference');
      return await _repository.submitBirthday(
        reference: reference,
        birthday: birthday,
      );
    } catch (e) {
      MPLogger.error('Failed to submit birthday', error: e);
      rethrow;
    }
  }

  @override
  Future<ChargeResponse> submitAddress({
    required String reference,
    required String address,
    required String zipCode,
    required String city,
    required String state,
  }) async {
    try {
      MPLogger.info('Submitting address for reference: $reference');
      return await _repository.submitAddress(
        reference: reference,
        address: address,
        zipCode: zipCode,
        city: city,
        state: state,
      );
    } catch (e) {
      MPLogger.error('Failed to submit address', error: e);
      rethrow;
    }
  }

  @override
  Future<ChargeStatus> checkChargeStatus(String reference) async {
    try {
      MPLogger.info('Checking charge status for reference: $reference');
      return await _repository.checkChargeStatus(reference);
    } catch (e) {
      MPLogger.error('Failed to check charge status', error: e);
      rethrow;
    }
  }

  @override
  Future<ChargeResponse> createPartialDebit({
    required int amount,
    required String email,
    required String authorizationCode,
    required String currency,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      MPLogger.info('Creating partial debit for email: $email');
      return await _repository.createPartialDebit(
        amount: amount,
        email: email,
        authorizationCode: authorizationCode,
        currency: currency,
        metadata: metadata,
      );
    } catch (e) {
      MPLogger.error('Failed to create partial debit', error: e);
      rethrow;
    }
  }
}
