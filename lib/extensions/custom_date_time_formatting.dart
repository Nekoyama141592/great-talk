extension CustomDateTimeFormatting on DateTime {
  // 時刻を取得する.
  String timeString() {
    String hour = this.hour.toString().padLeft(2, '0');
    String minute = this.minute.toString().padLeft(2, '0');
    return "$hour:$minute";
  }
}
