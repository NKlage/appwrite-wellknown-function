// ignore_for_file: avoid_dynamic_calls
import 'dart:async';

import 'package:dart_appwrite/dart_appwrite.dart';

import 'src/database_configuration_service.dart';
import 'src/function_runtime.dart';

// This is your Appwrite function
// It's executed each time we get a request
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

  final databaseService = DatabaseConfigurationService(
    databases: Databases(functionRuntime.client),
  );

  final dbConfiguration = await databaseService.create();
  final map = dbConfiguration.map((e) => e.toJson()).toList();
  context.log('dbConfiguration: $map');

  final result = {
    'min_client_version': functionRuntime.configuration.wkMinimumClientVersion,
    'endpoint': functionRuntime.configuration.endpoint,
    'databases': map,
  };

  return context.res.json(result);
}
