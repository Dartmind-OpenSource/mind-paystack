import 'package:mind_paystack/src/core/models/resource.dart';
import 'package:mind_paystack/src/features/transaction/models/models.dart';

abstract class ITransactionService {
  /// 1. Initialize Transaction
  Future<Resource<TransactionInitialization>> initialize(
    InitializeTransactionOptions options,
  );

  /// 2. Verify Transaction
  Future<Resource<Transaction>> verify(String reference);

  /// 3. List Transactions
  Future<Resource<List<Transaction>>> list(
    ListTransactionsOptions options,
  );

  /// 4. Fetch Transaction by ID
  Future<Resource<Transaction>> fetch(int id);

  /// 5. Charge Authorization (reuse an existing authorization)
  Future<Resource<Transaction>> chargeAuthorization({
    required String authorizationCode,
    required int amount,
    required String email,
  });

  /// 6. View Transaction Timeline
  Future<Resource<TransactionTimeline>> timeline(String idOrReference);

  /// 7. Transaction Totals
  Future<Resource<TransactionTotals>> totals();

  /// 8. Export Transactions
  Future<Resource<TransactionExport>> export(
    ExportTransactionsOptions options,
  );

  /// 9. Partial Debit
  Future<Resource<PartialDebit>> partialDebit(
    PartialDebitOptions options,
  );
}
