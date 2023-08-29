import 'package:flutter/material.dart' show TextStyle, FontWeight;

import 'utils.dart';

/// A utility class that provides easy access to commonly used text styles in the `EasyDateTimeLine` widget.
final class EasyTextStyles {
  EasyTextStyles._();

  /// The text style of the number representing the day.
  static const TextStyle dayNumStyle = TextStyle(
    fontSize: EasyConstants.dayAsNumFontSize,
    fontWeight: FontWeight.bold,
    color: EasyColors.dayAsNumColor,
  );

  /// The text style of the string representing the day.
  static const TextStyle dayStrStyle = TextStyle(
    fontSize: EasyConstants.dayAsStrFontSize,
    color: EasyColors.dayAsStrColor,
  );

  /// The text style of the string representing the month.
  static const TextStyle monthStrStyle = TextStyle(
    fontSize: EasyConstants.monthAsStrFontSize,
    color: EasyColors.monthAsStrColor,
  );

  /// The text style of the selected date.
  static const TextStyle selectedDateStyle = TextStyle(
    fontSize: EasyConstants.selectedDateFontSize,
    fontWeight: FontWeight.bold,
    color: EasyColors.dayAsNumColor,
  );
}
