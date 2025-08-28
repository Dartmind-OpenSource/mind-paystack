import 'package:dart_mappable/dart_mappable.dart';
part 'custom_field.mapper.dart';

/// Represents a custom field as a key-value pair in transaction metadata
///
/// Custom fields allow storing additional information with transactions
/// for tracking purposes, analytics, or business logic requirements.
@MappableClass()
class CustomField with CustomFieldMappable {
  /// Creates a new [CustomField] instance
  ///
  /// * [displayName] - Human-readable label for the field
  /// * [value] - The actual data value stored in this field
  const CustomField({
    required this.displayName,
    required this.value,
  });

  /// Label for this custom field
  final String displayName;

  /// Actual value for this custom field
  final String value;
}
