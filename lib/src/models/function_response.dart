import 'response.dart';

class FunctionResponse extends Response {
  FunctionResponse({
    required super.id,
    required super.name,
    required this.timeout,
  });

  final int timeout;

  @override
  Map<String, dynamic> toMap() {
    final responseMap = super.toMap()..addAll({'timeout': timeout});

    return responseMap;
  }
}
