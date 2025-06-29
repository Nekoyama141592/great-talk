import 'package:great_talk/domain/entity/view_model_state/email_auth/email_auth_state.dart';
import 'package:great_talk/core/provider/repository/auth/auth_repository_provider.dart';
import 'package:great_talk/infrastructure/repository/result/result.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'email_auth_view_model.g.dart';

@riverpod
class EmailAuthViewModel extends _$EmailAuthViewModel {
  @override
  EmailAuthState build() {
    return const EmailAuthState();
  }

  void toggleSignUpMode() {
    state = state.copyWith(isSignUp: !state.isSignUp);
  }

  void setLoading(bool loading) {
    state = state.copyWith(isLoading: loading);
  }

  FutureResult<User> signUp(String email, String password) async {
    setLoading(true);
    final result = await ref
        .read(authRepositoryProvider)
        .signUp(email, password);
    setLoading(false);
    return result;
  }

  FutureResult<User> signIn(String email, String password) async {
    setLoading(true);
    final result = await ref
        .read(authRepositoryProvider)
        .signIn(email, password);
    setLoading(false);
    return result;
  }

  FutureResult<User> authenticate(String email, String password) async {
    return state.isSignUp
        ? await signUp(email, password)
        : await signIn(email, password);
  }
}
