/// Default wellknown response
abstract class Response {
  /// Default Constructor
  ///
  /// Holds the [id] and [name] of the Appwrite object
  Response({required this.id, required this.name});

  /// Id
  final String id;

  /// name
  final String name;

  /// convert [Response] to Map
  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
      };
}
