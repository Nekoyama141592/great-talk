import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/consts/enums.dart';
import 'package:great_talk/model/database_schema/private_user/private_user.dart';
import 'package:great_talk/model/database_schema/public_user/public_user.dart';
import 'package:great_talk/model/global/current_user/auth_user/auth_user.dart';

part 'current_user_state.freezed.dart';
part 'current_user_state.g.dart';


@freezed
abstract class CurrentUserState with _$CurrentUserState {
  const CurrentUserState._();
  const factory CurrentUserState({
    AuthUser? authUser,
    PublicUser? publicUser,
    PrivateUser? privateUser,
    String? base64,
  }) = _CurrentUserState;
  factory CurrentUserState.fromJson(Map<String, dynamic> json) =>
      _$CurrentUserStateFromJson(json);
  String currentUid() => authUser?.uid ?? '';

  CurrentAuthState _currentAuthState() {
    if (authUser == null) {
      return CurrentAuthState.notLoggedIn;
    } else if (authUser!.isAnonymous) {
      return CurrentAuthState.isAnonymous;
    } else {
      return CurrentAuthState.loggedIn; // ログイン済みユーザーの場合
    }
  }

  String currentAuthStateString() {
    final authState = _currentAuthState();
    switch (authState) {
      case CurrentAuthState.isAnonymous:
        return "匿名ログイン中";
      case CurrentAuthState.loggedIn:
        return "ログイン中";
      case CurrentAuthState.notLoggedIn:
        return "未ログイン"; // 修正: 未ログイン状態
    }
  }
  bool isAdmin() => privateUser?.isAdmin ?? false;
  bool isOfficial() => publicUser?.isOfficial ?? false;

  bool isAnonymous() => authUser?.isAnonymous ?? true;

  bool isNotLoggedIn() => authUser == null || isAnonymous();
  bool isLoggedIn() => !isNotLoggedIn();

  bool _hasPublicUser() => publicUser != null;
  bool hasNoPublicUser() => !_hasPublicUser();

  bool isNotVerified() => !(authUser?.emailVerified ?? false);
}
