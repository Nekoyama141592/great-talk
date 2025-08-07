import 'package:firebase_auth/firebase_auth.dart';
import 'package:great_talk/domain/entity/database/private_user/private_user_entity.dart';
import 'package:great_talk/domain/entity/database/public_user/public_user_entity.dart';
import 'package:great_talk/presentation/state/current_user/current_user/current_user_state.dart';
import 'package:great_talk/core/provider/keep_alive/stream/auth/stream_auth_provider.dart';
import 'package:great_talk/core/provider/repository/api/api_repository_provider.dart';
import 'package:great_talk/core/provider/repository/auth/auth_repository_provider.dart';
import 'package:great_talk/core/provider/repository/database/database_repository_provider.dart';
import 'package:great_talk/infrastructure/model/result/result.dart';
import 'package:great_talk/core/util/credential_util.dart';
import 'package:great_talk/infrastructure/repository/auth_repository.dart';
import 'package:great_talk/infrastructure/repository/database_repository.dart';
import 'package:great_talk/core/provider/keep_alive/usecase/file/file_use_case_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_user_notifier.g.dart';

@Riverpod(keepAlive: true)
class CurrentUserNotifier extends _$CurrentUserNotifier {
  AuthRepository get _authRepository => ref.watch(authRepositoryProvider);
  DatabaseRepository get _databaseRepository =>
      ref.watch(databaseRepositoryProvider);
  @override
  Future<CurrentUserState> build() async {
    final initialState = CurrentUserState();
    final authUserData = ref.watch(authProvider);
    if (authUserData == null || authUserData.isAnonymous) {
      return initialState;
    }
    return _fetchData();
  }

  FutureResult<User> onAppleButtonPressed() async {
    return await _authRepository.signInWithApple();
  }

  FutureResult<User> onGoogleButtonPressed() async {
    return await _authRepository.signInWithGoogle();
  }

  String? _getCurrentUid() => ref.watch(authUidProvider);

  Future<CurrentUserState> _fetchData() async {
    final uid = _getCurrentUid();
    if (uid == null) {
      return CurrentUserState();
    }
    final publicUser = await _getPublicUser(uid);
    final privateUser = await _getPrivateUser(uid);
    final base64 = await _getBase64Image(publicUser);
    return CurrentUserState(
      publicUser: publicUser,
      privateUser: privateUser,
      base64: base64,
    );
  }

  Future<PublicUserEntity?> _getPublicUser(String uid) async {
    var publicUser = await _databaseRepository.getPublicUser(uid);
    if (publicUser == null) {
      final createdUser = await _databaseRepository.createPublicUser(uid);
      if (createdUser != null) {
        publicUser = PublicUserEntity.fromJson(createdUser.toJson());
      }
    }
    return publicUser;
  }

  Future<PrivateUserEntity?> _getPrivateUser(String uid) async {
    var privateUser = await _databaseRepository.getPrivateUser(uid);
    privateUser ??= await _databaseRepository.createPrivateUser(uid);
    return privateUser;
  }

  Future<String?> _getBase64Image(PublicUserEntity? publicUser) async {
    if (publicUser == null) return null;
    final oldImage = publicUser.image;
    final bucketName = oldImage.bucketName;
    final fileName = oldImage.value;
    if (bucketName.isEmpty || fileName.isEmpty) return null;
    final image = await ref
        .read(fileUseCaseProvider)
        .getObject(bucketName, fileName);
    return image;
  }

  FutureResult<bool> signOut() async {
    final result = await _authRepository.signOut();
    return result;
  }

  FutureResult<bool> reauthenticateWithAppleToDelete() async {
    final credential = await CredentialUtil.appleCredential();
    return await _reauthenticateToDelete(credential);
  }

  FutureResult<bool> reauthenticateWithGoogleToDelete() async {
    final credential = await CredentialUtil.googleCredential();
    return await _reauthenticateToDelete(credential);
  }

  Future<Result<bool>> _reauthenticateToDelete(AuthCredential credential) async {
    return await _authRepository.reauthenticateWithCredential(credential);
  }

  FutureResult<bool> deletePublicUser() async {
    final user = state.value?.publicUser;
    if (user == null) {
      return const Result.failure('ログインしてください');
    }
    final result = await _databaseRepository.deletePublicUser(user.uid);
    late Result<bool> authResult;
    await result.when(
      success: (_) async => authResult = await _deleteAuthUser(),
      failure:
          (e) async =>
              authResult = const Result.failure('データベースからユーザーを削除できませんでした'),
    );
    authResult.when(
      success: (_) {
        final imageValue = user.image.value;
        if (imageValue.isNotEmpty) {
          ref.read(apiRepositoryProvider).deleteObject(imageValue);
        }
      },
      failure: (_) {},
    );
    return authResult;
  }

  FutureResult<bool> _deleteAuthUser() async {
    final result = await _authRepository.deleteUser();
    return result;
  }

  Future<void> updateUser() async {
    final uid = ref.read(authUidProvider);
    final stateValue = state.value;
    if (uid == null || stateValue == null) return;
    state = await AsyncValue.guard(() async {
      final publicUser = await _getPublicUser(uid);
      final base64 = await _getBase64Image(publicUser);
      return stateValue.copyWith(publicUser: publicUser, base64: base64);
    });
  }
}
