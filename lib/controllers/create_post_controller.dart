import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:great_talk/common/doubles.dart';
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/controllers/abstract/loading_controller.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/extensions/string_extension.dart';
import 'package:great_talk/infrastructure/firestore/firestore_queries.dart';
import 'package:great_talk/mixin/current_uid_mixin.dart';
import 'package:great_talk/model/aws_s3_repository.dart';
import 'package:great_talk/repository/firestore_repository.dart';
import 'package:great_talk/utility/aws_s3_utility.dart';
import 'package:great_talk/utility/file_utility.dart';
import 'package:great_talk/utility/new_content.dart';
import 'package:great_talk/validator/post_validator.dart';

class CreatePostController extends LoadingController with CurrentUserMixin {
  static CreatePostController get to => Get.find<CreatePostController>();
  String? title = "";
  String? systemPrompt = "";
  String? description = "";
  String? temperature = defaultTemperature.toString();
  String? topP = defaultTopP.toString();
  String? presencePenalty = defaultPresencePenalty.toString();
  String? frequencyPenalty = defaultFrequencyPenalty.toString();
  final Rx<Uint8List?> uint8list = Rx(null);
  // セッターメソッド
  void setTitle(String? value) => title = value;
  void setSystemPrompt(String? value) => systemPrompt = value;
  void setDescription(String? value) => description = value;
  void setTemperature(String? value) => temperature = value;
  void setTopP(String? value) => topP = value;
  void setPresencePenalty(String? value) => presencePenalty = value;
  void setFrequencyPenalty(String? value) => frequencyPenalty = value;

  Future<void> processCreatePost() async {
    if (uint8list.value == null) {
      await UIHelper.showErrorFlutterToast("アイコンをタップして画像をアップロードしてください");
      return;
    }
    if (PostValidator.isInValidPost(description, systemPrompt, title,
        temperature, topP, presencePenalty, frequencyPenalty)) {
      await UIHelper.showErrorFlutterToast("条件を満たしていないものがあります");
      return;
    }
    if ((temperature!.toRoundToSecondDecimalPlace() != defaultTemperature) &&
        (topP!.toRoundToSecondDecimalPlace() != defaultTopP)) {
      await UIHelper.showErrorFlutterToast("temperatureとtopPはどちらか一方しか変更できません");
      return;
    }
    if (isLoading.value) return; // 二重リクエストを防止.
    startLoading();
    final newFileName = s3FileName();
    final bucketName = AWSS3Utility.postImagesBucketName();
    final repository = AWSS3Repository();
    final result =
        await repository.uploadImage(uint8list.value!, bucketName, newFileName);
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
    final customCompleteText = NewContent.newCustomCompleteText(systemPrompt!,
            temperature!, topP!, presencePenalty!, frequencyPenalty!)
        .toJson()
      ..removeWhere((key, value) => value == null);
    final newPost = NewContent.newPost(
        systemPrompt!.trim(),
        title!.trim(),
        description!.trim(),
        fileName,
        CurrentUserController.to.publicUser.value!,
        postId,
        postRef,
        customCompleteText);
    final result = await repository.createPost(postRef, newPost.toJson());
    result.when(success: (_) {
      Get.back();
      UIHelper.showFlutterToast("投稿が作成できました！");
    }, failure: () {
      UIHelper.showErrorFlutterToast("投稿が作成できませんでした");
    });
  }

  void onImagePickButtonPressed() async {
    final result = await FileUtility.getCompressedImage();
    uint8list(result);
  }
}
