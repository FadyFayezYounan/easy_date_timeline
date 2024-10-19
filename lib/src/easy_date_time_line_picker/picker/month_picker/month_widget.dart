import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../theme/theme.exports.dart';
import '../../utils/date_format_utils.dart';

class MonthWidget extends StatefulWidget {
  /// A stateful widget that represents a single month in a month picker grid.
  /// This widget handles the display and interaction of individual months, including
  /// their selection state, current month highlighting, and theme customization.
  ///
  /// Example usage:
  /// ```dart
  /// MonthWidget(
  ///   date: DateTime(2024, 3),
  ///   isDisabled: false,
  ///   isSelected: true,
  ///   isCurrentMonth: true,
  ///   locale: 'en_US',
  ///   onMonthSelected: (DateTime date) {
  ///     print('Selected month: ${date.month}');
  ///   },
  /// )
  /// ```
  const MonthWidget({
    super.key,
    required this.date,
    required this.isDisabled,
    required this.isSelected,
    required this.isCurrentMonth,
    required this.locale,
    required this.onMonthSelected,
  });

  /// The date representing this month.
  final DateTime date;

  /// Whether this month is disabled for selection.
  final bool isDisabled;

  /// Whether this month is currently selected.
  final bool isSelected;

  /// Whether this month is the current month.
  final bool isCurrentMonth;

  /// The locale used for formatting the month name.
  /// If null, the default locale will be used.
  final String? locale;

  /// Callback function called when the month is selected.
  /// Provides the selected date as a parameter.
  final ValueChanged<DateTime> onMonthSelected;

  @override
  State<MonthWidget> createState() => _MonthWidgetState();
}

/// The private State class for MonthWidget.
///
/// Handles the widget's state management and appearance customization based on
/// the provided theme and current state.
class _MonthWidgetState extends State<MonthWidget> {
  /// Controller for managing the widget's interactive states.
  final WidgetStatesController _statesController = WidgetStatesController();

  @override
  void dispose() {
    _statesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final EasyThemeData defaults = EasyTheme.defaultsOf(context);
    final EasyThemeData? datePickerTheme = EasyTheme.maybeOf(context);

    /// Helper function to resolve theme values with fallback to defaults.
    T? effectiveValue<T>(T? Function(EasyThemeData? theme) getProperty) {
      return getProperty(datePickerTheme) ?? getProperty(defaults);
    }

    /// Helper function to resolve state-dependent properties.
    T? resolve<T>(
        WidgetStateProperty<T>? Function(EasyThemeData? theme) getProperty,
        Set<WidgetState> states) {
      return effectiveValue(
        (EasyThemeData? theme) {
          return getProperty(theme)?.resolve(states);
        },
      );
    }

    // Constants for month item dimensions
    const double decorationHeight = 36.0;
    const double decorationWidth = 82.0;

    // Define the current states of the widget
    final Set<WidgetState> states = <WidgetState>{
      if (widget.isDisabled) WidgetState.disabled,
      if (widget.isSelected) WidgetState.selected,
    };

    // Resolve theme-dependent colors and styles
    final Color? background = resolve<Color?>(
        (EasyThemeData? theme) => widget.isCurrentMonth
            ? theme?.currentMonthBackgroundColor
            : theme?.monthBackgroundColor,
        states);

    final Color? monthForegroundColor = resolve<Color?>(
        (theme) => widget.isCurrentMonth
            ? theme?.currentMonthForegroundColor
            : theme?.monthForegroundColor,
        states);

    final WidgetStateProperty<Color?> overlayColor =
        WidgetStateProperty.resolveWith<Color?>(
      (Set<WidgetState> states) => effectiveValue(
          (EasyThemeData? theme) => theme?.overlayColor?.resolve(states)),
    );

    // Resolve shape and border styles
    final OutlinedBorder monthShape = widget.isCurrentMonth
        ? resolve<OutlinedBorder?>((theme) => theme?.currentMonthShape, states)!
        : resolve<OutlinedBorder?>((theme) => theme?.monthShape, states)!;

    final BorderSide? border = resolve<BorderSide?>(
        (theme) => widget.isCurrentMonth
            ? theme?.currentMonthBorder
            : theme?.monthBorder,
        states);

    // Create the shape decoration for the month item
    final ShapeDecoration decoration = ShapeDecoration(
      color: background,
      shape: monthShape.copyWith(
        side: border,
      ),
    );

    // Resolve text style based on current state
    final TextStyle? textStyle = resolve<TextStyle?>(
        (theme) => widget.isCurrentMonth
            ? theme?.currentMonthStyle
            : theme?.monthStyle,
        states);

    // Build the month item widget
    Widget yearItem = Center(
      child: Container(
        decoration: decoration,
        height: decorationHeight,
        width: decorationWidth,
        alignment: Alignment.center,
        child: Semantics(
          selected: widget.isSelected,
          button: true,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              DateFormat(DateFormatUtils.monthName, widget.locale)
                  .format(widget.date),
              style: textStyle?.apply(color: monthForegroundColor),
            ),
          ),
        ),
      ),
    );

    // Add interaction handling
    _statesController.value = states;
    yearItem = InkWell(
      key: ValueKey<int>(widget.date.month),
      onTap:
          widget.isDisabled ? null : () => widget.onMonthSelected(widget.date),
      statesController: _statesController,
      overlayColor: overlayColor,
      child: yearItem,
    );
    return yearItem;
  }
}
