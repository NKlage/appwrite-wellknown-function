import 'response.dart';

/// Welllknown storage response
class StorageResponse extends Response {
  /// Standard constructor for a storage response
  ///
  /// Holds the [id] and [name] and  of the Appwrite storages
  StorageResponse({required super.id, required super.name});
}
