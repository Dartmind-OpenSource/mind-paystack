import 'package:get_it/get_it.dart';

/// Extension methods for dependency injection utilities
extension GetItExtension on GetIt {
  /// Resets all registrations (useful for testing)
  Future<void> reset() async {
    // await unregisterAll();
  }

  /// Safely gets an instance, throwing a clear error if not registered
  T getRequired<T extends Object>({String? instanceName}) {
    if (!isRegistered<T>(instanceName: instanceName)) {
      throw Exception(
        // ignore: lines_longer_than_80_chars
        'Required dependency $T ${instanceName != null ? '($instanceName)' : ''} '
        'is not registered. Ensure configureDependencies() was called.',
      );
    }
    return get<T>(instanceName: instanceName);
  }
}
