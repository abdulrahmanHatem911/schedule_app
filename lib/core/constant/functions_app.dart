import 'package:intl/intl.dart';

class AppFunctions {
  static String formatDate({required String date, required String typeFormat}) {
    final DateTime dateTime = DateTime.parse(date);
    final DateFormat formatter = DateFormat(typeFormat);
    final String formatted = formatter.format(dateTime);
    return formatted;
  }

  static String formatTime({required String time}) {
    final DateTime dateTime = DateTime.parse('2021-01-01T$time');
    final DateFormat format = DateFormat('hh:mm');
    return format.format(dateTime);
  }

  static String getFinishDate({required String date}) {
    // function to calculate the number of days between finish date and current date
    final DateTime currentDate = DateTime.now();
    final DateTime finishDate = DateTime.parse(date);
    final int difference = currentDate.difference(finishDate).inDays;
    if (difference == 0) {
      return 'Today';
    } else if (difference == 1) {
      return 'Tomorrow';
    } else if (difference == -1) {
      return 'Yesterday';
    } else if (difference > 1) {
      return '$difference';
    } else if (difference < -1) {
      return '$difference';
    } else {
      return '';
    }
  }
}
