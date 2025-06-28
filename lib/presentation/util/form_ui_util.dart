import 'package:great_talk/presentation/constant/form_consts.dart';

class FormUiUtil {
  static String get invalidFieldMsg =>
      "${FormConsts.notUseOnField.join(",")}の文字は使用できません";
}
