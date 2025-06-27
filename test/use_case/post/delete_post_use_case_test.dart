import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/repository/api_repository.dart';
import 'package:great_talk/repository/result/result.dart';
import 'package:great_talk/application/use_case/post/delete_post_use_case.dart';
import 'package:great_talk/domain/entity/post/post.dart';
import 'package:great_talk/domain/entity/detected_image/detected_image.dart';
import 'package:great_talk/model/rest_api/delete_object/response/delete_object_response.dart';
import '../../repository/fake/fake_database_repository.dart';

// Using shared FakeDatabaseRepository

class FakeApiRepository implements ApiRepository {
  bool shouldSucceed = true;
  String? errorMessage;
  Map<String, dynamic> capturedArguments = {};
  List<String> deletedObjects = [];

  @override
  FutureResult<DeleteObjectResponse> deleteObject(DetectedImage image) async {
    capturedArguments = {
      'method': 'deleteObject',
      'image': image,
    };
    
    if (shouldSucceed) {
      deletedObjects.add(image.value);
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
    late FakeDatabaseRepository fakeDatabaseRepository;
    late FakeApiRepository fakeApiRepository;

    setUp(() {
      fakeDatabaseRepository = FakeDatabaseRepository();
      fakeApiRepository = FakeApiRepository();
      deletePostUseCase = DeletePostUseCase(
        firestoreRepository: fakeDatabaseRepository,
        apiRepository: fakeApiRepository,
      );
    });

    group('deletePost', () {
      late Post testPost;

      setUp(() {
        testPost = const Post(
          postId: 'test_post_id',
          uid: 'test_post_owner_uid',
          createdAt: 'test_timestamp',
          customCompleteText: {},
          description: {},
          image: {
            'value': 'test_image.jpg',
            'bucketName': 'test_bucket',
            'moderationLabels': [],
            'moderationModelVersion': 'test_version',
          },
          searchToken: {},
          title: {},
          updatedAt: 'test_timestamp',
        );
      });

      test('should return success when deleting post succeeds', () async {
        fakeDatabaseRepository.shouldSucceed = true;
        fakeApiRepository.shouldSucceed = true;

        final result = await deletePostUseCase.deletePost(testPost);

        expect(result, isA<Result<bool>>());
        result.when(
          success: (value) => expect(value, isTrue),
          failure: (error) => fail('Expected success but got failure: $error'),
        );
      });

      test('should return failure when database operation fails', () async {
        const expectedError = 'Database deletion failed';
        fakeDatabaseRepository.shouldSucceed = false;
        fakeDatabaseRepository.errorMessage = expectedError;
        fakeApiRepository.shouldSucceed = true;

        final result = await deletePostUseCase.deletePost(testPost);

        expect(result, isA<Result<bool>>());
        result.when(
          success: (value) => fail('Expected failure but got success: $value'),
          failure: (error) => expect(error, equals(expectedError)),
        );
      });

      test('should call deletePost on database repository', () async {
        fakeDatabaseRepository.shouldSucceed = true;
        fakeApiRepository.shouldSucceed = true;

        await deletePostUseCase.deletePost(testPost);

        final capturedArgs = fakeDatabaseRepository.capturedArguments;
        expect(capturedArgs['method'], equals('deletePost'));
        expect(capturedArgs['post'], equals(testPost));
      });

      test('should delete associated image when database deletion succeeds', () async {
        fakeDatabaseRepository.shouldSucceed = true;
        fakeApiRepository.shouldSucceed = true;

        await deletePostUseCase.deletePost(testPost);

        final capturedArgs = fakeApiRepository.capturedArguments;
        expect(capturedArgs['method'], equals('deleteObject'));
        expect(capturedArgs['image'], isA<DetectedImage>());
        expect(fakeApiRepository.deletedObjects, contains('test_image.jpg'));
      });

      test('should not delete image when database deletion fails', () async {
        fakeDatabaseRepository.shouldSucceed = false;
        fakeApiRepository.shouldSucceed = true;

        await deletePostUseCase.deletePost(testPost);

        expect(fakeApiRepository.capturedArguments.isEmpty, isTrue);
        expect(fakeApiRepository.deletedObjects, isEmpty);
      });

      test('should still return success even if image deletion fails', () async {
        fakeDatabaseRepository.shouldSucceed = true;
        fakeApiRepository.shouldSucceed = false;
        fakeApiRepository.errorMessage = 'S3 deletion failed';

        final result = await deletePostUseCase.deletePost(testPost);

        expect(result, isA<Result<bool>>());
        result.when(
          success: (value) => expect(value, isTrue),
          failure: (error) => fail('Expected success but got failure: $error'),
        );
      });

      test('should handle post with empty image data', () async {
        final postWithEmptyImage = testPost.copyWith(
          image: {},
        );
        
        fakeDatabaseRepository.shouldSucceed = true;
        fakeApiRepository.shouldSucceed = true;

        final result = await deletePostUseCase.deletePost(postWithEmptyImage);

        expect(result, isA<Result<bool>>());
        result.when(
          success: (value) => expect(value, isTrue),
          failure: (error) => fail('Expected success but got failure: $error'),
        );
      });

      test('should handle post with null image value', () async {
        final postWithNullFileName = testPost.copyWith(
          image: {
            'value': null,
            'bucketName': 'test_bucket',
            'moderationLabels': [],
            'moderationModelVersion': 'test_version',
          },
        );
        
        fakeDatabaseRepository.shouldSucceed = true;
        fakeApiRepository.shouldSucceed = true;

        final result = await deletePostUseCase.deletePost(postWithNullFileName);

        expect(result, isA<Result<bool>>());
        result.when(
          success: (value) => expect(value, isTrue),
          failure: (error) => fail('Expected success but got failure: $error'),
        );
      });

      test('should handle post with different image configurations', () async {
        final postWithDifferentImage = testPost.copyWith(
          image: {
            'value': 'different_image.png',
            'bucketName': 'different_bucket',
            'moderationLabels': [],
            'moderationModelVersion': 'test_version',
          },
        );
        
        fakeDatabaseRepository.shouldSucceed = true;
        fakeApiRepository.shouldSucceed = true;

        final result = await deletePostUseCase.deletePost(postWithDifferentImage);

        expect(result, isA<Result<bool>>());
        result.when(
          success: (value) => expect(value, isTrue),
          failure: (error) => fail('Expected success but got failure: $error'),
        );

        expect(fakeApiRepository.deletedObjects, contains('different_image.png'));
      });

      test('should handle posts with high counts', () async {
        final postWithHighCounts = testPost.copyWith(
          likeCount: 9999,
          muteCount: 100,
          reportCount: 50,
          msgCount: 1000,
          userCount: 500,
          impressionCount: 10000,
          bookmarkCount: 200,
        );
        
        fakeDatabaseRepository.shouldSucceed = true;
        fakeApiRepository.shouldSucceed = true;

        final result = await deletePostUseCase.deletePost(postWithHighCounts);

        expect(result, isA<Result<bool>>());
        result.when(
          success: (value) => expect(value, isTrue),
          failure: (error) => fail('Expected success but got failure: $error'),
        );
      });
    });

    group('constructor', () {
      test('should create DeletePostUseCase with required dependencies', () {
        final useCase = DeletePostUseCase(
          firestoreRepository: fakeDatabaseRepository,
          apiRepository: fakeApiRepository,
        );

        expect(useCase, isA<DeletePostUseCase>());
        expect(useCase.firestoreRepository, equals(fakeDatabaseRepository));
        expect(useCase.apiRepository, equals(fakeApiRepository));
      });
    });

    group('error handling', () {
      late Post testPost;

      setUp(() {
        testPost = const Post(
          postId: 'test_post_id',
          uid: 'test_post_owner_uid',
          createdAt: 'test_timestamp',
          customCompleteText: {},
          description: {},
          image: {
            'value': 'test_image.jpg',
            'bucketName': 'test_bucket',
            'moderationLabels': [],
            'moderationModelVersion': 'test_version',
          },
          searchToken: {},
          title: {},
          updatedAt: 'test_timestamp',
        );
      });

      test('should handle network timeout errors', () async {
        const timeoutError = 'Network timeout';
        fakeDatabaseRepository.shouldSucceed = false;
        fakeDatabaseRepository.errorMessage = timeoutError;

        final result = await deletePostUseCase.deletePost(testPost);

        result.when(
          success: (value) => fail('Expected failure but got success'),
          failure: (error) => expect(error, equals(timeoutError)),
        );
      });

      test('should handle permission denied errors', () async {
        const permissionError = 'Permission denied';
        fakeDatabaseRepository.shouldSucceed = false;
        fakeDatabaseRepository.errorMessage = permissionError;

        final result = await deletePostUseCase.deletePost(testPost);

        result.when(
          success: (value) => fail('Expected failure but got success'),
          failure: (error) => expect(error, equals(permissionError)),
        );
      });

      test('should handle post not found errors', () async {
        const notFoundError = 'Post not found';
        fakeDatabaseRepository.shouldSucceed = false;
        fakeDatabaseRepository.errorMessage = notFoundError;

        final result = await deletePostUseCase.deletePost(testPost);

        result.when(
          success: (value) => fail('Expected failure but got success'),
          failure: (error) => expect(error, equals(notFoundError)),
        );
      });

      test('should handle dependency conflicts', () async {
        const conflictError = 'Post has dependencies and cannot be deleted';
        fakeDatabaseRepository.shouldSucceed = false;
        fakeDatabaseRepository.errorMessage = conflictError;

        final result = await deletePostUseCase.deletePost(testPost);

        result.when(
          success: (value) => fail('Expected failure but got success'),
          failure: (error) => expect(error, equals(conflictError)),
        );
      });

      test('should handle S3 deletion errors gracefully', () async {
        fakeDatabaseRepository.shouldSucceed = true;
        fakeApiRepository.shouldSucceed = false;
        fakeApiRepository.errorMessage = 'S3 service unavailable';

        final result = await deletePostUseCase.deletePost(testPost);

        // Should still succeed even if S3 deletion fails
        result.when(
          success: (value) => expect(value, isTrue),
          failure: (error) => fail('Expected success but got failure: $error'),
        );
      });

      test('should handle database errors after successful image deletion', () async {
        const databaseError = 'Database transaction failed';
        fakeDatabaseRepository.shouldSucceed = false;
        fakeDatabaseRepository.errorMessage = databaseError;
        fakeApiRepository.shouldSucceed = true;

        final result = await deletePostUseCase.deletePost(testPost);

        result.when(
          success: (value) => fail('Expected failure but got success'),
          failure: (error) => expect(error, equals(databaseError)),
        );

        // Image deletion should not be called when database fails first
        expect(fakeApiRepository.capturedArguments.isEmpty, isTrue);
      });
    });

    group('edge cases', () {
      test('should handle concurrent deletion attempts', () async {
        final post = const Post(
          postId: 'concurrent_test_post',
          uid: 'owner_uid',
          createdAt: 'test_timestamp',
          customCompleteText: {},
          description: {},
          image: {
            'value': 'concurrent_image.jpg',
            'bucketName': 'test_bucket',
            'moderationLabels': [],
            'moderationModelVersion': 'test_version',
          },
          searchToken: {},
          title: {},
          updatedAt: 'test_timestamp',
        );

        fakeDatabaseRepository.shouldSucceed = true;
        fakeApiRepository.shouldSucceed = true;

        final future1 = deletePostUseCase.deletePost(post);
        final future2 = deletePostUseCase.deletePost(post);

        final results = await Future.wait([future1, future2]);

        for (final result in results) {
          expect(result, isA<Result<bool>>());
          result.when(
            success: (value) => expect(value, isTrue),
            failure: (error) => fail('Expected success but got failure: $error'),
          );
        }
      });

      test('should handle posts with special characters in image value', () async {
        final postWithSpecialChars = const Post(
          postId: 'special_chars_post',
          uid: 'owner_uid',
          createdAt: 'test_timestamp',
          customCompleteText: {},
          description: {},
          image: {
            'value': 'image@#\$%^&*()_+.jpg',
            'bucketName': 'test_bucket',
            'moderationLabels': [],
            'moderationModelVersion': 'test_version',
          },
          searchToken: {},
          title: {},
          updatedAt: 'test_timestamp',
        );

        fakeDatabaseRepository.shouldSucceed = true;
        fakeApiRepository.shouldSucceed = true;

        final result = await deletePostUseCase.deletePost(postWithSpecialChars);

        expect(result, isA<Result<bool>>());
        result.when(
          success: (value) => expect(value, isTrue),
          failure: (error) => fail('Expected success but got failure: $error'),
        );

        expect(fakeApiRepository.deletedObjects, contains('image@#\$%^&*()_+.jpg'));
      });

      test('should handle posts with very long image values', () async {
        final longFileName = 'very_long_file_name_' * 10 + '.jpg';
        final postWithLongFileName = Post(
          postId: 'long_filename_post',
          uid: 'owner_uid',
          createdAt: 'test_timestamp',
          customCompleteText: const {},
          description: const {},
          image: {
            'value': longFileName,
            'bucketName': 'test_bucket',
            'moderationLabels': [],
            'moderationModelVersion': 'test_version',
          },
          searchToken: const {},
          title: const {},
          updatedAt: 'test_timestamp',
        );

        fakeDatabaseRepository.shouldSucceed = true;
        fakeApiRepository.shouldSucceed = true;

        final result = await deletePostUseCase.deletePost(postWithLongFileName);

        expect(result, isA<Result<bool>>());
        result.when(
          success: (value) => expect(value, isTrue),
          failure: (error) => fail('Expected success but got failure: $error'),
        );

        expect(fakeApiRepository.deletedObjects, contains(longFileName));
      });
    });
  });
}