import 'package:great_talk/extensions/double_extensions.dart';

extension StringExtension on String {
  // double toDouble() => double.parse(this);
  double toRoundToSecondDecimalPlace() =>
      double.parse(this).roundToSecondDecimalPlace();
  String removeNewlinesAndSpaces() {
    return replaceAll('\n', '').replaceAll(' ', '');
  }
}
