// ignore_for_file: avoid_dynamic_calls
import 'dart:async';

import 'package:dart_appwrite/dart_appwrite.dart';

import 'src/database_configuration_service.dart';
import 'src/function_runtime.dart';
import 'src/wellknown_service.dart';

/// Appwrite function entrypoint
///
/// More information about the implementation of the [context] can be found
/// [here](https://github.com/open-runtimes/open-runtimes/blob/main/runtimes/dart-3.0/src/function_types.dart):
// ignore: inference_failure_on_untyped_parameter, type_annotate_public_apis, avoid_final_parameters
Future<dynamic> main(final context) async {
  final requestHeaders = context.req.headers as Map<String, dynamic>;
  context.logs.add('requestHeaders $requestHeaders');
  if (!requestHeaders.containsKey(
    FunctionRuntime.wkTokenHeaderName,
  )) {
    context.errors.add('Missing ${FunctionRuntime.wkTokenHeaderName}');
    return context.res.send('', 404);
  }

  final tokenHeaderValue =
      requestHeaders[FunctionRuntime.wkTokenHeaderName].toString();

  if (tokenHeaderValue != functionRuntime.configuration.wkTokenHeaderValue) {
    context.errors.add('${FunctionRuntime.wkTokenHeaderName} is not valid');
    return context.res.send('', 404);
  }

  final appwriteClient = functionRuntime.client;

  final service = WellknownService(
    configuration: functionRuntime.configuration,
    databaseConfigurationService: DatabaseConfigurationService(
      databases: Databases(appwriteClient),
    ),
  );
  final response = await service.create();

  return context.res.json(response.toMap());
}
