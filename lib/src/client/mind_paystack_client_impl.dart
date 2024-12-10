import 'package:dio/dio.dart';
import 'package:mind_paystack/src/client/mind_paystack_client.dart';
import 'package:mind_paystack/src/config/mind_paystack_config.dart';

import 'package:mind_paystack/src/core/exceptions.dart';
import 'package:mind_paystack/src/core/retry_interceptor.dart';
import 'package:mind_paystack/src/utils/logger.dart';

/// A Dart implementation of the Paystack API client that handles HTTP requests,
/// authentication, logging, and error handling.
class MindPaystackClientImpl implements MindPaystackClient {
  /// Creates a new instance of the Paystack client
  ///
  /// [config] Required configuration for API authentication and settings
  /// [dio] Optional HTTP client instance. If not provided, creates a new one
  MindPaystackClientImpl({
    required MindPaystackConfig config,
    Dio? dio,
  })  : _config = config,
        _cancelToken = CancelToken(),
        _dio = dio ?? Dio() {
    _setupInterceptors();
  }

  /// HTTP client for making API requests
  final Dio _dio;

  /// Configuration settings for the Paystack client
  final MindPaystackConfig _config;

  /// Token for cancelling in-flight requests
  final CancelToken _cancelToken;

  /// Configures the HTTP client with authentication, logging, and retry
  /// interceptors
  void _setupInterceptors() {
    _dio.interceptors.addAll([
      // Authentication interceptor - adds Bearer token to all requests
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] = 'Bearer ${_config.publicKey}';
          return handler.next(options);
        },
      ),

      // Logging interceptor - logs all API requests, responses, and errors
      InterceptorsWrapper(
        onRequest: (options, handler) {
          MPLogger.logAPIRequest(
            options.path,
            Map<String, dynamic>.from(options.data as Map? ?? {}),
          );
          return handler.next(options);
        },
        onResponse: (response, handler) {
          MPLogger.logAPIResponse(
            response.requestOptions.path,
            Map<String, dynamic>.from(
              response.data as Map? ?? {},
            ),
          );
          return handler.next(response);
        },
        onError: (error, handler) {
          MPLogger.logAPIError(
            error.requestOptions.path,
            error.response?.data ?? error.message,
          );
          return handler.next(error);
        },
      ),

