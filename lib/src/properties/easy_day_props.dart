import 'package:flutter/material.dart' show BoxDecoration, Color, TextStyle;

import '../utils/utils.dart';

final class EasyDayProps {
  const EasyDayProps({
    this.activeDayDecoration,
    this.inactiveDayDecoration,
    this.dayStructure,
    this.activeBorderRadius = EasyConstants.dayWidgetBorderRadius,
    this.inactiveBorderRadius = EasyConstants.dayWidgetBorderRadius,
    this.borderColor = EasyColors.dayWidgetBorderColor,
    this.width = EasyConstants.dayWidgetWidth,
    this.height = EasyConstants.dayWidgetHeight,
    this.activeDayNumStyle,
    this.inactiveDayNumStyle,
    this.activeDayStrStyle,
    this.inactiveDayStrStyle,
    this.activeMothStrStyle,
    this.inactiveMothStrStyle,
    this.landScapeMode = false,
    this.currentDateHighlightColor,
    this.highlightCurrentDay = true,
  });

  /// The decoration applied to the active day. If null, it used default decoration.
  final BoxDecoration? activeDayDecoration;

  /// The decoration applied to inactive days. If null, inactive days are not decorated.
  final BoxDecoration? inactiveDayDecoration;

  /// The structure used to build the day widget.
  final DayStructure? dayStructure;

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

  /// The text style applied to the string representing the active day.
  final TextStyle? activeDayStrStyle;

  /// The text style applied to the string representing inactive days.
  final TextStyle? inactiveDayStrStyle;

  /// The text style applied to the month string when the day is active.
  final TextStyle? activeMothStrStyle;

  /// The text style applied to the month string when the day is inactive.
  final TextStyle? inactiveMothStrStyle;

  /// The width of the day widget.
  final double width;

  /// The height of the day widget.
  final double height;

  /// The appearance of the day widget whether in vertical or horizontal .
  final bool landScapeMode;

  /// Set a background color for the current date.
  final Color? currentDateHighlightColor;

  /// Show the background color for the current date or not.
  final bool highlightCurrentDay;
}

enum DayStructure {
  monthDayNumDayStr,
  dayStrDayNumMonth,
  dayNumDayStr,
  dayStrDayNum,
  dayNumberOnly,
  dayNameOnly,
}
