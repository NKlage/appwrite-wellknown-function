import 'database_response.dart';
import 'function_response.dart';
import 'storage_response.dart';

/// Represents the wellknown client configuration
class WellknownResponse {
  /// Default Constructor
  WellknownResponse({
    required this.minClientVersion,
    required this.projectId,
    required this.endpoint,
    required this.databases,
    required this.storages,
    required this.functions,
  });

  /// Create empty [WellknownResponse]
  factory WellknownResponse.empty() {
    return WellknownResponse(
      minClientVersion: '',
      projectId: '',
      endpoint: '',
      databases: [],
      storages: [],
      functions: [],
    );
  }

  /// Minimum client version to interact with this Appwrite project
  final String minClientVersion;

  /// Appwrite Project Id from which the configuration was created
  final String projectId;

  /// Appwrite endpoint from which the configuration was created
  final String endpoint;

  /// List of databases in the Appwrite project
  final List<DatabaseResponse> databases;

  /// List of storages in the Appwrite project
  final List<StorageResponse> storages;

  /// List of functions in the Appwrite project
  final List<FunctionResponse> functions;

  /// Convert [WellknownResponse] to Map
  Map<String, dynamic> toMap() {
    return {
      'min_client_version': minClientVersion,
      'project_id': projectId,
      'endpoint': endpoint,
      'databases': databases.map((e) => e.toMap()).toList(),
      'storages': storages.map((e) => e.toMap()).toList(),
      'functions': functions.map((e) => e.toMap()).toList(),
    };
  }

  /// Create copy with different values
  WellknownResponse copyWith({
    String? minClientVersion,
    String? projectId,
    String? endpoint,
    List<DatabaseResponse>? databases,
    List<StorageResponse>? storages,
    List<FunctionResponse>? functions,
  }) {
    return WellknownResponse(
      minClientVersion: minClientVersion ?? this.minClientVersion,
      projectId: projectId ?? this.projectId,
      endpoint: endpoint ?? this.endpoint,
      databases: databases ?? this.databases,
      storages: storages ?? this.storages,
      functions: functions ?? this.functions,
    );
  }
}
