import 'package:dart_mappable/dart_mappable.dart';
import 'package:mind_paystack/src/core/models/src/sub_account.dart';
part 'split_sub_account.mapper.dart';

/// Represents a subaccount's participation in a payment split
///
/// This model defines how a specific subaccount participates in a split,
/// including the subaccount details and their share of the split amount.
@MappableClass()
class SplitSubaccount with SplitSubaccountMappable {
  /// Creates a new [SplitSubaccount] instance
  ///
  /// * [subaccount] - The subaccount participating in the split
  /// * [share] - The share amount or percentage for this subaccount
  const SplitSubaccount({
    required this.subaccount,
    required this.share,
  });

  /// The subaccount participating in this split
  final Subaccount subaccount;
  
  /// Share amount or percentage allocated to this subaccount
  /// (interpretation depends on the split type)
  final int share;
}
