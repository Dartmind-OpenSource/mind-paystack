import 'package:dio/dio.dart';
import 'package:mind_paystack/src/core/errors/enums/error_source.dart';
import 'package:mind_paystack/src/core/errors/models/error_metadata.dart';
import 'package:mind_paystack/src/core/errors/models/mind_exception.dart';

/// Extension methods for converting standard exceptions to MindException.
/// 
/// This extension provides convenient methods for converting various types
/// of exceptions (including Dio HTTP errors and generic exceptions) into
/// the standardized MindException format used throughout the SDK.
/// 
/// This ensures consistent error handling and provides rich metadata
/// for all exceptions, regardless of their original source.
/// 
/// Example usage:
/// ```dart
/// try {
///   await someApiCall();
/// } catch (e) {
///   final mindException = e.toMindException();
///   handleError(mindException);
/// }
/// ```
extension MindExceptionX on Exception {
  /// Converts any exception to a standardized MindException.
  /// 
  /// This method handles different exception types intelligently:
  /// - If already a MindException, returns it unchanged
  /// - If a DioException, uses specialized conversion with HTTP context
  /// - For other exceptions, wraps them with basic metadata
  /// 
  /// Returns:
  /// A MindException with appropriate categorization, metadata, and context
  /// based on the original exception type.
  /// 
  /// Example:
  /// ```dart
  /// try {
  ///   throw FormatException('Invalid JSON');
  /// } catch (e) {
  ///   final mindException = e.toMindException();
  ///   print(mindException.source); // ErrorSource.system
  ///   print(mindException.code);   // 'unknown_error'
  /// }
  /// ```
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
