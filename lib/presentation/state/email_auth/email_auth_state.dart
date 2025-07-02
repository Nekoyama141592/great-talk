import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_auth_state.freezed.dart';
part 'email_auth_state.g.dart';

@freezed
abstract class EmailAuthState with _$EmailAuthState {
  const EmailAuthState._();
  const factory EmailAuthState({
    @Default(false) bool isSignUp,
    @Default(false) bool isLoading,
  }) = _EmailAuthState;

  factory EmailAuthState.fromJson(Map<String, dynamic> json) =>
      _$EmailAuthStateFromJson(json);
}
