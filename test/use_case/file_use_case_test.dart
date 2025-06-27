import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/model/rest_api/get_object/request/get_object_request.dart';
import 'package:great_talk/repository/local_repository.dart';
import 'package:great_talk/repository/api_repository.dart';
import 'package:great_talk/repository/result/result.dart';
import 'package:great_talk/application/use_case/file/file_use_case.dart';

class FakeLocalRepository implements LocalRepository {
  final Map<String, String> _cache = {};
  bool shouldThrowError = false;

  @override
  String? getImage(String key) {
    if (shouldThrowError) {
      throw Exception('Cache read error');
    }
    return _cache[key];
  }

  @override
  Future<bool> setImage(String key, String value) async {
    _cache[key] = value;
    return true;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) {
    return null;
  }
}

class FakeApiRepository implements ApiRepository {
  bool shouldSucceed = true;
  String? errorMessage;
  String? responseData;

  @override
  Future<Result<String>> getObject(GetObjectRequest request) async {
    if (shouldSucceed && responseData != null) {
      return Result.success(responseData!);
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
  group('FileUseCase', () {
    late FileUseCase fileUseCase;
    late FakeLocalRepository fakeLocalRepository;
    late FakeApiRepository fakeApiRepository;

    setUp(() {
      fakeLocalRepository = FakeLocalRepository();
      fakeApiRepository = FakeApiRepository();
      fileUseCase = FileUseCase(
        localRepository: fakeLocalRepository,
        repository: fakeApiRepository,
      );
    });

    group('getS3Image', () {
      const testFileName = 'test_image.jpg';
      const testBucketName = 'test_bucket';
      const testImageData = 'base64encodedimagedata';

      test('should return null when fileName is empty', () async {
        final result = await fileUseCase.getObject(testBucketName, '');

        expect(result, isNull);
      });

      test('should return cached image when available', () async {
        fakeLocalRepository._cache[testFileName] = testImageData;

        final result = await fileUseCase.getObject(
          testBucketName,
          testFileName,
        );

        expect(result, equals(testImageData));
      });

      test(
        'should fetch from S3 when not cached and cache the result',
        () async {
          fakeApiRepository.shouldSucceed = true;
          fakeApiRepository.responseData = testImageData;

          final result = await fileUseCase.getObject(
            testBucketName,
            testFileName,
          );

          expect(result, equals(testImageData));
          expect(
            fakeLocalRepository._cache[testFileName],
            equals(testImageData),
          );
        },
      );

      test('should return null when S3 fetch fails', () async {
        fakeApiRepository.shouldSucceed = false;
        fakeApiRepository.errorMessage = 'Network error';

        final result = await fileUseCase.getObject(
          testBucketName,
          testFileName,
        );

        expect(result, isNull);
        expect(fakeLocalRepository._cache.containsKey(testFileName), false);
      });
    });

    group('constructor', () {
      test('should create FileUseCase with required dependencies', () {
        final useCase = FileUseCase(
          localRepository: fakeLocalRepository,
          repository: fakeApiRepository,
        );

        expect(useCase, isA<FileUseCase>());
        expect(useCase.localRepository, equals(fakeLocalRepository));
        expect(useCase.repository, equals(fakeApiRepository));
      });
    });

    group('caching behavior', () {
      const testFileName = 'cache_test.jpg';
      const testBucketName = 'test_bucket';
      const testImageData = 'cached_image_data';

      test('should use cache on second call for same file', () async {
        fakeApiRepository.shouldSucceed = true;
        fakeApiRepository.responseData = testImageData;

        // First call - should fetch from API and cache
        final firstResult = await fileUseCase.getObject(
          testBucketName,
          testFileName,
        );
        expect(firstResult, equals(testImageData));

        // Reset API to fail to ensure cache is used
        fakeApiRepository.shouldSucceed = false;

        // Second call - should use cache
        final secondResult = await fileUseCase.getObject(
          testBucketName,
          testFileName,
        );
        expect(secondResult, equals(testImageData));
      });
    });

    group('error handling', () {
      const testFileName = 'error_test.jpg';
      const testBucketName = 'test_bucket';

      test('should handle cache read errors gracefully', () async {
        fakeLocalRepository.shouldThrowError = true;

        expect(
          () => fileUseCase.getObject(testBucketName, testFileName),
          throwsA(isA<Exception>()),
        );
      });

      test('should handle API errors and return null', () async {
        fakeApiRepository.shouldSucceed = false;
        fakeApiRepository.errorMessage = 'API error';

        final result = await fileUseCase.getObject(
          testBucketName,
          testFileName,
        );

        expect(result, isNull);
      });
    });

    group('edge cases', () {
      test('should handle empty bucket name', () async {
        const result = 'test_data';
        fakeLocalRepository._cache['test.jpg'] = result;

        final actual = await fileUseCase.getObject('', 'test.jpg');

        expect(actual, equals(result));
      });

      test('should handle special characters in fileName', () async {
        const specialFileName = 'test@#\$%^&*().jpg';
        const testData = 'special_char_data';

        fakeLocalRepository._cache[specialFileName] = testData;

        final result = await fileUseCase.getObject('bucket', specialFileName);

        expect(result, equals(testData));
      });
    });
  });
}
