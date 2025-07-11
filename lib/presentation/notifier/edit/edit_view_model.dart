import 'dart:convert';

import 'package:great_talk/core/util/image_util.dart';
import 'package:great_talk/presentation/state/current_user/current_user/current_user_state.dart';
import 'package:great_talk/core/provider/keep_alive/stream/auth/stream_auth_provider.dart';
import 'package:great_talk/presentation/notifier/current_user/current_user_notifier.dart';
import 'package:great_talk/core/provider/repository/api/api_repository_provider.dart';
import 'package:great_talk/core/provider/repository/database/database_repository_provider.dart';
import 'package:great_talk/infrastructure/model/result/result.dart';
import 'package:great_talk/presentation/util/image_ui_util.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:great_talk/presentation/constant/form_consts.dart';
import 'package:great_talk/presentation/constant/msg_constants.dart';
import 'package:great_talk/core/extension/string_extension.dart';
import 'package:great_talk/infrastructure/model/database_schema/user_update_log/user_update_log_model.dart';
import 'package:great_talk/core/util/aws_s3_util.dart';
import 'package:great_talk/presentation/state/edit/edit_state.dart';

part 'edit_view_model.g.dart';

@riverpod
class EditViewModel extends _$EditViewModel {
  CurrentUserState? _currentUserState() =>
      ref.read(currentUserNotifierProvider).value;
  @override
  FutureOr<EditState> build() {
    final user = _currentUserState()?.publicUser;
    final bio = user?.bioValue ?? "";
    final userName = user?.nameValue ?? "";
    final base64 = _currentUserState()?.base64;
    return EditState(
      bio: bio,
      userName: userName,
      base64: base64,
      isPicked: false,
    );
  }

  /// 画像選択時の処理
  FutureResult<bool> onImagePickButtonPressed() async {
    final result = await ImageUtil.getCompressedImage();
    if (result == null) return const Result.failure('画像が取得できませんでした');
    final info = await ImageUtil.imageInfo(result);
    if (info.isNotSquare) {
      return Result.failure(ImageUiUtil.squareImageRequestMsg);
    }
    if (info.isSmall) {
      return const Result.failure(FormConsts.bigImageRequestMsg);
    }
    state = AsyncData(state.value!.copyWith(base64: result, isPicked: true));
    return Result.success(true);
  }

  /// 初期化
  void init() {
    final base64 = _currentUserState()?.base64;
    if (state.value?.base64 != null && base64 != null) {
      state = AsyncData(state.value!.copyWith(base64: base64));
    }
  }

  /// Bioのセット
  void setBio(String? value) {
    if (value == null) return;
    state = AsyncData(state.value!.copyWith(bio: value));
  }

  /// UserNameのセット
  void setUserName(String? value) {
    if (value == null) return;
    state = AsyncData(state.value!.copyWith(userName: value));
  }

  /// プロフィール更新ボタン押下時
  FutureResult<bool> onPositiveButtonPressed() async {
    final s = state.value;
    final uid = ref.read(authUidProvider);
    if (s == null || uid == null) {
      return const Result.failure('もう一度お試しください.');
    }
    final base64 = s.base64;
    if (base64 == null) {
      return const Result.failure("アイコンをタップしてプロフィール画像をアップロードしてください");
    }
    final userName = s.userName;
    final bio = s.bio;
    if (userName.isEmpty ||
        bio.isEmpty ||
        userName.invalidField ||
        userName == MsgConstants.noName) {
      return const Result.failure("条件を満たしていないものがあります");
    }
    if (state.isLoading) {
      return const Result.failure("通信中...");
    }
    state = const AsyncLoading();
    final publicUser = _currentUserState()?.publicUser;
    if (publicUser == null) {
      state = AsyncData(s);
      return const Result.failure("ユーザーが見つかりません");
    }
    late Result<bool> updateUserResult;
    if (s.isPicked) {
      final fileName = AWSS3Util.profileObject(uid);
      final uint8list = base64;
      final base64Image = base64Encode(base64Decode(uint8list));
      final repository = ref.read(apiRepositoryProvider);
      final result = await repository.putObject(base64Image, fileName);
      await result.when(
        success: (res) async {
          updateUserResult = await _createUserUpdateLog(
            fileName,
            userName,
            bio,
          );
        },
        failure: (e) {
          updateUserResult = const Result.failure("画像のアップロードが失敗しました");
          state = AsyncData(s);
        },
      );
    } else {
      // 写真がそのまま場合の処理
      updateUserResult = await _createUserUpdateLog(
        publicUser.image.value,
        userName,
        bio,
      );
    }
    // 完了時はstateを元に戻す
    state = AsyncData(s.copyWith(isPicked: false));
    return updateUserResult;
  }

  FutureResult<bool> _createUserUpdateLog(
    String fileName,
    String userName,
    String bio,
  ) async {
    final uid = ref.read(authUidProvider);
    if (uid == null) return const Result.failure('ログインしてください.');
    final repository = ref.read(databaseRepositoryProvider);
    final newUpdateLog = UserUpdateLog.fromRegister(
      uid,
      userName,
      bio,
      fileName,
    );
    final json = newUpdateLog.toJson();
    final result = await repository.createUserUpdateLog(uid, json);
    return result;
  }
}
