import 'package:easy_date_timeline/src/utils/utils.dart';
import 'package:flutter/material.dart'
    show BoxDecoration, TextStyle, BorderRadius;

class DayStyle {
  const DayStyle({
    this.decoration,
    this.borderRadius,
    this.dayNumStyle,
    this.dayStrStyle,
    this.monthStrStyle,
    this.splashBorder = EasyConstants.daySplashBorder,
  });

  /// The decoration applied to the day. If null, it used default decoration.
  final BoxDecoration? decoration;

  /// The border radius of the day, note that if you provide a decoration this value will be ignored.
  final double? borderRadius;

  /// The text style applied to the number of the day.
  final TextStyle? dayNumStyle;

  /// The text style applied to the string representing the day.
  final TextStyle? dayStrStyle;

  /// The text style applied to the month string.
  final TextStyle? monthStrStyle;

  /// The border radius applied to the day when it's touched (splashed).
  final BorderRadius splashBorder;
}
