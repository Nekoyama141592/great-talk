import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/domain/entity/database/public_user/public_user_entity.dart';
import 'package:great_talk/application/use_case/file/file_use_case.dart';
import 'package:great_talk/application/use_case/user/user_use_case.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'user_use_case_test.mocks.dart';

@GenerateMocks([FileUseCase])
void main() {
  group('UserUseCase', () {
    late UserUseCase userUseCase;
    late MockFileUseCase mockFileUseCase;
    late Timestamp mockTimestamp;

    setUp(() {
      mockFileUseCase = MockFileUseCase();
      userUseCase = UserUseCase(mockFileUseCase);
      mockTimestamp = Timestamp.fromDate(DateTime(2024, 1, 1, 12, 0, 0));
    });

    group('usersToImageUsers', () {
      late List<PublicUserEntity> testUsers;

      setUp(() {
        testUsers = [
          PublicUserEntity(
            uid: 'user_1',
            accountName: '',
            blockCount: 0,
            ethAddress: '',
            isNFTicon: false,
            isOfficial: false,
            isSuspended: false,
            links: const [],
            muteCount: 0,
            postCount: 0,
            reportCount: 0,
            score: 0.0,
            searchToken: const {},
            walletAddresses: const [],
            bio: const {
              'languageCode': 'en',
              'negativeScore': 0.1,
              'positiveScore': 0.9,
              'sentiment': 'positive',
              'value': 'Bio for user 1',
            },
            createdAt: mockTimestamp,
            updatedAt: mockTimestamp,
            image: const {
              'bucketName': 'test-bucket',
              'value': 'user1_image.jpg',
            },
            userName: const {
              'languageCode': 'en',
              'negativeScore': 0.05,
              'positiveScore': 0.95,
              'sentiment': 'positive',
              'value': 'user_one',
            },
            followerCount: 10,
            followingCount: 5,
          ),
          PublicUserEntity(
            uid: 'user_2',
            accountName: '',
            blockCount: 0,
            ethAddress: '',
            isNFTicon: false,
            isOfficial: false,
            isSuspended: false,
            links: const [],
            muteCount: 0,
            postCount: 0,
            reportCount: 0,
            score: 0.0,
            searchToken: const {},
            walletAddresses: const [],
            bio: const {
              'languageCode': 'en',
              'negativeScore': 0.1,
              'positiveScore': 0.9,
              'sentiment': 'positive',
              'value': 'Bio for user 2',
            },
            createdAt: mockTimestamp,
            updatedAt: mockTimestamp,
            image: const {
              'bucketName': 'test-bucket',
              'value': 'user2_image.jpg',
            },
            userName: const {
              'languageCode': 'en',
              'negativeScore': 0.05,
              'positiveScore': 0.95,
              'sentiment': 'positive',
              'value': 'user_two',
            },
            followerCount: 20,
            followingCount: 15,
          ),
        ];
      });

      test('should convert users to ImageUsers with base64 images', () async {
        // Mock file use case to return base64 images
        when(
          mockFileUseCase.getObject('test-bucket', 'user1_image.jpg'),
        ).thenAnswer((_) async => 'base64_image_1');
        when(
          mockFileUseCase.getObject('test-bucket', 'user2_image.jpg'),
        ).thenAnswer((_) async => 'base64_image_2');

        final result = await userUseCase.usersToImageUsers(testUsers);

        expect(result, hasLength(2));
        expect(result[0].user?.uid, equals('user_1'));
        expect(result[0].base64, equals('base64_image_1'));
        expect(result[1].user?.uid, equals('user_2'));
        expect(result[1].base64, equals('base64_image_2'));

        // Verify file use case was called with correct parameters
        verify(
          mockFileUseCase.getObject('test-bucket', 'user1_image.jpg'),
        ).called(1);
        verify(
          mockFileUseCase.getObject('test-bucket', 'user2_image.jpg'),
        ).called(1);
      });

      test('should handle empty user list', () async {
        final result = await userUseCase.usersToImageUsers([]);

        expect(result, isEmpty);
        verifyNever(mockFileUseCase.getObject(any, any));
      });

      test('should handle users with empty image data', () async {
        final usersWithEmptyImages = [
          testUsers[0].copyWith(image: const {}),
          testUsers[1].copyWith(image: const {}),
        ];

        // Mock empty bucket name and value
        when(mockFileUseCase.getObject('', '')).thenAnswer((_) async => null);

        final result = await userUseCase.usersToImageUsers(
          usersWithEmptyImages,
        );

        expect(result, hasLength(2));
        expect(result[0].user?.uid, equals('user_1'));
        expect(result[0].base64, isNull);
        expect(result[1].user?.uid, equals('user_2'));
        expect(result[1].base64, isNull);

        // Verify file use case was called with empty parameters
        verify(mockFileUseCase.getObject('', '')).called(2);
      });

      test('should handle null responses from file use case', () async {
        when(
          mockFileUseCase.getObject('test-bucket', 'user1_image.jpg'),
        ).thenAnswer((_) async => null);
        when(
          mockFileUseCase.getObject('test-bucket', 'user2_image.jpg'),
        ).thenAnswer((_) async => null);

        final result = await userUseCase.usersToImageUsers(testUsers);

        expect(result, hasLength(2));
        expect(result[0].user?.uid, equals('user_1'));
        expect(result[0].base64, isNull);
        expect(result[1].user?.uid, equals('user_2'));
        expect(result[1].base64, isNull);
      });

      test('should handle single user', () async {
        when(
          mockFileUseCase.getObject('test-bucket', 'user1_image.jpg'),
        ).thenAnswer((_) async => 'single_user_image');

        final result = await userUseCase.usersToImageUsers([testUsers[0]]);

        expect(result, hasLength(1));
        expect(result[0].user?.uid, equals('user_1'));
        expect(result[0].base64, equals('single_user_image'));
      });

      test('should handle users with different bucket names', () async {
        final usersWithDifferentBuckets = [
          testUsers[0].copyWith(
            image: const {'bucketName': 'bucket-1', 'value': 'image1.jpg'},
          ),
          testUsers[1].copyWith(
            image: const {'bucketName': 'bucket-2', 'value': 'image2.jpg'},
          ),
        ];

        when(
          mockFileUseCase.getObject('bucket-1', 'image1.jpg'),
        ).thenAnswer((_) async => 'image_from_bucket_1');
        when(
          mockFileUseCase.getObject('bucket-2', 'image2.jpg'),
        ).thenAnswer((_) async => 'image_from_bucket_2');

        final result = await userUseCase.usersToImageUsers(
          usersWithDifferentBuckets,
        );

        expect(result, hasLength(2));
        expect(result[0].base64, equals('image_from_bucket_1'));
        expect(result[1].base64, equals('image_from_bucket_2'));

        verify(mockFileUseCase.getObject('bucket-1', 'image1.jpg')).called(1);
        verify(mockFileUseCase.getObject('bucket-2', 'image2.jpg')).called(1);
      });

      test(
        'should handle successful file operations with some failures',
        () async {
          when(
            mockFileUseCase.getObject('test-bucket', 'user1_image.jpg'),
          ).thenAnswer(
            (_) async => null,
          ); // Simulating a failed operation that returns null
          when(
            mockFileUseCase.getObject('test-bucket', 'user2_image.jpg'),
          ).thenAnswer((_) async => 'user2_image');

          final result = await userUseCase.usersToImageUsers(testUsers);

          expect(result, hasLength(2));
          expect(result[0].user?.uid, equals('user_1'));
          expect(result[0].base64, isNull); // Failed to load image
          expect(result[1].user?.uid, equals('user_2'));
          expect(
            result[1].base64,
            equals('user2_image'),
          ); // Successfully loaded image
        },
      );

      test('should preserve user data in ImageUser objects', () async {
        when(
          mockFileUseCase.getObject('test-bucket', 'user1_image.jpg'),
        ).thenAnswer((_) async => 'test_image');

        final result = await userUseCase.usersToImageUsers([testUsers[0]]);

        expect(result, hasLength(1));
        final imageUser = result[0];
        expect(imageUser.user?.uid, equals('user_1'));
        expect(imageUser.user?.nameValue, equals('user_one'));
        expect(imageUser.user?.bioValue, equals('Bio for user 1'));
        expect(imageUser.user?.followerCount, equals(10));
        expect(imageUser.user?.followingCount, equals(5));
        expect(imageUser.base64, equals('test_image'));
      });

      test('should handle concurrent image loading', () async {
        // Create more users to test concurrent loading
        final moreUsers = List.generate(
          5,
          (index) => PublicUserEntity(
            uid: 'user_$index',
            accountName: '',
            blockCount: 0,
            ethAddress: '',
            isNFTicon: false,
            isOfficial: false,
            isSuspended: false,
            links: const [],
            muteCount: 0,
            postCount: 0,
            reportCount: 0,
            score: 0.0,
            searchToken: const {},
            walletAddresses: const [],
            followerCount: 0,
            followingCount: 0,
            bio: {
              'languageCode': 'en',
              'negativeScore': 0.1,
              'positiveScore': 0.9,
              'sentiment': 'positive',
              'value': 'Bio for user $index',
            },
            createdAt: mockTimestamp,
            updatedAt: mockTimestamp,
            image: {
              'bucketName': 'test-bucket',
              'value': 'user${index}_image.jpg',
            },
            userName: {
              'languageCode': 'en',
              'negativeScore': 0.05,
              'positiveScore': 0.95,
              'sentiment': 'positive',
              'value': 'user_$index',
            },
          ),
        );

        // Mock responses for all users
        for (int i = 0; i < 5; i++) {
          when(
            mockFileUseCase.getObject('test-bucket', 'user${i}_image.jpg'),
          ).thenAnswer((_) async => 'image_$i');
        }

        final result = await userUseCase.usersToImageUsers(moreUsers);

        expect(result, hasLength(5));
        for (int i = 0; i < 5; i++) {
          expect(result[i].user?.uid, equals('user_$i'));
          expect(result[i].base64, equals('image_$i'));
        }

        // Verify all file calls were made
        for (int i = 0; i < 5; i++) {
          verify(
            mockFileUseCase.getObject('test-bucket', 'user${i}_image.jpg'),
          ).called(1);
        }
      });
    });

    group('constructor', () {
      test('should create UserUseCase with required dependencies', () {
        final useCase = UserUseCase(mockFileUseCase);

        expect(useCase, isA<UserUseCase>());
        expect(useCase.fileUseCase, equals(mockFileUseCase));
      });
    });
  });
}
