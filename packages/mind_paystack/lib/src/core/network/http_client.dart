import 'package:dio/dio.dart';
import 'package:mind_paystack/src/config/mind_paystack_config.dart';
import 'package:mind_paystack/src/core/errors/extensions/x_mind_exception.dart';
import 'package:mind_paystack/src/core/errors/models/mind_exception.dart';

import 'package:mind_paystack/src/core/network/interceptors/auth_interceptor.dart';
import 'package:mind_paystack/src/core/network/interceptors/error_interceptor.dart';
import 'package:mind_paystack/src/core/network/interceptors/logging_interceptor.dart';
import 'package:mind_paystack/src/core/network/interceptors/request_enricher_interceptor.dart';
import 'package:mind_paystack/src/core/network/interceptors/retry_interceptor.dart';

/// HTTP client for making API requests
class HttpClient {
  ///
  HttpClient(this._config) {
    _initializeDio();
  }

  final PaystackConfig _config;
  late final Dio _dio;

  void _initializeDio() {
    final baseOptions = BaseOptions(
      baseUrl: 'https://api.paystack.co',
      connectTimeout: _config.timeout,
      receiveTimeout: _config.timeout,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    _dio = Dio(baseOptions);

    // Add interceptors
    _dio.interceptors.addAll([
      // First: Enrich the request with additional headers and metadata
      RequestEnricherInterceptor(_config),

      // Second: Add authentication headers
      AuthInterceptor(_config),

      // Third: Handle retries
      RetryInterceptor(_config.retryPolicy),

      // Fourth: Transform errors
      ErrorInterceptor(),

      // Last: Log everything (if enabled)
      if (_config.logLevel.index >= 2) LoggingInterceptor(_config.logLevel),
    ]);
  }

  /// Makes a GET request
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      throw MindException.fromDioError(e);
    } on Exception catch (e) {
      throw e.toMindException();
    } catch (e) {
      throw MindException(
        message: e.toString(),
        code: 'error_occurred',
      );
    }
  }

  /// Makes a POST request
  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      print(e.error);
      throw MindException.fromDioError(e);
    } on Exception catch (e) {
      throw e.toMindException();
    } catch (e) {
      throw MindException(
        message: e.toString(),
        code: 'error_occurred',
      );
    }
  }

  /// Makes a PUT request
  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.put<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      throw MindException.fromDioError(e);
    } on Exception catch (e) {
      throw e.toMindException();
    } catch (e) {
      throw MindException(
        message: e.toString(),
        code: 'error_occurred',
      );
    }
  }

  /// Makes a DELETE request
  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.delete<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      throw MindException.fromDioError(e);
    } on Exception catch (e) {
      throw e.toMindException();
    } catch (e) {
      throw MindException(
        message: e.toString(),
        code: 'error_occurred',
      );
    }
  }

  /// Makes a PATCH request
  Future<Response<T>> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.patch<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      throw MindException.fromDioError(e);
    } on Exception catch (e) {
      throw e.toMindException();
    } catch (e) {
      throw MindException(
        message: e.toString(),
        code: 'error_occurred',
      );
    }
  }
}
