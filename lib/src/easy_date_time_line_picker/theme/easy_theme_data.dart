import 'package:flutter/foundation.dart'
    show DiagnosticPropertiesBuilder, Diagnosticable, DiagnosticsProperty;
import 'package:flutter/material.dart';

import '../options/options.exports.dart';
import '../sealed_classes/sealed_classes.exports.dart';
import 'theme.exports.dart';

class EasyThemeData with Diagnosticable {
  /// Defines the visual properties for the `EasyDateTimeLinePicker` widget.
  ///
  /// This class allows for customization of various visual aspects of calendar days,
  /// including background colors, foreground colors, shapes, borders, and text styles
  /// for both regular days and the current day.
  const EasyThemeData({
    this.dayBackgroundColor,
    this.currentDayBackgroundColor,
    this.monthBackgroundColor,
    this.currentMonthBackgroundColor,
    this.yearBackgroundColor,
    this.currentYearBackgroundColor,
    this.dayForegroundColor,
    this.currentDayForegroundColor,
    this.monthForegroundColor,
    this.currentMonthForegroundColor,
    this.yearForegroundColor,
    this.currentYearForegroundColor,
    this.dayShape,
    this.currentDayShape,
    this.monthShape,
    this.currentMonthShape,
    this.yearShape,
    this.currentYearShape,
    this.overlayColor,
    this.dayBorder,
    this.currentDayBorder,
    this.monthBorder,
    this.currentMonthBorder,
    this.yearBorder,
    this.currentYearBorder,
    this.dayMiddleElementStyle,
    this.currentDayMiddleElementStyle,
    this.dayTopElementStyle,
    this.currentDayTopElementStyle,
    this.dayBottomElementStyle,
    this.currentDayBottomElementStyle,
    this.monthStyle,
    this.currentMonthStyle,
    this.yearStyle,
    this.currentYearStyle,
    this.locale,
    this.selectionMode,
    this.ignoreUserInteractionOnAnimating,
    this.timelineOptions,
  });

  /// The background color for regular days.
  final WidgetStateProperty<Color?>? dayBackgroundColor;

  /// The background color for the current day.
  final WidgetStateProperty<Color?>? currentDayBackgroundColor;

  /// The background color for years.
  final WidgetStateProperty<Color?>? monthBackgroundColor;

  /// The background color for the current month.
  final WidgetStateProperty<Color?>? currentMonthBackgroundColor;

  /// The background color for the year.
  final WidgetStateProperty<Color?>? yearBackgroundColor;

  /// The background color for the current year.
  final WidgetStateProperty<Color?>? currentYearBackgroundColor;

  /// The foreground color for regular days.
  final WidgetStateProperty<Color?>? dayForegroundColor;

  /// The foreground color for the current day.
  final WidgetStateProperty<Color?>? currentDayForegroundColor;

  /// The foreground color for the month.
  final WidgetStateProperty<Color?>? monthForegroundColor;

  /// The foreground color for the current month.
  final WidgetStateProperty<Color?>? currentMonthForegroundColor;

  /// The foreground color for the year.
  final WidgetStateProperty<Color?>? yearForegroundColor;

  /// The foreground color for the current year.
  final WidgetStateProperty<Color?>? currentYearForegroundColor;

  /// The shape of regular days.
  final WidgetStateProperty<OutlinedBorder?>? dayShape;

  /// The shape of the current day.
  final WidgetStateProperty<OutlinedBorder?>? currentDayShape;

  /// The shape of the month.
  final WidgetStateProperty<OutlinedBorder?>? monthShape;

  /// The shape of the current month.
  final WidgetStateProperty<OutlinedBorder?>? currentMonthShape;

  /// The shape of the year.
  final WidgetStateProperty<OutlinedBorder?>? yearShape;

  /// The shape of the current year.
  final WidgetStateProperty<OutlinedBorder?>? currentYearShape;

  /// The overlay color applied to days when interacted with.
  final WidgetStateProperty<Color?>? overlayColor;

  /// The border for regular days.
  final WidgetStateProperty<BorderSide?>? dayBorder;

  /// The border for the current day.
  final WidgetStateProperty<BorderSide?>? currentDayBorder;

  /// The border for the month.
  final WidgetStateProperty<BorderSide?>? monthBorder;

  /// The border for the current month.
  final WidgetStateProperty<BorderSide?>? currentMonthBorder;

  /// The border for the year.
  final WidgetStateProperty<BorderSide?>? yearBorder;

  /// The border for the current year.
  final WidgetStateProperty<BorderSide?>? currentYearBorder;

  /// The text style for the middle element of regular days.
  final WidgetStateProperty<TextStyle?>? dayMiddleElementStyle;

  /// The text style for the middle element of the current day.
  final WidgetStateProperty<TextStyle?>? currentDayMiddleElementStyle;

  /// The text style for the top element of regular days.
  final WidgetStateProperty<TextStyle?>? dayTopElementStyle;

