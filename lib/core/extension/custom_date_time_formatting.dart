extension CustomDateTimeFormatting on DateTime {
  // 時刻を取得する.
  String timeString() {
    String hour = this.hour.toString().padLeft(2, '0');
    String minute = this.minute.toString().padLeft(2, '0');
    return "$hour:$minute";
  }

  // 同じ日かどうかを確認する.
  bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  // 曜日を取得する.
  String _getWeekdayString() {
    const weekdays = ['月', '火', '水', '木', '金', '土', '日'];
    return "${weekdays[weekday - 1]}曜日";
  }

  String japaneseDifference() {
    final now = DateTime.now();
    final difference = now.difference(this);
    if (isSameDay(now, this)) {
      return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
    } else if (difference.inDays == 1) {
      return '昨日';
    } else if (difference.inDays == 2) {
      return '一昨日';
    } else if (difference.inDays <= 7) {
      return _getWeekdayString();
    } else if (difference.inDays <= 365) {
      return '${month.toString()}/${day.toString()}';
    } else {
      return '$year/${month.toString().padLeft(2, '0')}/${day.toString().padLeft(2, '0')}';
    }
  }
}
