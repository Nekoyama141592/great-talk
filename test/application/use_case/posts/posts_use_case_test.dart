import 'package:flutter_test/flutter_test.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:great_talk/infrastructure/repository/database_repository.dart';
import 'package:great_talk/application/use_case/posts/posts_use_case.dart';
import 'package:great_talk/application/use_case/file/file_use_case.dart';
import 'package:great_talk/infrastructure/model/database_schema/post/post.dart';
import 'package:great_talk/infrastructure/model/database_schema/public_user/public_user.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'posts_use_case_test.mocks.dart';

@GenerateMocks([FileUseCase])
void main() {
  group('PostsUseCase', () {
    late PostsUseCase postsUseCase;
    late DatabaseRepository databaseRepository;
    late MockFileUseCase mockFileUseCase;
    late FakeFirebaseFirestore fakeFirestore;
    late Timestamp mockTimestamp;

    setUp(() {
      fakeFirestore = FakeFirebaseFirestore();
      databaseRepository = DatabaseRepository(instance: fakeFirestore);
      mockFileUseCase = MockFileUseCase();
      mockTimestamp = Timestamp.fromDate(DateTime(2024, 1, 1, 12, 0, 0));
      postsUseCase = PostsUseCase(
        repository: databaseRepository,
        fileUseCase: mockFileUseCase,
      );
    });

    group('createUserPosts', () {
      late List<Post> testPosts;
      late List<PublicUser> testUsers;

      setUp(() {
        testPosts = [
          Post(
            postId: 'post_1',
            uid: 'user_1',
            createdAt: mockTimestamp,
            updatedAt: mockTimestamp,
            customCompleteText: const {},
            description: const {
              'languageCode': 'en',
              'negativeScore': 0.05,
              'positiveScore': 0.95,
              'sentiment': 'positive',
              'value': 'First test post',
            },
            image: const {'bucketName': 'test-bucket', 'value': 'image1.jpg'},
            searchToken: const {},
            title: const {
              'languageCode': 'en',
              'negativeScore': 0.1,
              'positiveScore': 0.9,
              'sentiment': 'positive',
              'value': 'Test Post 1',
            },
            likeCount: 10,
          ),
          Post(
            postId: 'post_2',
            uid: 'user_2',
            createdAt: Timestamp.fromDate(DateTime(2024, 1, 2, 12, 0, 0)),
            updatedAt: Timestamp.fromDate(DateTime(2024, 1, 2, 12, 0, 0)),
            customCompleteText: const {},
            description: const {
              'languageCode': 'en',
              'negativeScore': 0.1,
              'positiveScore': 0.9,
              'sentiment': 'positive',
              'value': 'Second test post',
            },
            image: const {'bucketName': 'test-bucket', 'value': 'image2.jpg'},
            searchToken: const {},
            title: const {
              'languageCode': 'en',
              'negativeScore': 0.05,
              'positiveScore': 0.95,
              'sentiment': 'positive',
              'value': 'Test Post 2',
            },
            likeCount: 20,
          ),
        ];

        testUsers = [
          PublicUser(
            uid: 'user_1',
            bio: const {
              'languageCode': 'en',
              'negativeScore': 0.1,
              'positiveScore': 0.9,
              'sentiment': 'positive',
              'value': 'Bio for user 1',
            },
            createdAt: mockTimestamp,
            updatedAt: mockTimestamp,
            image: const {},
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
          PublicUser(
            uid: 'user_2',
            bio: const {
              'languageCode': 'en',
              'negativeScore': 0.1,
              'positiveScore': 0.9,
              'sentiment': 'positive',
              'value': 'Bio for user 2',
            },
            createdAt: mockTimestamp,
            updatedAt: mockTimestamp,
            image: const {},
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

      test('should return empty list when no posts provided', () async {
        final result = await postsUseCase.createUserPosts([]);
        expect(result, isEmpty);
      });

      test(
        'should create user posts with correct sorting by created date',
        () async {
          // Mock file use case to return base64 images
          when(
            mockFileUseCase.getObject('test-bucket', 'image1.jpg'),
          ).thenAnswer((_) async => 'base64_image_1');
          when(
            mockFileUseCase.getObject('test-bucket', 'image2.jpg'),
          ).thenAnswer((_) async => 'base64_image_2');

          // Add users to fake firestore
          for (final user in testUsers) {
            await fakeFirestore
                .collection('public')
                .doc('v1')
                .collection('users')
                .doc(user.uid)
                .set(user.toJson());
          }

          final result = await postsUseCase.createUserPosts(testPosts);

          expect(result, hasLength(2));
          // Should be sorted by created date (newest first)
          expect(result[0].post.postId, equals('post_2'));
          expect(result[1].post.postId, equals('post_1'));
          expect(result[0].base64, equals('base64_image_2'));
          expect(result[1].base64, equals('base64_image_1'));
          expect(result[0].user?.uid, equals('user_2'));
          expect(result[1].user?.uid, equals('user_1'));
        },
      );

      test(
        'should create user posts with correct sorting by like count when ranking',
        () async {
          when(
            mockFileUseCase.getObject('test-bucket', 'image1.jpg'),
          ).thenAnswer((_) async => 'base64_image_1');
          when(
            mockFileUseCase.getObject('test-bucket', 'image2.jpg'),
          ).thenAnswer((_) async => 'base64_image_2');

          for (final user in testUsers) {
            await fakeFirestore
                .collection('public')
                .doc('v1')
                .collection('users')
                .doc(user.uid)
                .set(user.toJson());
          }

          final result = await postsUseCase.createUserPosts(
            testPosts,
            isRankingPosts: true,
          );

          expect(result, hasLength(2));
          // Should be sorted by like count (highest first)
          expect(result[0].post.postId, equals('post_2')); // 20 likes
          expect(result[1].post.postId, equals('post_1')); // 10 likes
          expect(result[0].post.likeCount, equals(20));
          expect(result[1].post.likeCount, equals(10));
        },
      );

      test('should handle posts with missing users', () async {
        when(
          mockFileUseCase.getObject('test-bucket', 'image1.jpg'),
        ).thenAnswer((_) async => 'base64_image_1');

        // Only add one user to firestore
        await fakeFirestore
            .collection('public')
            .doc('v1')
            .collection('users')
            .doc(testUsers[0].uid)
            .set(testUsers[0].toJson());

        final result = await postsUseCase.createUserPosts(testPosts);

        // Should only return posts for users that exist
        expect(result, hasLength(1));
        expect(result[0].user?.uid, equals('user_1'));
        expect(result[0].post.postId, equals('post_1'));
      });

      test('should handle null image from file use case', () async {
        when(
          mockFileUseCase.getObject('test-bucket', 'image1.jpg'),
        ).thenAnswer((_) async => null);
        when(
          mockFileUseCase.getObject('test-bucket', 'image2.jpg'),
        ).thenAnswer((_) async => null);

        for (final user in testUsers) {
          await fakeFirestore
              .collection('public')
              .doc('v1')
              .collection('users')
              .doc(user.uid)
              .set(user.toJson());
        }

        final result = await postsUseCase.createUserPosts(testPosts);

        expect(result, hasLength(2));
        expect(result[0].base64, isNull);
        expect(result[1].base64, isNull);
      });

      test('should handle posts with empty image data', () async {
        final postsWithEmptyImages = [
          testPosts[0].copyWith(image: const {}),
          testPosts[1].copyWith(image: const {}),
        ];

        // Mock empty bucket name and value
        when(mockFileUseCase.getObject('', '')).thenAnswer((_) async => null);

        for (final user in testUsers) {
          await fakeFirestore
              .collection('public')
              .doc('v1')
              .collection('users')
              .doc(user.uid)
              .set(user.toJson());
        }

        final result = await postsUseCase.createUserPosts(postsWithEmptyImages);

        expect(result, hasLength(2));
        verify(mockFileUseCase.getObject('', '')).called(2);
      });

      test('should handle single post', () async {
        when(
          mockFileUseCase.getObject('test-bucket', 'image1.jpg'),
        ).thenAnswer((_) async => 'base64_image_1');

        await fakeFirestore
            .collection('public')
            .doc('v1')
            .collection('users')
            .doc(testUsers[0].uid)
            .set(testUsers[0].toJson());

        final result = await postsUseCase.createUserPosts([testPosts[0]]);

        expect(result, hasLength(1));
        expect(result[0].post.postId, equals('post_1'));
        expect(result[0].user?.uid, equals('user_1'));
        expect(result[0].base64, equals('base64_image_1'));
      });

      test('should handle posts with same like count', () async {
        final postsWithSameLikes = [
          testPosts[0].copyWith(likeCount: 15),
          testPosts[1].copyWith(likeCount: 15),
        ];

        when(
          mockFileUseCase.getObject('test-bucket', 'image1.jpg'),
        ).thenAnswer((_) async => 'base64_image_1');
        when(
          mockFileUseCase.getObject('test-bucket', 'image2.jpg'),
        ).thenAnswer((_) async => 'base64_image_2');

        for (final user in testUsers) {
          await fakeFirestore
              .collection('public')
              .doc('v1')
              .collection('users')
              .doc(user.uid)
              .set(user.toJson());
        }

        final result = await postsUseCase.createUserPosts(
          postsWithSameLikes,
          isRankingPosts: true,
        );

        expect(result, hasLength(2));
        // Both should have same like count
        expect(result[0].post.likeCount, equals(15));
        expect(result[1].post.likeCount, equals(15));
      });

      test('should handle posts with zero likes', () async {
        final postsWithZeroLikes = [
          testPosts[0].copyWith(likeCount: 0),
          testPosts[1].copyWith(likeCount: 0),
        ];

        when(
          mockFileUseCase.getObject('test-bucket', 'image1.jpg'),
        ).thenAnswer((_) async => 'base64_image_1');
        when(
          mockFileUseCase.getObject('test-bucket', 'image2.jpg'),
        ).thenAnswer((_) async => 'base64_image_2');

        for (final user in testUsers) {
          await fakeFirestore
              .collection('public')
              .doc('v1')
              .collection('users')
              .doc(user.uid)
              .set(user.toJson());
        }

        final result = await postsUseCase.createUserPosts(
          postsWithZeroLikes,
          isRankingPosts: true,
        );

        expect(result, hasLength(2));
        expect(result[0].post.likeCount, equals(0));
        expect(result[1].post.likeCount, equals(0));
      });
    });

    group('constructor', () {
      test('should create PostsUseCase with required dependencies', () {
        final useCase = PostsUseCase(
          repository: databaseRepository,
          fileUseCase: mockFileUseCase,
        );

        expect(useCase, isA<PostsUseCase>());
        expect(useCase.repository, equals(databaseRepository));
        expect(useCase.fileUseCase, equals(mockFileUseCase));
      });
    });
  });
}