      // Retry interceptor - handles retrying failed requests based on policy
      RetryInterceptor(
        dio: _dio,
        retryPolicy: _config.retryPolicy,
        logger: MPLogger.warning,
      ),
    ]);
  }

  /// Makes a GET request to the specified endpoint
  ///
  /// [endpoint] The API endpoint to call
  /// [queryParams] Optional query parameters
  /// [headers] Optional additional headers
  @override
  Future<T> get<T>(
    String endpoint, {
    Map<String, dynamic>? queryParams,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _dio.get<T>(
        _buildUrl(endpoint),
        queryParameters: queryParams,
        options: Options(
          headers: _mergeHeaders(headers),
          responseType: _getResponseType<T>(),
        ),
        cancelToken: _cancelToken,
      );
      return _handleResponse<T>(response);
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// Makes a POST request to the specified endpoint
  ///
  /// [endpoint] The API endpoint to call
  /// [data] Optional request body data
  /// [headers] Optional additional headers
  @override
  Future<T> post<T>(
    String endpoint, {
    Map<String, dynamic>? data,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _dio.post<T>(
        _buildUrl(endpoint),
        data: data,
        options: Options(
          headers: _mergeHeaders(headers),
          responseType: _getResponseType<T>(),
        ),
        cancelToken: _cancelToken,
      );
      return _handleResponse<T>(response);
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// Makes a PUT request to the specified endpoint
  ///
  /// [endpoint] The API endpoint to call
  /// [data] Optional request body data
  /// [headers] Optional additional headers
  @override
  Future<T> put<T>(
    String endpoint, {
    Map<String, dynamic>? data,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _dio.put<T>(
        _buildUrl(endpoint),
        data: data,
        options: Options(
          headers: _mergeHeaders(headers),
          responseType: _getResponseType<T>(),
        ),
        cancelToken: _cancelToken,
      );
      return _handleResponse<T>(response);
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// Makes a DELETE request to the specified endpoint
  ///
  /// [endpoint] The API endpoint to call
  /// [headers] Optional additional headers
  @override
  Future<T> delete<T>(
    String endpoint, {
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _dio.delete<T>(
        _buildUrl(endpoint),
        options: Options(
          headers: _mergeHeaders(headers),
          responseType: _getResponseType<T>(),
        ),
        cancelToken: _cancelToken,
      );
      return _handleResponse<T>(response);
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// Uploads a file to the specified endpoint
  ///
  /// [endpoint] The API endpoint to call
  /// [bytes] The file data as bytes
  /// [filename] Name of the file being uploaded
  /// [data] Optional additional form data
  /// [headers] Optional additional headers
  @override
  Future<T> upload<T>(
    String endpoint,
    List<int> bytes,
    String filename, {
    Map<String, dynamic>? data,
    Map<String, String>? headers,
  }) async {
    try {
      final formData = FormData.fromMap({
        'file': MultipartFile.fromBytes(
          bytes,
          filename: filename,
        ),
        ...?data,
      });

      final response = await _dio.post<T>(
        _buildUrl(endpoint),
        data: formData,
        options: Options(
          headers: _mergeHeaders(headers),
          responseType: _getResponseType<T>(),
        ),
        cancelToken: _cancelToken,
      );
      return _handleResponse<T>(response);
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// Downloads a file from the specified endpoint
  ///
  /// [endpoint] The API endpoint to call
  /// [headers] Optional additional headers
  @override
  Future<List<int>> download(
    String endpoint, {
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _dio.get<List<int>>(
        _buildUrl(endpoint),
        options: Options(
          headers: _mergeHeaders(headers),
          responseType: ResponseType.bytes,
        ),
        cancelToken: _cancelToken,
      );
      return response.data ?? [];
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// Cancels all pending requests
  @override
  void cancelRequests() {
    _cancelToken.cancel('Request cancelled by user');
  }

  /// Builds the full URL for an endpoint by combining base URL and endpoint
  String _buildUrl(String endpoint) {
    final baseUrl = _config.environment.baseUrl;
    return '$baseUrl/$endpoint'.replaceAll('//', '/');
  }

  /// Merges default headers with any additional headers provided
  Map<String, String> _mergeHeaders(Map<String, String>? headers) {
    return {
      ..._config.environment.headers,
      ...?headers,
    };
  }

  /// Determines the appropriate response type based on the expected return type
  ResponseType _getResponseType<T>() {
    if (T == String) return ResponseType.plain;
    if (T == List<int>) return ResponseType.bytes;
    return ResponseType.json;
  }

  /// Handles the API response and converts it to the expected type
  ///
  /// Throws [PaystackException] if response is invalid or can't be converted
  T _handleResponse<T>(Response<dynamic> response) {
    if (response.data == null) {
      throw PaystackException(
        message: 'Empty response from server',
        code: 'empty_response',
      );
    }

    if (T == dynamic || T == Map<String, dynamic>) {
      return response.data as T;
    }

    try {
      if (T == String) return response.data.toString() as T;
      if (T == List<int>) return response.data as T;

      throw PaystackException(
        message: 'Unsupported response type: $T',
        code: 'unsupported_type',
      );
    } catch (e) {
      throw PaystackException(
        message: 'Failed to parse response: $e',
        code: 'parse_error',
      );
    }
  }

  /// Converts various error types into [PaystackException] with appropriate
  /// details
  PaystackException _handleError(dynamic error) {
    if (error is DioException) {
      final response = error.response;
      final data = response?.data;

      if (data is Map<String, dynamic>) {
        return PaystackException(
          message:
              (data['message'] ?? error.message ?? 'Unknown error occurred')
                  .toString(),
          code: (data['code'] ?? 'unknown_error').toString(),
          details: data,
        );
      }

      return PaystackException(
        message: error.message ?? 'Network error occurred',
        code: 'network_error',
        details: {
          'statusCode': response?.statusCode,
          'data': data,
        },
      );
    }

    if (error is PaystackException) return error;

    return PaystackException(
      message: error.toString(),
      code: 'unknown_error',
    );
  }
}
