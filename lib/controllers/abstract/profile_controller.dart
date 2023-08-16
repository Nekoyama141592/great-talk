import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/controllers/abstract/docs_controller.dart';
import 'package:great_talk/model/public_user/public_user.dart';
import 'package:great_talk/utility/file_utility.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class ProfileController extends DocsController {
  ProfileController(this.isMyProfile)
      : super(enablePullDown: true, requiresValueReset: !isMyProfile);
  final bool isMyProfile;
  final Rx<PublicUser?> passiveUser = Rx(null);
  final Rx<Uint8List?> uint8list = Rx(null);
  String passiveUid() => isMyProfile ? currentUid() : Get.parameters['uid']!;

  @override
  Future<void> fetchDocs() async {
    // MyProfileのpassiveUserの情報はCurrentUserControllerで代入される
    if (!isMyProfile) {
      await _getPassiveUser();
    }
    final result = await repository.getUserPostsByNewest(passiveUid());
    result.when(success: (res) {
      setAllDocs(res);
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
    final detectedImage = passiveUser.value!.typedImage();
    final s3Image = await FileUtility.getS3Image(
        detectedImage.bucketName, detectedImage.value);
    uint8list(s3Image);
  }

  @override
  Future<void> onLoading(RefreshController refreshController) async {
    final result =
        await repository.getMoreUserPostsByNewest(passiveUid(), docs.last.doc);
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
        await repository.getNewUserPostsByNewest(passiveUid(), docs.first.doc);
    result.when(success: (res) {
      insertAllDocs(res);
    }, failure: () {
      UIHelper.showErrorFlutterToast("データの取得に失敗しました");
    });
    refreshController.refreshCompleted();
  }
}
