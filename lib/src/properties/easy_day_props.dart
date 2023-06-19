import 'package:flutter/material.dart' show BoxDecoration, Color, TextStyle;

import '../utils/utils.dart';

final class EasyDayProps {
  const EasyDayProps({
    this.activeDayDecoration,
    this.inactiveDayDecoration,
    this.dayStructure = DayStructure.monthDayNumDayStr,
    this.activeBorderRadius = EasyConstants.dayWidgetBorderRadius,
    this.inactiveBorderRadius = EasyConstants.dayWidgetBorderRadius,
    this.borderColor = EasyColors.dayWidgetBorderColor,
    this.width = EasyConstants.dayWidgetWidth,
    this.height = EasyConstants.dayWidgetHeight,
    this.activeDayNumStyle,
    this.inactiveDayNumStyle,
    this.todayNumStyle,
    this.todayStrStyle,
    this.activeDayStrStyle,
    this.inactiveDayStrStyle,
    this.todayMonthStrStyle,
    this.activeMothStrStyle,
    this.inactiveMothStrStyle,
    this.landScapeMode = false,
    this.todayHighlightColor,
    this.todayHighlightStyle = TodayHighlightStyle.withBorder,
  });

  /// The decoration applied to the active day. If null, it used default decoration.
  final BoxDecoration? activeDayDecoration;

  /// The decoration applied to inactive days. If null, inactive days are not decorated.
  final BoxDecoration? inactiveDayDecoration;

  /// The structure used to build the day widget.
  final DayStructure dayStructure;

  /// The border radius of the active day.
  final double activeBorderRadius;

  /// The border radius of inactive days.
  final double inactiveBorderRadius;

  /// The color of the border around the day widget.
  final Color borderColor;

  /// The text style applied to the number of the active day.
  final TextStyle? activeDayNumStyle;

  /// The text style applied to the number of inactive days.
  final TextStyle? inactiveDayNumStyle;

  /// The text style applied to the number of today.
  final TextStyle? todayNumStyle;

  /// The text style applied to the string representing the active day.
  final TextStyle? activeDayStrStyle;

  /// The text style applied to the string representing inactive days.
  final TextStyle? inactiveDayStrStyle;

  /// The text style applied to the string representing today.
  final TextStyle? todayStrStyle;

  /// The text style applied to the month string when the day is active.
  final TextStyle? activeMothStrStyle;

  /// The text style applied to the month string when the day is inactive.
  final TextStyle? inactiveMothStrStyle;

  /// The text style applied to the string representing today month.
  final TextStyle? todayMonthStrStyle;

  /// The width of the day widget.
  final double width;

  /// The height of the day widget.
  final double height;

  /// The appearance of the day widget whether in vertical or horizontal .
  final bool landScapeMode;

  /// Set a background color for the current date.
  final Color? todayHighlightColor;

  /// Styles for the current day in the date timeline.
  final TodayHighlightStyle todayHighlightStyle;
}

/// An enumeration that defines the possible structures for displaying a day in the date timeline.
enum DayStructure {
  /// Displays the month day number and the day of the week abbreviated name. Example: "Sep 14 Mon".
  monthDayNumDayStr,

  /// Displays the day of the week abbreviated name, the day of the month, and the month abbreviated name. Example: "Mon 14 Sep".
  dayStrDayNumMonth,

  /// Displays the day of the month and the day of the week abbreviated name. Example: "14 Mon".
  dayNumDayStr,

  /// Displays the day of the week abbreviated name and the day of the month. Example: "Mon 14".
  dayStrDayNum,

  /// Displays the day of the month only. Example: "14".
  dayNumberOnly,

  /// Displays the day of the week abbreviated name only. Example: "Mon".
  dayNameOnly,
}

/// An enumeration that defines the possible highlight styles for the current day in the date timeline.
enum TodayHighlightStyle {
  /// Highlights the current day with a border style.
  withBorder,

  /// Highlights the background of the current day.
  withBackground,

  /// No Highlights color for the current day.
  none,
}
