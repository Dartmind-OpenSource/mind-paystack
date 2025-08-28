import 'package:dart_mappable/dart_mappable.dart';
import 'package:mind_paystack/src/core/models/src/split_sub_account.dart';
part 'split.mapper.dart';

/// Represents a payment split configuration for revenue sharing
///
/// Splits allow distributing payment amounts among multiple subaccounts
/// based on predefined rules. This enables marketplace functionality,
/// commission splitting, and revenue sharing between parties.
@MappableClass()
class Split with SplitMappable {
  /// Creates a new [Split] instance
  ///
  /// * [id] - Unique identifier for the split
  /// * [name] - Human-readable name for the split
  /// * [type] - Type of split (e.g., "percentage", "flat")
  /// * [currency] - Currency code for the split amounts
  /// * [splitCode] - Unique code to identify this split
  /// * [active] - Whether this split is currently active
  /// * [bearerType] - Who bears transaction fees
  /// * [bearerSubaccount] - Subaccount that bears fees (if applicable)
  /// * [subaccounts] - List of subaccounts participating in the split
  /// * [totalSubaccounts] - Total number of subaccounts in this split
  const Split({
    required this.id,
    required this.name,
    required this.type,
    required this.currency,
    required this.splitCode,
    required this.active,
    required this.bearerType,
    required this.subaccounts,
    required this.totalSubaccounts,
    this.bearerSubaccount,
  });

  /// Unique identifier for the split configuration
  final int? id;
  
  /// Human-readable name for the split
  final String? name;
  
  /// Type of split calculation (e.g., "percentage", "flat")
  final String? type;
  
  /// Currency code for split amounts
  final String? currency;
  
  /// Unique code to identify this split configuration
  @MappableField(key: 'split_code')
  final String? splitCode;
  
  /// Whether this split configuration is currently active
  final bool? active;
  
  /// Who bears the transaction fees (e.g., "account", "subaccount")
  @MappableField(key: 'bearer_type')
  final String? bearerType;
  
  /// Subaccount code that bears transaction fees 
  /// (if bearer_type is "subaccount")
  @MappableField(key: 'bearer_subaccount')
  final String? bearerSubaccount;
  
  /// List of subaccounts participating in this split
  final List<SplitSubaccount>? subaccounts;
  
  /// Total number of subaccounts in this split configuration
  @MappableField(key: 'total_subaccounts')
  final int? totalSubaccounts;
}