  /// The text style for the top element of the current day.
  final WidgetStateProperty<TextStyle?>? currentDayTopElementStyle;

  /// The text style for the bottom element of regular days.
  final WidgetStateProperty<TextStyle?>? dayBottomElementStyle;

  /// The text style for the bottom element of the current day.
  final WidgetStateProperty<TextStyle?>? currentDayBottomElementStyle;

  /// The text style for months.
  final WidgetStateProperty<TextStyle?>? monthStyle;

  /// The text style for the current month.
  final WidgetStateProperty<TextStyle?>? currentMonthStyle;

  /// The text style for the year.
  final WidgetStateProperty<TextStyle?>? yearStyle;

  /// The text style for the current year.
  final WidgetStateProperty<TextStyle?>? currentYearStyle;

  /// The locale used for formatting dates.
  final Locale? locale;

  /// The mode of selection for the calendar.
  final SelectionMode? selectionMode;

  /// Whether to ignore user interaction while animating.
  final bool? ignoreUserInteractionOnAnimating;

  /// Options for timeline display.
  final TimelineOptions? timelineOptions;

  /// Creates a copy of this [EasyThemeData] with the given fields replaced with new values.
  ///
  /// This method allows for updating specific properties of the theme data while
  /// keeping the rest unchanged.
  EasyThemeData copyWith({
    WidgetStateProperty<Color?>? dayBackgroundColor,
    WidgetStateProperty<Color?>? currentDayBackgroundColor,
    WidgetStateProperty<Color?>? monthBackgroundColor,
    WidgetStateProperty<Color?>? currentMonthBackgroundColor,
    WidgetStateProperty<Color?>? yearBackgroundColor,
    WidgetStateProperty<Color?>? currentYearBackgroundColor,
    WidgetStateProperty<Color?>? dayForegroundColor,
    WidgetStateProperty<Color?>? currentDayForegroundColor,
    WidgetStateProperty<Color?>? monthForegroundColor,
    WidgetStateProperty<Color?>? currentMonthForegroundColor,
    WidgetStateProperty<Color?>? yearForegroundColor,
    WidgetStateProperty<Color?>? currentYearForegroundColor,
    WidgetStateProperty<OutlinedBorder?>? dayShape,
    WidgetStateProperty<OutlinedBorder?>? currentDayShape,
    WidgetStateProperty<OutlinedBorder?>? monthShape,
    WidgetStateProperty<OutlinedBorder?>? currentMonthShape,
    WidgetStateProperty<OutlinedBorder?>? yearShape,
    WidgetStateProperty<OutlinedBorder?>? currentYearShape,
    WidgetStateProperty<Color?>? overlayColor,
    WidgetStateProperty<BorderSide?>? dayBorder,
    WidgetStateProperty<BorderSide?>? currentDayBorder,
    WidgetStateProperty<BorderSide?>? monthBorder,
    WidgetStateProperty<BorderSide?>? currentMonthBorder,
    WidgetStateProperty<BorderSide?>? yearBorder,
    WidgetStateProperty<BorderSide?>? currentYearBorder,
    WidgetStateProperty<TextStyle?>? dayMiddleElementStyle,
    WidgetStateProperty<TextStyle?>? currentDayMiddleElementStyle,
    WidgetStateProperty<TextStyle?>? dayTopElementStyle,
    WidgetStateProperty<TextStyle?>? currentDayTopElementStyle,
    WidgetStateProperty<TextStyle?>? dayBottomElementStyle,
    WidgetStateProperty<TextStyle?>? currentDayBottomElementStyle,
    WidgetStateProperty<TextStyle?>? monthStyle,
    WidgetStateProperty<TextStyle?>? currentMonthStyle,
    WidgetStateProperty<TextStyle?>? yearStyle,
    WidgetStateProperty<TextStyle?>? currentYearStyle,
    Locale? locale,
    SelectionMode? selectionMode,
    bool? ignoreUserInteractionOnAnimating,
    TimelineOptions? timelineOptions,
  }) {
    return EasyThemeData(
      dayBackgroundColor: dayBackgroundColor ?? this.dayBackgroundColor,
      currentDayBackgroundColor:
          currentDayBackgroundColor ?? this.currentDayBackgroundColor,
      monthBackgroundColor: monthBackgroundColor ?? this.monthBackgroundColor,
      currentMonthBackgroundColor:
          currentMonthBackgroundColor ?? this.currentMonthBackgroundColor,
      yearBackgroundColor: yearBackgroundColor ?? this.yearBackgroundColor,
      currentYearBackgroundColor:
          currentYearBackgroundColor ?? this.currentYearBackgroundColor,
      dayForegroundColor: dayForegroundColor ?? this.dayForegroundColor,
      currentDayForegroundColor:
          currentDayForegroundColor ?? this.currentDayForegroundColor,
      monthForegroundColor: monthForegroundColor ?? this.monthForegroundColor,
      currentMonthForegroundColor:
          currentMonthForegroundColor ?? this.currentMonthForegroundColor,
      yearForegroundColor: yearForegroundColor ?? this.yearForegroundColor,
      currentYearForegroundColor:
          currentYearForegroundColor ?? this.currentYearForegroundColor,
      dayShape: dayShape ?? this.dayShape,
      currentDayShape: currentDayShape ?? this.currentDayShape,
      monthShape: monthShape ?? this.monthShape,
      currentMonthShape: currentMonthShape ?? this.currentMonthShape,
      yearShape: yearShape ?? this.yearShape,
      currentYearShape: currentYearShape ?? this.currentYearShape,
      overlayColor: overlayColor ?? this.overlayColor,
      dayBorder: dayBorder ?? this.dayBorder,
      currentDayBorder: currentDayBorder ?? this.currentDayBorder,
      monthBorder: monthBorder ?? this.monthBorder,
      currentMonthBorder: currentMonthBorder ?? this.currentMonthBorder,
      yearBorder: yearBorder ?? this.yearBorder,
      currentYearBorder: currentYearBorder ?? this.currentYearBorder,
      dayMiddleElementStyle:
          dayMiddleElementStyle ?? this.dayMiddleElementStyle,
      currentDayMiddleElementStyle:
          currentDayMiddleElementStyle ?? this.currentDayMiddleElementStyle,
      dayTopElementStyle: dayTopElementStyle ?? this.dayTopElementStyle,
      currentDayTopElementStyle:
          currentDayTopElementStyle ?? this.currentDayTopElementStyle,
      dayBottomElementStyle:
          dayBottomElementStyle ?? this.dayBottomElementStyle,
      currentDayBottomElementStyle:
          currentDayBottomElementStyle ?? this.currentDayBottomElementStyle,
      monthStyle: monthStyle ?? this.monthStyle,
      currentMonthStyle: currentMonthStyle ?? this.currentMonthStyle,
      yearStyle: yearStyle ?? this.yearStyle,
      currentYearStyle: currentYearStyle ?? this.currentYearStyle,
      locale: locale ?? this.locale,
      selectionMode: selectionMode ?? this.selectionMode,
      ignoreUserInteractionOnAnimating: ignoreUserInteractionOnAnimating ??
          this.ignoreUserInteractionOnAnimating,
      timelineOptions: timelineOptions ?? this.timelineOptions,
    );
  }

