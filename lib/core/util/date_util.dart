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
}
