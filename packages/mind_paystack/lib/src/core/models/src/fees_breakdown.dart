import 'package:dart_mappable/dart_mappable.dart';
part 'fees_breakdown.mapper.dart';

/// Represents the breakdown of fees applied to a transaction
///
/// This model provides detailed information about how transaction fees
/// are calculated and applied, including fixed and percentage-based components.
@MappableClass()
class FeesBreakdown with FeesBreakdownMappable {
  /// Creates a new [FeesBreakdown] instance
  ///
  /// * [fixedFee] - Fixed amount charged regardless of transaction
  ///   value (in kobo)
  /// * [percentageFee] - Percentage-based fee as a decimal
  ///   (e.g., 0.015 for 1.5%)
  /// * [totalFee] - Combined total of all fees applied (in kobo)
  const FeesBreakdown({
    this.fixedFee,
    this.percentageFee,
    this.totalFee,
  });

  /// Fixed fee amount charged regardless of transaction value (in kobo)
  @MappableField(key: 'fixed_fee')
  final int? fixedFee;

  /// Percentage-based fee as a decimal value
  @MappableField(key: 'percentage_fee')
  final double? percentageFee;

  /// Total combined fee amount applied to the transaction (in kobo)
  @MappableField(key: 'total_fee')
  final int? totalFee;
}
