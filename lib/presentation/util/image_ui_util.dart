import 'dart:io';

import 'package:great_talk/presentation/constant/form_consts.dart';

class ImageUiUtil {
  static String get squareImageRequestMsg =>
      Platform.isIOS
          ? FormConsts.iosSquareImageRequestMsg
          : FormConsts.androidSquareImageRequestMsg;
}
