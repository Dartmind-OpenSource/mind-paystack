import 'package:dart_mappable/dart_mappable.dart';
import 'package:mind_paystack/src/core/models/src/custom_field.dart';
part 'payment_metadata.mapper.dart';

/// Represents additional metadata for payment transactions
///
/// This model allows attaching custom information to payments, including
/// structured custom fields and descriptive narration text. Metadata can
/// be used for tracking, analytics, reporting, and business logic purposes.
@MappableClass()
class PaymentMetadata with PaymentMetadataMappable {
  /// Creates a new [PaymentMetadata] instance
  ///
  /// * [customFields] - List of structured key-value pairs for additional data
  /// * [narration] - Optional description or notes about the payment
  const PaymentMetadata({
    this.customFields,
    this.narration,
  });

  /// Custom key-value fields to pass (optional)
  final List<CustomField>? customFields;

  /// Optional description or notes
  final String? narration;
}
