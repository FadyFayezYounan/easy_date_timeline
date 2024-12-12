import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../options/options.exports.dart';
import '../sealed_classes/sealed_classes.exports.dart';
import 'easy_theme_data.dart';

class EasyDatePickerDefaultsM2 extends EasyThemeData {
  EasyDatePickerDefaultsM2(this.context)
      : super(
          dayShape: const WidgetStatePropertyAll<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
          ),
          currentDayShape: const WidgetStatePropertyAll<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
          ),
          monthShape:
              const WidgetStatePropertyAll<OutlinedBorder>(StadiumBorder()),
          yearShape:
              const WidgetStatePropertyAll<OutlinedBorder>(StadiumBorder()),
          currentMonthShape:
              const WidgetStatePropertyAll<OutlinedBorder>(StadiumBorder()),
          currentYearShape:
              const WidgetStatePropertyAll<OutlinedBorder>(StadiumBorder()),
        );
  final BuildContext context;
  late final ThemeData _theme = Theme.of(context);
  late final ColorScheme _colors = _theme.colorScheme;
  late final TextTheme _textTheme = _theme.textTheme;
  // late final bool _isDark = _colors.brightness == Brightness.dark;

  @override
  WidgetStateProperty<TextStyle?>? get dayTopElementStyle =>
      WidgetStatePropertyAll<TextStyle?>(_textTheme.bodySmall);

  @override
  WidgetStateProperty<TextStyle?>? get dayMiddleElementStyle =>
      WidgetStatePropertyAll<TextStyle?>(_textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
      ));

  @override
  WidgetStateProperty<TextStyle?>? get dayBottomElementStyle =>
      WidgetStatePropertyAll<TextStyle?>(_textTheme.bodySmall);

  @override
  WidgetStateProperty<TextStyle?>? get currentDayTopElementStyle =>
      WidgetStatePropertyAll<TextStyle?>(_textTheme.bodySmall);

  @override
  WidgetStateProperty<TextStyle?>? get currentDayMiddleElementStyle =>
      WidgetStatePropertyAll<TextStyle?>(_textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
      ));

  @override
  WidgetStateProperty<TextStyle?>? get currentDayBottomElementStyle =>
      WidgetStatePropertyAll<TextStyle?>(_textTheme.bodySmall);

  @override
  WidgetStateProperty<Color?>? get dayForegroundColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return _colors.onPrimary;
        } else if (states.contains(WidgetState.disabled)) {
          return _colors.onSurface.withValues(alpha: 0.38);
        }
        return _colors.onSurface;
      });

  @override
  WidgetStateProperty<Color?>? get dayBackgroundColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return _colors.primary;
        }
        return null;
      });

  @override
  WidgetStateProperty<Color?>? get overlayColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          if (states.contains(WidgetState.pressed)) {
            return _colors.onPrimary.withValues(alpha: 0.38);
          }
          if (states.contains(WidgetState.hovered)) {
            return _colors.onPrimary.withValues(alpha: 0.08);
          }
          if (states.contains(WidgetState.focused)) {
            return _colors.onPrimary.withValues(alpha: 0.12);
          }
        } else {
          if (states.contains(WidgetState.pressed)) {
            return _colors.onSurfaceVariant.withValues(alpha: 0.12);
          }
          if (states.contains(WidgetState.hovered)) {
            return _colors.onSurfaceVariant.withValues(alpha: 0.08);
          }
          if (states.contains(WidgetState.focused)) {
            return _colors.onSurfaceVariant.withValues(alpha: 0.12);
          }
        }
        return null;
      });

  @override
  WidgetStateProperty<Color?>? get currentDayForegroundColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return _colors.onPrimary;
        } else if (states.contains(WidgetState.disabled)) {
          return _colors.onSurface.withValues(alpha: 0.38);
        }
        return _colors.primary;
      });

  @override
  WidgetStateProperty<Color?>? get currentDayBackgroundColor =>
      dayBackgroundColor;

  @override
  WidgetStateProperty<BorderSide?>? get currentDayBorder =>
      WidgetStatePropertyAll<BorderSide>(BorderSide(color: _colors.primary));

  @override
  WidgetStateProperty<BorderSide?>? get dayBorder =>
      WidgetStatePropertyAll<BorderSide>(
          BorderSide(color: _colors.onSurface.withValues(alpha: 0.08)));

  @override
  Locale? get locale => defaultLocale;

  @override
  SelectionMode? get selectionMode => const SelectionMode.autoCenter();

  @override
  bool? get ignoreUserInteractionOnAnimating => true;

  @override
  TimelineOptions? get timelineOptions => const TimelineOptions();

  @override
  WidgetStateProperty<Color?>? get monthBackgroundColor => dayBackgroundColor;

  @override
  WidgetStateProperty<Color?>? get currentMonthBackgroundColor =>
      dayBackgroundColor;

  @override
  WidgetStateProperty<Color?>? get monthForegroundColor => dayForegroundColor;

  @override
  WidgetStateProperty<Color?>? get currentMonthForegroundColor =>
      dayForegroundColor;

  @override
  WidgetStateProperty<TextStyle?>? get monthStyle =>
      WidgetStatePropertyAll<TextStyle?>(_textTheme.bodyMedium);

  @override
  WidgetStateProperty<BorderSide?>? get currentMonthBorder => currentDayBorder;

  @override
  WidgetStateProperty<TextStyle?>? get currentMonthStyle =>
      WidgetStatePropertyAll<TextStyle?>(_textTheme.bodyMedium);

  @override
  WidgetStateProperty<Color?>? get yearBackgroundColor => dayBackgroundColor;

  @override
  WidgetStateProperty<Color?>? get currentYearBackgroundColor =>
      dayBackgroundColor;

  @override
  WidgetStateProperty<Color?>? get yearForegroundColor => dayForegroundColor;

  @override
  WidgetStateProperty<Color?>? get currentYearForegroundColor =>
      dayForegroundColor;

  @override
  WidgetStateProperty<TextStyle?>? get yearStyle =>
      WidgetStatePropertyAll<TextStyle?>(_textTheme.bodyLarge);

  @override
  WidgetStateProperty<TextStyle?>? get currentYearStyle =>
      WidgetStatePropertyAll<TextStyle?>(_textTheme.bodyLarge);

  @override
  WidgetStateProperty<BorderSide?>? get currentYearBorder => currentDayBorder;
}
