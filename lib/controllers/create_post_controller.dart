import 'package:get/get.dart';
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/consts/form_consts.dart';
import 'package:great_talk/controllers/abstract/forms_controller.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/core/firestore/doc_ref_core.dart';
import 'package:great_talk/extensions/string_extension.dart';
import 'package:great_talk/mixin/current_uid_mixin.dart';
import 'package:great_talk/repository/aws_s3_repository.dart';
import 'package:great_talk/repository/firestore_repository.dart';
import 'package:great_talk/utility/aws_s3_utility.dart';
import 'package:great_talk/utility/new_content.dart';
import 'package:great_talk/validator/post_validator.dart';
import 'package:great_talk/views/auth/login_page.dart';
import 'package:great_talk/views/create_post/create_post_page.dart';
import 'package:great_talk/views/edit_page.dart';

class CreatePostController extends FormsController with CurrentUserMixin {
  static CreatePostController get to => Get.find<CreatePostController>();
  final title = "".obs;
  final systemPrompt = FormConsts.defaultSystemPrompt.obs;
  final description = "".obs;
  final temperature = FormConsts.defaultTemperature.toString().obs;
  final topP = FormConsts.defaultTopP.toString().obs;
  final presencePenalty = FormConsts.defaultPresencePenalty.toString().obs;
  final frequencyPenalty = FormConsts.defaultFrequencyPenalty.toString().obs;
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

  @override
  Future<void> onPositiveButtonPressed() async {
    if (rxUint8list.value == null) {
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
    final newFileName = AWSS3Utility.s3FileName(currentUid());
    final bucketName = AWSS3Utility.postImagesBucketName;
    final repository = AWSS3Repository();
    final result =
        await repository.putObject(rxUint8list.value!, bucketName, newFileName);
    result.when(
        success: (res) => _createPost(res),
        failure: () {
          UIHelper.showErrorFlutterToast("画像のアップロードが失敗しました");
        });
    endLoading();
  }

  Future<void> _createPost(String fileName) async {
    final publicUser = CurrentUserController.to.rxPublicUser.value;
    if (publicUser == null) return;
    final repository = FirestoreRepository();
    final postId = randomString();
    final postRef = DocRefCore.post(currentUid(), postId);
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
        postId,
        postRef,
        customCompleteText,
        publicUser.uid);
    final json = newPost.toJson();
    final result = await repository.createDoc(postRef, json);
    result.when(success: (_) {
      Get.back();
      _resetState(); // 初期化を行う
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
    rxUint8list.value = null;
  }

  void onFloatingActionButtonPressed() {
    final publicUser = CurrentUserController.to.rxPublicUser.value;
    if (publicUser == null) {
      _toLoginPage();
    } else {
      publicUser.hasNoBio
          ? _toEditProfilePage()
          : Get.toNamed(CreatePostPage.path);
    }
  }

  void _toEditProfilePage() {
    UIHelper.showErrorFlutterToast("投稿するにはプロフィールを編集してください");
    Get.toNamed(EditProfilePage.path);
  }

  void _toLoginPage() {
    UIHelper.showErrorFlutterToast("投稿するにはログインが必要です");
    Get.toNamed(LoginPage.path);
  }
}
