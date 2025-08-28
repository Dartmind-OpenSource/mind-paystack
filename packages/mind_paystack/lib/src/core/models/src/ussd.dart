import 'package:dart_mappable/dart_mappable.dart';
part 'ussd.mapper.dart';

/// Represents USSD payment configuration details
///
/// USSD (Unstructured Supplementary Service Data) is a mobile payment
/// method that allows customers to make payments using short codes
/// on their mobile phones without requiring internet connectivity.
@MappableClass()
class Ussd with UssdMappable {
  /// Creates a new [Ussd] instance
  ///
  /// * [type] - USSD code type (e.g., "*737#" for GTBank)
  const Ussd({
    required this.type,
  });

  /// Type of USSD charge, e.g. "*737#"
  final String type;
}
