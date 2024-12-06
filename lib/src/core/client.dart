abstract class MindPaystackClient {
  /// Make a GET request to the specified endpoint
  Future<T> get<T>(
    String endpoint, {
    Map<String, dynamic>? queryParams,
    Map<String, String>? headers,
  });

  /// Make a POST request to the specified endpoint
  Future<T> post<T>(
    String endpoint, {
    Map<String, dynamic>? data,
    Map<String, String>? headers,
  });

  /// Make a PUT request to the specified endpoint
  Future<T> put<T>(
    String endpoint, {
    Map<String, dynamic>? data,
    Map<String, String>? headers,
  });

  /// Make a DELETE request to the specified endpoint
  Future<T> delete<T>(
    String endpoint, {
    Map<String, String>? headers,
  });

  /// Upload a file to the specified endpoint
  Future<T> upload<T>(
    String endpoint,
    List<int> bytes,
    String filename, {
    Map<String, dynamic>? data,
    Map<String, String>? headers,
  });

  /// Download a file from the specified endpoint
  Future<List<int>> download(
    String endpoint, {
    Map<String, String>? headers,
  });

  /// Cancel all pending requests
  void cancelRequests();
}
