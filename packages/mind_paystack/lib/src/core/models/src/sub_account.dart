import 'package:dart_mappable/dart_mappable.dart';
part 'sub_account.mapper.dart';

/// Represents a subaccount for split payments and marketplace functionality
///
/// Subaccounts allow merchants to split payments with other parties,
/// enabling marketplace functionality where funds can be automatically
/// distributed to different accounts based on business rules.
@MappableClass()
class Subaccount with SubaccountMappable {
  /// Creates a new [Subaccount] instance
  ///
  /// * [id] - Unique identifier for the subaccount
  /// * [subaccountCode] - Unique code to identify this subaccount
  /// * [businessName] - Business name associated with the subaccount
  /// * [settlementBank] - Bank where funds will be settled
  /// * [accountNumber] - Bank account number for settlement
  /// * [percentageCharge] - Percentage of transaction fees charged
  const Subaccount({
    required this.id,
    required this.subaccountCode,
    required this.businessName,
    required this.settlementBank,
    required this.accountNumber,
    required this.percentageCharge,
  });

  /// Unique identifier for the subaccount in Paystack's system
  final int? id;
  
  /// Unique code to identify this subaccount
  @MappableField(key: 'subaccount_code')
  final String? subaccountCode;
  
  /// Business name associated with this subaccount
  @MappableField(key: 'business_name')
  final String? businessName;
  
  /// Bank code where subaccount funds will be settled
  @MappableField(key: 'settlement_bank')
  final String? settlementBank;
  
  /// Bank account number for settlement of subaccount funds
  @MappableField(key: 'account_number')
  final String? accountNumber;
  
  /// Percentage of transaction fees charged to this subaccount
  @MappableField(key: 'percentage_charge')
  final num? percentageCharge;
}
