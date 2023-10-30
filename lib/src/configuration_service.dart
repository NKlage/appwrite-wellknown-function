import 'models/response.dart';

//ignore_for_file: one_member_abstracts
/// Base Configuration Service
abstract class ConfigurationService<T extends Response> {
  /// Create Appwrite configuration
  Future<List<T>> create();
}
