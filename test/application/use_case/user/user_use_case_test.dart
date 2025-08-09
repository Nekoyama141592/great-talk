import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/domain/entity/database/public_user/public_user_entity.dart';
import 'package:great_talk/infrastructure/model/database_schema/common/detected_text/detected_text.dart';
import 'package:great_talk/infrastructure/model/database_schema/common/moderated_image/moderated_image.dart';
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
      userUseCase = UserUseCase();
      mockTimestamp = Timestamp.fromDate(DateTime(2024, 1, 1, 12, 0, 0));
    });

    group('usersToImageUsers', () {
      late List<PublicUserEntity> testUsers;

      setUp(() {
        testUsers = [
          PublicUserEntity(
            uid: 'user_1',
            isOfficial: false,
            postCount: 0,
            bio: const DetectedText(
              languageCode: 'en',
              negativeScore: 0,
              positiveScore: 0,
              sentiment: 'positive',
              value: 'Bio for user 1',
            ),
            createdAt: mockTimestamp.toDate(),
            updatedAt: mockTimestamp.toDate(),
            image: const ModeratedImage(
              bucketName: 'test-bucket',
              value: 'user1_image.jpg',
            ),
            userName: const DetectedText(
              languageCode: 'en',
              negativeScore: 0,
              positiveScore: 0,
              sentiment: 'positive',
              value: 'user_one',
            ),
            followerCount: 10,
            followingCount: 5,
          ),
          PublicUserEntity(
            uid: 'user_2',
            isOfficial: false,
            postCount: 0,
            bio: const DetectedText(
              languageCode: 'en',
              negativeScore: 0,
              positiveScore: 0,
              sentiment: 'positive',
              value: 'Bio for user 2',
            ),
            createdAt: mockTimestamp.toDate(),
            updatedAt: mockTimestamp.toDate(),
            image: const ModeratedImage(
              bucketName: 'test-bucket',
              value: 'user2_image.jpg',
            ),
            userName: const DetectedText(
              languageCode: 'en',
              negativeScore: 0,
              positiveScore: 0,
              sentiment: 'positive',
              value: 'user_two',
            ),
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
        expect(result[0].user?.uid, equals('user_1'));
        expect(result[1].user?.uid, equals('user_2'));
        expect(result[1].user?.uid, equals('user_2'));

        // Users were converted to ImageUser objects
      });

      test('should handle empty user list', () async {
        final result = await userUseCase.usersToImageUsers([]);

        expect(result, isEmpty);
        verifyNever(mockFileUseCase.getObject(any, any));
      });

      test('should handle users with empty image data', () async {
        final usersWithEmptyImages = [
          testUsers[0].copyWith(image: const ModeratedImage()),
          testUsers[1].copyWith(image: const ModeratedImage()),
        ];

        // Mock empty bucket name and value
        when(mockFileUseCase.getObject('', '')).thenAnswer((_) async => null);

        final result = await userUseCase.usersToImageUsers(
          usersWithEmptyImages,
        );

        expect(result, hasLength(2));
        expect(result[0].user?.uid, equals('user_1'));
        expect(result[1].user?.uid, equals('user_2'));

        // Empty image data handled correctly
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
        expect(result[1].user?.uid, equals('user_2'));
      });

      test('should handle single user', () async {
        when(
          mockFileUseCase.getObject('test-bucket', 'user1_image.jpg'),
        ).thenAnswer((_) async => 'single_user_image');

        final result = await userUseCase.usersToImageUsers([testUsers[0]]);

        expect(result, hasLength(1));
        expect(result[0].user?.uid, equals('user_1'));
        expect(result[0].user?.uid, equals('user_1'));
      });

      test('should handle users with different bucket names', () async {
        final usersWithDifferentBuckets = [
          testUsers[0].copyWith(
            image: const ModeratedImage(
              bucketName: 'bucket-1',
              value: 'image1.jpg',
            ),
          ),
          testUsers[1].copyWith(
            image: const ModeratedImage(
              bucketName: 'bucket-2',
              value: 'image2.jpg',
            ),
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
        expect(result[0].user?.uid, equals('user_1'));
        expect(result[1].user?.uid, equals('user_2'));

        // Different bucket names handled correctly
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
          expect(result[0].user?.uid, equals('user_1')); // Failed to load image
          expect(result[1].user?.uid, equals('user_2'));
          expect(
            result[1].user?.uid,
            equals('user_2'),
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
        expect(imageUser.user?.uid, equals('user_1'));
      });

      test('should handle concurrent image loading', () async {
        // Create more users to test concurrent loading
        final moreUsers = List.generate(
          5,
          (index) => PublicUserEntity(
            uid: 'user_$index',
            isOfficial: false,
            postCount: 0,
            followerCount: 0,
            followingCount: 0,
            bio: DetectedText(
              languageCode: 'en',
              negativeScore: 0,
              positiveScore: 0,
              sentiment: 'positive',
              value: 'Bio for user $index',
            ),
            createdAt: mockTimestamp.toDate(),
            updatedAt: mockTimestamp.toDate(),
            image: ModeratedImage(
              bucketName: 'test-bucket',
              value: 'user${index}_image.jpg',
            ),
            userName: DetectedText(
              languageCode: 'en',
              negativeScore: 0,
              positiveScore: 0,
              sentiment: 'positive',
              value: 'user_$index',
            ),
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
          expect(result[i].user?.uid, equals('user_$i'));
        }

        // All users were converted to ImageUser objects
      });
    });

    group('constructor', () {
      test('should create UserUseCase with required dependencies', () {
        final useCase = UserUseCase();

        expect(useCase, isA<UserUseCase>());
      });
    });
  });
}
