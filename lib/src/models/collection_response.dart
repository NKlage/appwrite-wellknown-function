import 'response.dart';

/// Welllknown Database Collection Response
class CollectionResponse extends Response {
  /// Standard constructor for a collection response
  ///
  /// Holds the [id] and [name] of the Appwrite collection
  CollectionResponse({required super.id, required super.name});
}
