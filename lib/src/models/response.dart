/// Default wellknown Response
abstract class Response {
  /// Default Constructor
  Response({required this.id, required this.name});

  /// Database Id
  final String id;

  /// Database name
  final String name;

  /// convert [Response] to Map
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
