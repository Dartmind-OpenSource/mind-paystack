import 'package:dio/dio.dart';
import 'package:mind_paystack/src/config/mind_paystack_config.dart';
import 'package:mind_paystack/src/core/client.dart';
import 'package:mind_paystack/src/core/exceptions.dart';
import 'package:mind_paystack/src/core/retry_interceptor.dart';
import 'package:mind_paystack/src/utils/logger.dart';

class MindPaystackClientImpl implements MindPaystackClient {
  final Dio _dio;
  final MindPaystackConfig _config;
  final CancelToken _cancelToken;

  MindPaystackClientImpl({
    required MindPaystackConfig config,
    Dio? dio,
  })  : _config = config,
        _cancelToken = CancelToken(),
        _dio = dio ?? Dio() {
    _setupInterceptors();
  }

  void _setupInterceptors() {
    _dio.interceptors.addAll([
      // Authentication interceptor
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] = 'Bearer ${_config.publicKey}';
          return handler.next(options);
        },
      ),

      // Logging interceptor
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

      // Retry interceptor
      RetryInterceptor(
        dio: _dio,
        retryPolicy: _config.retryPolicy,
        logger: MPLogger.warning,
      ),
    ]);
  }

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

  @override
  void cancelRequests() {
    _cancelToken.cancel('Request cancelled by user');
  }

  String _buildUrl(String endpoint) {
    final baseUrl = _config.environment.baseUrl;
    return '$baseUrl/$endpoint'.replaceAll('//', '/');
  }

  Map<String, String> _mergeHeaders(Map<String, String>? headers) {
    return {
      ..._config.environment.headers,
      ...?headers,
    };
  }

  ResponseType _getResponseType<T>() {
    if (T == String) return ResponseType.plain;
    if (T == List<int>) return ResponseType.bytes;
    return ResponseType.json;
  }

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

      // Add more type handling as needed
      throw PaystackException(
        message: 'Unsupported response type: $T',
        code: 'unsupported_type',
      );
    } catch (e) {
      throw PaystackException(
        message: 'Failed to parse response: ${e.toString()}',
        code: 'parse_error',
      );
    }
  }

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
