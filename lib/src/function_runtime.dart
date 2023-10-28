import 'dart:io';

import 'package:dart_appwrite/dart_appwrite.dart';

import 'utils.dart';

/// [FunctionRuntime] instance
FunctionRuntime functionRuntime = FunctionRuntime();

/// Function Runtime Configuration
///
/// Get required Function Parameters from Environment
class FunctionRuntime {
  /// Key for the environment variables of the API Key for the Appwrite Function
  static final apiKey = 'WELLKNOWN_FUNCTION_API_KEY';

  /// Key for the environment variables of the Appwite Endpoint for the Appwrite
  /// Function
  static final endpoint = 'APPWRITE_ENDPOINT';

  /// Key for the environment variables of the Appwrite Project Id for the
  /// Appwrite Function
  static final projectId = 'APPWRITE_PROJECT_ID';

  /// Request Header that contains a valid Wellknown token to verify Request
  static final wkTokenHeaderName = 'x-wk-token';

  /// Token for X-WK-Token request header value
  static final wkTokenHeaderValue = 'WELLKNOWN_TOKEN';

  /// Minimum Client Version to interact with Appwrite Project
  static final wkMinClientVersion = 'WELLKNOWN_MIN_CLIENT_VERSION';

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
