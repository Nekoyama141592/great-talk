import 'dart:convert';

import 'package:great_talk/model/view_model_state/create_post/create_post_state.dart';
import 'package:great_talk/providers/global/auth/stream_auth_provider.dart';
import 'package:great_talk/repository/on_call/on_call_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:great_talk/core/strings.dart';
import 'package:great_talk/ui_core/ui_helper.dart';
import 'package:great_talk/consts/form_consts.dart';
import 'package:great_talk/core/firestore/doc_ref_core.dart';
import 'package:great_talk/model/rest_api/put_object/request/put_object_request.dart';
import 'package:great_talk/repository/firestore/firestore_repository.dart';
import 'package:great_talk/utility/aws_s3_utility.dart';
import 'package:great_talk/utility/file_utility.dart';
import 'package:great_talk/utility/new_content.dart';
import 'package:great_talk/ui_core/validator/post_validator.dart';

part 'create_post_view_model.g.dart';

@riverpod
class CreatePostViewModel extends _$CreatePostViewModel {
  @override
  FutureOr<CreatePostState> build() {
    // 初期状態を返す
    return const CreatePostState();
  }

  // セッターメソッド群 (whenDataを使い安全に更新)
  void setTitle(String? value) {
    if (value == null) return;
    state.whenData((s) => state = AsyncValue.data(s.copyWith(title: value)));
  }

  void setSystemPrompt(String? value) {
    if (value == null) return;
    state.whenData(
      (s) => state = AsyncValue.data(s.copyWith(systemPrompt: value)),
    );
  }

  void setDescription(String? value) {
    if (value == null) return;
    state.whenData(
      (s) => state = AsyncValue.data(s.copyWith(description: value)),
    );
  }

  void setTemperature(String? value) {
    if (value == null) return;
    state.whenData(
      (s) =>
          state = AsyncValue.data(
            s.copyWith(
              temperature:
                  double.tryParse(value) ?? FormConsts.defaultTemperature,
            ),
          ),
    );
  }

  void setTopP(String? value) {
    if (value == null) return;
    state.whenData(
      (s) =>
          state = AsyncValue.data(
            s.copyWith(topP: double.tryParse(value) ?? FormConsts.defaultTopP),
          ),
    );
  }

  void setPresencePenalty(String? value) {
    if (value == null) return;
    state.whenData(
      (s) =>
          state = AsyncValue.data(
            s.copyWith(
              presencePenalty:
                  double.tryParse(value) ?? FormConsts.defaultPresencePenalty,
            ),
          ),
    );
  }

  void setFrequencyPenalty(String? value) {
    if (value == null) return;
    state.whenData(
      (s) =>
          state = AsyncValue.data(
            s.copyWith(
              frequencyPenalty:
                  double.tryParse(value) ?? FormConsts.defaultFrequencyPenalty,
            ),
          ),
    );
  }

  // 画像選択処理
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
    // state内のpickedImageを更新
    state.whenData(
      (s) =>
          state = AsyncValue.data(
            s.copyWith(pickedImage: base64Encode(result)),
          ),
    );
  }

  // 投稿ボタン押下時の処理
  Future<bool> onPositiveButtonPressed() async {
    if (state.isLoading) return false; // 二重リクエストを防止

    final currentState = state.value;
    if (currentState == null) return false;
    final pickedImage = currentState.pickedImage;
    if (pickedImage == null) {
      UIHelper.showErrorFlutterToast("アイコンをタップして画像をアップロードしてください");
      return false;
    }
    if (PostValidator.isInValidPost(
      currentState.description,
      currentState.systemPrompt,
      currentState.title,
      currentState.temperature.toString(),
      currentState.topP.toString(),
      currentState.presencePenalty.toString(),
      currentState.frequencyPenalty.toString(),
    )) {
      UIHelper.showErrorFlutterToast("条件を満たしていないものがあります");
      return false;
    }
    if ((currentState.temperature != FormConsts.defaultTemperature) &&
        (currentState.topP != FormConsts.defaultTopP)) {
      UIHelper.showErrorFlutterToast("temperatureとtopPはどちらか一方しか変更できません");
      return false;
    }

    final currentUid = ref.read(streamAuthUidProvider).value;
    if (currentUid == null) {
      UIHelper.showErrorFlutterToast("ログインが必要です");
      return false;
    }

    // ローディング状態に設定
    state = const AsyncValue.loading();

    try {
      final postId = randomString();
      final fileName = AWSS3Utility.postObject(currentUid, postId);
      final repository = OnCallRepository();
      final request = PutObjectRequest.fromUint8List(
        uint8list: base64Decode(pickedImage),
        fileName: fileName,
      );
      final result = await repository.putObject(request);

      final success = await result.when<Future<bool>>(
        success:
            (res) async => await _createPost(postId, fileName, currentState),
        failure: (e) async {
          UIHelper.showErrorFlutterToast("画像のアップロードが失敗しました");
          return false;
        },
      );

      if (success) {
        _resetState(); // 成功したら状態をリセット
        return true;
      } else {
        // 失敗したら元の状態に戻す
        state = AsyncValue.data(currentState);
        return false;
      }
    } catch (e, st) {
      UIHelper.showErrorFlutterToast("投稿処理中にエラーが発生しました: $e");
      // エラー状態にし、元のデータを保持する
      state = AsyncValue.error(e, st);
      // 復帰できるように元のデータで上書き
      state = AsyncValue.data(currentState);
      return false;
    }
  }

  Future<bool> _createPost(
    String postId,
    String fileName,
    CreatePostState postState,
  ) async {
    final repository = FirestoreRepository();
    final currentUid = ref.read(streamAuthUidProvider).value;
    if (currentUid == null) return false;

    final postRef = DocRefCore.post(currentUid, postId);
    final customCompleteText =
        NewContent.newCustomCompleteText(
            postState.systemPrompt,
            postState.temperature.toString(),
            postState.topP.toString(),
            postState.presencePenalty.toString(),
            postState.frequencyPenalty.toString(),
          ).toJson()
          ..removeWhere((key, value) => value == null);

    final newPost = NewContent.newPost(
      postState.systemPrompt.trim(),
      postState.title.trim(),
      postState.description.trim(),
      fileName,
      postId,
      postRef,
      customCompleteText,
      currentUid,
    );
    final json = newPost.toJson();
    final result = await repository.createDoc(postRef, json);

    return result.when(
      success: (_) {
        UIHelper.showFlutterToast("投稿が作成できました！");
        return true;
      },
      failure: (e) {
        UIHelper.showErrorFlutterToast("投稿が作成できませんでした");
        return false;
      },
    );
  }

  void _resetState() {
    state = const AsyncValue.data(CreatePostState());
  }
}
