import 'package:intl/intl.dart' show DateFormat;

abstract final class EasyDateFormatter {
  static String shortDayName(DateTime date, String locale) {
    return DateFormat("E", locale).format(date);
  }

  static String fullDayName(DateTime date, String locale) {
    return DateFormat("EEEE", locale).format(date);
  }

  static String shortMonthName(DateTime date, String locale) {
    return DateFormat("MMM", locale).format(date);
  }

  static String customFormat(String format, DateTime date, String locale) {
    return DateFormat(format, locale).format(date);
  }

  static String fullMonthName(DateTime date, String locale) {
    return DateFormat("MMMM", locale).format(date);
  }

  static String fullDateDMY(DateTime date, String locale) {
    return DateFormat("dd/MM/yyyy", locale).format(date);
  }
}
