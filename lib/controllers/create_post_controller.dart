import 'package:get/get.dart';
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/infrastructure/firestore/firestore_queries.dart';
import 'package:great_talk/mixin/current_uid_mixin.dart';
import 'package:great_talk/repository/firestore_repository.dart';
import 'package:great_talk/utility/new_content.dart';

class CreatePostController extends GetxController with CurrentUserMixin {
  String title = "";
  Future<void> onCreateButtonPressed() async {
    final repository = FirestoreRepository();
    final postId = randomString();
    final postRef = FirestoreQueries.userPostRef(currentUid(), postId);
    final newPost = NewContent.newPost(
        title, CurrentUserController.to.firestoreUser.value!, postId, postRef);
    final result = await repository.createPost(postRef, newPost.toJson());
    result.when(success: (_) {
      UIHelper.showFlutterToast("投稿が作成できました！");
    }, failure: () {
      UIHelper.showFlutterToast("投稿が作成できませんでした");
    });
  }
}
