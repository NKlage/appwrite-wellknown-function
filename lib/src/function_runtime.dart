import 'dart:io';

import 'package:dart_appwrite/dart_appwrite.dart';

import 'utils.dart';

/// [FunctionRuntime] instance
FunctionRuntime functionRuntime = FunctionRuntime();

/// Runtime Configuration
///
/// Reads the configuration parameters from the environment variables.
class FunctionRuntime {
  /// Name of the environment variable that provides the API key in Appwrite.
  ///
  /// Appwrite API Key to read the required Appwrite Objects. The API key should
  /// have read permission.
  static const apiKey = 'WELLKNOWN_FUNCTION_API_KEY';

  /// Name of the environment variable that provides the Appwrite endpoint in
  /// Appwrite.
  static const endpoint = 'APPWRITE_ENDPOINT';

  /// Name of the environment variable that provides the Appwrite project id in
  /// Appwrite.
  static const projectId = 'APPWRITE_PROJECT_ID';

  /// Name of the request header that holds the token to secure the requests.
  static const wkTokenHeaderName = 'x-wk-token';

  /// Name of the environment variable that provides the x-wk-token value/secret in Appwrite.
  static const wkTokenHeaderValue = 'WELLKNOWN_TOKEN';

  /// Name of the environment variable that sets the minimum version of the
  /// client to detect incompatibilities in the Appwrite project.
  static const wkMinClientVersion = 'WELLKNOWN_MIN_CLIENT_VERSION';

  /// Get the Function Runtime Configuration
  FunctionConfiguration get configuration => _configuration();

  /// Get Appwrite Client
  Client get client => Client()
      .setEndpoint(configuration.endpoint)
      .setProject(configuration.projectId)
      .setKey(configuration.apiKey);

  FunctionConfiguration _configuration() {
    final envParams = Platform.environment;

    throwIfMissing(envParams, [
      apiKey,
      endpoint,
      projectId,
      wkTokenHeaderValue,
    ]);

    return FunctionConfiguration(
      apiKey: envParams[apiKey]!,
      endpoint: envParams[endpoint]!,
      projectId: envParams[projectId]!,
      wkTokenHeaderValue: envParams[wkTokenHeaderValue]!,
      wkMinimumClientVersion: envParams[wkMinClientVersion],
    );
  }
}

/// Represents a function configuration object
class FunctionConfiguration {
  /// Create new Function Configuration Entity
  const FunctionConfiguration({
    required this.apiKey,
    required this.endpoint,
    required this.projectId,
    required this.wkTokenHeaderValue,
    this.wkMinimumClientVersion,
  });

  /// Api Key to access Appwrite functionality
  final String apiKey;

  /// Appwrite Endpoint
  ///
  /// Example: https://cloud.appwrite.io/v1
  final String endpoint;

  /// Appwrite Project Id
  final String projectId;

  /// Expected X-WK-TOKEN Value
  final String wkTokenHeaderValue;

  /// Expected minimum Client Version
  final String? wkMinimumClientVersion;
}
