import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  int get totalDayInMonth {
    final beginningNextMonth =
        (month < 12) ? DateTime(year, month + 1) : DateTime(year + 1);
    return beginningNextMonth.subtract(const Duration(days: 1)).day;
  }

  DateTime get yearMonthDay => DateTime(year, month, day);

  DateTime get yearMonthDayHourMinute =>
      DateTime(year, month, day, hour, minute);

  DateTime get startMonth =>
      DateTime.parse(timeInString).subtract(Duration(days: day - 1));

  String get timeInString => toIso8601String().substring(0, 19);

  // TODO(Any): soon create injector to inject locale.
  String get formattedy => DateFormat.y('id').format(this);

  String get formattedyMMMd => DateFormat.yMMMMd('id').format(this);

  String get formattedyMd => DateFormat.yMd('id').format(this);

  String get formattedyMMMdHm {
    final formattedDate = DateFormat.yMMMMd('id').format(this);
    final formattedTime = DateFormat.Hm('id').format(this);

    return '$formattedDate - $formattedTime';
  }

  String get formattedEEEEyMMMdHm {
    final formattedDate = DateFormat.yMMMMd('id').format(this);
    final formattedTime = DateFormat.Hm('id').format(this);
    final formattedDay = DateFormat.EEEE('id').format(this);

    return '$formattedDay, $formattedDate - $formattedTime';
  }

  String get formattedHHmm {
    final formattedTime = DateFormat.Hm('id').format(this);

    return formattedTime;
  }

  int get unix =>  millisecondsSinceEpoch ~/ 1000;
}
