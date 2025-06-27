import 'package:great_talk/consts/ui/form_consts.dart';
import 'package:great_talk/core/extension/double_extensions.dart';

extension StringExtension on String {
  // double toDouble() => double.parse(this);
  double toRoundToSecondDecimalPlace() =>
      double.parse(this).roundToSecondDecimalPlace();
  String removeNewlinesAndSpaces() {
    return replaceAll('\n', '').replaceAll(' ', '');
  }

  // firestoreのフィールドに使用できないならtrueを返す
  bool get invalidField {
    for (final value in FormConsts.notUseOnField) {
      if (contains(value)) {
        return true;
      }
    }
    return false;
  }
}
