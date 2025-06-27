import 'package:firebase_auth/firebase_auth.dart';
import 'package:great_talk/consts/enums.dart';

class AuthCore {
  static CurrentAuthState _currentAuthState(User? authUser) {
    if (authUser == null) {
      return CurrentAuthState.notLoggedIn;
    } else if (authUser.isAnonymous) {
      return CurrentAuthState.isAnonymous;
    } else {
      return CurrentAuthState.loggedIn; // ログイン済みユーザーの場合
    }
  }

  static String currentAuthStateString(User? authUser) {
    final authState = _currentAuthState(authUser);
    switch (authState) {
      case CurrentAuthState.isAnonymous:
        return "匿名ログイン中";
      case CurrentAuthState.loggedIn:
        return "ログイン中";
      case CurrentAuthState.notLoggedIn:
        return "未ログイン状態";
    }
  }
}
