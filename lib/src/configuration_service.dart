import 'models/response.dart';

abstract class ConfigurationService<T extends Response> {
  /// Create Appwrite configuration
  Future<List<T>> create();
}
