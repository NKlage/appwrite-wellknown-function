import 'package:dart_appwrite/dart_appwrite.dart';

import 'configuration_service.dart';
import 'models/function_response.dart';

/// Service to create the Appwrite functions configuration
class FunctionConfigurationService
    implements ConfigurationService<FunctionResponse> {
  /// Default Constructor
  ///
  /// Requires an Appwrite [Functions] object to read the functions
  /// in the Appwrite project.
  FunctionConfigurationService({required Functions functions})
      : _functions = functions;

  final Functions _functions;

  @override
  Future<List<FunctionResponse>> create() async {
    final functionsList = await _functions.list(
      queries: [
        Query.equal('enabled', true),
      ],
    );

    return functionsList.functions
        .map(
          (e) => FunctionResponse(
            id: e.$id,
            name: e.name,
            timeout: e.timeout,
          ),
        )
        .toList();
  }
}
