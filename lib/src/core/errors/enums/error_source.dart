import 'package:freezed_annotation/freezed_annotation.dart';

/// Represents the source of an error
enum ErrorSource {
  @JsonValue('api')
  api,
  @JsonValue('sdk')
  sdk,
  @JsonValue('user')
  user,
  @JsonValue('system')
  system
}
