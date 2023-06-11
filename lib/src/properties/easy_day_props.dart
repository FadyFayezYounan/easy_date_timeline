import 'package:flutter/material.dart' show BoxDecoration, Color, TextStyle;

import '../utils/utils.dart';

final class EasyDayProps {
  final BoxDecoration? activeDayDecoration;
  final BoxDecoration? inactiveDayDecoration;
  final DayStructure? dayStructure;
  final double activeBorderRadius;
  final double inactiveBorderRadius;
  final Color borderColor;
  final TextStyle? activeDayNumStyle;
  final TextStyle? inactiveDayNumStyle;
  final TextStyle? activeDayStrStyle;
  final TextStyle? inactiveDayStrStyle;
  final TextStyle? activeMothStrStyle;
  final TextStyle? inactiveMothStrStyle;
  final double width;
  final double height;

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
  });
}

enum DayStructure {
  monthDayNumDayStr,
  dayStrDayNumMonth,
  dayNumDayStr,
  dayStrDayNum,
}
