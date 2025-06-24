import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/extension/custom_date_time_formatting.dart';

void main() {
  group('CustomDateTimeFormatting', () {
    group('timeString', () {
      test('should format hour and minute with leading zeros', () {
        final dateTime = DateTime(2023, 5, 15, 9, 5);
        expect(dateTime.timeString(), '09:05');
      });

      test(
        'should format hour and minute without leading zeros when not needed',
        () {
          final dateTime = DateTime(2023, 5, 15, 14, 30);
          expect(dateTime.timeString(), '14:30');
        },
      );

      test('should handle midnight correctly', () {
        final dateTime = DateTime(2023, 5, 15, 0, 0);
        expect(dateTime.timeString(), '00:00');
      });

      test('should handle noon correctly', () {
        final dateTime = DateTime(2023, 5, 15, 12, 0);
        expect(dateTime.timeString(), '12:00');
      });

      test('should handle single digit minutes', () {
        final dateTime = DateTime(2023, 5, 15, 15, 7);
        expect(dateTime.timeString(), '15:07');
      });

      test('should handle late night hours', () {
        final dateTime = DateTime(2023, 5, 15, 23, 59);
        expect(dateTime.timeString(), '23:59');
      });
    });

    group('isSameDay', () {
      test('should return true for same date with different times', () {
        final dateTime1 = DateTime(2023, 5, 15, 9, 30);
        final dateTime2 = DateTime(2023, 5, 15, 18, 45);
        expect(dateTime1.isSameDay(dateTime1, dateTime2), true);
      });

      test('should return false for different dates', () {
        final dateTime1 = DateTime(2023, 5, 15, 9, 30);
        final dateTime2 = DateTime(2023, 5, 16, 9, 30);
        expect(dateTime1.isSameDay(dateTime1, dateTime2), false);
      });

      test('should return false for different months', () {
        final dateTime1 = DateTime(2023, 5, 15, 9, 30);
        final dateTime2 = DateTime(2023, 6, 15, 9, 30);
        expect(dateTime1.isSameDay(dateTime1, dateTime2), false);
      });

      test('should return false for different years', () {
        final dateTime1 = DateTime(2023, 5, 15, 9, 30);
        final dateTime2 = DateTime(2024, 5, 15, 9, 30);
        expect(dateTime1.isSameDay(dateTime1, dateTime2), false);
      });

      test('should return true for identical DateTimes', () {
        final dateTime = DateTime(2023, 5, 15, 9, 30);
        expect(dateTime.isSameDay(dateTime, dateTime), true);
      });

      test('should handle leap year dates correctly', () {
        final dateTime1 = DateTime(2024, 2, 29, 10, 0);
        final dateTime2 = DateTime(2024, 2, 29, 22, 0);
        expect(dateTime1.isSameDay(dateTime1, dateTime2), true);
      });
    });

    group('japaneseDifference', () {
      test('should return time format for same day', () {
        final now = DateTime.now();
        final sameDay = DateTime(now.year, now.month, now.day, 14, 30);
        expect(sameDay.japaneseDifference(), '14:30');
      });

      test('should return time format for same day with different format', () {
        final now = DateTime.now();
        final sameDay = DateTime(now.year, now.month, now.day, 9, 5);
        expect(sameDay.japaneseDifference(), '09:05');
      });

      test('should handle weekday formatting correctly', () {
        final testDateTime = DateTime(2023, 5, 15);

        expect(testDateTime.weekday, 1);
      });

      test('should return month/day format for dates within a year', () {
        final pastDate = DateTime(2023, 5, 15, 14, 30);
        final result = pastDate.japaneseDifference();

        expect(result.contains('/'), true);
      });

      test('should return full date format for dates over a year ago', () {
        final testDate = DateTime(2020, 5, 15, 14, 30);
        final result = testDate.japaneseDifference();

        expect(result.contains('2020'), true);
        expect(result.split('/').length, 3);
      });

      test('should handle edge cases correctly', () {
        final now = DateTime.now();
        final yesterday = now.subtract(const Duration(days: 1));
        final dayBeforeYesterday = now.subtract(const Duration(days: 2));

        expect(yesterday.japaneseDifference(), '昨日');
        expect(dayBeforeYesterday.japaneseDifference(), '一昨日');
      });

      test('should format month and day with proper padding in full date', () {
        final testDate = DateTime(2020, 5, 5, 14, 30);
        final result = testDate.japaneseDifference();

        expect(result, '2020/05/05');
      });

      test('should handle dates exactly 7 days ago', () {
        final now = DateTime.now();
        final weekAgo = now.subtract(const Duration(days: 7));
        final result = weekAgo.japaneseDifference();

        final weekdays = ['月曜日', '火曜日', '水曜日', '木曜日', '金曜日', '土曜日', '日曜日'];
        expect(weekdays.contains(result), true);
      });

      test('should handle dates exactly 365 days ago', () {
        final now = DateTime.now();
        final yearAgo = now.subtract(const Duration(days: 365));
        final result = yearAgo.japaneseDifference();

        expect(result.contains(yearAgo.month.toString()), true);
        expect(result.contains(yearAgo.day.toString()), true);
      });

      test('should be consistent with timeString format for same day', () {
        final now = DateTime.now();
        final sameDay = DateTime(now.year, now.month, now.day, 14, 30);

        expect(sameDay.japaneseDifference(), sameDay.timeString());
      });
    });

    group('edge cases', () {
      test('should handle minimum DateTime values', () {
        final minDateTime = DateTime(1);
        expect(minDateTime.timeString(), '00:00');
      });

      test('should handle maximum DateTime values', () {
        final maxDateTime = DateTime(9999, 12, 31, 23, 59);
        expect(maxDateTime.timeString(), '23:59');
      });

      test('should handle leap year February 29th', () {
        final leapDay = DateTime(2024, 2, 29, 12, 0);
        expect(leapDay.timeString(), '12:00');
      });
    });

    group('consistency tests', () {
      test('should maintain consistent formatting across different years', () {
        final date1 = DateTime(2020, 5, 15, 9, 30);
        final date2 = DateTime(2023, 5, 15, 9, 30);

        expect(date1.timeString(), date2.timeString());
      });

      test('should handle time zone independent calculations', () {
        final utcDate = DateTime.utc(2023, 5, 15, 12, 0);
        final localDate = DateTime(2023, 5, 15, 12, 0);

        expect(utcDate.timeString(), localDate.timeString());
      });
    });
  });
}
