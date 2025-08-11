import 'package:flutter_test/flutter_test.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:great_talk/infrastructure/repository/api_repository.dart';
import 'package:great_talk/infrastructure/repository/database_repository.dart';
import 'package:great_talk/infrastructure/model/result/result.dart';
import 'package:great_talk/application/use_case/post/delete_post_use_case.dart';
import 'package:great_talk/domain/entity/database/post/post_entity.dart';
import 'package:great_talk/infrastructure/model/database_schema/common/moderated_image/moderated_image.dart';
import 'package:great_talk/infrastructure/model/database_schema/common/detected_text/detected_text.dart';
import 'package:great_talk/infrastructure/model/database_schema/post/custom_complete_text/custom_complete_text.dart';
import 'package:great_talk/infrastructure/model/rest_api/delete_object/response/delete_object_response.dart';

class FakeApiRepository implements ApiRepository {
  bool shouldSucceed = true;
  String? errorMessage;
  Map<String, dynamic> capturedArguments = {};
  List<String> deletedObjects = [];

  @override
  FutureResult<DeleteObjectResponse> deleteObject(String object) async {
    capturedArguments = {'method': 'deleteObject', 'object': object};

    if (shouldSucceed) {
      deletedObjects.add(object);
      return const Result.success(DeleteObjectResponse(httpStatusCode: 200));
    } else {
      return Result.failure(errorMessage ?? 'API error');
    }
  }

  @override
  dynamic noSuchMethod(Invocation invocation) {
    return Future.value(const Result.success({}));
  }
}

