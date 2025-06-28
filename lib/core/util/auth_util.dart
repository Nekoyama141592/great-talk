import 'package:firebase_auth/firebase_auth.dart';

class AuthUtil {
  static String currentAuthStateString(User? authUser) {
    if (authUser == null) {
      return "未ログイン状態";
    } else if (authUser.isAnonymous) {
      return "匿名ログイン中";
    } else {
      return "ログイン中"; // ログイン済みユーザーの場合
    }
  }
}
