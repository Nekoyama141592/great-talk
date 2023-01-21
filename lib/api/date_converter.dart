class DateConverter {
  
  static DateTime _intToDateTime(int date) {
    var year = date ~/ 10000;
    var month = (date % 10000) ~/ 100;
    var day = date % 100;
    return DateTime(year, month, day);
  }

  static int dateTimeToInt(DateTime date) {
    return (date.year * 10000) + (date.month * 100) + date.day;
  }

  static bool is24HourPassed(int last, DateTime now) {
    final date1 = _intToDateTime(last);
    final date2 = now;
    final difference = date2.difference(date1);
    return difference.inHours >= 24;
  }

  static int nowDateTime() => DateTime.now().millisecondsSinceEpoch;
}