import 'database_response.dart';

/// Represents the wellknown client configuration
class WellknownResponse {
  /// Default Constructor
  WellknownResponse({
    required this.minClientVersion,
    required this.projectId,
    required this.endpoint,
    required this.databases,
  });

  factory WellknownResponse.empty() {
    return WellknownResponse(
      minClientVersion: '',
      projectId: '',
      endpoint: '',
      databases: [],
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

  /// Convert [WellknownResponse] to Map
  Map<String, dynamic> toMap() {
    return {
      'min_client_version': minClientVersion,
      'project_id': projectId,
      'endpoint': endpoint,
      'databases': databases.map((e) => e.toMap()).toList(),
    };
  }

  WellknownResponse copyWith({
    String? minClientVersion,
    String? projectId,
    String? endpoint,
    List<DatabaseResponse>? databases,
  }) {
    return WellknownResponse(
      minClientVersion: minClientVersion ?? this.minClientVersion,
      projectId: projectId ?? this.projectId,
      endpoint: endpoint ?? this.endpoint,
      databases: databases ?? this.databases,
    );
  }
}
