import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'stream_auth_provider.g.dart';

@Riverpod(keepAlive: true)
Stream<String?> streamAuthUid(Ref ref) {
  final userStream = FirebaseAuth.instance.authStateChanges();
  return userStream.map((user) => user?.uid);
}

@Riverpod(keepAlive: true)
Stream<User?> streamAuth(Ref ref) {
  return FirebaseAuth.instance.authStateChanges();
}
