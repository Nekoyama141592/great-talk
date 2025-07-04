import 'package:great_talk/core/provider/keep_alive/infrastructure/firebase/firebath_auth/firebase_auth_provider.dart';
import 'package:great_talk/infrastructure/repository/auth_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository_provider.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) =>
    AuthRepository(ref.read(firebaseAuthProvider));
