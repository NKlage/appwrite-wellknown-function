import 'package:dart_appwrite/dart_appwrite.dart';

import 'configuration_service.dart';
import 'models/storage_response.dart';

/// Service to create the Appwrite storage configuration
class StorageConfigurationService
    implements ConfigurationService<StorageResponse> {
  /// Default Constructor
  ///
  /// Requires an Appwrite [Storage] object to read the storage objects
  /// in the Appwrite project.
  StorageConfigurationService({required Storage storage}) : _storage = storage;

  final Storage _storage;
  final List<StorageResponse> _projectStorages = List.empty(growable: true);

  @override
  Future<List<StorageResponse>> create() async {
    final bucketList = await _storage.listBuckets();
    for (final bucket in bucketList.buckets) {
      if (!bucket.enabled) {
        continue;
      }
      _projectStorages.add(StorageResponse(id: bucket.$id, name: bucket.name));
    }
    return _projectStorages;
  }
}
