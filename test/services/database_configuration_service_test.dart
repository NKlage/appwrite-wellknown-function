import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:dart_appwrite/models.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:starter_template/src/database_configuration_service.dart';
import 'package:test/test.dart';

import 'database_configuration_service_test.mocks.dart';

@GenerateMocks([Databases])
void main() {
  test('should return database configuration list', () async {
    // Arrange
    final mockDatabase = MockDatabases();
    final sut = DatabaseConfigurationService(databases: mockDatabase);
    final databaseList = DatabaseList(
      total: 1,
      databases: [
        Database(
          $id: 'id',
          name: 'name',
          $createdAt: 'createdAt',
          $updatedAt: 'updatedAt',
          enabled: true,
        ),
      ],
    );
    final collectionList = CollectionList(
      total: 3,
      collections: [
        Collection(
          $id: 'id',
          $createdAt: 'createdAt',
          $updatedAt: 'updatedAt',
          $permissions: ['permissions'],
          databaseId: 'databaseId',
          name: 'name',
          enabled: true,
          documentSecurity: false,
          attributes: [],
          indexes: [],
        ),
      ],
    );

    when(
      mockDatabase.list(
        queries: [
          Query.equal('enabled', true),
        ],
      ),
    ).thenAnswer((_) => Future.value(databaseList));

    when(
      mockDatabase.listCollections(
        databaseId: anyNamed('databaseId'),
        queries: [
          Query.equal('enabled', true),
        ],
      ),
    ).thenAnswer((_) => Future.value(collectionList));

    // Act
    final databaseResponseList = await sut.create();
    // Assert
    expect(
      databaseResponseList.length,
      1,
      reason: 'should only one database in response',
    );
    expect(
      databaseResponseList[0].collections.length,
      1,
      reason: 'should only one collection in response',
    );
  });
}