  /// Creates a copy of this [EasyThemeData] with the given fields replaced with new values.
  ///
  /// This method allows for updating theme data using [DayThemeData] objects for
  /// different states (selected, unselected, disabled) of regular and current days.

  EasyThemeData copyWithState({
    // Regular days
    DayThemeData? selectedDayTheme,
    DayThemeData? unselectedDayTheme,
    DayThemeData? disabledDayTheme,
    // Current day
    DayThemeData? selectedCurrentDayTheme,
    DayThemeData? unselectedCurrentDayTheme,
    DayThemeData? disabledCurrentDayTheme,
    // Regular month
    MonthYearThemeData? selectedMonthTheme,
    MonthYearThemeData? unselectedMonthTheme,
    MonthYearThemeData? disabledMonthTheme,
    // Current month
    MonthYearThemeData? selectedCurrentMonthTheme,
    MonthYearThemeData? unselectedCurrentMonthTheme,
    MonthYearThemeData? disabledCurrentMonthTheme,
    // Regular year
    MonthYearThemeData? selectedYearTheme,
    MonthYearThemeData? unselectedYearTheme,
    MonthYearThemeData? disabledYearTheme,
    // Current year
    MonthYearThemeData? selectedCurrentYearTheme,
    MonthYearThemeData? unselectedCurrentYearTheme,
    MonthYearThemeData? disabledCurrentYearTheme,
    // other
    Color? selectedOverlayColor,
    Color? unselectedOverlayColor,
    Color? disabledOverlayColor,
    Locale? locale,
    SelectionMode? selectionMode,
    bool? ignoreUserInteractionOnAnimating,
    TimelineOptions? timelineOptions,
  }) {
    // effective background colors
    final WidgetStateProperty<Color?>? effectiveDayBackgroundColor = switch ((
      selectedDayTheme?.backgroundColor,
      unselectedDayTheme?.backgroundColor,
      disabledDayTheme?.backgroundColor
    )) {
      (null, null, null) => null,
      (_, _, _) => _GenericWidgetStateProperty(
          selectedDayTheme?.backgroundColor,
          unselectedDayTheme?.backgroundColor,
          disabledDayTheme?.backgroundColor),
    };
    final WidgetStateProperty<Color?>? effectiveCurrentDayBackgroundColor =
        switch ((
      selectedCurrentDayTheme?.backgroundColor,
      unselectedCurrentDayTheme?.backgroundColor,
      disabledCurrentDayTheme?.backgroundColor
    )) {
      (null, null, null) => null,
      (_, _, _) => _GenericWidgetStateProperty(
          selectedCurrentDayTheme?.backgroundColor,
          unselectedCurrentDayTheme?.backgroundColor,
          disabledCurrentDayTheme?.backgroundColor),
    };

    final WidgetStateProperty<Color?>? effectiveMonthBackgroundColor = switch ((
      selectedMonthTheme?.backgroundColor,
      unselectedMonthTheme?.backgroundColor,
      disabledMonthTheme?.backgroundColor
    )) {
      (null, null, null) => null,
      (_, _, _) => _GenericWidgetStateProperty(
          selectedMonthTheme?.backgroundColor,
          unselectedMonthTheme?.backgroundColor,
          disabledMonthTheme?.backgroundColor),
    };

    final WidgetStateProperty<Color?>? effectiveCurrentMonthBackgroundColor =
        switch ((
      selectedCurrentMonthTheme?.backgroundColor,
      unselectedCurrentMonthTheme?.backgroundColor,
      disabledCurrentMonthTheme?.backgroundColor
    )) {
      (null, null, null) => null,
      (_, _, _) => _GenericWidgetStateProperty(
          selectedCurrentMonthTheme?.backgroundColor,
          unselectedCurrentMonthTheme?.backgroundColor,
          disabledCurrentMonthTheme?.backgroundColor),
    };

    final WidgetStateProperty<Color?>? effectiveYearBackgroundColor = switch ((
      selectedYearTheme?.backgroundColor,
      unselectedYearTheme?.backgroundColor,
      disabledYearTheme?.backgroundColor
    )) {
      (null, null, null) => null,
      (_, _, _) => _GenericWidgetStateProperty(
          selectedYearTheme?.backgroundColor,
          unselectedYearTheme?.backgroundColor,
          disabledYearTheme?.backgroundColor),
    };

    final WidgetStateProperty<Color?>? effectiveCurrentYearBackgroundColor =
        switch ((
      selectedCurrentYearTheme?.backgroundColor,
      unselectedCurrentYearTheme?.backgroundColor,
      disabledCurrentYearTheme?.backgroundColor
    )) {
      (null, null, null) => null,
      (_, _, _) => _GenericWidgetStateProperty(
          selectedCurrentYearTheme?.backgroundColor,
          unselectedCurrentYearTheme?.backgroundColor,
          disabledCurrentYearTheme?.backgroundColor),
    };

    // effective foreground colors
    final WidgetStateProperty<Color?>? effectiveDayForegroundColor = switch ((
      selectedDayTheme?.foregroundColor,
      unselectedDayTheme?.foregroundColor,
      disabledDayTheme?.foregroundColor
    )) {
      (null, null, null) => null,
      (_, _, _) => _GenericWidgetStateProperty(
          selectedDayTheme?.foregroundColor,
          unselectedDayTheme?.foregroundColor,
          disabledDayTheme?.foregroundColor),
    };

    final WidgetStateProperty<Color?>? effectiveCurrentDayForegroundColor =
        switch ((
      selectedCurrentDayTheme?.foregroundColor,
      unselectedCurrentDayTheme?.foregroundColor,
      disabledCurrentDayTheme?.foregroundColor
    )) {
      (null, null, null) => null,
      (_, _, _) => _GenericWidgetStateProperty(
          selectedCurrentDayTheme?.foregroundColor,
          unselectedCurrentDayTheme?.foregroundColor,
          disabledCurrentDayTheme?.foregroundColor),
    };

    final WidgetStateProperty<Color?>? effectiveMonthForegroundColor = switch ((
      selectedMonthTheme?.foregroundColor,
      unselectedMonthTheme?.foregroundColor,
      disabledMonthTheme?.foregroundColor
    )) {
      (null, null, null) => null,
      (_, _, _) => _GenericWidgetStateProperty(
          selectedMonthTheme?.foregroundColor,
          unselectedMonthTheme?.foregroundColor,
          disabledMonthTheme?.foregroundColor),
    };

    final WidgetStateProperty<Color?>? effectiveCurrentMonthForegroundColor =
        switch ((
      selectedCurrentMonthTheme?.foregroundColor,
      unselectedCurrentMonthTheme?.foregroundColor,
      disabledCurrentMonthTheme?.foregroundColor
    )) {
      (null, null, null) => null,
      (_, _, _) => _GenericWidgetStateProperty(
          selectedCurrentMonthTheme?.foregroundColor,
          unselectedCurrentMonthTheme?.foregroundColor,
          disabledCurrentMonthTheme?.foregroundColor),
    };

    final WidgetStateProperty<Color?>? effectiveYearForegroundColor = switch ((
      selectedYearTheme?.foregroundColor,
      unselectedYearTheme?.foregroundColor,
      disabledYearTheme?.foregroundColor
    )) {
      (null, null, null) => null,
      (_, _, _) => _GenericWidgetStateProperty(
          selectedYearTheme?.foregroundColor,
          unselectedYearTheme?.foregroundColor,
          disabledYearTheme?.foregroundColor),
    };

    final WidgetStateProperty<Color?>? effectiveCurrentYearForegroundColor =
        switch ((
      selectedCurrentYearTheme?.foregroundColor,
      unselectedCurrentYearTheme?.foregroundColor,
      disabledCurrentYearTheme?.foregroundColor
    )) {
      (null, null, null) => null,
      (_, _, _) => _GenericWidgetStateProperty(
          selectedCurrentYearTheme?.foregroundColor,
          unselectedCurrentYearTheme?.foregroundColor,
          disabledCurrentYearTheme?.foregroundColor),
    };

    //   effective overlay colors
    final WidgetStateProperty<Color?>? effectiveOverlayColor = switch ((
      selectedOverlayColor,
      unselectedOverlayColor,
      disabledOverlayColor
    )) {
      (null, null, null) => null,
      (_, _, _) => _GenericWidgetStateProperty(
          selectedOverlayColor, unselectedOverlayColor, disabledOverlayColor),
    };

    //   effective shapes
    final WidgetStateProperty<OutlinedBorder?>? effectiveDayShape = switch ((
      selectedDayTheme?.shape,
      unselectedDayTheme?.shape,
      disabledDayTheme?.shape
    )) {
      (null, null, null) => null,
      (_, _, _) => _GenericWidgetStateProperty(selectedDayTheme?.shape,
          unselectedDayTheme?.shape, disabledDayTheme?.shape),
    };

    final WidgetStateProperty<OutlinedBorder?>? effectiveCurrentDayShape =
        switch ((
      selectedCurrentDayTheme?.shape,
      unselectedCurrentDayTheme?.shape,
      disabledCurrentDayTheme?.shape
    )) {
      (null, null, null) => null,
      (_, _, _) => _GenericWidgetStateProperty(selectedCurrentDayTheme?.shape,
          unselectedCurrentDayTheme?.shape, disabledCurrentDayTheme?.shape),
    };

    final WidgetStateProperty<OutlinedBorder?>? effectiveMonthShape = switch ((
      selectedMonthTheme?.shape,
      unselectedMonthTheme?.shape,
      disabledMonthTheme?.shape
    )) {
      (null, null, null) => null,
      (_, _, _) => _GenericWidgetStateProperty(selectedMonthTheme?.shape,
          unselectedMonthTheme?.shape, disabledMonthTheme?.shape),
    };

    final WidgetStateProperty<OutlinedBorder?>? effectiveCurrentMonthShape =
        switch ((
      selectedCurrentMonthTheme?.shape,
      unselectedCurrentMonthTheme?.shape,
      disabledCurrentMonthTheme?.shape
    )) {
      (null, null, null) => null,
      (_, _, _) => _GenericWidgetStateProperty(selectedCurrentMonthTheme?.shape,
          unselectedCurrentMonthTheme?.shape, disabledCurrentMonthTheme?.shape),
    };

    final WidgetStateProperty<OutlinedBorder?>? effectiveYearShape = switch ((
      selectedYearTheme?.shape,
      unselectedYearTheme?.shape,
      disabledYearTheme?.shape
    )) {
      (null, null, null) => null,
      (_, _, _) => _GenericWidgetStateProperty(selectedYearTheme?.shape,
          unselectedYearTheme?.shape, disabledYearTheme?.shape),
    };

    final WidgetStateProperty<OutlinedBorder?>? effectiveCurrentYearShape =
        switch ((
      selectedCurrentYearTheme?.shape,
      unselectedCurrentYearTheme?.shape,
      disabledCurrentYearTheme?.shape
    )) {
      (null, null, null) => null,
      (_, _, _) => _GenericWidgetStateProperty(selectedCurrentYearTheme?.shape,
          unselectedCurrentYearTheme?.shape, disabledCurrentYearTheme?.shape),
    };

    //   effective borders
    final WidgetStateProperty<BorderSide?>? effectiveDayBorder = switch ((
      selectedDayTheme?.border,
      unselectedDayTheme?.border,
      disabledDayTheme?.border
    )) {
      (null, null, null) => null,
      (_, _, _) => _GenericWidgetStateProperty(selectedDayTheme?.border,
          unselectedDayTheme?.border, disabledDayTheme?.border),
    };

    final WidgetStateProperty<BorderSide?>? effectiveCurrentDayBorder =
        switch ((
      selectedCurrentDayTheme?.border,
      unselectedCurrentDayTheme?.border,
      disabledCurrentDayTheme?.border
    )) {
      (null, null, null) => null,
      (_, _, _) => _GenericWidgetStateProperty(selectedCurrentDayTheme?.border,
          unselectedCurrentDayTheme?.border, disabledCurrentDayTheme?.border),
    };

    final WidgetStateProperty<BorderSide?>? effectiveMonthBorder = switch ((
      selectedMonthTheme?.border,
      unselectedMonthTheme?.border,
      disabledMonthTheme?.border
    )) {
      (null, null, null) => null,
      (_, _, _) => _GenericWidgetStateProperty(selectedMonthTheme?.border,
          unselectedMonthTheme?.border, disabledMonthTheme?.border),
    };

    final WidgetStateProperty<BorderSide?>? effectiveCurrentMonthBorder =
        switch ((
      selectedCurrentMonthTheme?.border,
      unselectedCurrentMonthTheme?.border,
      disabledCurrentMonthTheme?.border
    )) {
      (null, null, null) => null,
      (_, _, _) => _GenericWidgetStateProperty(
          selectedCurrentMonthTheme?.border,
          unselectedCurrentMonthTheme?.border,
          disabledCurrentMonthTheme?.border),
    };

    final WidgetStateProperty<BorderSide?>? effectiveYearBorder = switch ((
      selectedYearTheme?.border,
      unselectedYearTheme?.border,
      disabledYearTheme?.border
    )) {
      (null, null, null) => null,
      (_, _, _) => _GenericWidgetStateProperty(selectedYearTheme?.border,
          unselectedYearTheme?.border, disabledYearTheme?.border),
    };

    final WidgetStateProperty<BorderSide?>? effectiveCurrentYearBorder =
        switch ((
      selectedCurrentYearTheme?.border,
      unselectedCurrentYearTheme?.border,
      disabledCurrentYearTheme?.border
    )) {
      (null, null, null) => null,
      (_, _, _) => _GenericWidgetStateProperty(selectedCurrentYearTheme?.border,
          unselectedCurrentYearTheme?.border, disabledCurrentYearTheme?.border),
    };

    // effective day text styles

    final WidgetStateProperty<TextStyle?>? effectiveDayTopPartStyle = switch ((
      selectedDayTheme?.topElementStyle,
      unselectedDayTheme?.topElementStyle,
      disabledDayTheme?.topElementStyle
    )) {
      (null, null, null) => null,
      (_, _, _) => _GenericWidgetStateProperty(
          selectedDayTheme?.topElementStyle,
          unselectedDayTheme?.topElementStyle,
          disabledDayTheme?.topElementStyle),
    };

    final WidgetStateProperty<TextStyle?>? effectiveDayMiddlePartStyle =
        switch ((
      selectedDayTheme?.middleElementStyle,
      unselectedDayTheme?.middleElementStyle,
      disabledDayTheme?.middleElementStyle
    )) {
      (null, null, null) => null,
      (_, _, _) => _GenericWidgetStateProperty(
          selectedDayTheme?.middleElementStyle,
          unselectedDayTheme?.middleElementStyle,
          disabledDayTheme?.middleElementStyle),
    };

    final WidgetStateProperty<TextStyle?>? effectiveDayBottomPartStyle =
        switch ((
      selectedDayTheme?.bottomElementStyle,
      unselectedDayTheme?.bottomElementStyle,
      disabledDayTheme?.bottomElementStyle
    )) {
      (null, null, null) => null,
      (_, _, _) => _GenericWidgetStateProperty(
          selectedDayTheme?.bottomElementStyle,
          unselectedDayTheme?.bottomElementStyle,
          disabledDayTheme?.bottomElementStyle),
    };

    // effective current day text styles

    final WidgetStateProperty<TextStyle?>? effectiveCurrentDayTopPartStyle =
        switch ((
      selectedCurrentDayTheme?.topElementStyle,
      unselectedCurrentDayTheme?.topElementStyle,
      disabledCurrentDayTheme?.topElementStyle
    )) {
      (null, null, null) => null,
      (_, _, _) => _GenericWidgetStateProperty(
          selectedCurrentDayTheme?.topElementStyle,
          unselectedCurrentDayTheme?.topElementStyle,
          disabledCurrentDayTheme?.topElementStyle),
    };

    final WidgetStateProperty<TextStyle?>? effectiveCurrentDayMiddlePartStyle =
        switch ((
      selectedCurrentDayTheme?.middleElementStyle,
      unselectedCurrentDayTheme?.middleElementStyle,
      disabledCurrentDayTheme?.middleElementStyle
    )) {
      (null, null, null) => null,
      (_, _, _) => _GenericWidgetStateProperty(
          selectedCurrentDayTheme?.middleElementStyle,
          unselectedCurrentDayTheme?.middleElementStyle,
          disabledCurrentDayTheme?.middleElementStyle),
    };

    final WidgetStateProperty<TextStyle?>? effectiveCurrentDayBottomPartStyle =
        switch ((
      selectedCurrentDayTheme?.bottomElementStyle,
      unselectedCurrentDayTheme?.bottomElementStyle,
      disabledCurrentDayTheme?.bottomElementStyle
    )) {
      (null, null, null) => null,
      (_, _, _) => _GenericWidgetStateProperty(
          selectedCurrentDayTheme?.bottomElementStyle,
          unselectedCurrentDayTheme?.bottomElementStyle,
          disabledCurrentDayTheme?.bottomElementStyle),
    };

    // effective month text styles
    final WidgetStateProperty<TextStyle?>? effectiveMonthStyle = switch ((
      selectedMonthTheme?.textStyle,
      unselectedMonthTheme?.textStyle,
      disabledMonthTheme?.textStyle
    )) {
      (null, null, null) => null,
      (_, _, _) => _GenericWidgetStateProperty(selectedMonthTheme?.textStyle,
          unselectedMonthTheme?.textStyle, disabledMonthTheme?.textStyle),
    };

    final WidgetStateProperty<TextStyle?>? effectiveCurrentMonthStyle =
        switch ((
      selectedCurrentMonthTheme?.textStyle,
      unselectedCurrentMonthTheme?.textStyle,
      disabledCurrentMonthTheme?.textStyle
    )) {
      (null, null, null) => null,
      (_, _, _) => _GenericWidgetStateProperty(
          selectedCurrentMonthTheme?.textStyle,
          unselectedCurrentMonthTheme?.textStyle,
          disabledCurrentMonthTheme?.textStyle),
    };

    // effective year text styles
    final WidgetStateProperty<TextStyle?>? effectiveYearStyle = switch ((
      selectedYearTheme?.textStyle,
      unselectedYearTheme?.textStyle,
      disabledYearTheme?.textStyle
    )) {
      (null, null, null) => null,
      (_, _, _) => _GenericWidgetStateProperty(selectedYearTheme?.textStyle,
          unselectedYearTheme?.textStyle, disabledYearTheme?.textStyle),
    };

    final WidgetStateProperty<TextStyle?>? effectiveCurrentYearStyle = switch ((
      selectedCurrentYearTheme?.textStyle,
      unselectedCurrentYearTheme?.textStyle,
      disabledCurrentYearTheme?.textStyle
    )) {
      (null, null, null) => null,
      (_, _, _) => _GenericWidgetStateProperty(
          selectedCurrentYearTheme?.textStyle,
          unselectedCurrentYearTheme?.textStyle,
          disabledCurrentYearTheme?.textStyle),
    };

    return copyWith(
      dayBackgroundColor: effectiveDayBackgroundColor,
      currentDayBackgroundColor: effectiveCurrentDayBackgroundColor,
      monthBackgroundColor: effectiveMonthBackgroundColor,
      currentMonthBackgroundColor: effectiveCurrentMonthBackgroundColor,
      yearBackgroundColor: effectiveYearBackgroundColor,
      currentYearBackgroundColor: effectiveCurrentYearBackgroundColor,
      dayForegroundColor: effectiveDayForegroundColor,
      currentDayForegroundColor: effectiveCurrentDayForegroundColor,
      monthForegroundColor: effectiveMonthForegroundColor,
      currentMonthForegroundColor: effectiveCurrentMonthForegroundColor,
      yearForegroundColor: effectiveYearForegroundColor,
      currentYearForegroundColor: effectiveCurrentYearForegroundColor,
      overlayColor: effectiveOverlayColor,
      dayShape: effectiveDayShape,
      currentDayShape: effectiveCurrentDayShape,
      monthShape: effectiveMonthShape,
      currentMonthShape: effectiveCurrentMonthShape,
      yearShape: effectiveYearShape,
      currentYearShape: effectiveCurrentYearShape,
      dayBorder: effectiveDayBorder,
      currentDayBorder: effectiveCurrentDayBorder,
      monthBorder: effectiveMonthBorder,
      currentMonthBorder: effectiveCurrentMonthBorder,
      yearBorder: effectiveYearBorder,
      currentYearBorder: effectiveCurrentYearBorder,
      // current day text styles
      currentDayTopElementStyle: effectiveCurrentDayTopPartStyle,
      currentDayMiddleElementStyle: effectiveCurrentDayMiddlePartStyle,
      currentDayBottomElementStyle: effectiveCurrentDayBottomPartStyle,
      // regular day text styles
      dayTopElementStyle: effectiveDayTopPartStyle,
      dayMiddleElementStyle: effectiveDayMiddlePartStyle,
      dayBottomElementStyle: effectiveDayBottomPartStyle,
      // month text styles
      monthStyle: effectiveMonthStyle,
      currentMonthStyle: effectiveCurrentMonthStyle,
      // year text styles
      yearStyle: effectiveYearStyle,
      currentYearStyle: effectiveCurrentYearStyle,
      // other
      locale: locale,
      selectionMode: selectionMode,
      ignoreUserInteractionOnAnimating: ignoreUserInteractionOnAnimating,
      timelineOptions: timelineOptions,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties.add(DiagnosticsProperty<WidgetStateProperty<Color?>>(
        'backgroundColor', dayBackgroundColor));
    properties.add(DiagnosticsProperty<WidgetStateProperty<Color?>>(
        'currentDayBackgroundColor', currentDayBackgroundColor));
    properties.add(DiagnosticsProperty<WidgetStateProperty<Color?>>(
        'dayForegroundColor', dayForegroundColor));
    properties.add(DiagnosticsProperty<WidgetStateProperty<Color?>>(
        'dayOverlayColor', overlayColor));
    properties.add(DiagnosticsProperty<WidgetStateProperty<Color?>>(
        'currentDayForegroundColor', currentDayForegroundColor));
    properties.add(DiagnosticsProperty<WidgetStateProperty<OutlinedBorder?>>(
        'dayShape', dayShape));
    properties.add(DiagnosticsProperty<WidgetStateProperty<OutlinedBorder?>>(
        'currentDayShape', currentDayShape));
    properties.add(DiagnosticsProperty<WidgetStateProperty<BorderSide?>>(
        'dayBorder', dayBorder));
    properties.add(DiagnosticsProperty<WidgetStateProperty<BorderSide?>>(
        'currentDayBorder', currentDayBorder));
    properties.add(DiagnosticsProperty<WidgetStateProperty<TextStyle?>>(
        'dayTopElementStyle', dayTopElementStyle));
    properties.add(DiagnosticsProperty<WidgetStateProperty<TextStyle?>>(
        'dayMiddleElementStyle', dayMiddleElementStyle));
    properties.add(DiagnosticsProperty<WidgetStateProperty<TextStyle?>>(
        'dayBottomElementStyle', dayBottomElementStyle));
    properties.add(DiagnosticsProperty<WidgetStateProperty<TextStyle?>>(
        'currentDayTopElementStyle', currentDayTopElementStyle));
    properties.add(DiagnosticsProperty<WidgetStateProperty<TextStyle?>>(
        'currentDayMiddleElementStyle', currentDayMiddleElementStyle));
    properties.add(DiagnosticsProperty<WidgetStateProperty<TextStyle?>>(
        'currentDayBottomElementStyle', currentDayBottomElementStyle));
    properties.add(
        DiagnosticsProperty<SelectionMode>('selectionMode', selectionMode));
    properties.add(DiagnosticsProperty<bool>(
        'ignoreUserInteractionOnAnimating', ignoreUserInteractionOnAnimating));
    properties.add(DiagnosticsProperty<TimelineOptions>(
        'timelineOptions', timelineOptions));
    properties.add(DiagnosticsProperty<Locale?>('locale', locale));
    super.debugFillProperties(properties);
  }

  @override
  bool operator ==(covariant EasyThemeData other) {
    if (identical(this, other)) return true;

    return other.dayBackgroundColor == dayBackgroundColor &&
        other.currentDayBackgroundColor == currentDayBackgroundColor &&
        other.dayForegroundColor == dayForegroundColor &&
        other.currentDayForegroundColor == currentDayForegroundColor &&
        other.dayShape == dayShape &&
        other.currentDayShape == currentDayShape &&
        other.overlayColor == overlayColor &&
        other.currentDayBorder == currentDayBorder &&
        other.dayBorder == dayBorder &&
        other.dayMiddleElementStyle == dayMiddleElementStyle &&
        other.dayTopElementStyle == dayTopElementStyle &&
        other.dayBottomElementStyle == dayBottomElementStyle &&
        other.locale == locale &&
        other.selectionMode == selectionMode &&
        other.ignoreUserInteractionOnAnimating ==
            ignoreUserInteractionOnAnimating &&
        other.timelineOptions == timelineOptions;
  }

  @override
  int get hashCode {
    return dayBackgroundColor.hashCode ^
        currentDayBackgroundColor.hashCode ^
        dayForegroundColor.hashCode ^
        currentDayForegroundColor.hashCode ^
        dayShape.hashCode ^
        currentDayShape.hashCode ^
        overlayColor.hashCode ^
        currentDayBorder.hashCode ^
        dayBorder.hashCode ^
        dayMiddleElementStyle.hashCode ^
        dayTopElementStyle.hashCode ^
        dayBottomElementStyle.hashCode ^
        locale.hashCode ^
        selectionMode.hashCode ^
        ignoreUserInteractionOnAnimating.hashCode ^
        timelineOptions.hashCode;
  }
}

/// A generic implementation of [WidgetStateProperty] that resolves values based on widget state.
///
/// This class is used internally by [EasyThemeData] to manage state-dependent properties.
@immutable
class _GenericWidgetStateProperty<T> extends WidgetStateProperty<T> {
  /// Creates a [_GenericWidgetStateProperty] with values for different widget states.
  _GenericWidgetStateProperty(this.selected, this.unselected, this.disabled);

  /// The value to use when the widget is in a selected state.
  final T selected;

  /// The value to use when the widget is in an unselected state.
  final T unselected;

  /// The value to use when the widget is in a disabled state.
  final T disabled;

  /// Resolves the appropriate value based on the given set of [WidgetState]s.
  ///
  /// This method prioritizes the disabled state, then the selected state, and finally
  /// the unselected state.
  @override
  T resolve(Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled)) return disabled;
    if (states.contains(WidgetState.selected)) return selected;
    return unselected;
  }
}
