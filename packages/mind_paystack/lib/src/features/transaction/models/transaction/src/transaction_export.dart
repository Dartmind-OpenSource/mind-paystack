import 'package:dart_mappable/dart_mappable.dart';
part 'transaction_export.mapper.dart';

/// Contains information about an exported transaction report.
/// 
/// This model is returned when requesting transaction exports and provides
/// the download path for the generated CSV file along with its expiration time.
/// The exported file contains transaction data in a downloadable format.
/// 
/// Example usage:
/// ```dart
/// final export = TransactionExport(
///   path: 'https://exports.paystack.co/transactions_20231201.csv',
///   expiresAt: DateTime(2023, 12, 8),
/// );
/// 
/// // Download the export file before it expires
/// if (export.expiresAt?.isAfter(DateTime.now()) == true) {
///   await downloadFile(export.path);
/// }
/// ```
@MappableClass()
class TransactionExport with TransactionExportMappable {
  /// Creates a new TransactionExport instance.
  /// 
  /// The [path] is required and points to the downloadable export file.
  /// The [expiresAt] field is optional but indicates when the file expires.
  const TransactionExport({
    required this.path,
    this.expiresAt,
  });
  /// URL path to the downloadable CSV export file.
  /// 
  /// This path can be used to download the exported transaction data.
  /// The file is typically in CSV format containing transaction details.
  final String path;
  
  /// Timestamp when the export file expires and becomes unavailable.
  /// 
  /// After this time, the export file will no longer be accessible
  /// and a new export request must be made.
  @MappableField(key: 'expires_at')
  final DateTime? expiresAt;
}
