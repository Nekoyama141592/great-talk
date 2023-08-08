import 'package:get/get.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/controllers/docs_controller.dart';
import 'package:great_talk/model/public_user/public_user.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class ProfileController extends DocsController {
  ProfileController(this.isMyProfile)
      : super(enablePullDown: true, isUserDocs: false);
  final bool isMyProfile;
  final Rx<PublicUser?> passiveUser = Rx(null);
  String passiveUid() => isMyProfile ? currentUid() : Get.parameters['uid']!;

  @override
  Future<void> fetchDocs() async {
    if (isMyProfile) {
      passiveUser(CurrentUserController.to.publicUser.value);
    } else {
      await _getPassiveUser();
    }
    final result = await repository.getUserPostsByNewest(passiveUid());
    result.when(success: (res) {
      docs(res);
    }, failure: () {
      UIHelper.showErrorFlutterToast("データの取得に失敗しました");
    });
  }

  Future<void> _getPassiveUser() async {
    final result = await repository.getPublicUser(Get.parameters['uid']!);
    result.when(success: (res) {
      passiveUser(PublicUser.fromJson(res.data()!));
    }, failure: () {
      UIHelper.showErrorFlutterToast("データの取得に失敗しました");
    });
  }

  @override
  Future<void> onLoading(RefreshController refreshController) async {
    final result =
        await repository.getMoreUserPostsByNewest(passiveUid(), docs.last);
    result.when(success: (res) {
      addAllDocs(res);
    }, failure: () {
      UIHelper.showErrorFlutterToast("データの取得に失敗しました");
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
      UIHelper.showErrorFlutterToast("データの取得に失敗しました");
    });
    refreshController.refreshCompleted();
  }
}
