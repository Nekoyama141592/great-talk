import 'package:collection/collection.dart';

class TokensUtil {
  static List<T> addToTokenList<T>(List<T> currentList, T newToken) {
    return [...currentList, newToken];
  }

  static TokenRemovalResult<T> removeFromTokenList<T>(
    List<T> currentList,
    bool Function(T) condition,
  ) {
    final tokenToRemove = currentList.firstWhereOrNull(condition);
    if (tokenToRemove == null) {
      return TokenRemovalResult(newList: currentList, removedToken: null);
    }

    final newList = List<T>.from(currentList);
    newList.remove(tokenToRemove);
    return TokenRemovalResult(newList: newList, removedToken: tokenToRemove);
  }

  static TokenRemovalResult<T> removeSpecificToken<T>(
    List<T> currentList,
    T tokenToRemove,
  ) {
    if (!currentList.contains(tokenToRemove)) {
      return TokenRemovalResult(newList: currentList, removedToken: null);
    }

    final newList =
        currentList.where((token) => token != tokenToRemove).toList();
    return TokenRemovalResult(newList: newList, removedToken: tokenToRemove);
  }

  static T? findToken<T>(List<T> tokenList, bool Function(T) condition) {
    return tokenList.firstWhereOrNull(condition);
  }

  static List<T> removeById<T>(
    List<T> currentList,
    String id,
    String Function(T) idGetter,
  ) {
    return currentList.where((token) => idGetter(token) != id).toList();
  }

  static TokenRemovalResult<T> removeByPostId<T>(
    List<T> currentList,
    String postId,
    String Function(T) postIdGetter,
  ) {
    bool condition(T token) => postIdGetter(token) == postId;
    return removeFromTokenList(currentList, condition);
  }

  static TokenRemovalResult<T> removeByPassiveUid<T>(
    List<T> currentList,
    String passiveUid,
    String Function(T) passiveUidGetter,
  ) {
    bool condition(T token) => passiveUidGetter(token) == passiveUid;
    return removeFromTokenList(currentList, condition);
  }

  static TokenRemovalResult<T> removeByTokenId<T>(
    List<T> currentList,
    String tokenId,
    String Function(T) tokenIdGetter,
  ) {
    bool condition(T token) => tokenIdGetter(token) == tokenId;
    return removeFromTokenList(currentList, condition);
  }
}

class TokenRemovalResult<T> {
  const TokenRemovalResult({required this.newList, required this.removedToken});

  final List<T> newList;
  final T? removedToken;

  bool get wasRemoved => removedToken != null;
}
