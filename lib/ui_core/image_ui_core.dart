import 'dart:io';

import 'package:great_talk/consts/form_consts.dart';

class ImageUiCore {
  static String get squareImageRequestMsg =>
      Platform.isIOS
          ? FormConsts.iosSquareImageRequestMsg
          : FormConsts.androidSquareImageRequestMsg;
}
