import 'package:dart_appwrite/dart_appwrite.dart';

import 'configuration_service.dart';
import 'models/collection_response.dart';
import 'models/database_response.dart';

/// Service to create the Appwrite database configuration
class DatabaseConfigurationService
    implements ConfigurationService<DatabaseResponse> {
  /// Default Constructor
  ///
  /// Requires an Appwrite [Databases] object to read the databases and its
  /// collections in the Appwrite project.
  DatabaseConfigurationService({
    required Databases databases,
  }) : _databases = databases;

  late final Databases _databases;
  final List<DatabaseResponse> _projectDatabases = List.empty(growable: true);

  /// Create Appwrite database configuration
  @override
  Future<List<DatabaseResponse>> create() async {
    await _readDatabases();
    await _readDatabaseCollections();

    return _projectDatabases;
  }

  /// Read all databases in Appwrite project
  Future<void> _readDatabases() async {
    final databases = await _databases.list();

    for (final db in databases.databases) {
      if (!db.enabled) {
        continue;
      }
      _projectDatabases.add(DatabaseResponse(id: db.$id, name: db.name));
    }
  }

  /// Read collections in Appwrite Databases
  Future<void> _readDatabaseCollections() async {
    // ignore: prefer_final_in_for_each
    for (var database in _projectDatabases) {
      final collectionList = await _databases.listCollections(
        databaseId: database.id,
      );

      for (final collection in collectionList.collections) {
        if (!collection.enabled) {
          continue;
        }
        database.collections.add(
          CollectionResponse(
            id: collection.$id,
            name: collection.name,
          ),
        );
      }
    }
  }
}
