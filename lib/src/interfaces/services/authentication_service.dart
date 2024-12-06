// lib/src/services/authentication/authentication_service.dart

import 'dart:math';

import 'package:dio/dio.dart';
import 'package:mind_paystack/src/core/client.dart';
import 'package:mind_paystack/src/core/exceptions.dart';
import 'package:mind_paystack/src/repositories/authentication_repository.dart';
import 'package:mind_paystack/src/utils/logger.dart';

abstract class IAuthenticationService {
  /// Initialize a new transaction
  Future<AuthResponse> initializeTransaction({
    required int amount,
    required String email,
    String? reference,
    Map<String, dynamic>? metadata,
  });

  /// Verify a transaction
  Future<TransactionResponse> verifyTransaction(String reference);

  /// Get transaction list
  Future<List<TransactionResponse>> listTransactions({
    DateTime? from,
    DateTime? to,
    int? perPage,
    int? page,
  });

  /// Fetch payment data
  Future<PaymentDataResponse> getPaymentData(String reference);
}

class PaymentDataResponse {
  static Future<PaymentDataResponse> fromJson(Map<String, dynamic> response) {
    return Future.value(PaymentDataResponse());
  }
}

// lib/src/services/authentication/authentication_service_impl.dart

class AuthenticationService implements IAuthenticationService {
  final MindPaystackClient _client;
  final AuthenticationRepository _repository;

  AuthenticationService({
    required MindPaystackClient client,
    required AuthenticationRepository repository,
  })  : _client = client,
        _repository = repository;

  @override
  Future<AuthResponse> initializeTransaction({
    required int amount,
    required String email,
    String? reference,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      final response = await _client.post<Map<String, dynamic>>(
        'transaction/initialize',
        data: {
          'amount': amount,
          'email': email,
          'reference': reference ?? _generateReference(),
          'metadata': metadata,
        },
      );

      final authResponse = AuthResponse.fromJson(response);

      // Cache the authorization data
      await _repository.saveAuthorizationData(
        reference: authResponse.reference,
        data: authResponse,
      );

      MPLogger.info('Transaction initialized: ${authResponse.reference}');
      return authResponse;
    } on DioException catch (e) {
      throw _handleAuthError(e);
    }
  }

  @override
  Future<TransactionResponse> verifyTransaction(String reference) async {
    try {
      // Check cache first
      final cachedData = await _repository.getTransactionData(reference);
      if (cachedData != null && !_isTransactionStale(cachedData)) {
        return cachedData;
      }

      final response = await _client.get<Map<String, dynamic>>(
        'transaction/verify/$reference',
      );

      final transactionResponse = TransactionResponse.fromJson(response);

      // Cache the verification result
      await _repository.saveTransactionData(
        reference: reference,
        data: transactionResponse,
      );

      MPLogger.info('Transaction verified: $reference');
      return transactionResponse;
    } on DioException catch (e) {
      throw _handleAuthError(e);
    }
  }

  @override
  Future<List<TransactionResponse>> listTransactions({
    DateTime? from,
    DateTime? to,
    int? perPage,
    int? page,
  }) async {
    try {
      final response = await _client.get<Map<String, dynamic>>(
        'transaction',
        queryParams: {
          if (from != null) 'from': from.toIso8601String(),
          if (to != null) 'to': to.toIso8601String(),
          if (perPage != null) 'perPage': perPage.toString(),
          if (page != null) 'page': page.toString(),
        },
      );

      final List<dynamic> transactions = response['data'] as List<dynamic>;
      return transactions
          .map((json) => TransactionResponse.fromJson(
              Map<String, dynamic>.from(json as Map)))
          .toList();
    } on DioException catch (e) {
      throw _handleAuthError(e);
    }
  }

  @override
  Future<PaymentDataResponse> getPaymentData(String reference) async {
    try {
      final response = await _client.get<Map<String, dynamic>>(
        'transaction/$reference/payment-data',
      );

      return PaymentDataResponse.fromJson(response);
    } on DioException catch (e) {
      throw _handleAuthError(e);
    }
  }

  String _generateReference() {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final random = Random().nextInt(1000000);
    return 'MPST_${timestamp}_$random';
  }

  bool _isTransactionStale(TransactionResponse transaction) {
    final staleThreshold = Duration(minutes: 5);
    return DateTime.now().difference(transaction.updatedAt) > staleThreshold;
  }

  PaystackException _handleAuthError(DioException e) {
    if (e.response?.statusCode == 401) {
      return PaystackAuthException.invalidKey();
    }

    if (e.response?.statusCode == 403) {
      return PaystackAuthException(
        message: 'Permission denied',
        code: 'permission_denied',
      );
    }

    final data = e.response?.data;
    if (data is Map<String, dynamic>) {
      return PaystackException(
        message: (data['message'] ?? 'Authentication failed').toString(),
        code: (data['code'] ?? 'auth_error').toString(),
        details: data,
      );
    }

    return PaystackException(
      message: 'Authentication failed',
      code: 'auth_error',
    );
  }
}

// lib/src/services/authentication/models/auth_response.dart

class AuthResponse {
  final String reference;
  final String accessCode;
  final String authorizationUrl;
  final Map<String, dynamic>? metadata;

  AuthResponse({
    required this.reference,
    required this.accessCode,
    required this.authorizationUrl,
    this.metadata,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>;
    return AuthResponse(
      reference: data['reference'] as String,
      accessCode: data['access_code'] as String,
      authorizationUrl: data['authorization_url'] as String,
      metadata: data['metadata'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reference': reference,
      'access_code': accessCode,
      'authorization_url': authorizationUrl,
      'metadata': metadata,
    };
  }
}

// lib/src/services/authentication/models/transaction_response.dart

class TransactionResponse {
  final String reference;
  final String status;
  final int amount;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Map<String, dynamic>? metadata;

  TransactionResponse({
    required this.reference,
    required this.status,
    required this.amount,
    required this.createdAt,
    required this.updatedAt,
    this.metadata,
  });

  factory TransactionResponse.fromJson(Map<String, dynamic> json) {
    return TransactionResponse(
      reference: json['reference'] as String,
      status: json['status'] as String,
      amount: json['amount'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reference': reference,
      'status': status,
      'amount': amount,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'metadata': metadata,
    };
  }
}
