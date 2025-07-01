import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user.freezed.dart';
part 'auth_user.g.dart';

@freezed
abstract class AuthUser with _$AuthUser {
  const AuthUser._();
  const factory AuthUser({
    String? email,
    required String uid,
    required bool isAnonymous,
    required bool emailVerified,
  }) = _AuthUser;
  factory AuthUser.fromJson(Map<String, dynamic> json) =>
      _$AuthUserFromJson(json);
  factory AuthUser.fromFirebaseAuthUser(User user) {
    return AuthUser(
      uid: user.uid,
      isAnonymous: user.isAnonymous,
      emailVerified: user.emailVerified,
      email: user.email,
    );
  }
}
