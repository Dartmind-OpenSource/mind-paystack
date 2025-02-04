import 'package:dio/dio.dart';
import 'package:mind_paystack/src/config/mind_paystack_config.dart';
import 'package:uuid/uuid.dart';

/// Interceptor that enriches requests with additional headers and metadata
class RequestEnricherInterceptor extends Interceptor {
  RequestEnricherInterceptor(this._config);

  final PaystackConfig _config;
  final _uuid = const Uuid();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    // Add request ID
    final requestId = _uuid.v4();
    options.headers['x-request-id'] = requestId;

    // Add SDK info
    options.headers['x-sdk-name'] = 'mind-paystack';
    options.headers['x-sdk-version'] = '1.0.0';

    // Add environment info
    options.headers['x-environment'] = _config.environment.name;

    // Add idempotency key for non-GET requests
    if (options.method.toUpperCase() != 'GET') {
      options.headers['idempotency-key'] = _uuid.v4();
    }

    handler.next(options);
  }
}
