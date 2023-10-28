import 'package:dart_appwrite/dart_appwrite.dart';

import 'models/collection_response.dart';
import 'models/database_response.dart';

/// Service to create the Appwrite Database Configuration
class DatabaseConfigurationService {
  /// Default Constructor
  DatabaseConfigurationService({
    required Databases databases,
  }) : _databases = databases;

  late final Databases _databases;
  final List<DatabaseResponse> _projectDatabases = List.empty(growable: true);

  /// Create Appwrite Database Configuration
  Future<List<DatabaseResponse>> create() async {
    await readDatabases();
    await readDatabaseCollections();

    return _projectDatabases;
  }

  /// Read all Databases in Appwrite Project
  Future<void> readDatabases() async {
    final databases = await _databases.list();

    for (final db in databases.databases) {
      _projectDatabases.add(DatabaseResponse(id: db.$id, name: db.name));
    }
  }

  // b3702b6afd3442fcbec49bc7f8ea6c14

  /// Read all Collections in Appwrite Databases
  Future<void> readDatabaseCollections() async {
    // ignore: prefer_final_in_for_each
    for (var database in _projectDatabases) {
      final collectionList = await _databases.listCollections(
        databaseId: database.id,
      );

      for (final collection in collectionList.collections) {
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
