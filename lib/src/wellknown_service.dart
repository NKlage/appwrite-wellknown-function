import 'database_configuration_service.dart';
import 'function_configuration_service.dart';
import 'function_runtime.dart';
import 'models/wellknown_response.dart';
import 'storage_configuration_service.dart';

/// Service to read the Appwrite Objects and creates a Wellknown configuration
class WellknownService {
  /// Default Constructor

  WellknownService({
    required FunctionConfiguration configuration,
    required DatabaseConfigurationService databaseConfigurationService,
    required StorageConfigurationService storageConfigurationService,
    required FunctionConfigurationService functionConfigurationService,
  }) {
    _databaseConfigurationService = databaseConfigurationService;
    _storageConfigurationService = storageConfigurationService;
    _functionConfigurationService = functionConfigurationService;

    _response = _response.copyWith(
      minClientVersion: configuration.wkMinimumClientVersion,
      projectId: configuration.projectId,
      endpoint: configuration.endpoint,
    );
  }
  late DatabaseConfigurationService _databaseConfigurationService;

  late StorageConfigurationService _storageConfigurationService;
  late FunctionConfigurationService _functionConfigurationService;
  WellknownResponse _response = WellknownResponse.empty();

  /// Get list of errors
  List<String> errors = List.empty(growable: true);

  /// Create client configuration
  ///
  /// Reads the Appwrite Objects in Appwrite Project and return a
  /// [WellknownResponse] object
  Future<WellknownResponse> create() async {
    await _readDatabases();
    await _readStorage();
    await _readFunctions();
    return _response;
  }

  /// Read databases from [DatabaseConfigurationService]
  Future<void> _readDatabases() async {
    try {
      _response = _response.copyWith(
        databases: await _databaseConfigurationService.create(),
      );
    } catch (e) {
      errors.add(e.toString());
    }
  }

  Future<void> _readStorage() async {
    try {
      _response = _response.copyWith(
        storages: await _storageConfigurationService.create(),
      );
    } catch (e) {
      errors.add(e.toString());
    }
  }

  Future<void> _readFunctions() async {
    try {
      _response = _response.copyWith(
        functions: await _functionConfigurationService.create(),
      );
    } catch (e) {
      errors.add(e.toString());
    }
  }
}
