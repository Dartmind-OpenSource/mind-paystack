import 'package:dart_mappable/dart_mappable.dart';

part 'resource.mapper.dart';

@MappableClass()
class Resource<T> with ResourceMappable<T> {
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
  // optional pagination or extra metadata

  const Resource({
    required this.status,
    this.message,
    this.data,
    this.meta,
  });
  final bool status;
  final String? message;
  final T? data;
  final dynamic meta;
}
