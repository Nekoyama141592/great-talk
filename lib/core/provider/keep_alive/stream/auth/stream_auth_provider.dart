import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:great_talk/core/provider/keep_alive/infrastructure/firebase/firebath_auth/firebase_auth_provider.dart';
import 'package:great_talk/domain/entity/global/current_user/auth_user/auth_user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'stream_auth_provider.g.dart';

@Riverpod(keepAlive: true)
Stream<User?> streamAuth(Ref ref) {
  return ref.watch(firebaseAuthProvider).authStateChanges();
}

@Riverpod(keepAlive: true)
AuthUser? auth(Ref ref) {
  final firebaseAuthUser = ref.watch(streamAuthProvider).value;
  return firebaseAuthUser != null ? AuthUser.fromFirebaseAuthUser(firebaseAuthUser) : null;
}

@Riverpod(keepAlive: true)
String? authUid(Ref ref) {
  return ref.watch(authProvider)?.uid;
}

@Riverpod(keepAlive: true)
String? authEmail(Ref ref) {
  return ref.watch(authProvider)?.email;
}
