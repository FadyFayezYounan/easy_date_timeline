import 'package:flutter/material.dart' show BoxDecoration, Color, TextStyle;

import '../utils/utils.dart';
import 'day_style.dart';

final class EasyDayProps {
  const EasyDayProps({
    this.activeDayStyle = const DayStyle(),
    this.inactiveDayStyle = const DayStyle(),
    this.disabledDayStyle = const DayStyle(),
    this.todayStyle = const DayStyle(),
    @Deprecated(
      'Use `activeDayStyle` instead. '
      'This feature was deprecated after v0.0.7',
    )
    this.activeDayDecoration,
    @Deprecated(
      'Use `inactiveDayStyle` instead. '
      'This feature was deprecated after v0.0.7',
    )
    this.inactiveDayDecoration,
    this.dayStructure = DayStructure.monthDayNumDayStr,
    @Deprecated(
      'Use `activeDayStyle` instead. '
      'This feature was deprecated after v0.0.7',
    )
    this.activeBorderRadius = EasyConstants.dayWidgetBorderRadius,
    @Deprecated(
      'Use `inactiveDayStyle` instead. '
      'This feature was deprecated after v0.0.7',
    )
    this.inactiveBorderRadius = EasyConstants.dayWidgetBorderRadius,
    this.borderColor = EasyColors.dayWidgetBorderColor,
    this.width = EasyConstants.dayWidgetWidth,
    this.height = EasyConstants.dayWidgetHeight,
    @Deprecated(
      'Use `activeDayStyle` instead. '
      'This feature was deprecated after v0.0.7',
    )
    this.activeDayNumStyle,
    @Deprecated(
      'Use `inactiveDayStyle` instead. '
      'This feature was deprecated after v0.0.7',
    )
    this.inactiveDayNumStyle,
    @Deprecated(
      'Use `todayStyle` instead. '
      'This feature was deprecated after v0.0.7',
    )
    this.todayNumStyle,
    @Deprecated(
      'Use `TodayProps` instead. '
      'This feature was deprecated after v0.0.7',
    )
    this.todayStrStyle,
    @Deprecated(
      'Use `activeDayStyle` instead. '
      'This feature was deprecated after v0.0.7',
    )
    this.activeDayStrStyle,
    @Deprecated(
      'Use `inactiveDayStyle` instead. '
      'This feature was deprecated after v0.0.7',
    )
    this.inactiveDayStrStyle,
    @Deprecated(
      'Use `todayStyle` instead. '
      'This feature was deprecated after v0.0.7',
    )
    this.todayMonthStrStyle,
    @Deprecated(
      'Use `activeDayStyle` instead. '
      'This feature was deprecated after v0.0.7',
    )
    this.activeMothStrStyle,
    @Deprecated(
      'Use `inactiveDayStyle` instead. '
      'This feature was deprecated after v0.0.7',
    )
    this.inactiveMothStrStyle,
    this.landScapeMode = false,
    this.todayHighlightColor,
    this.todayHighlightStyle = TodayHighlightStyle.withBorder,
  });

  /// The properties applied to the active day.
  final DayStyle activeDayStyle;

  /// The properties applied to the inactive days.
  final DayStyle inactiveDayStyle;

  /// The properties applied to the disabled days.
  final DayStyle disabledDayStyle;

  /// The properties applied to the current day.
  final DayStyle todayStyle;

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
