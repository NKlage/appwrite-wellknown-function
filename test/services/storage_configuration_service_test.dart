import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:dart_appwrite/models.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:starter_template/src/storage_configuration_service.dart';
import 'package:test/test.dart';

import 'storage_configuration_service_test.mocks.dart';

@GenerateMocks([Storage])
void main() {
  test('should return storage list', () async {
    // Arrange
    final mockStorage = MockStorage();
    final sut = StorageConfigurationService(storage: mockStorage);

    when(mockStorage.listBuckets()).thenAnswer(
      (realInvocation) => Future.value(
        BucketList(
          total: 3,
          buckets: [
            Bucket(
              $id: 'id',
              $createdAt: 'createdAt',
              $updatedAt: 'updatedAt',
              $permissions: ['permissions'],
              fileSecurity: true,
              name: 'name',
              enabled: true,
              maximumFileSize: 50,
              allowedFileExtensions: ['.ext'],
              compression: 'compression',
              encryption: true,
              antivirus: true,
            ),
            Bucket(
              $id: 'id',
              $createdAt: 'createdAt',
              $updatedAt: 'updatedAt',
              $permissions: ['permissions'],
              fileSecurity: true,
              name: 'name',
              enabled: true,
              maximumFileSize: 50,
              allowedFileExtensions: ['.ext'],
              compression: 'compression',
              encryption: true,
              antivirus: true,
            ),
            Bucket(
              $id: 'id',
              $createdAt: 'createdAt',
              $updatedAt: 'updatedAt',
              $permissions: ['permissions'],
              fileSecurity: true,
              name: 'name',
              enabled: false,
              maximumFileSize: 50,
              allowedFileExtensions: ['.ext'],
              compression: 'compression',
              encryption: true,
              antivirus: true,
            ),
          ],
        ),
      ),
    );

    // Act
    final storageResponseList = await sut.create();

    // Assert
    expect(storageResponseList.length, 2);
  });
}
