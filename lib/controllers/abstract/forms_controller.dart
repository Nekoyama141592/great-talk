// import 'dart:typed_data';

// import 'package:get/get.dart';
// import 'package:great_talk/ui_core/ui_helper.dart';
// import 'package:great_talk/consts/form_consts.dart';
// import 'package:great_talk/utility/file_utility.dart';

// abstract class FormsController extends GetxController {
//   final isLoading = false.obs;
//   bool cannotShow() => isLoading.value;
//   void startLoading() => isLoading(true);
//   void endLoading() => isLoading(false);
//   bool isPicked = false; // 画像を新たに取得したか判定するフラグ
//   final Rx<Uint8List?> rxPickedUint8list = Rx(null);

//   void onImagePickButtonPressed() async {
//     final result = await FileUtility.getCompressedImage();
//     if (result == null) return;
//     final info = await FileUtility.getImageInfo(result);
//     final isNotSquare = info.isNotSquare;
//     if (isNotSquare) {
//       UIHelper.showErrorFlutterToast(FileUtility.squareImageRequestMsg);
//       return;
//     }
//     final isSmall = info.isSmall;
//     if (isSmall) {
//       UIHelper.showErrorFlutterToast(FormConsts.bigImageRequestMsg);
//       return;
//     }
//     rxPickedUint8list(result);
//     isPicked = true;
//   }
// }
