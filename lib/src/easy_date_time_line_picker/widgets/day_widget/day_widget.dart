import 'package:easy_date_timeline/src/easy_date_time_line_picker/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../sealed_classes/sealed_classes.exports.dart';
import '../../theme/theme.exports.dart';
import 'day_part_widget.dart';

class DayWidget extends StatefulWidget {
  /// A widget that represents a single day in a calendar view.
  ///
  /// This widget is responsible for rendering a day cell with customizable appearance
  /// based on various states such as selected, disabled, or current day.
  const DayWidget({
    super.key,
    required this.date,
    required this.isDisabled,
    required this.isSelectedDay,
    required this.isToday,
    required this.onChanged,
    this.focusNode,
    required this.dayPartsOrder,
    required this.locale,
  });

  /// The date represented by this widget.
  final DateTime date;

  /// Whether this day is disabled and cannot be selected.
  final bool isDisabled;

  /// Whether this day is currently selected.
  final bool isSelectedDay;

  /// Whether this day represents the current date.
  final bool isToday;

  /// Callback function triggered when this day is selected.
  final ValueChanged<DateTime> onChanged;

  /// Optional focus node for managing focus on this day widget.
  final FocusNode? focusNode;

  /// The order in which different parts of the day (e.g., day number, weekday) should be displayed.
  final List<DayElement> dayPartsOrder;

  /// The locale used for formatting date strings.
  final String locale;

  @override
  State<DayWidget> createState() => _DayWidgetState();
}

class _DayWidgetState extends State<DayWidget> {
  /// Controller for managing the widget's states (e.g., disabled, selected).
  final WidgetStatesController _statesController = WidgetStatesController();

  @override
  Widget build(BuildContext context) {
    // Retrieve theme data and default styles
    final EasyThemeData defaults = EasyTheme.defaultsOf(context);
    final EasyThemeData? datePickerTheme = EasyTheme.maybeOf(context);
    // Helper functions for resolving theme properties
    T? effectiveValue<T>(T? Function(EasyThemeData? theme) getProperty) {
      return getProperty(datePickerTheme) ?? getProperty(defaults);
    }

    // Helper function for resolving widget state properties
    T? resolve<T>(
        WidgetStateProperty<T>? Function(EasyThemeData? theme) getProperty,
        Set<WidgetState> states) {
      return effectiveValue(
        (EasyThemeData? theme) {
          return getProperty(theme)?.resolve(states);
        },
      );
    }

    // Determine the current states of the widget
    final Set<WidgetState> states = <WidgetState>{
      if (widget.isDisabled) WidgetState.disabled,
      if (widget.isSelectedDay) WidgetState.selected,
    };

    final TextStyle? dayMiddlePartStyle = resolve<TextStyle?>(
        (theme) => widget.isToday
            ? theme?.currentDayMiddleElementStyle
            : theme?.dayMiddleElementStyle,
        states);
    final TextStyle? dayTopPartStyle = resolve<TextStyle?>(
        (theme) => widget.isToday
            ? theme?.currentDayTopElementStyle
            : theme?.dayTopElementStyle,
        states);
    final TextStyle? dayBottomPartStyle = resolve<TextStyle?>(
        (theme) => widget.isToday
            ? theme?.currentDayBottomElementStyle
            : theme?.dayBottomElementStyle,
        states);

    // Resolve colors based on the current state and theme
    final Color? dayForegroundColor = resolve<Color?>(
        (theme) => widget.isToday
            ? theme?.currentDayForegroundColor
            : theme?.dayForegroundColor,
        states);

    final Color? dayBackgroundColor = resolve<Color?>(
        (theme) => widget.isToday
            ? theme?.currentDayBackgroundColor
            : theme?.dayBackgroundColor,
        states);

    final WidgetStateProperty<Color?> dayOverlayColor =
        WidgetStateProperty.resolveWith<Color?>(
      (Set<WidgetState> states) =>
          effectiveValue((theme) => theme?.overlayColor?.resolve(states)),
    );

    // Determine the shape of the day widget
    final OutlinedBorder dayShape = widget.isToday
        ? resolve<OutlinedBorder?>((theme) => theme?.currentDayShape, states)!
        : resolve<OutlinedBorder?>((theme) => theme?.dayShape, states)!;

    final BorderSide border = resolve<BorderSide?>(
        (theme) => widget.isToday ? theme?.currentDayBorder : theme?.dayBorder,
        states)!;

    // Create the decoration for the day widget
    final ShapeDecoration decoration = ShapeDecoration(
      color: dayBackgroundColor,
      shape: dayShape.copyWith(
        side: border,
      ),
    );

    // Determine the main axis alignment based on the number of day parts
    final effectiveMainAxisAlignment = widget.dayPartsOrder.length < 3
        ? MainAxisAlignment.center
        : MainAxisAlignment.spaceEvenly;

    _statesController.value = states;
    // Build the day widget with all its parts
    Widget dayWidget = DecoratedBox(
      decoration: decoration,
      child: Padding(
        padding: const EdgeInsets.all(defaultDayPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: effectiveMainAxisAlignment,
          children: widget.dayPartsOrder
              .map(
                (dayPart) => DayPartWidget(
                  date: widget.date,
                  format: dayPart.format,
                  locale: widget.locale,
                  style: switch (dayPart) {
                    TopDayElement() => dayTopPartStyle,
                    MiddleDayElement() => dayMiddlePartStyle,
                    BottomDayElement() => dayBottomPartStyle,
                  }
                      ?.apply(color: dayForegroundColor),
                ),
              )
              .toList(),
        ),
      ),
    );

    // Wrap the day widget with appropriate interaction and accessibility features
    if (widget.isDisabled) {
      dayWidget = ExcludeSemantics(
        child: dayWidget,
      );
    } else {
      dayWidget = InkWell(
        focusNode: widget.focusNode,
        onTap: () => widget.onChanged(widget.date),
        statesController: _statesController,
        overlayColor: dayOverlayColor,
        customBorder: dayShape,
        child: Semantics(
          // Provide a meaningful label for accessibility
          label: '${widget.date.day}, ${widget.date.month}/${widget.date.year}',
          button: true,
          selected: widget.isSelectedDay,
          excludeSemantics: true,
          child: dayWidget,
        ),
      );
    }
    return dayWidget;
  }

  @override
  void dispose() {
    _statesController.dispose();
    super.dispose();
  }
}
