import 'package:flutter/material.dart' show BorderRadius, Radius;

/// A utility class that provides easy access to commonly used constants in the `EasyDateTimeLine` widget.
class EasyConstants {
  EasyConstants._();

  static const Duration animationDuration = Duration(milliseconds: 300);
  static const Duration selectionModeAnimationDuration =
      Duration(milliseconds: 400);

  // Day widget constants
  static const double dayWidgetBorderRadius = 12.0;
  static const BorderRadius daySplashBorder =
      BorderRadius.all(Radius.circular(dayWidgetBorderRadius));
  static const double dayWidgetWidth = 68.0;
  static const double dayWidgetHeight = 112.0;
  static const double dayAsNumFontSize = 20.0;
  static const double dayAsStrFontSize = 12.0;
  static const double landscapeDayPadding = 4.0;

  // Timeline list constants
  static const double separatorPadding = 8.0;
  static const double timelinePadding = 8.0;
  static const String startLocale = "en_US";

  // Month dropdown constants
  static const double monthDropDownRadius = 12.0;
  static const int monthDropDownElevation = 4;
  static const double monthAsStrFontSize = 12.0;

  // Header constants
  static const double selectedDateFontSize = 16.0;
}
