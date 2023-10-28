import 'collection_response.dart';
import 'response.dart';

/// Welllknown Database Response
class DatabaseResponse extends Response {
  /// Default constructor
  DatabaseResponse({required super.id, required super.name});

  /// List of Collections in the Database
  final List<CollectionResponse> collections = List.empty(growable: true);

  /// Convert to map
  @override
  Map<String, dynamic> toJson() {
    final databaseCollections = collections.map((e) => e.toJson()).toList();
    final database = super.toJson()
      ..putIfAbsent(
        'collections',
        () => databaseCollections,
      );
    return database;
  }
}
