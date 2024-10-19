import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;

class DayPartWidget extends StatelessWidget {
  /// Builds a widget that displays a part of a date in a flexible area.
  ///
  /// The [date] is formatted according to the [format] and [locale] provided.
  /// The formatted text is then displayed in a [Text] widget with the given
  /// [style].
  ///
  /// The [Text] widget is contained within a [FittedBox] to ensure that it
  /// fits within the available space.
  ///
  /// The [Flexible] widget is used to ensure that the [FittedBox] has a
  /// bounded width.
  const DayPartWidget({
    super.key,
    required this.date,
    required this.format,
    required this.locale,
    this.style,
  });

  /// `date`: The date to be formatted and displayed.
  final DateTime date;

  /// `format`: The format string used to format the date.
  final String format;

  /// `locale`: The locale to be used for formatting the date.
  final String locale;

  /// `style`: An optional `TextStyle` to style the displayed date.
  final TextStyle? style;

  @override
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: FittedBox(
        alignment: Alignment.center,
        fit: BoxFit.scaleDown,
        child: Text(
          DateFormat(format, locale).format(date),
          style: style,
        ),
      ),
    );
  }
}
