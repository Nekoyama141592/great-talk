import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/core/util/date_util.dart';

void main() {
  group('DateUtil', () {
    group('milliSecondsToDateTime', () {
      test('should convert valid milliseconds string to DateTime', () {
        const milliSeconds = '1672531200000'; // 2023-01-01 00:00:00 UTC
        final result = DateUtil.milliSecondsToDateTime(milliSeconds);

        expect(result, isA<DateTime>());
        expect(result.millisecondsSinceEpoch, 1672531200000);
      });

      test('should handle zero milliseconds', () {
        const milliSeconds = '0';
        final result = DateUtil.milliSecondsToDateTime(milliSeconds);

        expect(result.millisecondsSinceEpoch, 0);
      });

      test('should throw FormatException for invalid string', () {
        const invalidMilliSeconds = 'invalid';

        expect(
          () => DateUtil.milliSecondsToDateTime(invalidMilliSeconds),
          throwsA(isA<FormatException>()),
        );
      });

      test('should throw FormatException for empty string', () {
        const emptyMilliSeconds = '';

        expect(
          () => DateUtil.milliSecondsToDateTime(emptyMilliSeconds),
          throwsA(isA<FormatException>()),
        );
      });
    });

    group('isFuture', () {
      test('should return true for future date', () {
        final futureDate = DateTime.now().add(const Duration(days: 1));
        final result = DateUtil.isFuture(futureDate);

        expect(result, true);
      });

      test('should return false for past date', () {
        final pastDate = DateTime.now().subtract(const Duration(days: 1));
        final result = DateUtil.isFuture(pastDate);

        expect(result, false);
      });

      test('should return false for current time (approximately)', () {
        final now = DateTime.now();
        final result = DateUtil.isFuture(now);

        // Since there's a tiny time difference between creating the date and checking,
        // this could be either true or false, but should be false in most cases
        expect(result, false);
      });
    });

    group('expireDateString', () {
      test('should return formatted date string without .000', () {
        const milliSeconds = '1672531200000'; // 2023-01-01 00:00:00 UTC
        final result = DateUtil.expireDateString(milliSeconds);

        expect(result, isA<String>());
        expect(result, contains('2023-01-01'));
        expect(result, isNot(contains('.000')));
      });

      test('should handle milliseconds with .000 ending', () {
        const milliSeconds = '1672531200000';
        final result = DateUtil.expireDateString(milliSeconds);
        final dateTime = DateUtil.milliSecondsToDateTime(milliSeconds);
        final expectedString = dateTime.toString().replaceAll('.000', '');

        expect(result, expectedString);
      });

      test('should throw FormatException for invalid milliseconds', () {
        const invalidMilliSeconds = 'invalid';

        expect(
          () => DateUtil.expireDateString(invalidMilliSeconds),
          throwsA(isA<FormatException>()),
        );
      });
    });
  });
}
