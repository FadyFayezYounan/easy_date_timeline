import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'dart:math' as math show max;

import '../../utils/utils.exports.dart';

const double _innerPadding = 4.0;

class PickerButtonViewOnly extends StatelessWidget {
  /// A stateless widget that displays a date in a formatted manner within a padded container.
  ///
  /// The [PickerButtonViewOnly] widget takes a [DateTime] object, a locale string, and padding
  /// for the timeline. It formats the date according to the provided locale and displays it
  /// within a padded container.
  ///
  /// The padding is adjusted based on the provided [timelinePadding] to ensure proper spacing.
  ///
  /// The widget uses the [DateFormat] class to format the date and the [Theme] class to style
  /// the text.
  ///
  /// Parameters:
  /// - [date]: The date to be displayed.
  /// - [local]: The locale used for formatting the date.
  /// - [timelinePadding]: The padding around the timeline.

  const PickerButtonViewOnly({
    super.key,
    required this.date,
    required this.local,
    required this.timelinePadding,
  });

  /// The date to be displayed.
  final DateTime date;

  /// The locale used for formatting the date.
  final String local;

  /// The padding around the timeline.
  final EdgeInsets timelinePadding;

  @override
  Widget build(BuildContext context) {
    final double effectiveHorizontalPadding =
        math.max(0, timelinePadding.horizontal - _innerPadding);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: effectiveHorizontalPadding,
        vertical: 4.0,
      ),
      child: SizedBox(
        height: pickerHeaderHeight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: _innerPadding),
          child: Center(
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    DateFormat(DateFormatUtils.dMonthY, local).format(date),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
