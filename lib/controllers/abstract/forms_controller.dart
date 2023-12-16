import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/consts/form_consts.dart';
import 'package:great_talk/controllers/abstract/loading_controller.dart';
import 'package:great_talk/utility/file_utility.dart';

abstract class FormsController extends LoadingController {
  bool isPicked = false; // 画像を新たに取得したか判定するフラグ
  final Rx<Uint8List?> rxUint8list = Rx(null);

  void onPositiveButtonPressed();
  void onImagePickButtonPressed() async {
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
    rxUint8list(result);
    isPicked = true;
  }

  String get invalidFieldMsg =>
      "${FormConsts.notUseOnField.join(",")}の文字は使用できません";
}
