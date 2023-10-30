import 'collection_response.dart';
import 'response.dart';

/// Welllknown database response
class DatabaseResponse extends Response {
  /// Standard constructor for a database response
  ///
  /// Holds the [id] and [name] of the Appwrite database
  DatabaseResponse({required super.id, required super.name});

  /// List of collections in the database
  final List<CollectionResponse> collections = List.empty(growable: true);

  /// Convert to map
  @override
  Map<String, dynamic> toMap() {
    final databaseCollections = collections.map((e) => e.toMap()).toList();
    final database = super.toMap()
      ..putIfAbsent(
        'collections',
        () => databaseCollections,
      );
    return database;
  }
}
