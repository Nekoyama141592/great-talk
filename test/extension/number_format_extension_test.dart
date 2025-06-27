import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/core/extension/number_format_extension.dart';

void main() {
  group('NumberFormatExtension', () {
    group('formatNumber', () {
      test('should format numbers in billions with B suffix', () {
        expect(1000000000.formatNumber(), '1.0B');
        expect(1500000000.formatNumber(), '1.5B');
        expect(2300000000.formatNumber(), '2.3B');
        expect(10000000000.formatNumber(), '10.0B');
      });

      test('should format numbers in millions with M suffix', () {
        expect(1000000.formatNumber(), '1.0M');
        expect(1500000.formatNumber(), '1.5M');
        expect(2300000.formatNumber(), '2.3M');
        expect(999000000.formatNumber(), '999.0M');
      });

      test('should format numbers in thousands with k suffix', () {
        expect(1000.formatNumber(), '1.0k');
        expect(1500.formatNumber(), '1.5k');
        expect(2300.formatNumber(), '2.3k');
        expect(999000.formatNumber(), '999.0k');
      });

      test('should return toString for numbers less than 1000', () {
        expect(0.formatNumber(), '0');
        expect(1.formatNumber(), '1');
        expect(999.formatNumber(), '999');
        expect(500.formatNumber(), '500');
      });

      test('should handle decimal numbers correctly', () {
        expect(1500.5.formatNumber(), '1.5k');
        expect(1500000.7.formatNumber(), '1.5M');
        expect(1500000000.9.formatNumber(), '1.5B');
      });

      test('should handle negative numbers correctly', () {
        expect((-1000).formatNumber(), '-1000');
        expect((-1000000).formatNumber(), '-1000000');
        expect((-1000000000).formatNumber(), '-1000000000');
        expect((-500).formatNumber(), '-500');
      });

      test('should handle edge case values', () {
        expect(999.formatNumber(), '999');
        expect(1000.formatNumber(), '1.0k');
        expect(999999.formatNumber(), '1000.0k');
        expect(1000000.formatNumber(), '1.0M');
        expect(999999999.formatNumber(), '1000.0M');
        expect(1000000000.formatNumber(), '1.0B');
      });

      test('should handle very large numbers', () {
        expect(1000000000000.formatNumber(), '1000.0B');
        expect(5000000000000.formatNumber(), '5000.0B');
      });

      test('should handle double precision correctly', () {
        expect(1234567890.formatNumber(), '1.2B');
        expect(1234567.formatNumber(), '1.2M');
        expect(1234.formatNumber(), '1.2k');
      });

      test('should format with exactly one decimal place', () {
        final result1 = 1234567890.formatNumber();
        final result2 = 1234567.formatNumber();
        final result3 = 1234.formatNumber();

        expect(result1.split('.')[1][0], '2');
        expect(result2.split('.')[1][0], '2');
        expect(result3.split('.')[1][0], '2');
      });

      test('should work with int type', () {
        const intValue = 1500000;
        expect(intValue.formatNumber(), '1.5M');
      });

      test('should work with double type', () {
        const doubleValue = 1500000.0;
        expect(doubleValue.formatNumber(), '1.5M');
      });

      test('should handle zero correctly', () {
        expect(0.formatNumber(), '0');
        expect(0.0.formatNumber(), '0.0');
      });

      test('should handle very small positive numbers', () {
        expect(0.1.formatNumber(), '0.1');
        expect(0.999.formatNumber(), '0.999');
      });

      test('should handle boundary values precisely', () {
        expect(999.9.formatNumber(), '999.9');
        expect(1000.0.formatNumber(), '1.0k');
        expect(999999.9.formatNumber(), '1000.0k');
        expect(1000000.0.formatNumber(), '1.0M');
        expect(999999999.9.formatNumber(), '1000.0M');
        expect(1000000000.0.formatNumber(), '1.0B');
      });

      test('should maintain consistent rounding', () {
        expect(1999.formatNumber(), '2.0k');
        expect(1999999.formatNumber(), '2.0M');
        expect(1999999999.formatNumber(), '2.0B');
      });

      test('should handle scientific notation input', () {
        expect((1e3).formatNumber(), '1.0k');
        expect((1e6).formatNumber(), '1.0M');
        expect((1e9).formatNumber(), '1.0B');
      });

      test('should format consistently regardless of input type', () {
        const intVal = 1500000;
        const doubleVal = 1500000.0;

        expect(intVal.formatNumber(), doubleVal.formatNumber());
      });
    });

    group('edge cases and precision', () {
      test('should handle maximum safe integer', () {
        const maxSafeInt = 9007199254740991;
        final result = maxSafeInt.formatNumber();
        expect(result.endsWith('B'), true);
      });

      test('should handle minimum safe integer', () {
        const minSafeInt = -9007199254740991;
        final result = minSafeInt.formatNumber();
        expect(result.startsWith('-'), true);
      });

      test('should handle infinity correctly', () {
        final infinityResult = double.infinity.formatNumber();
        final negInfinityResult = double.negativeInfinity.formatNumber();

        expect(infinityResult.contains('Infinity'), true);
        expect(negInfinityResult.contains('Infinity'), true);
        expect(negInfinityResult.startsWith('-'), true);
      });

      test('should handle NaN correctly', () {
        expect(double.nan.formatNumber(), 'NaN');
      });
    });

    group('real world scenarios', () {
      test('should format typical social media follower counts', () {
        expect(1500.formatNumber(), '1.5k');
        expect(15000.formatNumber(), '15.0k');
        expect(150000.formatNumber(), '150.0k');
        expect(1500000.formatNumber(), '1.5M');
        expect(15000000.formatNumber(), '15.0M');
      });

      test('should format typical view counts', () {
        expect(523.formatNumber(), '523');
        expect(1200.formatNumber(), '1.2k');
        expect(45000.formatNumber(), '45.0k');
        expect(2300000.formatNumber(), '2.3M');
      });

      test('should format financial numbers', () {
        expect(1000.formatNumber(), '1.0k');
        expect(1000000.formatNumber(), '1.0M');
        expect(1000000000.formatNumber(), '1.0B');
      });
    });
  });
}
