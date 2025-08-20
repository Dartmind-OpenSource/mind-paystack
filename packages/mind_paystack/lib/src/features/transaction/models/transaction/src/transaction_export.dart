import 'package:dart_mappable/dart_mappable.dart';
part 'transaction_export.mapper.dart';

@MappableClass()
class TransactionExport with TransactionExportMappable {

  const TransactionExport({
    required this.path,
    this.expiresAt,
  });
  final String path; // downloadable CSV path
  @MappableField(key: 'expires_at')
  final DateTime? expiresAt;
}
