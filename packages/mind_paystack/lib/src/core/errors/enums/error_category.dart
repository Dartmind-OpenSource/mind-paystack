import 'package:freezed_annotation/freezed_annotation.dart';

/// Represents different categories of errors
enum ErrorCategory {
  @JsonValue('network')
  network,
  @JsonValue('authentication')
  authentication,
  @JsonValue('validation')
  validation,
  @JsonValue('business')
  business,
  @JsonValue('server')
  server,
  @JsonValue('unknown')
  unknown
}
