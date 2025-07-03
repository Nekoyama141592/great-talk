import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/core/util/tokens_util.dart';

// Test model classes
class MockToken {
  const MockToken({
    required this.id,
    required this.postId,
    required this.passiveUid,
    required this.tokenId,
    required this.name,
  });

  final String id;
  final String postId;
  final String passiveUid;
  final String tokenId;
  final String name;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MockToken &&
        other.id == id &&
        other.postId == postId &&
        other.passiveUid == passiveUid &&
        other.tokenId == tokenId &&
        other.name == name;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        postId.hashCode ^
        passiveUid.hashCode ^
        tokenId.hashCode ^
        name.hashCode;
  }

  @override
  String toString() {
    return 'MockToken(id: $id, postId: $postId, passiveUid: $passiveUid, tokenId: $tokenId, name: $name)';
  }
}

void main() {
  group('TokensUtil', () {
    late List<MockToken> testTokens;
    late MockToken token1;
    late MockToken token2;
    late MockToken token3;

    setUp(() {
      token1 = const MockToken(
        id: '1',
        postId: 'post1',
        passiveUid: 'user1',
        tokenId: 'token1',
        name: 'First Token',
      );
      token2 = const MockToken(
        id: '2',
        postId: 'post2',
        passiveUid: 'user2',
        tokenId: 'token2',
        name: 'Second Token',
      );
      token3 = const MockToken(
        id: '3',
        postId: 'post1', // Same postId as token1
        passiveUid: 'user3',
        tokenId: 'token3',
        name: 'Third Token',
      );
      testTokens = [token1, token2, token3];
    });

    group('addToTokenList', () {
      test('should add token to empty list', () {
        const List<MockToken> emptyList = [];
        
        final result = TokensUtil.addToTokenList(emptyList, token1);
        
        expect(result, hasLength(1));
        expect(result.first, equals(token1));
      });

      test('should add token to existing list', () {
        final initialList = [token1, token2];
        
        final result = TokensUtil.addToTokenList(initialList, token3);
        
        expect(result, hasLength(3));
        expect(result, contains(token1));
        expect(result, contains(token2));
        expect(result, contains(token3));
        expect(result.last, equals(token3));
      });

      test('should not modify original list', () {
        final originalList = [token1, token2];
        final originalLength = originalList.length;
        
        TokensUtil.addToTokenList(originalList, token3);
        
        expect(originalList, hasLength(originalLength));
        expect(originalList, isNot(contains(token3)));
      });

      test('should handle adding duplicate tokens', () {
        final initialList = [token1, token2];
        
        final result = TokensUtil.addToTokenList(initialList, token1);
        
        expect(result, hasLength(3));
        expect(result.where((token) => token == token1), hasLength(2));
      });
    });

    group('removeFromTokenList', () {
      test('should remove token matching condition', () {
        final result = TokensUtil.removeFromTokenList(
          testTokens,
          (token) => token.id == '2',
        );
        
        expect(result.wasRemoved, isTrue);
        expect(result.removedToken, equals(token2));
        expect(result.newList, hasLength(2));
        expect(result.newList, isNot(contains(token2)));
        expect(result.newList, contains(token1));
        expect(result.newList, contains(token3));
      });

      test('should return null when no token matches condition', () {
        final result = TokensUtil.removeFromTokenList(
          testTokens,
          (token) => token.id == 'nonexistent',
        );
        
        expect(result.wasRemoved, isFalse);
        expect(result.removedToken, isNull);
        expect(result.newList, equals(testTokens));
      });

      test('should handle empty list', () {
        const List<MockToken> emptyList = [];
        
        final result = TokensUtil.removeFromTokenList(
          emptyList,
          (token) => token.id == '1',
        );
        
        expect(result.wasRemoved, isFalse);
        expect(result.removedToken, isNull);
        expect(result.newList, isEmpty);
      });

      test('should remove first matching token only', () {
        final duplicateList = [token1, token2, token1, token3];
        
        final result = TokensUtil.removeFromTokenList(
          duplicateList,
          (token) => token.id == '1',
        );
        
        expect(result.wasRemoved, isTrue);
        expect(result.removedToken, equals(token1));
        expect(result.newList, hasLength(3)); // Removes only the first matching token
        expect(result.newList.where((token) => token.id == '1'), hasLength(1));
      });
    });

    group('removeSpecificToken', () {
      test('should remove specific token instance', () {
        final result = TokensUtil.removeSpecificToken(testTokens, token2);
        
        expect(result.wasRemoved, isTrue);
        expect(result.removedToken, equals(token2));
        expect(result.newList, hasLength(2));
        expect(result.newList, isNot(contains(token2)));
      });

      test('should return null when token not in list', () {
        const nonExistentToken = MockToken(
          id: '99',
          postId: 'post99',
          passiveUid: 'user99',
          tokenId: 'token99',
          name: 'Non-existent Token',
        );
        
        final result = TokensUtil.removeSpecificToken(testTokens, nonExistentToken);
        
        expect(result.wasRemoved, isFalse);
        expect(result.removedToken, isNull);
        expect(result.newList, equals(testTokens));
      });

      test('should handle empty list', () {
        const List<MockToken> emptyList = [];
        
        final result = TokensUtil.removeSpecificToken(emptyList, token1);
        
        expect(result.wasRemoved, isFalse);
        expect(result.removedToken, isNull);
        expect(result.newList, isEmpty);
      });

      test('should remove all instances of token', () {
        final duplicateList = [token1, token2, token1, token3];
        
        final result = TokensUtil.removeSpecificToken(duplicateList, token1);
        
        expect(result.wasRemoved, isTrue);
        expect(result.removedToken, equals(token1));
        expect(result.newList, hasLength(2));
        expect(result.newList, isNot(contains(token1)));
        expect(result.newList, contains(token2));
        expect(result.newList, contains(token3));
      });
    });

    group('findToken', () {
      test('should find token matching condition', () {
        final result = TokensUtil.findToken(
          testTokens,
          (token) => token.name == 'Second Token',
        );
        
        expect(result, equals(token2));
      });

      test('should return null when no token matches', () {
        final result = TokensUtil.findToken(
          testTokens,
          (token) => token.name == 'Nonexistent Token',
        );
        
        expect(result, isNull);
      });

      test('should return first matching token', () {
        final duplicateList = [token1, token2, token1, token3];
        
        final result = TokensUtil.findToken(
          duplicateList,
          (token) => token.id == '1',
        );
        
        expect(result, equals(token1));
      });

      test('should handle empty list', () {
        const List<MockToken> emptyList = [];
        
        final result = TokensUtil.findToken(
          emptyList,
          (token) => token.id == '1',
        );
        
        expect(result, isNull);
      });
    });

    group('removeById', () {
      test('should remove token by id', () {
        final result = TokensUtil.removeById(
          testTokens,
          '2',
          (token) => token.id,
        );
        
        expect(result, hasLength(2));
        expect(result, isNot(contains(token2)));
        expect(result, contains(token1));
        expect(result, contains(token3));
      });

      test('should return same list when id not found', () {
        final result = TokensUtil.removeById(
          testTokens,
          'nonexistent',
          (token) => token.id,
        );
        
        expect(result, equals(testTokens));
      });

      test('should handle empty list', () {
        const List<MockToken> emptyList = [];
        
        final result = TokensUtil.removeById(
          emptyList,
          '1',
          (token) => token.id,
        );
        
        expect(result, isEmpty);
      });
    });

    group('removeByPostId', () {
      test('should remove token by postId', () {
        final result = TokensUtil.removeByPostId(
          testTokens,
          'post2',
          (token) => token.postId,
        );
        
        expect(result.wasRemoved, isTrue);
        expect(result.removedToken, equals(token2));
        expect(result.newList, hasLength(2));
        expect(result.newList, isNot(contains(token2)));
      });

      test('should remove first token when multiple have same postId', () {
        final result = TokensUtil.removeByPostId(
          testTokens,
          'post1', // Both token1 and token3 have this postId
          (token) => token.postId,
        );
        
        expect(result.wasRemoved, isTrue);
        expect(result.removedToken, equals(token1)); // First one found
        expect(result.newList, hasLength(2));
        expect(result.newList, contains(token3)); // token3 should still be there
        expect(result.newList, contains(token2)); // token2 should still be there
      });

      test('should return null when postId not found', () {
        final result = TokensUtil.removeByPostId(
          testTokens,
          'nonexistent_post',
          (token) => token.postId,
        );
        
        expect(result.wasRemoved, isFalse);
        expect(result.removedToken, isNull);
        expect(result.newList, equals(testTokens));
      });
    });

    group('removeByPassiveUid', () {
      test('should remove token by passiveUid', () {
        final result = TokensUtil.removeByPassiveUid(
          testTokens,
          'user2',
          (token) => token.passiveUid,
        );
        
        expect(result.wasRemoved, isTrue);
        expect(result.removedToken, equals(token2));
        expect(result.newList, hasLength(2));
        expect(result.newList, isNot(contains(token2)));
      });

      test('should return null when passiveUid not found', () {
        final result = TokensUtil.removeByPassiveUid(
          testTokens,
          'nonexistent_user',
          (token) => token.passiveUid,
        );
        
        expect(result.wasRemoved, isFalse);
        expect(result.removedToken, isNull);
        expect(result.newList, equals(testTokens));
      });
    });

    group('removeByTokenId', () {
      test('should remove token by tokenId', () {
        final result = TokensUtil.removeByTokenId(
          testTokens,
          'token3',
          (token) => token.tokenId,
        );
        
        expect(result.wasRemoved, isTrue);
        expect(result.removedToken, equals(token3));
        expect(result.newList, hasLength(2));
        expect(result.newList, isNot(contains(token3)));
      });

      test('should return null when tokenId not found', () {
        final result = TokensUtil.removeByTokenId(
          testTokens,
          'nonexistent_token',
          (token) => token.tokenId,
        );
        
        expect(result.wasRemoved, isFalse);
        expect(result.removedToken, isNull);
        expect(result.newList, equals(testTokens));
      });
    });

    group('TokenRemovalResult', () {
      test('wasRemoved should return true when token was removed', () {
        const result = TokenRemovalResult<MockToken>(
          newList: [],
          removedToken: MockToken(
            id: '1',
            postId: 'post1',
            passiveUid: 'user1',
            tokenId: 'token1',
            name: 'Test Token',
          ),
        );
        
        expect(result.wasRemoved, isTrue);
      });

      test('wasRemoved should return false when no token was removed', () {
        const result = TokenRemovalResult<MockToken>(
          newList: [],
          removedToken: null,
        );
        
        expect(result.wasRemoved, isFalse);
      });
    });

    group('Edge Cases and Performance', () {
      test('should handle large lists efficiently', () {
        final largeList = List.generate(
          1000,
          (index) => MockToken(
            id: '$index',
            postId: 'post$index',
            passiveUid: 'user$index',
            tokenId: 'token$index',
            name: 'Token $index',
          ),
        );

        final stopwatch = Stopwatch()..start();
        
        final result = TokensUtil.removeByPostId(
          largeList,
          'post500',
          (token) => token.postId,
        );
        
        stopwatch.stop();
        
        expect(result.wasRemoved, isTrue);
        expect(result.newList, hasLength(999));
        expect(stopwatch.elapsedMilliseconds, lessThan(100)); // Should be fast
      });

      test('should handle null getter values gracefully', () {
        const tokenWithNulls = MockToken(
          id: '',
          postId: '',
          passiveUid: '',
          tokenId: '',
          name: '',
        );
        final listWithNulls = [tokenWithNulls];
        
        final result = TokensUtil.removeByPostId(
          listWithNulls,
          '',
          (token) => token.postId,
        );
        
        expect(result.wasRemoved, isTrue);
        expect(result.newList, isEmpty);
      });

      test('should maintain list order after operations', () {
        final orderedList = [token1, token2, token3];
        
        final result = TokensUtil.removeFromTokenList(
          orderedList,
          (token) => token.id == '2',
        );
        
        expect(result.newList[0], equals(token1));
        expect(result.newList[1], equals(token3));
      });
    });

    group('Type Safety', () {
      test('should work with different token types', () {
        final stringList = ['a', 'b', 'c'];
        
        final result = TokensUtil.addToTokenList(stringList, 'd');
        
        expect(result, hasLength(4));
        expect(result.last, equals('d'));
      });

      test('should work with complex generic types', () {
        final mapList = [
          {'id': '1', 'name': 'first'},
          {'id': '2', 'name': 'second'},
        ];
        
        final result = TokensUtil.removeFromTokenList(
          mapList,
          (map) => map['id'] == '1',
        );
        
        expect(result.wasRemoved, isTrue);
        expect(result.newList, hasLength(1));
        expect(result.newList.first['name'], equals('second'));
      });
    });
  });
}