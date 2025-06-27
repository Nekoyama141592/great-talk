extension DoubleRoundingExtension on double {
  double roundToSecondDecimalPlace() {
    if (!isFinite) {
      return this;
    }
    const int decimalPlaces = 1; // 少数第二位で丸める
    const multiplier = 10 * decimalPlaces;
    final roundedValue = (this * multiplier).round() / multiplier;
    return roundedValue;
  }
}
