import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/consts/form_consts.dart';
import 'package:great_talk/controllers/abstract/loading_controller.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/controllers/my_profile_controller.dart';
import 'package:great_talk/extensions/string_extension.dart';
import 'package:great_talk/infrastructure/firestore/firestore_queries.dart';
import 'package:great_talk/mixin/current_uid_mixin.dart';
import 'package:great_talk/repository/aws_s3_repository.dart';
import 'package:great_talk/repository/firestore_repository.dart';
import 'package:great_talk/utility/aws_s3_utility.dart';
import 'package:great_talk/utility/file_utility.dart';
import 'package:great_talk/utility/new_content.dart';
import 'package:great_talk/validator/post_validator.dart';

class CreatePostController extends LoadingController with CurrentUserMixin {
  static CreatePostController get to => Get.find<CreatePostController>();
  final title = "".obs;
  final systemPrompt = FormConsts.defaultSystemPrompt.obs;
  final description = "".obs;
  final temperature = FormConsts.defaultTemperature.toString().obs;
  final topP = FormConsts.defaultTopP.toString().obs;
  final presencePenalty = FormConsts.defaultPresencePenalty.toString().obs;
  final frequencyPenalty = FormConsts.defaultFrequencyPenalty.toString().obs;
  final Rx<Uint8List?> uint8list = Rx(null);
  // セッターメソッド
  void setTitle(String? value) {
    if (value == null) return;
    title.value = value;
  }

  void setSystemPrompt(String? value) {
    if (value == null) return;
    systemPrompt.value = value;
  }

  void setDescription(String? value) {
    if (value == null) return;
    description.value = value;
  }

  void setTemperature(String? value) {
    if (value == null) return;
    temperature.value = value;
  }

  void setTopP(String? value) {
    if (value == null) return;
    topP.value = value;
  }

  void setPresencePenalty(String? value) {
    if (value == null) return;
    presencePenalty.value = value;
  }

  void setFrequencyPenalty(String? value) {
    if (value == null) return;
    frequencyPenalty.value = value;
  }

  Future<void> processCreatePost() async {
    if (uint8list.value == null) {
      await UIHelper.showErrorFlutterToast("アイコンをタップして画像をアップロードしてください");
      return;
    }
    if (PostValidator.isInValidPost(
        description.value,
        systemPrompt.value,
        title.value,
        temperature.value,
        topP.value,
        presencePenalty.value,
        frequencyPenalty.value)) {
      await UIHelper.showErrorFlutterToast("条件を満たしていないものがあります");
      return;
    }
    if ((temperature.value.toRoundToSecondDecimalPlace() !=
            FormConsts.defaultTemperature) &&
        (topP.value.toRoundToSecondDecimalPlace() != FormConsts.defaultTopP)) {
      await UIHelper.showErrorFlutterToast("temperatureとtopPはどちらか一方しか変更できません");
      return;
    }
    if (isLoading.value) return; // 二重リクエストを防止.
    startLoading();
    final newFileName = AWSS3Utility.s3FileName();
    final bucketName = AWSS3Utility.postImagesBucketName;
    final repository = AWSS3Repository();
    final result =
        await repository.putObject(uint8list.value!, bucketName, newFileName);
    result.when(
        success: (res) => _createPost(res),
        failure: () {
          UIHelper.showErrorFlutterToast("画像のアップロードが失敗しました");
        });
    endLoading();
  }

  Future<void> _createPost(String fileName) async {
    final repository = FirestoreRepository();
    final postId = randomString();
    final postRef = FirestoreQueries.userPostRef(currentUid(), postId);
    final customCompleteText = NewContent.newCustomCompleteText(
            systemPrompt.value,
            temperature.value,
            topP.value,
            presencePenalty.value,
            frequencyPenalty.value)
        .toJson()
      ..removeWhere((key, value) => value == null);
    final newPost = NewContent.newPost(
        systemPrompt.trim(),
        title.trim(),
        description.trim(),
        fileName,
        CurrentUserController.to.rxPublicUser.value!,
        postId,
        postRef,
        customCompleteText);
    final result = await repository.createPost(postRef, newPost.toJson());
    result.when(success: (_) {
      Get.back();
      _resetState(); // 初期化を行う
      _refreshMyPost(); // 投稿の再取得を行う
      UIHelper.showFlutterToast("投稿が作成できました！");
    }, failure: () {
      UIHelper.showErrorFlutterToast("投稿が作成できませんでした");
    });
  }

  void _resetState() {
    title.value = "";
    systemPrompt.value = FormConsts.defaultSystemPrompt;
    description.value = "";
    temperature.value = FormConsts.defaultTemperature.toString();
    topP.value = FormConsts.defaultTopP.toString();
    presencePenalty.value = FormConsts.defaultPresencePenalty.toString();
    frequencyPenalty.value = FormConsts.defaultFrequencyPenalty.toString();
    uint8list.value = null;
  }

  void onImagePickButtonPressed() async {
    // TODO: ImageControllerでLoadingControllerを継承して一般化
    final result = await FileUtility.getCompressedImage();
    if (result == null) return;
    final info = await FileUtility.getImageInfo(result);
    final isNotSquare = info.isNotSquare;
    if (isNotSquare) {
      UIHelper.showErrorFlutterToast(FileUtility.squareImageRequestMsg);
      return;
    }
    final isSmall = info.isSmall;
    if (isSmall) {
      UIHelper.showErrorFlutterToast(FormConsts.bigImageRequestMsg);
      return;
    }
    uint8list(result);
  }

  // 投稿を作成した後に再取得
  Future<void> _refreshMyPost() async {
    final myProfileController = MyProfileController.to;
    myProfileController.docs.isEmpty
        ? await myProfileController.onReload()
        : await MyProfileController.to.onRefresh();
  }
}
