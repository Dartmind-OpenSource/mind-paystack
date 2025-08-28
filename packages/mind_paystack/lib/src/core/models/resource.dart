import 'package:dart_mappable/dart_mappable.dart';
import 'package:mind_paystack/src/features/transaction/models/transaction/transaction.dart';

part 'resource.mapper.dart';

/// A generic wrapper for API response data with consistent structure.
///
/// This class provides a standardized way to handle API responses from\n/// Paystack,
/// including success/failure status, optional data payload, descriptive messages,
/// and additional metadata. It enables consistent error handling and response
/// processing across the entire SDK.
///
/// The generic type [T] represents the actual data type being wrapped,
/// such as [Transaction], [TransactionList], or [TransactionInitialization].
///
/// Example usage:
/// ```dart
/// // Successful response
/// final Resource<Transaction> successResponse = Resource<Transaction>(
///   status: true,
///   message: 'Transaction retrieved successfully',
///   data: transaction,
/// );
///
/// // Error response
/// final Resource<Transaction> errorResponse = Resource<Transaction>(
///   status: false,
///   message: 'Transaction not found',
///   data: null,
/// );
///
/// // Usage in application
/// if (response.status && response.data != null) {
///   // Handle successful response
///   final transaction = response.data!;
///   print('Transaction amount: ${transaction.amount}');
/// } else {
///   // Handle error response
///   print('Error: ${response.message}');
/// }
/// ```
@MappableClass()
class Resource<T> with ResourceMappable<T> {
  /// Creates a new Resource instance.
  ///
  /// The [status] parameter is required and indicates whether the operation
  /// was successful. Other parameters are optional depending on the response.
  const Resource({
    required this.status,
    this.message,
    this.data,
    this.meta,
  });

  /// Creates a Resource instance from a JSON map response.
  ///
  /// This factory constructor is used internally by the SDK to parse API
  /// responses into typed Resource objects. It handles the standard Paystack
  /// response format and maps the data field using the provided mapper
  /// function.
  ///
  /// Parameters:
  /// - [json]: The raw JSON response from the API
  /// - [mapper]: Function to convert the 'data' field into type [T]
  ///
  /// Returns:
  /// A properly typed Resource<T> instance with parsed data.
  ///
  /// Example:
  /// ```dart
  /// final resource = Resource.fromMap(
  ///   {
  ///     'status': true,
  ///     'message': 'Success',
  ///     'data': {'id': 123, 'amount': 50000},
  ///   },
  ///   TransactionMapper.fromMap,
  /// );
  /// ```
  factory Resource.fromMap(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) mapper,
  ) {
    return Resource<T>(
      status: json['status'] as bool,
      message: json['message'] as String?,
      data: json['data'] != null
          ? mapper(json['data'] as Map<String, dynamic>)
          : null,
      meta: json['meta'],
    );
  }

  /// Creates a Resource instance from a JSON map response with list data.
  ///
  /// This factory constructor is used internally by the SDK to parse API
  /// responses where the 'data' field is a list of objects. It handles the
  /// standard Paystack response format and maps the data field using the
  /// provided mapper function.
  ///
  /// Parameters:
  /// - [json]: The raw JSON response from the API
  /// - [mapper]: Function to convert the 'data' list into type [T]
  ///
  /// Returns:
  /// A properly typed Resource<T> instance with parsed list data.
  factory Resource.fromMapList(
    Map<String, dynamic> json,
    T Function(List<Map<String, dynamic>>) mapper,
  ) {
    return Resource<T>(
      status: json['status'] as bool,
      message: json['message'] as String?,
      data: json['data'] != null
          ? mapper((json['data'] as List).cast<Map<String, dynamic>>())
          : null,
      meta: json['meta'],
    );
  }

  /// Indicates whether the API operation was successful.
  ///
  /// - `true`: Operation completed successfully, [data] may contain results
  /// - `false`: Operation failed, [message] typically contains error details
  final bool status;

  /// Optional descriptive message about the operation result.
  ///
  /// For successful operations, this might contain confirmation messages.
  /// For failed operations, this typically contains error descriptions
  /// that can be displayed to users or logged for debugging.
  final String? message;

  /// The actual data payload returned by the API.
  ///
  /// This field contains the typed result of the operation when [status] is
  /// true.
  /// For failed operations or operations that don't return data, this will be
  /// null.
  /// The type [T] varies based on the specific API endpoint called.
  final T? data;

  /// Additional metadata associated with the response.
  ///
  /// This field can contain pagination information, rate limiting details,
  /// or other auxiliary data provided by the API. The structure varies
  /// depending on the specific endpoint and response type.
  ///
  /// Common examples:
  /// - Pagination metadata for list endpoints
  /// - Request timing information
  /// - API version details
  final dynamic meta;

  /// Convenience getter to check if the operation was successful.
  bool get isSuccess => status;

  /// Convenience getter to check if the operation failed.\
  bool get isFailure => !status;

  /// Convenience getter to check if the response has data.
  bool get hasData => data != null;
}
