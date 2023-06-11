import 'package:flutter/material.dart' show TextStyle;

final class EasyHeaderProps {
  final bool showHeader;
  final bool showSelectedDate;
  final bool showMonthPicker;
  final bool centerHeader;
  final SelectedDateFormat selectedDateFormat;
  final MonthPickerType monthPickerType;
  final TextStyle? selectedDateStyle;

  const EasyHeaderProps({
    this.showHeader = true,
    this.showSelectedDate = true,
    this.showMonthPicker = true,
    this.centerHeader = false,
    this.selectedDateFormat = SelectedDateFormat.dayOnly,
    this.monthPickerType = MonthPickerType.dropDown,
    this.selectedDateStyle,
  });
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
