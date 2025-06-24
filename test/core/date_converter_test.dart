import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/core/date_converter.dart';

void main() {
  group('DateConverter', () {
    group('intToDateTime', () {
      test('should convert int to DateTime correctly', () {
        const input = 20231215;
        final result = DateConverter.intToDateTime(input);

        expect(result.year, 2023);
        expect(result.month, 12);
        expect(result.day, 15);
      });

      test('should handle single digit month and day', () {
        const input = 20230105;
        final result = DateConverter.intToDateTime(input);

        expect(result.year, 2023);
        expect(result.month, 1);
        expect(result.day, 5);
      });

      test('should handle edge case dates', () {
        const input = 20240229;
        final result = DateConverter.intToDateTime(input);

        expect(result.year, 2024);
        expect(result.month, 2);
        expect(result.day, 29);
      });

      test('should handle year 1000', () {
        const input = 10000101;
        final result = DateConverter.intToDateTime(input);

        expect(result.year, 1000);
        expect(result.month, 1);
        expect(result.day, 1);
      });

      test('should handle maximum date values', () {
        const input = 99991231;
        final result = DateConverter.intToDateTime(input);

        expect(result.year, 9999);
        expect(result.month, 12);
        expect(result.day, 31);
      });
    });

    group('dateTimeToInt', () {
      test('should convert DateTime to int correctly', () {
        final input = DateTime(2023, 12, 15);
        final result = DateConverter.dateTimeToInt(input);

        expect(result, 20231215);
      });

      test('should handle single digit month and day', () {
        final input = DateTime(2023, 1, 5);
        final result = DateConverter.dateTimeToInt(input);

        expect(result, 20230105);
      });

      test('should handle leap year date', () {
        final input = DateTime(2024, 2, 29);
        final result = DateConverter.dateTimeToInt(input);

        expect(result, 20240229);
      });

      test('should handle year 1000', () {
        final input = DateTime(1000, 1, 1);
        final result = DateConverter.dateTimeToInt(input);

        expect(result, 10000101);
      });

      test('should handle maximum date values', () {
        final input = DateTime(9999, 12, 31);
        final result = DateConverter.dateTimeToInt(input);

        expect(result, 99991231);
      });
    });

    group('conversion consistency', () {
      test(
        'should maintain consistency between int and DateTime conversion',
        () {
          const originalInt = 20231215;
          final dateTime = DateConverter.intToDateTime(originalInt);
          final convertedInt = DateConverter.dateTimeToInt(dateTime);

          expect(convertedInt, originalInt);
        },
      );

      test(
        'should maintain consistency between DateTime and int conversion',
        () {
          final originalDateTime = DateTime(2023, 12, 15);
          final intValue = DateConverter.dateTimeToInt(originalDateTime);
          final convertedDateTime = DateConverter.intToDateTime(intValue);

          expect(convertedDateTime.year, originalDateTime.year);
          expect(convertedDateTime.month, originalDateTime.month);
          expect(convertedDateTime.day, originalDateTime.day);
        },
      );

      test('should handle multiple conversion cycles', () {
        const originalInt = 20240229;

        final dateTime1 = DateConverter.intToDateTime(originalInt);
        final int1 = DateConverter.dateTimeToInt(dateTime1);
        final dateTime2 = DateConverter.intToDateTime(int1);
        final int2 = DateConverter.dateTimeToInt(dateTime2);

        expect(int2, originalInt);
        expect(dateTime2.year, dateTime1.year);
        expect(dateTime2.month, dateTime1.month);
        expect(dateTime2.day, dateTime1.day);
      });
    });

    group('nowDateTime', () {
      test('should return current timestamp as int', () {
        final result = DateConverter.nowDateTime();
        final currentTime = DateTime.now().millisecondsSinceEpoch;

        expect(result, isA<int>());
        expect((result - currentTime).abs(), lessThan(1000));
      });

      test(
        'should return different values when called multiple times',
        () async {
          final result1 = DateConverter.nowDateTime();
          await Future.delayed(const Duration(milliseconds: 10));
          final result2 = DateConverter.nowDateTime();

          expect(result2, greaterThan(result1));
        },
      );
    });

    group('isCrossingDate', () {
      test('should return false for same date', () {
        final date1 = DateTime(2023, 12, 15, 10, 30);
        final date2 = DateTime(2023, 12, 15, 14, 45);

        final result = DateConverter.isCrossingDate(date1, date2);

        expect(result, false);
      });

      test('should return true for different days', () {
        final date1 = DateTime(2023, 12, 15, 23, 30);
        final date2 = DateTime(2023, 12, 16, 1, 15);

        final result = DateConverter.isCrossingDate(date1, date2);

        expect(result, true);
      });

      test('should return true for different months', () {
        final date1 = DateTime(2023, 11, 30, 10, 30);
        final date2 = DateTime(2023, 12, 1, 10, 30);

        final result = DateConverter.isCrossingDate(date1, date2);

        expect(result, true);
      });

      test('should return true for different years', () {
        final date1 = DateTime(2023, 12, 31, 23, 59);
        final date2 = DateTime(2024, 1, 1, 0, 1);

        final result = DateConverter.isCrossingDate(date1, date2);

        expect(result, true);
      });

      test('should return false for same date with different times', () {
        final date1 = DateTime(2023, 12, 15, 0, 0, 0);
        final date2 = DateTime(2023, 12, 15, 23, 59, 59);

        final result = DateConverter.isCrossingDate(date1, date2);

        expect(result, false);
      });

      test('should handle leap year date crossing', () {
        final date1 = DateTime(2024, 2, 28, 23, 59);
        final date2 = DateTime(2024, 2, 29, 0, 1);

        final result = DateConverter.isCrossingDate(date1, date2);

        expect(result, true);
      });

      test('should handle same exact DateTime', () {
        final date = DateTime(2023, 12, 15, 12, 30, 45);

        final result = DateConverter.isCrossingDate(date, date);

        expect(result, false);
      });

      test('should handle reverse order dates', () {
        final date1 = DateTime(2023, 12, 16, 10, 30);
        final date2 = DateTime(2023, 12, 15, 14, 45);

        final result = DateConverter.isCrossingDate(date1, date2);

        expect(result, true);
      });
    });
  });
}