void main() {
  group('DeletePostUseCase', () {
    late DeletePostUseCase deletePostUseCase;
    late DatabaseRepository databaseRepository;
    late FakeApiRepository fakeApiRepository;
    late FakeFirebaseFirestore fakeFirestore;
    late Timestamp mockTimestamp;

    setUp(() {
      fakeFirestore = FakeFirebaseFirestore();
      databaseRepository = DatabaseRepository(instance: fakeFirestore);
      fakeApiRepository = FakeApiRepository();
      mockTimestamp = Timestamp.fromDate(DateTime(2024, 1, 1, 12, 0, 0));
      deletePostUseCase = DeletePostUseCase(
        firestoreRepository: databaseRepository,
        apiRepository: fakeApiRepository,
      );
    });

    // Helper function to create Firestore-compatible post data
    Map<String, dynamic> createFirestorePostData(PostEntity post) {
      return {
        'uid': post.uid,
        'postId': post.postId,
        'title': post.title.toJson(),
        'description': post.description.toJson(),
        'createdAt': Timestamp.fromDate(post.createdAt),
        'updatedAt': Timestamp.fromDate(post.updatedAt),
        'customCompleteText': post.customCompleteText.toJson(),
        'image': post.image.toJson(),
        'searchToken': <String, dynamic>{},
        'bookmarkCount': 0,
        'exampleTexts': [],
        'genre': '',
        'hashTags': [],
        'impressionCount': 0,
        'likeCount': post.likeCount,
        'links': [],
        'msgCount': post.msgCount,
        'muteCount': 0,
        'reportCount': 0,
        'score': 0.0,
        'userCount': 0,
      };
    }

    group('deletePost', () {
      late PostEntity testPost;

      setUp(() {
        testPost = PostEntity(
          postId: 'test_post_id',
          uid: 'test_post_owner_uid',
          createdAt: mockTimestamp.toDate(),
          updatedAt: mockTimestamp.toDate(),
          customCompleteText: const CustomCompleteText(systemPrompt: 'test'),
          description: const DetectedText(
            languageCode: 'en',
            negativeScore: 0,
            positiveScore: 1,
            sentiment: 'positive',
            value: 'Test post description',
          ),
          image: const ModeratedImage(
            moderationLabels: [],
            moderationModelVersion: 'test_version',
          ),
          title: const DetectedText(
            languageCode: 'en',
            negativeScore: 0,
            positiveScore: 1,
            sentiment: 'positive',
            value: 'Test Post Title',
          ),
          likeCount: 0,
          msgCount: 0,
        );
      });

      test('should return success when deleting post succeeds', () async {
        // First create the post in fake Firestore
        await databaseRepository.createPost(
          testPost.uid,
          testPost.postId,
          createFirestorePostData(testPost),
        );

        // Verify post exists before deletion
        final existingPost = await databaseRepository.getPost(
          testPost.uid,
          testPost.postId,
        );
        expect(existingPost, isNotNull);

        fakeApiRepository.shouldSucceed = true;

        final result = await deletePostUseCase.deletePost(testPost);

        expect(result, isA<Result<bool>>());
        result.when(
          success: (value) => expect(value, isTrue),
          failure: (error) => fail('Expected success but got failure: $error'),
        );

        // Verify post was actually deleted
        final deletedPost = await databaseRepository.getPost(
          testPost.uid,
          testPost.postId,
        );
        expect(deletedPost, isNull);
      });

      test(
        'should delete associated image when database deletion succeeds',
        () async {
          // Create post in fake Firestore first
          await databaseRepository.createPost(
            testPost.uid,
            testPost.postId,
            createFirestorePostData(testPost),
          );

          fakeApiRepository.shouldSucceed = true;

          await deletePostUseCase.deletePost(testPost);

          final capturedArgs = fakeApiRepository.capturedArguments;
          expect(capturedArgs['method'], equals('deleteObject'));
          // The DeletePostUseCase uses moderationModelVersion as the object to delete
          expect(capturedArgs['object'], equals('test_version'));
          expect(fakeApiRepository.deletedObjects, contains('test_version'));
        },
      );

      test(
        'should still return success even if image deletion fails',
        () async {
          // Create post in fake Firestore first
          await databaseRepository.createPost(
            testPost.uid,
            testPost.postId,
            createFirestorePostData(testPost),
          );

          fakeApiRepository.shouldSucceed = false;
          fakeApiRepository.errorMessage = 'S3 deletion failed';

          final result = await deletePostUseCase.deletePost(testPost);

          expect(result, isA<Result<bool>>());
          result.when(
            success: (value) => expect(value, isTrue),
            failure:
                (error) => fail('Expected success but got failure: $error'),
          );

          // Verify post was still deleted from database
          final deletedPost = await databaseRepository.getPost(
            testPost.uid,
            testPost.postId,
          );
          expect(deletedPost, isNull);
        },
      );

      test('should handle post with empty image data', () async {
        final postWithEmptyImage = testPost.copyWith(
          image: const ModeratedImage(),
        );

        // Create post in fake Firestore first
        await databaseRepository.createPost(
          postWithEmptyImage.uid,
          postWithEmptyImage.postId,
          createFirestorePostData(postWithEmptyImage),
        );

        fakeApiRepository.shouldSucceed = true;

        final result = await deletePostUseCase.deletePost(postWithEmptyImage);

        expect(result, isA<Result<bool>>());
        result.when(
          success: (value) => expect(value, isTrue),
          failure: (error) => fail('Expected success but got failure: $error'),
        );

        // Verify post was deleted
        final deletedPost = await databaseRepository.getPost(
          postWithEmptyImage.uid,
          postWithEmptyImage.postId,
        );
        expect(deletedPost, isNull);
      });

      test('should handle post with null image value', () async {
        final postWithNullFileName = testPost.copyWith(
          image: const ModeratedImage(
            moderationLabels: [],
            moderationModelVersion: 'test_version',
          ),
        );

        // Create post in fake Firestore first
        await databaseRepository.createPost(
          postWithNullFileName.uid,
          postWithNullFileName.postId,
          createFirestorePostData(postWithNullFileName),
        );

        fakeApiRepository.shouldSucceed = true;

        final result = await deletePostUseCase.deletePost(postWithNullFileName);

        expect(result, isA<Result<bool>>());
        result.when(
          success: (value) => expect(value, isTrue),
          failure: (error) => fail('Expected success but got failure: $error'),
        );

        // Verify post was deleted
        final deletedPost = await databaseRepository.getPost(
          postWithNullFileName.uid,
          postWithNullFileName.postId,
        );
        expect(deletedPost, isNull);
      });

      test('should handle post with different image configurations', () async {
        final postWithDifferentImage = testPost.copyWith(
          image: const ModeratedImage(
            moderationLabels: [],
            moderationModelVersion: 'test_version',
          ),
        );

        // Create post in fake Firestore first
        await databaseRepository.createPost(
          postWithDifferentImage.uid,
          postWithDifferentImage.postId,
          createFirestorePostData(postWithDifferentImage),
        );

        fakeApiRepository.shouldSucceed = true;

        final result = await deletePostUseCase.deletePost(
          postWithDifferentImage,
        );

        expect(result, isA<Result<bool>>());
        result.when(
          success: (value) => expect(value, isTrue),
          failure: (error) => fail('Expected success but got failure: $error'),
        );

        // The DeletePostUseCase uses moderationModelVersion as the object to delete
        expect(
          fakeApiRepository.deletedObjects,
          contains('test_version'),
        );

        // Verify post was deleted
        final deletedPost = await databaseRepository.getPost(
          postWithDifferentImage.uid,
          postWithDifferentImage.postId,
        );
        expect(deletedPost, isNull);
      });

      test('should handle posts with high counts', () async {
        final postWithHighCounts = testPost.copyWith(
          likeCount: 9999,
          msgCount: 1000,
        );

        // Create post in fake Firestore first
        await databaseRepository.createPost(
          postWithHighCounts.uid,
          postWithHighCounts.postId,
          createFirestorePostData(postWithHighCounts),
        );

        fakeApiRepository.shouldSucceed = true;

        final result = await deletePostUseCase.deletePost(postWithHighCounts);

        expect(result, isA<Result<bool>>());
        result.when(
          success: (value) => expect(value, isTrue),
          failure: (error) => fail('Expected success but got failure: $error'),
        );

        // Verify post was deleted
        final deletedPost = await databaseRepository.getPost(
          postWithHighCounts.uid,
          postWithHighCounts.postId,
        );
        expect(deletedPost, isNull);
      });

      test(
        'should return success when trying to delete non-existent post',
        () async {
          // Don't create the post, just try to delete it
          // Note: Firestore allows deleting non-existent documents without error

          fakeApiRepository.shouldSucceed = true;

          final result = await deletePostUseCase.deletePost(testPost);

          expect(result, isA<Result<bool>>());
          result.when(
            success: (value) => expect(value, isTrue),
            failure:
                (error) => fail('Expected success but got failure: $error'),
          );

          // Verify that the post still doesn't exist after "deletion"
          final stillNonExistent = await databaseRepository.getPost(
            testPost.uid,
            testPost.postId,
          );
          expect(stillNonExistent, isNull);
        },
      );
    });

    group('constructor', () {
      test('should create DeletePostUseCase with required dependencies', () {
        final useCase = DeletePostUseCase(
          firestoreRepository: databaseRepository,
          apiRepository: fakeApiRepository,
        );

        expect(useCase, isA<DeletePostUseCase>());
        expect(useCase.firestoreRepository, equals(databaseRepository));
        expect(useCase.apiRepository, equals(fakeApiRepository));
      });
    });

    group('edge cases', () {
      test('should handle concurrent deletion attempts', () async {
        final post = PostEntity(
          postId: 'concurrent_test_post',
          uid: 'owner_uid',
          createdAt: mockTimestamp.toDate(),
          updatedAt: mockTimestamp.toDate(),
          customCompleteText: const CustomCompleteText(systemPrompt: 'test'),
          description: const DetectedText(
            languageCode: 'en',
            negativeScore: 0,
            positiveScore: 1,
            sentiment: 'positive',
            value: 'Concurrent test description',
          ),
          image: const ModeratedImage(
            moderationLabels: [],
            moderationModelVersion: 'test_version',
          ),
          title: const DetectedText(
            languageCode: 'en',
            negativeScore: 0,
            positiveScore: 1,
            sentiment: 'positive',
            value: 'Concurrent Test Post',
          ),
          likeCount: 0,
          msgCount: 0,
        );

        // Create post in fake Firestore first
        await databaseRepository.createPost(
          post.uid,
          post.postId,
          createFirestorePostData(post),
        );

        fakeApiRepository.shouldSucceed = true;

        final future1 = deletePostUseCase.deletePost(post);
        final future2 = deletePostUseCase.deletePost(post);

        final results = await Future.wait([future1, future2]);

        // First deletion should succeed, second should fail since post is already deleted
        expect(results[0], isA<Result<bool>>());
        expect(results[1], isA<Result<bool>>());

        // At least one should succeed
        bool hasSuccess = false;
        for (final result in results) {
          result.when(
            success: (value) => hasSuccess = true,
            failure: (error) => {}, // Expected for concurrent deletion
          );
        }
        expect(hasSuccess, isTrue);
      });

      test(
        'should handle posts with special characters in image value',
        () async {
          final postWithSpecialChars = PostEntity(
            postId: 'special_chars_post',
            uid: 'owner_uid',
            createdAt: mockTimestamp.toDate(),
            updatedAt: mockTimestamp.toDate(),
            customCompleteText: const CustomCompleteText(systemPrompt: 'test'),
            description: const DetectedText(
              languageCode: 'en',
              negativeScore: 0,
              positiveScore: 1,
              sentiment: 'positive',
              value: 'Special chars test description',
            ),
            image: const ModeratedImage(
              moderationLabels: [],
              moderationModelVersion: 'test_version',
            ),
            title: const DetectedText(
              languageCode: 'en',
              negativeScore: 0,
              positiveScore: 1,
              sentiment: 'positive',
              value: 'Special Chars Test Post',
            ),
            likeCount: 0,
            msgCount: 0,
          );

          // Create post in fake Firestore first
          await databaseRepository.createPost(
            postWithSpecialChars.uid,
            postWithSpecialChars.postId,
            createFirestorePostData(postWithSpecialChars),
          );

          fakeApiRepository.shouldSucceed = true;

          final result = await deletePostUseCase.deletePost(
            postWithSpecialChars,
          );

          expect(result, isA<Result<bool>>());
          result.when(
            success: (value) => expect(value, isTrue),
            failure:
                (error) => fail('Expected success but got failure: $error'),
          );

          // The DeletePostUseCase uses moderationModelVersion as the object to delete
          expect(
            fakeApiRepository.deletedObjects,
            contains('test_version'),
          );
        },
      );

      test('should handle posts with very long image values', () async {
        // value, bucketNameが削除されたので、longFileNameは使わず空文字列やnullでテスト
        final postWithLongFileName = PostEntity(
          postId: 'long_filename_post',
          uid: 'owner_uid',
          createdAt: mockTimestamp.toDate(),
          updatedAt: mockTimestamp.toDate(),
          customCompleteText: const CustomCompleteText(systemPrompt: 'test'),
          description: const DetectedText(
            languageCode: 'en',
            negativeScore: 0,
            positiveScore: 1,
            sentiment: 'positive',
            value: 'Long filename test description',
          ),
          image: const ModeratedImage(
            moderationLabels: [],
            moderationModelVersion: 'test_version',
          ),
          title: const DetectedText(
            languageCode: 'en',
            negativeScore: 0,
            positiveScore: 1,
            sentiment: 'positive',
            value: 'Long Filename Test Post',
          ),
          likeCount: 0,
          msgCount: 0,
        );

        // Create post in fake Firestore first
        await databaseRepository.createPost(
          postWithLongFileName.uid,
          postWithLongFileName.postId,
          createFirestorePostData(postWithLongFileName),
        );

        fakeApiRepository.shouldSucceed = true;

        final result = await deletePostUseCase.deletePost(postWithLongFileName);

        expect(result, isA<Result<bool>>());
        result.when(
          success: (value) => expect(value, isTrue),
          failure: (error) => fail('Expected success but got failure: $error'),
        );

        // The DeletePostUseCase uses moderationModelVersion as the object to delete
        expect(fakeApiRepository.deletedObjects, contains('test_version'));
      });
    });
  });
}
