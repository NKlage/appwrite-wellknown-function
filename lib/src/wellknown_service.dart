import 'database_configuration_service.dart';
import 'function_runtime.dart';
import 'models/wellknown_response.dart';

/// Service to read the Appwrite Objects and creates a Wellknown configuration
class WellknownService {
  /// Default Constructor
  WellknownService({
    required FunctionConfiguration configuration,
    required DatabaseConfigurationService databaseConfigurationService,
  }) {
    // _runtime = runtime;
    _databaseConfigurationService = databaseConfigurationService;
    _response = _response.copyWith(
      minClientVersion: configuration.wkMinimumClientVersion,
      projectId: configuration.projectId,
      endpoint: configuration.endpoint,
    );
  }

  // late FunctionRuntime _runtime;
  late DatabaseConfigurationService _databaseConfigurationService;
  WellknownResponse _response = WellknownResponse.empty();

  /// Create client configuration
  ///
  /// Reads the Appwrite Objects in Appwrite Project and return a
  /// [WellknownResponse] object
  Future<WellknownResponse> create() async {
    await _readDatabases();
    return _response;
  }

  /// Read databases from [DatabaseConfigurationService]
  Future<void> _readDatabases() async {
    try {
      _response = _response.copyWith(
        databases: await _databaseConfigurationService.create(),
      );
    } catch (e) {
      //
    }
  }
}
