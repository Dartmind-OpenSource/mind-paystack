// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'error_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ErrorMetadata _$ErrorMetadataFromJson(Map<String, dynamic> json) {
  return _ErrorMetadata.fromJson(json);
}

/// @nodoc
mixin _$ErrorMetadata {
  /// Timestamp when the error occurred.
  ///
  /// This precise timestamp helps with error correlation, debugging
  /// time-sensitive issues, and analyzing error patterns over time.
  DateTime get timestamp => throw _privateConstructorUsedError;

  /// Unique identifier for the API request that caused the error.
  ///
  /// This ID can be used to correlate errors with server logs,
  /// track requests across distributed systems, and provide
  /// better support when contacting Paystack.
  String? get requestId => throw _privateConstructorUsedError;

  /// HTTP status code returned by the API (if applicable).
  ///
  /// Provides quick identification of error types:
  /// - 4xx: Client errors (invalid request, authentication, etc.)
  /// - 5xx: Server errors (internal server error, service unavailable)
  int? get statusCode => throw _privateConstructorUsedError;

  /// HTTP method used for the request that failed.
  ///
  /// Examples: 'GET', 'POST', 'PUT', 'DELETE'
  /// Useful for understanding the type of operation that failed.
  String? get httpMethod => throw _privateConstructorUsedError;

  /// Full URL of the API endpoint that caused the error.
  ///
  /// Helps identify which specific API endpoint had issues
  /// and can be used for targeted error handling or monitoring.
  String? get url => throw _privateConstructorUsedError;

  /// HTTP headers that were sent with the failed request.
  ///
  /// May contain authentication headers, content-type,
  /// user-agent, and other metadata. Useful for debugging
  /// API communication issues.
  Map<String, List<String>>? get headers => throw _privateConstructorUsedError;

  /// Additional contextual information about the error.
  ///
  /// This flexible field can contain any relevant data such as:
  /// - User ID or session information
  /// - Transaction amounts or references
  /// - Feature flags or configuration state
  /// - Custom debugging information
  Map<String, dynamic>? get context => throw _privateConstructorUsedError;

  /// Stack trace showing the code path that led to the error.
  ///
  /// Provides detailed information about where the error occurred
  /// in the codebase, useful for debugging and fixing issues.
  /// Usually only populated in development/debug builds.
  String? get stackTrace => throw _privateConstructorUsedError;

  /// String representation of the original error object.
  ///
  /// Contains the raw error data before it was processed into
  /// a MindException. Useful for preserving all original error
  /// information for detailed analysis.
  String? get originalError => throw _privateConstructorUsedError;

  /// Serializes this ErrorMetadata to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ErrorMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ErrorMetadataCopyWith<ErrorMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorMetadataCopyWith<$Res> {
  factory $ErrorMetadataCopyWith(
          ErrorMetadata value, $Res Function(ErrorMetadata) then) =
      _$ErrorMetadataCopyWithImpl<$Res, ErrorMetadata>;
  @useResult
  $Res call(
      {DateTime timestamp,
      String? requestId,
      int? statusCode,
      String? httpMethod,
      String? url,
      Map<String, List<String>>? headers,
      Map<String, dynamic>? context,
      String? stackTrace,
      String? originalError});
}

