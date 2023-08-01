import 'package:get/get.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/controllers/docs_controller.dart';
import 'package:great_talk/mixin/current_uid_mixin.dart';
import 'package:great_talk/model/firestore_user/firestore_user.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class ProfileController extends DocsController with CurrentUidMixin {
  ProfileController(this.isMyProfile) : super(enablePullDown: true);
  final bool isMyProfile;
  final Rx<FirestoreUser?> passiveUser = Rx(null);
  String passiveUid() => isMyProfile ? currentUid() : Get.parameters['uid']!;

  @override
  Future<void> fetchDocs() async {
    if (isMyProfile) {
      passiveUser(CurrentUserController.to.firestoreUser.value);
    } else {
      await _getPassiveUser();
    }
    final result = await repository.getUserPostsByNewest(passiveUid());
    result.when(success: (res) {
      docs(res);
    }, failure: () {
      UIHelper.showFlutterToast("データの取得に失敗しました");
    });
  }

  Future<void> _getPassiveUser() async {
    final result = await repository.getUser(Get.parameters['uid']!);
    result.when(success: (res) {
      passiveUser(FirestoreUser.fromJson(res.data()!)); // TODO: ハンドリング
    }, failure: () {
      UIHelper.showFlutterToast("データの取得に失敗しました");
    });
  }

  @override
  Future<void> onLoading(RefreshController refreshController) async {
    final result =
        await repository.getMoreUserPostsByNewest(passiveUid(), docs.last);
    result.when(success: (res) {
      addAllDocs(res);
    }, failure: () {
      UIHelper.showFlutterToast("データの取得に失敗しました");
    });
    refreshController.loadComplete();
  }

  @override
  Future<void> onRefresh(RefreshController refreshController) async {
    final result =
        await repository.getNewUserPostsByNewest(passiveUid(), docs.first);
    result.when(success: (res) {
      insertAllDocs(res);
    }, failure: () {
      UIHelper.showFlutterToast("データの取得に失敗しました");
    });
    refreshController.refreshCompleted();
  }
}
