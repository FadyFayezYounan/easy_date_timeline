import 'package:flutter/material.dart';

import '../../disable_strategy/strategies.dart';
import '../../theme/theme.exports.dart';

class YearWidget extends StatefulWidget {
  /// A stateful widget that represents a single year in a year picker grid.
  /// This widget handles the display and interaction of individual years, including
  /// their selection state, current year highlighting, and theme customization.
  ///
  /// Example usage:
  /// ```dart
  /// YearWidget(
  ///   index: 2,
  ///   firstDate: DateTime(2020),
  ///   focusedDate: DateTime(2024),
  ///   lastDate: DateTime(2025),
  ///   currentDate: DateTime.now(),
  ///   isDisabled: false,
  ///   onChanged: (DateTime date) {
  ///     print('Selected year: ${date.year}');
  ///   },
  /// )
  /// ```
  const YearWidget({
    super.key,
    required this.index,
    required this.firstDate,
    required this.focusedDate,
    required this.lastDate,
    required this.currentDate,
    required this.isDisabled,
    required this.onChanged,
    required this.disableStrategy,
  });

  /// The index of this year relative to the firstDate.
  /// Used to calculate the actual year to display.
  final int index;

  /// The earliest date that can be selected.
  final DateTime firstDate;

  /// The currently focused date, if any.
  /// Used to determine if this year is selected.
  final DateTime? focusedDate;

  /// The latest date that can be selected.
  final DateTime lastDate;

  /// The current date (typically today's date).
  /// Used to highlight the current year.
  final DateTime currentDate;

  /// Whether this year is disabled for selection.
  final bool isDisabled;

  /// Callback function called when the year is selected.
  /// Provides the selected date as a parameter.
  final ValueChanged<DateTime> onChanged;

  final DisableStrategy disableStrategy;

  @override
  State<YearWidget> createState() => _YearWidgetState();
}

/// The private State class for YearWidget.
///
/// Handles the widget's state management and appearance customization based on
/// the provided theme and current state.
class _YearWidgetState extends State<YearWidget> {
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

    // Calculate the actual year and determine its states
    final int year = widget.firstDate.year + widget.index;
    final bool isSelected = year == widget.focusedDate?.year;
    final bool isCurrentYear = year == widget.currentDate.year;
    // final bool isDisabled = _isDisabled(DateTime(year, 1, 1));

    // Constants for year item dimensions
    const double decorationHeight = 36.0;
    const double decorationWidth = 72.0;

    // Define the current states of the widget
    final Set<WidgetState> states = <WidgetState>{
      if (widget.isDisabled) WidgetState.disabled,
      if (isSelected) WidgetState.selected,
    };

    // Resolve theme-dependent colors and styles
    final Color? background = resolve<Color?>(
        (EasyThemeData? theme) => isCurrentYear
            ? theme?.currentYearBackgroundColor
            : theme?.yearBackgroundColor,
        states);

    final Color? foregroundColor = resolve<Color?>(
        (theme) => isCurrentYear
            ? theme?.currentYearForegroundColor
            : theme?.yearForegroundColor,
        states);

    final WidgetStateProperty<Color?> overlayColor =
        WidgetStateProperty.resolveWith<Color?>(
      (Set<WidgetState> states) => effectiveValue(
          (EasyThemeData? theme) => theme?.overlayColor?.resolve(states)),
    );

    // Resolve shape and border styles
    final OutlinedBorder yearShape = isCurrentYear
        ? resolve<OutlinedBorder?>((theme) => theme?.currentYearShape, states)!
        : resolve<OutlinedBorder?>((theme) => theme?.yearShape, states)!;

    final BorderSide? border = resolve<BorderSide?>(
        (theme) => isCurrentYear ? theme?.currentYearBorder : theme?.yearBorder,
        states);

    // Create the shape decoration for the year item
    final ShapeDecoration decoration = ShapeDecoration(
      color: background,
      shape: yearShape.copyWith(
        side: border,
      ),
    );

    // Resolve text style based on current state
    final TextStyle? textStyle = resolve<TextStyle?>(
        (theme) => isCurrentYear ? theme?.currentYearStyle : theme?.yearStyle,
        states);

    // Build the year item widget
    Widget yearItem = Center(
      child: Container(
        decoration: decoration,
        height: decorationHeight,
        width: decorationWidth,
        alignment: Alignment.center,
        child: Semantics(
          selected: isSelected,
          button: true,
          child: Text(
            year.toString(),
            style: textStyle?.apply(color: foregroundColor),
          ),
        ),
      ),
    );

    // Calculate the date to be returned when this year is selected
    DateTime date =
        DateTime(year, widget.focusedDate?.month ?? DateTime.january);

    // Ensure the date stays within the allowed range
    if (date
        .isBefore(DateTime(widget.firstDate.year, widget.firstDate.month))) {
      assert(date.year == widget.firstDate.year);
      date = DateTime(year, widget.firstDate.month);
    } else if (date.isAfter(widget.lastDate)) {
      assert(date.year == widget.lastDate.year);
      date = DateTime(year, widget.lastDate.month);
    }

    // Add interaction handling
    _statesController.value = states;
    yearItem = InkWell(
      key: ValueKey<int>(year),
      onTap: () => widget.onChanged(date),
      statesController: _statesController,
      overlayColor: overlayColor,
      child: yearItem,
    );
    return yearItem;
  }
}
