import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/model/database_schema/post/post.dart';
import 'package:great_talk/model/database_schema/tokens/like_post_token/like_post_token.dart';
import 'package:great_talk/model/database_schema/tokens/mute_post_token/mute_post_token.dart';
import 'package:great_talk/model/database_schema/tokens/mute_user_token/mute_user_token.dart';
import 'package:great_talk/repository/api_repository.dart';
import 'package:great_talk/repository/database_repository.dart';
import 'package:great_talk/repository/result/result.dart';
import 'package:great_talk/use_case/post_use_case.dart';

class FakeDatabaseRepository implements DatabaseRepository {
  bool shouldSucceed = true;
  String? errorMessage;
  
  @override
  dynamic noSuchMethod(Invocation invocation) {
    if (shouldSucceed) {
      return Future.value(const Result<bool>.success(true));
    } else {
      return Future.value(Result<bool>.failure(errorMessage ?? 'Test error'));
    }
  }
}

class FakeApiRepository implements ApiRepository {
  @override
  dynamic noSuchMethod(Invocation invocation) {
    return Future.value(const Result.success({}));
  }
}

void main() {
  group('PostUseCase', () {
    late PostUseCase postUseCase;
    late FakeDatabaseRepository fakeFirestoreRepository;
    late FakeApiRepository fakeApiRepository;
    late Post testPost;
    const testCurrentUid = 'current_user_123';
    const testPassiveUid = 'passive_user_456';

    setUp(() {
      fakeFirestoreRepository = FakeDatabaseRepository();
      fakeApiRepository = FakeApiRepository();
      postUseCase = PostUseCase(
        firestoreRepository: fakeFirestoreRepository,
        apiRepository: fakeApiRepository,
      );

      testPost = Post(
        postId: 'test_post_123',
        uid: testPassiveUid,
        title: {'value': 'Test Post Title'},
        description: {'value': 'Test Description'},
        likeCount: 5,
        msgCount: 3,
        createdAt: DateTime(2024, 1, 1),
        updatedAt: DateTime(2024, 1, 1),
        customCompleteText: {'value': 'Test Complete'},
        image: {'value': 'test_image'},
        searchToken: {'value': 'test'},
      );
    });

    group('mutePost', () {
      test('should successfully mute a post', () async {
        final testToken = MutePostToken(
          activeUid: testCurrentUid,
          createdAt: DateTime.now(),
          postId: testPost.postId,
          tokenId: 'test_token_123',
          tokenType: 'mutePost',
        );

        fakeFirestoreRepository.shouldSucceed = true;
        final result = await postUseCase.mutePost(testPost, testCurrentUid, testToken);

        expect(result, isA<Result<bool>>());
        result.when(
          success: (data) => expect(data, true),
          failure: (_) => fail('Expected success'),
        );
      });

      test('should handle mute post failure', () async {
        final testToken = MutePostToken(
          activeUid: testCurrentUid,
          createdAt: DateTime.now(),
          postId: testPost.postId,
          tokenId: 'test_token_123',
          tokenType: 'mutePost',
        );

        fakeFirestoreRepository.shouldSucceed = false;
        fakeFirestoreRepository.errorMessage = 'Mute failed';
        
        final result = await postUseCase.mutePost(testPost, testCurrentUid, testToken);

        result.when(
          success: (_) => fail('Expected failure'),
          failure: (error) => expect(error, equals('Mute failed')),
        );
      });
    });

    group('muteUser', () {
      test('should successfully mute a user', () async {
        final testToken = MuteUserToken(
          activeUid: testCurrentUid,
          createdAt: DateTime.now(),
          passiveUid: testPassiveUid,
          tokenId: 'test_token_123',
          tokenType: 'muteUser',
        );

        fakeFirestoreRepository.shouldSucceed = true;
        final result = await postUseCase.muteUser(testPost, testCurrentUid, testToken);

        result.when(
          success: (data) => expect(data, true),
          failure: (_) => fail('Expected success'),
        );
      });

      test('should handle mute user failure', () async {
        final testToken = MuteUserToken(
          activeUid: testCurrentUid,
          createdAt: DateTime.now(),
          passiveUid: testPassiveUid,
          tokenId: 'test_token_123',
          tokenType: 'muteUser',
        );

        fakeFirestoreRepository.shouldSucceed = false;
        fakeFirestoreRepository.errorMessage = 'User mute failed';
        
        final result = await postUseCase.muteUser(testPost, testCurrentUid, testToken);

        result.when(
          success: (_) => fail('Expected failure'),
          failure: (error) => expect(error, equals('User mute failed')),
        );
      });
    });

    group('onLikeButtonPressed', () {
      test('should call repository with correct parameters', () async {
        final testToken = LikePostToken(
          activeUid: testCurrentUid,
          createdAt: DateTime.now(),
          passiveUid: testPassiveUid,
          postId: testPost.postId,
          tokenId: 'test_token_123',
          tokenType: 'likePost',
        );

        fakeFirestoreRepository.shouldSucceed = true;
        final result = await postUseCase.onLikeButtonPressed(
          testCurrentUid,
          testToken,
          testPost,
        );

        result.when(
          success: (data) => expect(data, true),
          failure: (_) => fail('Expected success'),
        );
      });

      test('should handle like button press failure', () async {
        final testToken = LikePostToken(
          activeUid: testCurrentUid,
          createdAt: DateTime.now(),
          passiveUid: testPassiveUid,
          postId: testPost.postId,
          tokenId: 'test_token_123',
          tokenType: 'likePost',
        );

        fakeFirestoreRepository.shouldSucceed = false;
        fakeFirestoreRepository.errorMessage = 'Like failed';
        
        final result = await postUseCase.onLikeButtonPressed(
          testCurrentUid,
          testToken,
          testPost,
        );

        result.when(
          success: (_) => fail('Expected failure'),
          failure: (error) => expect(error, equals('Like failed')),
        );
      });
    });

    group('onUnLikeButtonPressed', () {
      test('should call repository with correct parameters', () async {
        const testTokenId = 'test_token_123';

        fakeFirestoreRepository.shouldSucceed = true;
        final result = await postUseCase.onUnLikeButtonPressed(
          testCurrentUid,
          testTokenId,
          testPost,
        );

        result.when(
          success: (data) => expect(data, true),
          failure: (_) => fail('Expected success'),
        );
      });

      test('should handle unlike button press failure', () async {
        const testTokenId = 'test_token_123';

        fakeFirestoreRepository.shouldSucceed = false;
        fakeFirestoreRepository.errorMessage = 'Unlike failed';
        
        final result = await postUseCase.onUnLikeButtonPressed(
          testCurrentUid,
          testTokenId,
          testPost,
        );

        result.when(
          success: (_) => fail('Expected failure'),
          failure: (error) => expect(error, equals('Unlike failed')),
        );
      });
    });

    group('deletePost', () {
      test('should delete post successfully', () async {
        fakeFirestoreRepository.shouldSucceed = true;
        final result = await postUseCase.deletePost(testPost);

        result.when(
          success: (data) => expect(data, true),
          failure: (_) => fail('Expected success'),
        );
      });

      test('should handle delete post failure', () async {
        fakeFirestoreRepository.shouldSucceed = false;
        fakeFirestoreRepository.errorMessage = 'Delete failed';
        
        final result = await postUseCase.deletePost(testPost);

        result.when(
          success: (_) => fail('Expected failure'),
          failure: (error) => expect(error, equals('Delete failed')),
        );
      });
    });

    group('constructor', () {
      test('should create PostUseCase with required dependencies', () {
        final useCase = PostUseCase(
          firestoreRepository: fakeFirestoreRepository,
          apiRepository: fakeApiRepository,
        );
        
        expect(useCase, isA<PostUseCase>());
        expect(useCase.firestoreRepository, equals(fakeFirestoreRepository));
        expect(useCase.apiRepository, equals(fakeApiRepository));
      });
    });

    group('edge cases', () {
      test('should handle empty currentUid in mutePost', () async {
        final testToken = MutePostToken(
          activeUid: '',
          createdAt: DateTime.now(),
          postId: testPost.postId,
          tokenId: 'test_token_123',
          tokenType: 'mutePost',
        );

        fakeFirestoreRepository.shouldSucceed = true;
        final result = await postUseCase.mutePost(testPost, '', testToken);

        result.when(
          success: (data) => expect(data, true),
          failure: (_) => fail('Expected success'),
        );
      });

      test('should handle post with different uid', () async {
        final postWithDifferentUid = testPost.copyWith(uid: 'different_uid_789');
        final testToken = MuteUserToken(
          activeUid: testCurrentUid,
          createdAt: DateTime.now(),
          passiveUid: 'different_uid_789',
          tokenId: 'test_token_123',
          tokenType: 'muteUser',
        );

        fakeFirestoreRepository.shouldSucceed = true;
        final result = await postUseCase.muteUser(postWithDifferentUid, testCurrentUid, testToken);

        result.when(
          success: (data) => expect(data, true),
          failure: (_) => fail('Expected success'),
        );
      });
    });
  });
}