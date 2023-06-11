import 'package:flutter/material.dart' show TextStyle;

final class EasyHeaderProps {
  const EasyHeaderProps({
    this.showHeader = true,
    this.showSelectedDate = true,
    this.showMonthPicker = true,
    this.centerHeader = false,
    this.selectedDateFormat = SelectedDateFormat.dayOnly,
    this.monthPickerType = MonthPickerType.dropDown,
    this.selectedDateStyle,
  });

  /// Whether to show the header of the calendar widget.
  final bool showHeader;

  /// Whether to show the selected date in the header of the calendar widget.
  final bool showSelectedDate;

  /// Whether to show the month picker at the top of the calendar widget.
  final bool showMonthPicker;

  /// Whether to center the header of the calendar widget.
  final bool centerHeader;

  /// The format used to display the selected date in the header of the calendar widget.
  final SelectedDateFormat selectedDateFormat;

  /// The type of month picker to use if [showMonthPicker] is true.
  final MonthPickerType monthPickerType;

  /// The text style applied to the selected date string in the header of the calendar widget.
  final TextStyle? selectedDateStyle;
}

enum SelectedDateFormat {
  dayOnly("EEEE"),
  monthOnly("MMMM"),
  fullDateDMY("dd/MM/yyyy"),
  fullDateMDY("MM/dd/yyyy"),
  fullDateDayAsStrMY("EEEE M,y"),
  fullDateDMonthAsStrY("d MMMM, yyyy"),
  fullDateMonthAsStrDY("MMMM d, yyyy");

  const SelectedDateFormat(this.formatter);
  final String formatter;
}

enum MonthPickerType {
  dropDown,
  switcher,
}
