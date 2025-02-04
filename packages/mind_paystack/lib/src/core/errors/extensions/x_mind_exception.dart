import 'package:dio/dio.dart';
import 'package:mind_paystack/src/core/errors/enums/error_source.dart';
import 'package:mind_paystack/src/core/errors/models/error_metadata.dart';
import 'package:mind_paystack/src/core/errors/models/mind_exception.dart';

/// Helper extension for exception handling
extension MindExceptionX on Exception {
  /// Converts any exception to a MindException
  MindException toMindException() {
    if (this is MindException) return this as MindException;
    if (this is DioException) {
      return MindException.fromDioError(this as DioException);
    }
    return MindException(
      message: toString(),
      code: 'unknown_error',
      source: ErrorSource.system,
      metadata: ErrorMetadata(
        timestamp: DateTime.now(),
        originalError: toString(),
      ),
    );
  }
}
