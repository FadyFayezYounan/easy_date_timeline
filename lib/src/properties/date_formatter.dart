sealed class DateFormatter {
  const DateFormatter();
  String format();

  /// Formats the date with only the day of the week for example "Monday".
  ///
  /// Example usage:
  /// ```dart
  /// headerProps: const EasyHeaderProps(
  ///    dateFormatter: DateFormatter.dayOnly(),
  /// )
  /// ```
  const factory DateFormatter.dayOnly() = DayOnlyFormatter;

  /// Formats the date with only the month for example "January".
  ///
  /// Example usage:
  /// ```dart
  /// headerProps: const EasyHeaderProps(
  ///     dateFormatter: DateFormatter.monthOnly(),
  ///  )
  /// ```
  const factory DateFormatter.monthOnly() = MonthOnlyFormatter;

  /// Formats the date as "day/month/year" (e.g., "01/01/2022").
  ///
  /// Example usage:
  /// ```dart
  /// headerProps: const EasyHeaderProps(
  ///    dateFormatter: DateFormatter.fullDateDMY(),
  /// )
  /// ```
  /// You can also specify a custom separator to use between the day, month, and year.
  /// default separator is "/"
  const factory DateFormatter.fullDateDMY([String separator]) =
      FullDateDMYFormatter;

  /// Formats the date as "month/day/year" (e.g., "01/25/2022").
  ///
  /// Example usage:
  /// ```dart
  /// headerProps: const EasyHeaderProps(
  ///   dateFormatter: DateFormatter.fullDateMDY(),
  /// )
  /// ```
  /// You can also specify a custom separator to use between the month, day, and year.
  /// default separator is "/"
  const factory DateFormatter.fullDateMDY([String separator]) =
      FullDateMDYFormatter;

  /// Formats the date as "day month, year" (e.g., "Monday 12, 2022").
  /// Example usage:
  /// ```dart
  /// headerProps: const EasyHeaderProps(
  ///  dateFormatter: DateFormatter.fullDateDayAsStrMY(),
  /// )
  /// ```
  /// You can also specify a custom separator to use between the month and year.
  /// default separator is ", "
  const factory DateFormatter.fullDateDayAsStrMY([String separator]) =
      FullDateDayAsStrMYFormatter;

  /// Formats the date as "day month year" (e.g., "1 January, 2022").
  ///
  /// Example usage:
  /// ```dart
  /// headerProps: const EasyHeaderProps(
  ///  dateFormatter: DateFormatter.fullDateDMonthAsStrY(),
  /// )
  /// ```
  /// You can also specify a custom separator to use between the month and year.
  /// default separator is ", "
  const factory DateFormatter.fullDateDMonthAsStrY([String separator]) =
      FullDateDMonthAsStrYFormatter;

  /// Formats the date as "month day year" (e.g., "June 11,2023").
  ///
  /// Example usage:
  /// ```dart
  /// headerProps: const EasyHeaderProps(
  ///  dateFormatter: DateFormatter.fullDateMonthAsStrDY(),
  /// )
  /// ```
  /// You can also specify a custom separator to use between the month and year.
  /// default separator is ", "
  const factory DateFormatter.fullDateMonthAsStrDY([String separator]) =
      FullDateMonthAsStrDYFormatter;

  /// Formats the date using a custom formatter string provided by the user.
  ///
  /// Example usage:
  /// ```dart
  /// headerProps: const EasyHeaderProps(
  /// dateFormatter: DateFormatter.custom("EEEE M,y"),
  /// )
  /// ```
  /// or by using DateFormat from intl package:
  ///
  /// ```dart
  /// headerProps: const EasyHeaderProps(
  /// dateFormatter: DateFormatter.custom(DateFormat.yMMMMEEEEd().pattern),
  /// )
  /// ```
  /// another example:
  ///
  /// ```dart
  /// headerProps: const EasyHeaderProps(
  /// dateFormatter: DateFormatter.custom(DateFormat.YEAR_MONTH),
  /// )
  /// ```
  /// you must specify the format you want to use in this case.
  const factory DateFormatter.custom(String formatter) = CustomFormatter;
}

final class DayOnlyFormatter extends DateFormatter {
  /// Formats the date with only the day of the week for example "Monday".
  ///
  /// Example usage:
  /// ```dart
  /// headerProps: const EasyHeaderProps(
  ///    dateFormatter: DateFormatter.dayOnly(),
  /// )
  /// ```
  const DayOnlyFormatter();

  @override
  String format() {
    return "EEEE";
  }
}

