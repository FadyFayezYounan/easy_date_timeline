import 'package:flutter/material.dart';

import '../../properties/easy_day_props.dart';
import '../../utils/utils.dart';
import 'day_info_text.dart';

/// A widget that displays a single day in the timeline.
class EasyDayWidget extends StatelessWidget {
  const EasyDayWidget({
    super.key,
    this.easyDayProps,
    required this.date,
    required this.locale,
    this.isSelected = false,
    required this.onDayPressed,
    required this.activeTextColor,
    required this.activeDayColor,
  });

  /// Contains properties for configuring the appearance and behavior of the day widget.
  final EasyDayProps? easyDayProps;

  /// The date to display in the day widget.
  final DateTime date;

  /// A `String` that represents the locale code to use for formatting the date in the day widget.
  final String locale;

  /// A boolean value that indicates whether the day is selected.
  final bool isSelected;

  /// A callback function that is called when the day widget is pressed.
  final VoidCallback onDayPressed;

  /// The color of the text for the selected day.
  final Color activeTextColor;

  /// The background color of the selected day.
  final Color activeDayColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onDayPressed,
      borderRadius: _dayBorderRadius,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: EasyConstants.animationDuration),
        width: easyDayProps?.width ?? EasyConstants.dayWidgetWidth,
        height: easyDayProps?.height ?? EasyConstants.dayWidgetHeight,
        decoration: isSelected
            ? (easyDayProps?.activeDayDecoration ??
                _buildDayDefaultDecoration(activeDayColor))
            : (easyDayProps?.inactiveDayDecoration ??
                _buildDayDefaultDecoration(activeDayColor)),
        child: _buildDayStructure(easyDayProps?.dayStructure),
      ),
    );
  }

  /// Builds the default decoration for the day widget.
  ///
  /// This method returns a `BoxDecoration` object with the appropriate properties based on the `isSelected` boolean value and the `easyDayProps` object.
  BoxDecoration _buildDayDefaultDecoration(Color color) {
    return BoxDecoration(
      color: isSelected ? color : null,
      borderRadius: _dayBorderRadius,
      border: isSelected
          ? null
          : Border.all(
              color:
                  easyDayProps?.borderColor ?? EasyColors.dayWidgetBorderColor,
            ),
    );
  }

  /// Returns the `BorderRadius` of the day widget.
  ///
  /// This method returns a `BorderRadius` object with the appropriate radius based on the `isSelected` boolean value and the `easyDayProps` object.
  BorderRadius get _dayBorderRadius {
    return BorderRadius.all(
      Radius.circular(
        isSelected
            ? (easyDayProps?.activeBorderRadius ??
                EasyConstants.dayWidgetBorderRadius)
            : (easyDayProps?.inactiveBorderRadius ??
                EasyConstants.dayWidgetBorderRadius),
      ),
    );
  }

  /// Builds a `DayInfoText` widget for the month.
  ///
  /// This method returns a `DayInfoText` widget that displays the short name of the month of the current date, in uppercase.
  /// The `textStyle` property of the widget is determined based on the `isSelected` boolean value and the `easyDayProps` object.

  DayInfoText _buildMonth() {
    return DayInfoText(
      text: EasyDateFormatter.shortMonthName(date, locale).toUpperCase(),
      textStyle: isSelected
          ? (easyDayProps?.activeMothStrStyle ??
              EasyTextStyles.monthAsStrStyle.copyWith(
                color: activeTextColor,
              ))
          : (easyDayProps?.inactiveMothStrStyle ??
              EasyTextStyles.monthAsStrStyle),
    );
  }

  /// Builds a `DayInfoText` widget for the day number.
  ///
  /// This method returns a `DayInfoText` widget that displays the day number of the current date.
  /// The `textStyle` property of the widget is determined based on the `isSelected` boolean value and the `easyDayProps` object.
  DayInfoText _buildDayNumber() {
    return DayInfoText(
      text: date.day.toString(),
      textStyle: isSelected
          ? (easyDayProps?.activeDayNumStyle ??
              EasyTextStyles.dayAsNumStyle.copyWith(
                color: activeTextColor,
              ))
          : (easyDayProps?.inactiveDayNumStyle ?? EasyTextStyles.dayAsNumStyle),
    );
  }

  /// Builds a `DayInfoText` widget for the day number.
  ///
  /// This method returns a `DayInfoText` widget that displays the day number of the current date.
  /// The `textStyle` property of the widget is determined based on the `isSelected` boolean value and the `easyDayProps` object.

  DayInfoText _buildDayString() {
    return DayInfoText(
      text: EasyDateFormatter.shortDayName(date, locale).toUpperCase(),
      textStyle: isSelected
          ? (easyDayProps?.activeDayStrStyle ??
              EasyTextStyles.dayAsStrStyle.copyWith(
                color: activeTextColor,
              ))
          : (easyDayProps?.inactiveDayStrStyle ?? EasyTextStyles.dayAsStrStyle),
    );
  }

  /// Builds the structure of a day widget based on the provided `DayStructure`.
  ///
  /// `structure` is an enum value that represents the structure to use for the day widget.
  /// This method returns a `Column` widget that contains the appropriate widgets for the `DayStructure`.
  Widget _buildDayStructure(DayStructure? structure) {
    List<Widget> items = [];
    switch (structure) {
      case DayStructure.dayNumDayStr:
        items = [
          _buildDayNumber(),
          _buildDayString(),
        ];
        break;
      case DayStructure.dayStrDayNum:
        items = [
          _buildDayString(),
          _buildDayNumber(),
        ];
        break;
      case DayStructure.dayStrDayNumMonth:
        items = [
          _buildDayString(),
          _buildDayNumber(),
          _buildMonth(),
        ];
        break;
      default:
        items = [
          _buildMonth(),
          _buildDayNumber(),
          _buildDayString(),
        ];
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment:
          (easyDayProps?.dayStructure == DayStructure.dayNumDayStr ||
                  easyDayProps?.dayStructure == DayStructure.dayStrDayNum)
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceEvenly,
      children: items,
    );
  }
}
