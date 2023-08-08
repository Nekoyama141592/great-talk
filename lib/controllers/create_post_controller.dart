import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/infrastructure/firestore/firestore_queries.dart';
import 'package:great_talk/mixin/current_uid_mixin.dart';
import 'package:great_talk/model/aws_s3_repository.dart';
import 'package:great_talk/repository/firestore_repository.dart';
import 'package:great_talk/utility/file_utility.dart';
import 'package:great_talk/utility/new_content.dart';

class CreatePostController extends GetxController with CurrentUserMixin {
  Rx<Uint8List?> uint8List = Rx(null);
  String title = "";
  String systemPrompt = "";
  Future<void> onCreateButtonPressed() async {
    if (title.isEmpty || systemPrompt.isEmpty) {
      return;
    }
    final repository = FirestoreRepository();
    final postId = randomString();
    final postRef = FirestoreQueries.userPostRef(currentUid(), postId);
    final newPost = NewContent.newPost(systemPrompt, title,
        CurrentUserController.to.publicUser.value!, postId, postRef);
    final result = await repository.createPost(postRef, newPost.toJson());
    result.when(success: (_) {
      UIHelper.showFlutterToast("投稿が作成できました！");
    }, failure: () {
      UIHelper.showErrorFlutterToast("投稿が作成できませんでした");
    });
  }

  void onImagePickButtonPressed() async {
    final result = await FileUtility.getCompressedImage();
    uint8List(result);
  }

  void onUploadButtonPressed() async {
    final newFileName = s3FileName();
    await _uploadImage(newFileName);
  }

  Future<void> _uploadImage(String newFileName) async {
    if (uint8List.value == null) {
      return;
    }
    final repository = AWSS3Repository();
    final result = await repository.uploadImage(uint8List.value!, newFileName);
    result.when(
        success: (res) {},
        failure: () {
          UIHelper.showErrorFlutterToast("画像のアップロードが失敗しました");
        });
  }
}
