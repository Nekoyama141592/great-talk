import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:great_talk/model/global/current_user/current_user_state.dart';
import 'package:great_talk/providers/global/auth/stream_auth_provider.dart';
import 'package:great_talk/providers/global/current_user/current_user_notifier.dart';
import 'package:great_talk/repository/result/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:great_talk/consts/form_consts.dart';
import 'package:great_talk/core/maps.dart';
import 'package:great_talk/core/strings.dart';
import 'package:great_talk/ui_core/ui_helper.dart';
import 'package:great_talk/core/firestore/doc_ref_core.dart';
import 'package:great_talk/extensions/string_extension.dart';
import 'package:great_talk/model/database_schema/detected_image/detected_image.dart';
import 'package:great_talk/model/rest_api/put_object/request/put_object_request.dart';
import 'package:great_talk/model/database_schema/user_update_log/user_update_log.dart';
import 'package:great_talk/repository/aws_s3_repository.dart';
import 'package:great_talk/repository/firestore/firestore_repository.dart';
import 'package:great_talk/utility/aws_s3_utility.dart';
import 'package:great_talk/utility/file_utility.dart';
import 'package:great_talk/model/view_model_state/edit/edit_state.dart';

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
  Future<void> onImagePickButtonPressed() async {
    final result = await FileUtility.getCompressedImage();
    if (result == null) return;
    final info = await FileUtility.getImageInfo(result);
    if (info.isNotSquare) {
      UIHelper.showErrorFlutterToast(FileUtility.squareImageRequestMsg);
      return;
    }
    if (info.isSmall) {
      UIHelper.showErrorFlutterToast(FormConsts.bigImageRequestMsg);
      return;
    }
    final base64 = base64Encode(result);
    state = AsyncData(state.value!.copyWith(base64: base64, isPicked: true));
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
    final uid = ref.read(streamAuthUidProvider).value;
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
        userName == noName) {
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
      final fileName = AWSS3Utility.profileObject(uid);
      final uint8list = base64;
      final request = PutObjectRequest.fromUint8List(
        uint8list: base64Decode(uint8list),
        fileName: fileName,
      );
      final result = await AWSS3Repository().putObject(request);
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
        publicUser.typedImage().value,
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
    final uid = ref.read(streamAuthUidProvider).value;
    if (uid == null) return const Result.failure('ログインしてください.');
    final repository = FirestoreRepository();
    final newUpdateLog = UserUpdateLog(
      logCreatedAt: Timestamp.now(),
      searchToken: returnSearchToken(userName),
      stringBio: bio.trim(),
      stringUserName: userName.trim(),
      uid: uid,
      image: DetectedImage(value: fileName).toJson(),
      userRef: DocRefCore.user(uid),
    );
    final docRef = DocRefCore.userUpdateLog(uid);
    final json = newUpdateLog.toJson();
    final result = await repository.createDoc(docRef, json);
    return result;
  }
}
