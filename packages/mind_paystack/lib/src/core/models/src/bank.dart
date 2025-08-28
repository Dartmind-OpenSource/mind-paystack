import 'package:dart_mappable/dart_mappable.dart';
part 'bank.mapper.dart';

/// Represents bank account details for payment transactions
///
/// This model contains essential bank information needed to process
/// bank account charges, including the bank code and account number.
@MappableClass()
class BankDetails with BankDetailsMappable {
  /// Creates a new [BankDetails] instance
  ///
  /// * [code] - The bank's unique identifier code
  /// * [accountNumber] - The customer's bank account number
  const BankDetails({
    required this.code,
    required this.accountNumber,
  });

  /// Bank code (e.g., "057" for Zenith Bank)
  final String code;

  /// Customer's bank account number
  final String accountNumber;
}
