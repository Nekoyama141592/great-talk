class DateConverter {
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
  // 2つのDateTimeを受け取り、それらの日付（日、月、年）が異なる場合にtrueを返します.また、同一の日付であればfalseを返します.
  static bool isCrossingDate(DateTime startDate, DateTime endDate) {
    return startDate.day != endDate.day ||
        startDate.month != endDate.month ||
        startDate.year != endDate.year;
  }
}
