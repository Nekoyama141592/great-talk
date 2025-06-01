import 'dart:convert';

import 'package:great_talk/model/database_schema/custom_complete_text/custom_complete_text.dart';
import 'package:great_talk/model/database_schema/post/post.dart';
import 'package:great_talk/model/view_model_state/create_post/create_post_state.dart';
import 'package:great_talk/providers/global/auth/stream_auth_provider.dart';
import 'package:great_talk/repository/real/on_call/on_call_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:great_talk/core/strings.dart';
import 'package:great_talk/ui_core/ui_helper.dart';
import 'package:great_talk/consts/form_consts.dart';
import 'package:great_talk/model/rest_api/put_object/request/put_object_request.dart';
import 'package:great_talk/repository/real/firestore/firestore_repository.dart';
import 'package:great_talk/core/aws_s3_core.dart';
import 'package:great_talk/providers/usecase/file/file_usecase.dart';

part 'create_post_view_model.g.dart';

@riverpod
class CreatePostViewModel extends _$CreatePostViewModel {
  @override
  FutureOr<CreatePostState> build() {
    // 初期状態を返す
    return const CreatePostState();
  }

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

  // 画像選択処理
  Future<void> onImagePickButtonPressed() async {
    final usecase = ref.read(fileUseCaseProvider);
    final result = await usecase.getCompressedImage();
    if (result == null) return;

    final info = await usecase.getImageInfo(result);
    if (info.isNotSquare) {
      UIHelper.showErrorFlutterToast(usecase.squareImageRequestMsg);
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
    final currentUid = ref.read(streamAuthUidProvider).value;
    if (currentUid == null) {
      UIHelper.showErrorFlutterToast("ログインが必要です");
      return false;
    }

    // ローディング状態に設定
    state = const AsyncValue.loading();

    try {
      final postId = randomString();
      final fileName = AWSS3Core.postObject(currentUid, postId);
      final repository = ref.read(onCallRepositoryProvider);
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
    final repository = ref.read(firestoreRepositoryProvider);
    final uid = ref.read(streamAuthUidProvider).value;
    if (uid == null) return false;

    final customCompleteText = CustomCompleteText(
      systemPrompt: postState.systemPrompt.trim(),
    );

    final newPost = Post.fromRegister(
      postState.systemPrompt.trim(),
      postState.title.trim(),
      postState.description.trim(),
      fileName,
      postId,
      customCompleteText.toJson(),
      uid,
    );
    final json = newPost.toJson();
    final result = await repository.createPost(uid, postId, json);

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
