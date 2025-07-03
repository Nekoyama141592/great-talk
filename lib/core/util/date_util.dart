class DateUtil {
  static DateTime milliSecondsToDateTime(String milliSeconds) {
    final intMilliSeconds = int.parse(milliSeconds);
    return DateTime.fromMillisecondsSinceEpoch(intMilliSeconds);
  }

  static bool isFuture(DateTime value) {
    final now = DateTime.now();
    return now.compareTo(value) < 0;
  }

  static String expireDateString(String milliSeconds) {
    final dateTime = milliSecondsToDateTime(milliSeconds);
    return dateTime.toString().replaceAll('.000', '');
  }

  static String toYyyyMmDd(DateTime? dateTime) {
    if (dateTime == null) return '';
    final year = dateTime.year.toString();
    final month = dateTime.month.toString().padLeft(2, '0');
    final day = dateTime.day.toString().padLeft(2, '0');
    return '$year/$month/$day';
  }

  static DateTime intToDateTime(int date) {
    var year = date ~/ 10000;
    var month = (date % 10000) ~/ 100;
    var day = date % 100;
    return DateTime(year, month, day);
  }

  static int dateTimeToInt(DateTime date) {
    return (date.year * 10000) + (date.month * 100) + date.day;
  }

  static int nowDateTime() => DateTime.now().millisecondsSinceEpoch;

  static bool isCrossingDate(DateTime startDate, DateTime endDate) {
    return startDate.day != endDate.day ||
        startDate.month != endDate.month ||
        startDate.year != endDate.year;
  }
}