final class MonthOnlyFormatter extends DateFormatter {
  /// Formats the date with only the month for example "January".
  ///
  /// Example usage:
  /// ```dart
  /// headerProps: const EasyHeaderProps(
  ///     dateFormatter: DateFormatter.monthOnly(),
  ///  )
  /// ```
  const MonthOnlyFormatter();

  @override
  String format() {
    return "MMMM";
  }
}

final class FullDateDMYFormatter extends DateFormatter {
  /// Formats the date as "day/month/year" (e.g., "01/01/2022").
  ///
  /// Example usage:
  /// ```dart
  /// headerProps: const EasyHeaderProps(
  ///    dateFormatter: DateFormatter.fullDateDMY(),
  /// )
  /// ```
  /// You can also specify a custom separator to use between the day, month, and year.
  /// default separator is "/"
  const FullDateDMYFormatter([this.separator = "/"]);

  /// [separator] is the separator between the day, month, and year.
  final String separator;

  @override
  String format() {
    return "dd${separator}MM${separator}yyyy";
  }
}

final class FullDateMDYFormatter extends DateFormatter {
  /// Formats the date as "month/day/year" (e.g., "01/01/2022").
  ///
  /// Example usage:
  /// ```dart
  /// headerProps: const EasyHeaderProps(
  ///   dateFormatter: DateFormatter.fullDateMDY(),
  /// )
  /// ```
  /// You can also specify a custom separator to use between the month, day, and year.
  /// default separator is "/"
  const FullDateMDYFormatter([this.separator = "/"]);

  /// [separator] is the separator between the month, day, and year.
  final String separator;

  @override
  String format() {
    return "MM${separator}dd${separator}yyyy";
  }
}

final class FullDateDayAsStrMYFormatter extends DateFormatter {
  /// Formats the date as "day month, year" (e.g., "Monday January, 2022").
  /// Example usage:
  /// ```dart
  /// headerProps: const EasyHeaderProps(
  ///  dateFormatter: DateFormatter.fullDateDayAsStrMY(),
  /// )
  /// ```
  /// You can also specify a custom separator to use between the month and year.
  /// default separator is ","
  const FullDateDayAsStrMYFormatter([this.separator = ","]);

  /// [separator] is the separator between the month and year.
  final String separator;

  @override
  String format() {
    return "EEEE M${separator}y";
  }
}

final class FullDateDMonthAsStrYFormatter extends DateFormatter {
  /// Formats the date as "day month year" (e.g., "1 January, 2022").
  ///
  /// Example usage:
  /// ```dart
  /// headerProps: const EasyHeaderProps(
  ///  dateFormatter: DateFormatter.fullDateDMonthAsStrY(),
  /// )
  /// ```
  /// You can also specify a custom separator to use between the month and year.
  /// default separator is ", "
  const FullDateDMonthAsStrYFormatter([this.separator = ", "]);

  /// [separator] is the separator between the month and year.
  final String separator;

  @override
  String format() {
    return "d MMMM${separator}yyyy";
  }
}

final class FullDateMonthAsStrDYFormatter extends DateFormatter {
  /// Formats the date as "month day year" (e.g., "June 11,2023").
  ///
  /// Example usage:
  /// ```dart
  /// headerProps: const EasyHeaderProps(
  ///  dateFormatter: DateFormatter.fullDateMonthAsStrDY(),
  /// )
  /// ```
  /// You can also specify a custom separator to use between the month and year.
  /// default separator is ", "
  const FullDateMonthAsStrDYFormatter([this.separator = ", "]);

  /// [separator] is the separator between the month and year.
  final String separator;

  @override
  String format() {
    return "MMMM d${separator}yyyy";
  }
}

final class CustomFormatter extends DateFormatter {
  /// Formats the date using a custom formatter string provided by the user.
  ///
  /// Example usage:
  /// ```dart
  /// headerProps: const EasyHeaderProps(
  /// dateFormatter: DateFormatter.custom("EEEE M,y"),
  /// )
  /// ```
  /// or by using DateFormat from intl package:
  ///
  /// ```dart
  /// headerProps: const EasyHeaderProps(
  /// dateFormatter: DateFormatter.custom(DateFormat.yMMMMEEEEd().pattern),
  /// )
  /// ```
  /// another example:
  ///
  /// ```dart
  /// headerProps: const EasyHeaderProps(
  /// dateFormatter: DateFormatter.custom(DateFormat.YEAR_MONTH),
  /// )
  /// ```
  /// you must specify the format you want to use in this case.
  const CustomFormatter(this.formatter);

  /// [formatter] is the custom formatter string provided by the user.
  final String formatter;

  @override
  String format() {
    return formatter;
  }

  @override
  int get hashCode => formatter.hashCode;

  @override
  operator ==(Object other) =>
      other is CustomFormatter && other.formatter == formatter;
}
