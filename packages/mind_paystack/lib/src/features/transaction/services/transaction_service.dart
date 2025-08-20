import 'package:dio/dio.dart';
import 'package:mind_paystack/src/core/errors/models/mind_exception.dart';
import 'package:mind_paystack/src/core/models/resource.dart';
import 'package:mind_paystack/src/features/transaction/builders/charge_authorization_builder.dart';
import 'package:mind_paystack/src/features/transaction/builders/initialiaze_transaction_builder.dart';
import 'package:mind_paystack/src/features/transaction/interfaces/i_transaction_service.dart';
import 'package:mind_paystack/src/features/transaction/models/models.dart';
import 'package:mind_paystack/src/features/transaction/repositories/transaction_repository.dart';

/// Service class for managing transaction operations with proper exception
/// handling
class TransactionService implements ITransactionService {
  /// Creates a new TransactionService instance
  TransactionService(this._repository);

  /// The repository used for transaction operations
  final TransactionRepository _repository;

  @override
  Future<Resource<TransactionInitialization>> initialize(
    InitializeTransactionOptions options,
  ) async {
    try {
      return await _repository.initialize(options);
    } on DioException catch (e) {
      throw MindException.fromDioError(e);
    } catch (e) {
      throw MindException(
        message: 'Failed to initialize transaction',
        code: 'transaction_initialization_error',
        technicalMessage: e.toString(),
      );
    }
  }

  @override
  Future<Resource<Transaction>> verify(String reference) async {
    try {
      if (reference.isEmpty) {
        throw MindException.validation(
          message: 'Transaction reference cannot be empty',
          errors: [],
        );
      }
      return await _repository.verify(reference);
    } on DioException catch (e) {
      throw MindException.fromDioError(e);
    } catch (e) {
      throw MindException(
        message: 'Failed to verify transaction',
        code: 'transaction_verification_error',
        technicalMessage: e.toString(),
      );
    }
  }

  @override
  Future<Resource<List<Transaction>>> list(
    ListTransactionsOptions options,
  ) async {
    try {
      final result = await _repository.list(options: options);
      return Resource<List<Transaction>>(
        status: result.status,
        message: result.message,
        data: result.data?.data,
        meta: result.meta,
      );
    } on DioException catch (e) {
      throw MindException.fromDioError(e);
    } catch (e) {
      throw MindException(
        message: 'Failed to list transactions',
        code: 'transaction_list_error',
        technicalMessage: e.toString(),
      );
    }
  }

  @override
  Future<Resource<Transaction>> fetch(int id) async {
    try {
      if (id <= 0) {
        throw MindException.validation(
          message: 'Transaction ID must be a positive number',
          errors: [],
        );
      }
      return await _repository.fetch(id.toString());
    } on DioException catch (e) {
      throw MindException.fromDioError(e);
    } catch (e) {
      throw MindException(
        message: 'Failed to fetch transaction',
        code: 'transaction_fetch_error',
        technicalMessage: e.toString(),
      );
    }
  }

  @override
  Future<Resource<Transaction>> chargeAuthorization({
    required String authorizationCode,
    required int amount,
    required String email,
  }) async {
    try {
      if (authorizationCode.isEmpty) {
        throw MindException.validation(
          message: 'Authorization code cannot be empty',
          errors: [],
        );
      }
      if (amount <= 0) {
        throw MindException.validation(
          message: 'Amount must be greater than zero',
          errors: [],
        );
      }
      if (email.isEmpty || !email.contains('@')) {
        throw MindException.validation(
          message: 'Valid email address is required',
          errors: [],
        );
      }

      final options = ChargeAuthorizationOptions(
        authorizationCode: authorizationCode,
        email: email,
        amount: amount.toString(),
      );

      return await _repository.chargeAuthorization(options: options);
    } on DioException catch (e) {
      throw MindException.fromDioError(e);
    } catch (e) {
      throw MindException(
        message: 'Failed to charge authorization',
        code: 'authorization_charge_error',
        technicalMessage: e.toString(),
      );
    }
  }

  @override
  Future<Resource<TransactionTimeline>> timeline(String idOrReference) async {
    try {
      if (idOrReference.isEmpty) {
        throw MindException.validation(
          message: 'Transaction ID or reference cannot be empty',
          errors: [],
        );
      }
      return await _repository.timeline(idOrReference);
    } on DioException catch (e) {
      throw MindException.fromDioError(e);
    } catch (e) {
      throw MindException(
        message: 'Failed to get transaction timeline',
        code: 'transaction_timeline_error',
        technicalMessage: e.toString(),
      );
    }
  }

  @override
  Future<Resource<TransactionTotals>> totals() async {
    try {
      return await _repository.totals();
    } on DioException catch (e) {
      throw MindException.fromDioError(e);
    } catch (e) {
      throw MindException(
        message: 'Failed to get transaction totals',
        code: 'transaction_totals_error',
        technicalMessage: e.toString(),
      );
    }
  }

  @override
  Future<Resource<TransactionExport>> export(
    ExportTransactionsOptions options,
  ) async {
    try {
      return await _repository.export(options: options);
    } on DioException catch (e) {
      throw MindException.fromDioError(e);
    } catch (e) {
      throw MindException(
        message: 'Failed to export transactions',
        code: 'transaction_export_error',
        technicalMessage: e.toString(),
      );
    }
  }

  @override
  Future<Resource<PartialDebit>> partialDebit(
    PartialDebitOptions options,
  ) async {
    try {
      return await _repository.partialDebit(options);
    } on DioException catch (e) {
      throw MindException.fromDioError(e);
    } catch (e) {
      throw MindException(
        message: 'Failed to perform partial debit',
        code: 'partial_debit_error',
        technicalMessage: e.toString(),
      );
    }
  }

  /// Creates a new transaction initialization builder
  static InitializeTransactionBuilder builder() =>
      InitializeTransactionBuilder();

  /// Creates a new charge authorization builder
  static ChargeAuthorizationBuilder chargeBuilder() =>
      ChargeAuthorizationBuilder();

  /// Initializes a transaction using the builder pattern
  Future<Resource<TransactionInitialization>> initializeWithBuilder(
    void Function(InitializeTransactionBuilder) builderCallback,
  ) async {
    final builder = InitializeTransactionBuilder();
    builderCallback(builder);
    return initialize(builder.build());
  }

  /// Charges an authorization using the builder pattern
  Future<Resource<Transaction>> chargeAuthorizationWithBuilder(
    void Function(ChargeAuthorizationBuilder) builderCallback,
  ) async {
    final builder = ChargeAuthorizationBuilder();
    builderCallback(builder);
    final options = builder.build();
    return chargeAuthorization(
      authorizationCode: options.authorizationCode,
      amount: int.parse(options.amount),
      email: options.email,
    );
  }
}