/// @nodoc
class _$ErrorMetadataCopyWithImpl<$Res, $Val extends ErrorMetadata>
    implements $ErrorMetadataCopyWith<$Res> {
  _$ErrorMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ErrorMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? requestId = freezed,
    Object? statusCode = freezed,
    Object? httpMethod = freezed,
    Object? url = freezed,
    Object? headers = freezed,
    Object? context = freezed,
    Object? stackTrace = freezed,
    Object? originalError = freezed,
  }) {
    return _then(_value.copyWith(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      requestId: freezed == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      httpMethod: freezed == httpMethod
          ? _value.httpMethod
          : httpMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      headers: freezed == headers
          ? _value.headers
          : headers // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>?,
      context: freezed == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as String?,
      originalError: freezed == originalError
          ? _value.originalError
          : originalError // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ErrorMetadataImplCopyWith<$Res>
    implements $ErrorMetadataCopyWith<$Res> {
  factory _$$ErrorMetadataImplCopyWith(
          _$ErrorMetadataImpl value, $Res Function(_$ErrorMetadataImpl) then) =
      __$$ErrorMetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime timestamp,
      String? requestId,
      int? statusCode,
      String? httpMethod,
      String? url,
      Map<String, List<String>>? headers,
      Map<String, dynamic>? context,
      String? stackTrace,
      String? originalError});
}

/// @nodoc
class __$$ErrorMetadataImplCopyWithImpl<$Res>
    extends _$ErrorMetadataCopyWithImpl<$Res, _$ErrorMetadataImpl>
    implements _$$ErrorMetadataImplCopyWith<$Res> {
  __$$ErrorMetadataImplCopyWithImpl(
      _$ErrorMetadataImpl _value, $Res Function(_$ErrorMetadataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ErrorMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? requestId = freezed,
    Object? statusCode = freezed,
    Object? httpMethod = freezed,
    Object? url = freezed,
    Object? headers = freezed,
    Object? context = freezed,
    Object? stackTrace = freezed,
    Object? originalError = freezed,
  }) {
    return _then(_$ErrorMetadataImpl(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      requestId: freezed == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      httpMethod: freezed == httpMethod
          ? _value.httpMethod
          : httpMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      headers: freezed == headers
          ? _value._headers
          : headers // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>?,
      context: freezed == context
          ? _value._context
          : context // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as String?,
      originalError: freezed == originalError
          ? _value.originalError
          : originalError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ErrorMetadataImpl implements _ErrorMetadata {
  const _$ErrorMetadataImpl(
      {required this.timestamp,
      this.requestId,
      this.statusCode,
      this.httpMethod,
      this.url,
      final Map<String, List<String>>? headers,
      final Map<String, dynamic>? context,
      this.stackTrace,
      this.originalError})
      : _headers = headers,
        _context = context;

  factory _$ErrorMetadataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ErrorMetadataImplFromJson(json);

  /// Timestamp when the error occurred.
  ///
  /// This precise timestamp helps with error correlation, debugging
  /// time-sensitive issues, and analyzing error patterns over time.
  @override
  final DateTime timestamp;

  /// Unique identifier for the API request that caused the error.
  ///
  /// This ID can be used to correlate errors with server logs,
  /// track requests across distributed systems, and provide
  /// better support when contacting Paystack.
  @override
  final String? requestId;

  /// HTTP status code returned by the API (if applicable).
  ///
  /// Provides quick identification of error types:
  /// - 4xx: Client errors (invalid request, authentication, etc.)
  /// - 5xx: Server errors (internal server error, service unavailable)
  @override
  final int? statusCode;

  /// HTTP method used for the request that failed.
  ///
  /// Examples: 'GET', 'POST', 'PUT', 'DELETE'
  /// Useful for understanding the type of operation that failed.
  @override
  final String? httpMethod;

  /// Full URL of the API endpoint that caused the error.
  ///
  /// Helps identify which specific API endpoint had issues
  /// and can be used for targeted error handling or monitoring.
  @override
  final String? url;

  /// HTTP headers that were sent with the failed request.
  ///
  /// May contain authentication headers, content-type,
  /// user-agent, and other metadata. Useful for debugging
  /// API communication issues.
  final Map<String, List<String>>? _headers;

  /// HTTP headers that were sent with the failed request.
  ///
  /// May contain authentication headers, content-type,
  /// user-agent, and other metadata. Useful for debugging
  /// API communication issues.
  @override
  Map<String, List<String>>? get headers {
    final value = _headers;
    if (value == null) return null;
    if (_headers is EqualUnmodifiableMapView) return _headers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Additional contextual information about the error.
  ///
  /// This flexible field can contain any relevant data such as:
  /// - User ID or session information
  /// - Transaction amounts or references
  /// - Feature flags or configuration state
  /// - Custom debugging information
  final Map<String, dynamic>? _context;

  /// Additional contextual information about the error.
  ///
  /// This flexible field can contain any relevant data such as:
  /// - User ID or session information
  /// - Transaction amounts or references
  /// - Feature flags or configuration state
  /// - Custom debugging information
  @override
  Map<String, dynamic>? get context {
    final value = _context;
    if (value == null) return null;
    if (_context is EqualUnmodifiableMapView) return _context;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Stack trace showing the code path that led to the error.
  ///
  /// Provides detailed information about where the error occurred
  /// in the codebase, useful for debugging and fixing issues.
  /// Usually only populated in development/debug builds.
  @override
  final String? stackTrace;

  /// String representation of the original error object.
  ///
  /// Contains the raw error data before it was processed into
  /// a MindException. Useful for preserving all original error
  /// information for detailed analysis.
  @override
  final String? originalError;

  @override
  String toString() {
    return 'ErrorMetadata(timestamp: $timestamp, requestId: $requestId, statusCode: $statusCode, httpMethod: $httpMethod, url: $url, headers: $headers, context: $context, stackTrace: $stackTrace, originalError: $originalError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorMetadataImpl &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.httpMethod, httpMethod) ||
                other.httpMethod == httpMethod) &&
            (identical(other.url, url) || other.url == url) &&
            const DeepCollectionEquality().equals(other._headers, _headers) &&
            const DeepCollectionEquality().equals(other._context, _context) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace) &&
            (identical(other.originalError, originalError) ||
                other.originalError == originalError));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      timestamp,
      requestId,
      statusCode,
      httpMethod,
      url,
      const DeepCollectionEquality().hash(_headers),
      const DeepCollectionEquality().hash(_context),
      stackTrace,
      originalError);

  /// Create a copy of ErrorMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorMetadataImplCopyWith<_$ErrorMetadataImpl> get copyWith =>
      __$$ErrorMetadataImplCopyWithImpl<_$ErrorMetadataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ErrorMetadataImplToJson(
      this,
    );
  }
}

abstract class _ErrorMetadata implements ErrorMetadata {
  const factory _ErrorMetadata(
      {required final DateTime timestamp,
      final String? requestId,
      final int? statusCode,
      final String? httpMethod,
      final String? url,
      final Map<String, List<String>>? headers,
      final Map<String, dynamic>? context,
      final String? stackTrace,
      final String? originalError}) = _$ErrorMetadataImpl;

  factory _ErrorMetadata.fromJson(Map<String, dynamic> json) =
      _$ErrorMetadataImpl.fromJson;

  /// Timestamp when the error occurred.
  ///
  /// This precise timestamp helps with error correlation, debugging
  /// time-sensitive issues, and analyzing error patterns over time.
  @override
  DateTime get timestamp;

  /// Unique identifier for the API request that caused the error.
  ///
  /// This ID can be used to correlate errors with server logs,
  /// track requests across distributed systems, and provide
  /// better support when contacting Paystack.
  @override
  String? get requestId;

  /// HTTP status code returned by the API (if applicable).
  ///
  /// Provides quick identification of error types:
  /// - 4xx: Client errors (invalid request, authentication, etc.)
  /// - 5xx: Server errors (internal server error, service unavailable)
  @override
  int? get statusCode;

  /// HTTP method used for the request that failed.
  ///
  /// Examples: 'GET', 'POST', 'PUT', 'DELETE'
  /// Useful for understanding the type of operation that failed.
  @override
  String? get httpMethod;

  /// Full URL of the API endpoint that caused the error.
  ///
  /// Helps identify which specific API endpoint had issues
  /// and can be used for targeted error handling or monitoring.
  @override
  String? get url;

  /// HTTP headers that were sent with the failed request.
  ///
  /// May contain authentication headers, content-type,
  /// user-agent, and other metadata. Useful for debugging
  /// API communication issues.
  @override
  Map<String, List<String>>? get headers;

  /// Additional contextual information about the error.
  ///
  /// This flexible field can contain any relevant data such as:
  /// - User ID or session information
  /// - Transaction amounts or references
  /// - Feature flags or configuration state
  /// - Custom debugging information
  @override
  Map<String, dynamic>? get context;

  /// Stack trace showing the code path that led to the error.
  ///
  /// Provides detailed information about where the error occurred
  /// in the codebase, useful for debugging and fixing issues.
  /// Usually only populated in development/debug builds.
  @override
  String? get stackTrace;

  /// String representation of the original error object.
  ///
  /// Contains the raw error data before it was processed into
  /// a MindException. Useful for preserving all original error
  /// information for detailed analysis.
  @override
  String? get originalError;

  /// Create a copy of ErrorMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorMetadataImplCopyWith<_$ErrorMetadataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
