import 'package:dio/dio.dart';
import 'package:mind_paystack/src/config/mind_paystack_config.dart';
import 'package:mind_paystack/src/core/errors/models/mind_exception.dart';
import 'package:mind_paystack/src/utils/logger.dart';

/// Interceptor that handles authentication for API requests
class AuthInterceptor extends Interceptor {
  ///
  AuthInterceptor(this._config);

  final PaystackConfig _config;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    // Determine which key to use based on endpoint
    final isPublicEndpoint = _isPublicEndpoint(options.path);
    // final key = isPublicEndpoint ? _config.publicKey : _config.secretKey;
    final key = _config.secretKey;

    if (key.isEmpty) {
      handler.reject(
        DioException(
          requestOptions: options,
          error: MindException.authentication(
            message: 'Missing API key',
            technicalMessage:
                'No ${isPublicEndpoint ? "public" : "secret"} key provided',
          ),
        ),
      );
      return;
    }

    // Add authorization header
    options.headers['Authorization'] = 'Bearer $key';

    MPLogger.debug(
      // ignore: lines_longer_than_80_chars
      'Added ${isPublicEndpoint ? "public" : "secret"} key authentication for ${options.path}',
    );

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      handler.reject(
        DioException(
          requestOptions: err.requestOptions,
          error: MindException.authentication(
            message: 'Invalid API key',
            technicalMessage:
                'Authentication failed for ${err.requestOptions.path}',
          ),
        ),
      );
      return;
    }
    handler.next(err);
  }

  bool _isPublicEndpoint(String path) {
    const publicEndpoints = [
      '/transaction/initialize',
      '/bank/resolve',
      '/decision/bin/verify',
      '/balance',
      '/bank',
    ];
    return publicEndpoints.any((endpoint) => path.contains(endpoint));
  }
}
