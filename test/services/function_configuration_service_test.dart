import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:dart_appwrite/models.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:starter_template/src/function_configuration_service.dart';
import 'package:test/test.dart';

import 'function_configuration_service_test.mocks.dart';

@GenerateMocks([Functions])
void main() {
  test('should return function configuration', () async {
    // Arrange
    final mockFunctions = MockFunctions();
    final sut = FunctionConfigurationService(functions: mockFunctions);
    when(
      mockFunctions.list(
        queries: [
          Query.equal('enabled', true),
        ],
      ),
    ).thenAnswer(
      (realInvocation) => Future.value(
        FunctionList(
          total: 3,
          functions: [
            Func(
              $id: 'id',
              $createdAt: 'createdAt',
              $updatedAt: 'updatedAt',
              execute: [],
              name: 'name',
              enabled: true,
              live: true,
              logging: true,
              runtime: 'runtime',
              deployment: 'deployment',
              vars: [],
              events: [],
              schedule: 'schedule',
              timeout: 15,
              entrypoint: 'entrypoint',
              commands: 'commands',
              version: 'version',
              installationId: 'installationId',
              providerRepositoryId: 'providerRepositoryId',
              providerBranch: 'providerBranch',
              providerRootDirectory: 'providerRootDirectory',
              providerSilentMode: false,
            ),
            Func(
              $id: 'id',
              $createdAt: 'createdAt',
              $updatedAt: 'updatedAt',
              execute: [],
              name: 'name',
              enabled: true,
              live: true,
              logging: true,
              runtime: 'runtime',
              deployment: 'deployment',
              vars: [],
              events: [],
              schedule: 'schedule',
              timeout: 15,
              entrypoint: 'entrypoint',
              commands: 'commands',
              version: 'version',
              installationId: 'installationId',
              providerRepositoryId: 'providerRepositoryId',
              providerBranch: 'providerBranch',
              providerRootDirectory: 'providerRootDirectory',
              providerSilentMode: false,
            ),
          ],
        ),
      ),
    );

    // Act
    final functionsResponseList = await sut.create();
    // Assert
    expect(functionsResponseList.length, 2);
  });
}
