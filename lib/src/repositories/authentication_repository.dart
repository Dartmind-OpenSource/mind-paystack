// lib/src/services/authentication/repositories/authentication_repository.dart

import 'package:mind_paystack/src/core/exceptions.dart';
import 'package:mind_paystack/src/interfaces/services/authentication_service.dart';
import 'package:mind_paystack/src/utils/logger.dart';

abstract class IAuthenticationRepository {
  /// Save authorization data to local storage
  Future<void> saveAuthorizationData({
    required String reference,
    required AuthResponse data,
  });

  /// Get authorization data from local storage
  Future<AuthResponse?> getAuthorizationData(String reference);

  /// Save transaction data to local storage
  Future<void> saveTransactionData({
    required String reference,
    required TransactionResponse data,
  });

  /// Get transaction data from local storage
  Future<TransactionResponse?> getTransactionData(String reference);

  /// Clear all stored authentication data
  Future<void> clearAuthData();

  /// Check if a transaction exists in local storage
  Future<bool> hasTransaction(String reference);
}

// lib/src/services/authentication/repositories/authentication_repository_impl.dart

class AuthenticationRepository implements IAuthenticationRepository {
  final Storage _storage;
  final String _authPrefix = 'auth_';
  final String _transactionPrefix = 'transaction_';

  AuthenticationRepository({
    required Storage storage,
  }) : _storage = storage;

  @override
  Future<void> saveAuthorizationData({
    required String reference,
    required AuthResponse data,
  }) async {
    try {
      final key = _getAuthKey(reference);
      final json = data.toJson();

      await _storage.write(key, json);
      MPLogger.debug('Saved auth data for reference: $reference');
    } catch (e) {
      MPLogger.error('Failed to save auth data', e);
      throw PaystackException(
        message: 'Failed to save authorization data',
        code: 'storage_error',
      );
    }
  }

  @override
  Future<AuthResponse?> getAuthorizationData(String reference) async {
    try {
      final key = _getAuthKey(reference);
      final json = await _storage.read(key);

      if (json == null) return null;

      return AuthResponse.fromJson(json);
    } catch (e) {
      MPLogger.error('Failed to read auth data', e);
      return null;
    }
  }

  @override
  Future<void> saveTransactionData({
    required String reference,
    required TransactionResponse data,
  }) async {
    try {
      final key = _getTransactionKey(reference);
      final json = data.toJson();

      await _storage.write(key, json);
      MPLogger.debug('Saved transaction data for reference: $reference');
    } catch (e) {
      MPLogger.error('Failed to save transaction data', e);
      throw PaystackException(
        message: 'Failed to save transaction data',
        code: 'storage_error',
      );
    }
  }

  @override
  Future<TransactionResponse?> getTransactionData(String reference) async {
    try {
      final key = _getTransactionKey(reference);
      final json = await _storage.read(key);

      if (json == null) return null;

      return TransactionResponse.fromJson(json);
    } catch (e) {
      MPLogger.error('Failed to read transaction data', e);
      return null;
    }
  }

  @override
  Future<void> clearAuthData() async {
    try {
      final keys = await _storage.getAllKeys();
      final authKeys = keys.where((key) =>
          key.startsWith(_authPrefix) || key.startsWith(_transactionPrefix));

      for (final key in authKeys) {
        await _storage.delete(key);
      }

      MPLogger.info('Cleared all auth data');
    } catch (e) {
      MPLogger.error('Failed to clear auth data', e);
      throw PaystackException(
        message: 'Failed to clear authentication data',
        code: 'storage_error',
      );
    }
  }

  @override
  Future<bool> hasTransaction(String reference) async {
    try {
      final key = _getTransactionKey(reference);
      return await _storage.containsKey(key);
    } catch (e) {
      MPLogger.error('Failed to check transaction existence', e);
      return false;
    }
  }

  String _getAuthKey(String reference) => '$_authPrefix$reference';
  String _getTransactionKey(String reference) =>
      '$_transactionPrefix$reference';
}

// lib/src/services/authentication/repositories/storage.dart

abstract class Storage {
  /// Write data to storage
  Future<void> write(String key, Map<String, dynamic> value);

  /// Read data from storage
  Future<Map<String, dynamic>?> read(String key);

  /// Delete data from storage
  Future<void> delete(String key);

  /// Check if key exists in storage
  Future<bool> containsKey(String key);

  /// Get all keys in storage
  Future<List<String>> getAllKeys();

  /// Clear all data from storage
  Future<void> clear();
}

// lib/src/services/authentication/repositories/storage_impl.dart

// class SecureStorage implements Storage {
//   final FlutterSecureStorage _storage;

//   SecureStorage({
//     FlutterSecureStorage? storage,
//   }) : _storage = storage ?? const FlutterSecureStorage();

//   @override
//   Future<void> write(String key, Map<String, dynamic> value) async {
//     final jsonString = jsonEncode(value);
//     await _storage.write(key: key, value: jsonString);
//   }

//   @override
//   Future<Map<String, dynamic>?> read(String key) async {
//     final jsonString = await _storage.read(key: key);
//     if (jsonString == null) return null;

//     return jsonDecode(jsonString) as Map<String, dynamic>;
//   }

//   @override
//   Future<void> delete(String key) async {
//     await _storage.delete(key: key);
//   }

//   @override
//   Future<bool> containsKey(String key) async {
//     return await _storage.containsKey(key: key);
//   }

//   @override
//   Future<List<String>> getAllKeys() async {
//     final all = await _storage.readAll();
//     return all.keys.toList();
//   }

//   @override
//   Future<void> clear() async {
//     await _storage.deleteAll();
//   }
// }
