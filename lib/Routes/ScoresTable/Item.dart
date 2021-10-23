class Item {
  static final _monthMapper = {
    1: "января",
    2: "февраля",
    3: "марта",
    4: "апреля",
    5: "мая",
    6: "июня",
    7: "июля",
    8: "августа",
    9: "сентября",
    10: "октября",
    11: "ноября",
    12: "декабря"
  };

  static String _prependNumber(int number) {
    final intStr = number.toString();
    if (intStr.length == 1) {
      return '0$intStr';
    }
    return intStr;
  }

  final DateTime _date;

  final int score;

  Item(this._date, this.score);

  getDate() {
    return _date;
  }

  formatDate() {
    final year = _date.year;
    final month = _date.month;
    final day = _date.day;

    final hours = _date.hour;
    final minutes = _date.minute;

    final monthString = _monthMapper[month] ?? "(месяц неизвестен)";
    final hoursString = _prependNumber(hours);
    final minutesString = _prependNumber(minutes);

    return '$day $monthString $year года в $hoursString:$minutesString';
  }
}