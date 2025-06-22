import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/extension/double_extensions.dart';

void main() {
  group('DoubleRoundingExtension', () {
    group('roundToSecondDecimalPlace', () {
      test('should round to first decimal place correctly', () {
        // Note: The comment in the code says "少数第二位で丸める" (round to second decimal place)
        // but the implementation actually rounds to first decimal place (multiplier = 10 * 1)
        expect(3.14159.roundToSecondDecimalPlace(), 3.1);
        expect(2.95.roundToSecondDecimalPlace(), 3.0);
        expect(2.94.roundToSecondDecimalPlace(), 2.9);
        expect(1.05.roundToSecondDecimalPlace(), 1.1);
        expect(1.04.roundToSecondDecimalPlace(), 1.0);
      });

      test('should handle exact decimal values', () {
        expect(3.0.roundToSecondDecimalPlace(), 3.0);
        expect(3.1.roundToSecondDecimalPlace(), 3.1);
        expect(3.5.roundToSecondDecimalPlace(), 3.5);
        expect(3.9.roundToSecondDecimalPlace(), 3.9);
      });

      test('should handle negative numbers', () {
        expect((-3.14159).roundToSecondDecimalPlace(), -3.1);
        expect((-2.95).roundToSecondDecimalPlace(), -3.0);
        expect((-2.94).roundToSecondDecimalPlace(), -2.9);
        expect((-1.05).roundToSecondDecimalPlace(), -1.1);
        expect((-1.04).roundToSecondDecimalPlace(), -1.0);
      });

      test('should handle zero and very small numbers', () {
        expect(0.0.roundToSecondDecimalPlace(), 0.0);
        expect(0.01.roundToSecondDecimalPlace(), 0.0);
        expect(0.05.roundToSecondDecimalPlace(), 0.1);
        expect(0.09.roundToSecondDecimalPlace(), 0.1);
        expect(0.04.roundToSecondDecimalPlace(), 0.0);
      });

      test('should handle large numbers', () {
        expect(1234.56789.roundToSecondDecimalPlace(), 1234.6);
        expect(999999.95.roundToSecondDecimalPlace(), 1000000.0);
        expect(123456789.12345.roundToSecondDecimalPlace(), 123456789.1);
      });

      test('should handle edge cases around rounding boundary', () {
        expect(1.15.roundToSecondDecimalPlace(), 1.2);
        expect(1.14.roundToSecondDecimalPlace(), 1.1);
        expect(1.25.roundToSecondDecimalPlace(), 1.3);
        expect(1.24.roundToSecondDecimalPlace(), 1.2);
      });

      test('should handle very precise decimal values', () {
        expect(1.049999999.roundToSecondDecimalPlace(), 1.0);
        expect(1.050000001.roundToSecondDecimalPlace(), 1.1);
        expect(2.9499999999.roundToSecondDecimalPlace(), 2.9);
        expect(2.9500000001.roundToSecondDecimalPlace(), 3.0);
      });

      test('should maintain precision for already rounded values', () {
        expect(1.0.roundToSecondDecimalPlace(), 1.0);
        expect(1.1.roundToSecondDecimalPlace(), 1.1);
        expect(1.2.roundToSecondDecimalPlace(), 1.2);
        expect(1.9.roundToSecondDecimalPlace(), 1.9);
      });

      test('should handle special double values', () {
        expect(double.infinity.roundToSecondDecimalPlace(), double.infinity);
        expect(double.negativeInfinity.roundToSecondDecimalPlace(), double.negativeInfinity);
        expect(double.nan.roundToSecondDecimalPlace().isNaN, true);
      });

      test('should verify the multiplier calculation', () {
        // Verify that the implementation actually uses multiplier = 10 * 1 = 10
        // This means it rounds to 1 decimal place, not 2 as the comment suggests
        const testValue = 1.23456;
        const expectedMultiplier = 10; // 10 * decimalPlaces where decimalPlaces = 1
        final manualResult = (testValue * expectedMultiplier).round() / expectedMultiplier;
        expect(testValue.roundToSecondDecimalPlace(), manualResult);
        expect(testValue.roundToSecondDecimalPlace(), 1.2);
      });
    });
  });
}