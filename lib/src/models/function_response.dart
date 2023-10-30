import 'response.dart';

/// Welllknown database response
class FunctionResponse extends Response {
  /// Standard constructor for a functions response
  ///
  /// Holds the [id] and [name] and functions [timeout] of the Appwrite
  /// functions
  FunctionResponse({
    required super.id,
    required super.name,
    required this.timeout,
  });

  /// Function timeout in seconds
  final int timeout;

  @override
  Map<String, dynamic> toMap() {
    final responseMap = super.toMap()..addAll({'timeout': timeout});

    return responseMap;
  }
}
