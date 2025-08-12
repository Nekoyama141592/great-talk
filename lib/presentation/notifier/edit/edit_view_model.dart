import 'package:great_talk/core/util/image_util.dart';
import 'package:great_talk/presentation/state/current_user/current_user/current_user_state.dart';
import 'package:great_talk/core/provider/keep_alive/stream/auth/stream_auth_provider.dart';
import 'package:great_talk/presentation/notifier/current_user/current_user_notifier.dart';
import 'package:great_talk/core/provider/repository/api/api_repository_provider.dart';
import 'package:great_talk/infrastructure/model/result/result.dart';
import 'package:great_talk/presentation/util/image_ui_util.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:great_talk/presentation/constant/form_consts.dart';
import 'package:great_talk/presentation/constant/msg_constants.dart';
import 'package:great_talk/core/extension/string_extension.dart';
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
    return EditState(
      bio: bio,
      userName: userName,
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
    return const Result.success(true);
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
  FutureResult onPositiveButtonPressed() async {
    final s = state.value;
    final uid = ref.read(authUidProvider);
    if (s == null || uid == null) {
      return const Result.failure('もう一度お試しください.');
    }
    final base64 = s.base64;
    final isModerated = ref.read(currentUserNotifierProvider).value?.publicUser?.image.moderationModelVersion.isNotEmpty ?? false;
    if (base64 == null && !isModerated) {
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
    late Result updateUserResult;
    if (base64 == null && isModerated) {
      // 写真がそのまま場合の処理
      updateUserResult = await ref.read(apiRepositoryProvider).updateUser(null, bio, userName);
    } else {
      // 写真が更新された場合
      updateUserResult = await ref.read(apiRepositoryProvider).updateUser(base64!, bio, userName);
    }
    // 完了時はstateを元に戻す
    state = AsyncData(s.copyWith(isPicked: false));
    return updateUserResult;
  }
}
