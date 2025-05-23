import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:great_talk/core/maps.dart';
import 'package:great_talk/core/strings.dart';
import 'package:great_talk/ui_core/ui_helper.dart';
import 'package:great_talk/controllers/abstract/forms_controller.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/core/firestore/doc_ref_core.dart';
import 'package:great_talk/extensions/string_extension.dart';
import 'package:great_talk/mixin/current_uid_mixin.dart';
import 'package:great_talk/model/detected_image/detected_image.dart';
import 'package:great_talk/model/rest_api/put_object/request/put_object_request.dart';
import 'package:great_talk/model/user_update_log/user_update_log.dart';
import 'package:great_talk/repository/aws_s3_repository.dart';
import 'package:great_talk/repository/firestore_repository.dart';
import 'package:great_talk/utility/aws_s3_utility.dart';

class EditController extends FormsController with CurrentUserMixin {
  static EditController get to => Get.find<EditController>();
  final rxUserName =
      (CurrentUserController.to.rxPublicUser.value?.nameValue ?? "").obs;
  final rxBio =
      (CurrentUserController.to.rxPublicUser.value?.bioValue ?? "").obs;

  void init() {
    rxPickedUint8list.value ??= CurrentUserController.to.rxUint8list.value;
  }

  // セッターメソッド
  void setBio(String? value) {
    if (value == null) return;
    rxBio.value = value;
  }

  void setUserName(String? value) {
    if (value == null) return;
    rxUserName.value = value;
  }

  @override
  void onPositiveButtonPressed() async {
    final uint8list = rxPickedUint8list.value;
    if (uint8list == null) {
      await UIHelper.showErrorFlutterToast("アイコンをタップしてプロフィール画像をアップロードしてください");
      return;
    }
    final userName = rxUserName.value;
    final bio = rxBio.value;
    if (userName.isEmpty ||
        bio.isEmpty ||
        userName.invalidField ||
        userName == noName) {
      await UIHelper.showErrorFlutterToast("条件を満たしていないものがあります");
      return;
    }
    if (isLoading.value) return; // 二重リクエストを防止.
    startLoading();
    final publicUser = CurrentUserController.to.rxPublicUser.value;
    if (publicUser == null) return;
    if (isPicked) {
      final fileName = AWSS3Utility.profileObject(currentUid());
      final request = PutObjectRequest.fromUint8List(
          uint8list: uint8list, fileName: fileName);
      final result = await AWSS3Repository().putObject(request);
      await result.when(success: (res) async {
        await _createUserUpdateLog(fileName); // ユーザー情報を更新.
      }, failure: (e) {
        UIHelper.showErrorFlutterToast("画像のアップロードが失敗しました");
      });
    } else {
      // 写真がそのまま場合の処理
      await _createUserUpdateLog(publicUser.typedImage().value);
    }
    endLoading();
  }

  Future<void> _createUserUpdateLog(String fileName) async {
    final repository = FirestoreRepository();
    final bio = rxBio.value;
    final userName = rxUserName.value;
    final newUpdateLog = UserUpdateLog(
        logCreatedAt: Timestamp.now(),
        searchToken: returnSearchToken(userName),
        stringBio: bio.trim(),
        stringUserName: userName.trim(),
        uid: currentUid(),
        image: DetectedImage(value: fileName).toJson(),
        userRef: CurrentUserController.to.rxPublicUser.value!.ref);
    final ref = DocRefCore.userUpdateLog(currentUid());
    final json = newUpdateLog.toJson();
    final result = await repository.createDoc(ref, json);
    result.when(success: (_) {
      CurrentUserController.to.updateUser(userName, bio, fileName);
      Get.back();
      Get.back();
      UIHelper.showFlutterToast("プロフィールを更新できました！変更が完全に反映されるまで時間がかかります。");
    }, failure: (e) {
      UIHelper.showErrorFlutterToast("プロフィールを更新できませんでした");
    });
  }
}
