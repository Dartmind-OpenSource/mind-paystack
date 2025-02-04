import 'package:freezed_annotation/freezed_annotation.dart';

/// Represents the severity level of an exception
enum ExceptionSeverity {
  @JsonValue('fatal')
  fatal,
  @JsonValue('error')
  error,
  @JsonValue('warning')
  warning,
  @JsonValue('info')
  info
}
