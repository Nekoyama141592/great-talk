import 'dart:convert';

import 'package:great_talk/core/util/id_util.dart';
import 'package:great_talk/core/util/image_util.dart';
import 'package:great_talk/infrastructure/model/database_schema/custom_complete_text/custom_complete_text.dart';
import 'package:great_talk/infrastructure/model/database_schema/post/post.dart';
import 'package:great_talk/presentation/state/create_post/create_post_state.dart';
import 'package:great_talk/core/provider/keep_alive/stream/auth/stream_auth_provider.dart';
import 'package:great_talk/core/provider/repository/api/api_repository_provider.dart';
import 'package:great_talk/core/provider/repository/database/database_repository_provider.dart';
import 'package:great_talk/infrastructure/repository/result/result.dart';
import 'package:great_talk/presentation/util/image_ui_util.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:great_talk/presentation/util/toast_ui_util.dart';
import 'package:great_talk/presentation/constant/form_consts.dart';
import 'package:great_talk/core/util/aws_s3_util.dart';

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
    final result = await ImageUtil.getCompressedImage();
    if (result == null) return;

    final info = await ImageUtil.imageInfo(result);
    if (info.isNotSquare) {
      ToastUiUtil.showErrorFlutterToast(ImageUiUtil.squareImageRequestMsg);
      return;
    }
    if (info.isSmall) {
      ToastUiUtil.showErrorFlutterToast(FormConsts.bigImageRequestMsg);
      return;
    }
    // state内のpickedImageを更新
    state.whenData(
      (s) => state = AsyncValue.data(s.copyWith(pickedImage: result)),
    );
  }

  // 投稿ボタン押下時の処理
  FutureResult<bool> onPositiveButtonPressed() async {
    if (state.isLoading) {
      return const Result.failure('ロード中です');
    }

    final currentState = state.value!;
    final pickedImage = currentState.pickedImage;
    if (pickedImage == null) {
      return const Result.failure('アイコンをタップして画像をアップロードしてください');
    }
    final currentUid = ref.read(authUidProvider);
    if (currentUid == null) {
      return const Result.failure('ログインが必要です');
    }

    // ローディング状態に設定
    state = const AsyncValue.loading();

    final postId = IdUtil.randomString();
    final fileName = AWSS3Util.postObject(currentUid, postId);
    final repository = ref.read(apiRepositoryProvider);
    final base64Image = base64Encode(base64Decode(pickedImage));
    final putObjectResult = await repository.putObject(base64Image, fileName);

    final createPostResult = await putObjectResult.when<FutureResult<bool>>(
      success: (res) => _createPost(postId, fileName, currentState),
      failure: (e) async {
        return const Result.failure('画像のアップロードが失敗しました');
      },
    );
    return createPostResult;
  }

  FutureResult<bool> _createPost(
    String postId,
    String fileName,
    CreatePostState postState,
  ) async {
    final repository = ref.read(databaseRepositoryProvider);
    final uid = ref.read(authUidProvider);
    if (uid == null) {
      return const Result.failure('ログインしてください');
    }

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

    return result;
  }
}
