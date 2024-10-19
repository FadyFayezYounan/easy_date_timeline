import 'package:flutter/material.dart';

import '../../easy_date_time_line_picker/utils/typed_ahead.dart';
import '../../models/easy_month.dart';
import '../../utils/utils.dart';

/// A widget that displays a drop-down list of months.
class EasyMonthDropDown extends StatelessWidget {
  const EasyMonthDropDown({
    super.key,
    this.value,
    this.onMonthChange,
    required this.locale,
    this.style,
  });

  /// The currently selected month.
  final EasyMonth? value;

  /// A callback function that is called when the selected month changes.
  final OnMonthChangeCallBack? onMonthChange;

  /// A `String` that represents the locale code to use for formatting the month names in the drop-down list.
  final String locale;

  /// The text style applied to the month string.
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<EasyMonth>(
        borderRadius: const BorderRadius.all(
          Radius.circular(
            EasyConstants.monthDropDownRadius,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        elevation: EasyConstants.monthDropDownElevation,
        value: value,
        style: style,
        items: EasyDateUtils.getYearMonths(DateTime.now(), locale)
            .map(
              (month) => DropdownMenuItem<EasyMonth>(
                value: month,
                child: Text(month.name),
              ),
            )
            .toList(),
        onChanged: onMonthChange,
      ),
    );
  }
}
