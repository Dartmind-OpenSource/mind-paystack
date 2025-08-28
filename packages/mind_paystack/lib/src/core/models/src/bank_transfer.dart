import 'package:dart_mappable/dart_mappable.dart';
part 'bank_transfer.mapper.dart';

/// Represents bank transfer payment information for Paystack transactions
///
/// This model contains details about bank transfer payments, including
/// when temporary transfer accounts expire.
@MappableClass()
class BankTransfer with BankTransferMappable {
  /// Creates a new [BankTransfer] instance
  ///
  /// * [accountExpiresAt] - Optional expiry time for the transfer account
  const BankTransfer({
    this.accountExpiresAt,
  });

  /// Expiry time of the generated transfer account (ISO8601 string)
  @MappableField(key: 'account_expires_at')
  final DateTime? accountExpiresAt;
}
