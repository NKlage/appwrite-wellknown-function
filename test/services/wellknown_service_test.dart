import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:starter_template/src/database_configuration_service.dart';
import 'package:starter_template/src/function_configuration_service.dart';
import 'package:starter_template/src/function_runtime.dart';
import 'package:starter_template/src/models/database_response.dart';
import 'package:starter_template/src/models/function_response.dart';
import 'package:starter_template/src/models/storage_response.dart';
import 'package:starter_template/src/storage_configuration_service.dart';
import 'package:starter_template/src/wellknown_service.dart';
import 'package:test/test.dart';

import 'wellknown_service_test.mocks.dart';

class MockDatabaseConfigurationService extends Mock
    implements DatabaseConfigurationService {
  MockDatabaseConfigurationService({required this.createResponse});
  final List<DatabaseResponse> createResponse;

  @override
  Future<List<DatabaseResponse>> create() async {
    return Future.value(createResponse);
  }
}

class MockStorageConfigurationService extends Mock
    implements StorageConfigurationService {
  MockStorageConfigurationService({required this.createResponse});
  final List<StorageResponse> createResponse;

  @override
  Future<List<StorageResponse>> create() async {
    return Future.value(createResponse);
  }
}

@GenerateMocks([FunctionConfigurationService, Functions])
void main() {
  test('should create full wellknown response', () async {
    // Arrange
    const mockFunctionConfiguration = FunctionConfiguration(
      apiKey:
          'lCicLMCbtmJ2kzfoNe9wYl3kNzq3imYsObJ9ox5FbsXgujNJyCKu2ErP0tZSwcjz',
      endpoint: 'https://api.appwrite.local/v1',
      projectId: '653e8b662406667470e2',
      wkTokenHeaderValue: 'Whe6je20AiyX5Z6UNIvVOCKMs4gFkwBV',
      wkMinimumClientVersion: '1.2.3',
    );

    final mockDatabaseConfigurationService = MockDatabaseConfigurationService(
      createResponse: [
        DatabaseResponse(id: 'id1', name: 'First Database'),
        DatabaseResponse(id: 'id2', name: 'Second Database'),
        DatabaseResponse(id: 'id3', name: 'Third Database'),
      ],
    );

    final mockStorageConfigurationService = MockStorageConfigurationService(
      createResponse: [
        StorageResponse(id: 'id1', name: 'First Storage'),
        StorageResponse(id: 'id2', name: 'Second Storage'),
      ],
    );

    final mockFunctionConfigurationService = MockFunctionConfigurationService();

    final functionResponseList = [
      FunctionResponse(
        id: '4711',
        name: 'First Function',
        timeout: 15,
      ),
      FunctionResponse(
        id: '4712',
        name: 'Second Function',
        timeout: 15,
      ),
      FunctionResponse(
        id: '4713',
        name: 'Third Function',
        timeout: 15,
      ),
    ];

    when(mockFunctionConfigurationService.create()).thenAnswer(
      (_) => Future.value(functionResponseList),
    );
    final sut = WellknownService(
      configuration: mockFunctionConfiguration,
      databaseConfigurationService: mockDatabaseConfigurationService,
      storageConfigurationService: mockStorageConfigurationService,
      functionConfigurationService: mockFunctionConfigurationService,
    );

    // Act
    final wellknownResponse = await sut.create();

    // Assert
    expect(wellknownResponse.endpoint, 'https://api.appwrite.local/v1');
    expect(wellknownResponse.projectId, '653e8b662406667470e2');
    expect(wellknownResponse.minClientVersion, '1.2.3');
    expect(wellknownResponse.databases.length, 3);
    expect(wellknownResponse.storages.length, 2);
    expect(wellknownResponse.functions.length, 3);
  });
}
