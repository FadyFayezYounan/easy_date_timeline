import 'package:flutter/material.dart';

import '../../properties/easy_day_props.dart';
import '../../utils/utils.dart';
import 'day_info_text.dart';

/// A widget that displays a single day in the timeline.
class EasyDayWidget extends StatelessWidget {
  const EasyDayWidget({
    super.key,
    this.easyDayProps = const EasyDayProps(),
    required this.date,
    required this.locale,
    this.isSelected = false,
    required this.onDayPressed,
    required this.activeTextColor,
    required this.activeDayColor,
  });

  /// Contains properties for configuring the appearance and behavior of the day widget.
  final EasyDayProps easyDayProps;

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
    final isLandScapeMode = easyDayProps.landScapeMode;
    final width = isLandScapeMode ? easyDayProps.height : easyDayProps.width;
    final height = isLandScapeMode ? easyDayProps.width : easyDayProps.height;
    // Check if the date is today and if it should be highlighted with a background or a border
    final isToday = EasyDateUtils.isCurrentDay(date);

    return InkWell(
      onTap: onDayPressed,
      borderRadius: _dayBorderRadius,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: EasyConstants.animationDuration),
        width: width,
        height: height,
        decoration: isSelected ? _activeDayDecoration : _inactiveDayDecoration,
        child: _buildDayStructure(
          structure: easyDayProps.dayStructure,
          isLandScape: isLandScapeMode,
          isToday: isToday,
        ),
      ),
    );
  }

  BoxDecoration get _inactiveDayDecoration {
    return (easyDayProps.inactiveDayDecoration ??
        _buildDayDefaultDecoration(activeDayColor));
  }

  BoxDecoration get _activeDayDecoration {
    return (easyDayProps.activeDayDecoration ??
        _buildDayDefaultDecoration(activeDayColor));
  }

  /// Builds the default decoration for the day widget.
  ///
  /// This method returns a `BoxDecoration` object with the appropriate properties based on the `isSelected` boolean value and the `easyDayProps` object.

  BoxDecoration _buildDayDefaultDecoration(Color backgroundColor) {
    // Check if the date is today and if it should be highlighted with a background or a border
    final isToday = EasyDateUtils.isCurrentDay(date);
    // Check if the dayHighlightStyle is `withBackground` it returns true otherwise it returns false.
    final isBackgroundHighlight =
        easyDayProps.todayHighlightStyle == TodayHighlightStyle.withBackground;
    // Check if the dayHighlightStyle is `withBorder` it returns true otherwise it returns false.
    final isBorderHighlight =
        easyDayProps.todayHighlightStyle == TodayHighlightStyle.withBorder;
    // Indicating that today's date should be highlighted or not.
    final shouldHighlightToday =
        easyDayProps.todayHighlightStyle != TodayHighlightStyle.none;

    // Get the highlight color for today or use a default color if it should be highlighted
    final todayHighlightColor = easyDayProps.todayHighlightColor ??
        (isBackgroundHighlight
            ? backgroundColor.withOpacity(0.2)
            : backgroundColor);

    // Check if the date has a background or a border highlight
    final isHighlightedDate = isToday && shouldHighlightToday;
    final hasBackgroundHighlight = (isHighlightedDate && isBackgroundHighlight);
    final hasBorderHighlight = (isHighlightedDate && isBorderHighlight);

    // Hide the border if the date is selected or has a background highlight
    final hideBorder = isSelected || hasBackgroundHighlight;
    return BoxDecoration(
      // Use the background color for the selected date or the highlight color for the highlighted date
      color: isSelected
          ? backgroundColor
          : (hasBackgroundHighlight ? todayHighlightColor : null),
      borderRadius: _dayBorderRadius,

      // Use the border color for the highlighted date or hide the border otherwise
      border: hideBorder
          ? null
          : Border.all(
              color: hasBorderHighlight
                  ? todayHighlightColor
                  : easyDayProps.borderColor,
              //width: hasBorderHighlight ? 2.0 : 1.0,
            ),
    );
  }

  /// Returns the `BorderRadius` of the day widget.
  ///
  /// This method returns a `BorderRadius` object with the appropriate radius based on the `isSelected` boolean value and the `easyDayProps` object.

  BorderRadius get _dayBorderRadius {
    final activeBorderRadius = easyDayProps.activeBorderRadius;
    final inactiveBorderRadius = easyDayProps.inactiveBorderRadius;
    return BorderRadius.circular(
      isSelected ? activeBorderRadius : inactiveBorderRadius,
    );
  }

  /// Builds a `DayInfoText` widget for the month.
  ///
  /// This method returns a `DayInfoText` widget that displays the short name of the month of the current date, in uppercase.
  /// The `textStyle` property of the widget is determined based on the `isSelected` boolean value and the `easyDayProps` object.

  DayInfoText _buildMonth(bool isToday) {
    final activeMothStrStyle = easyDayProps.activeMothStrStyle ??
        EasyTextStyles.monthAsStrStyle.copyWith(
          color: activeTextColor,
        );
    final inactiveMothStrStyle =
        easyDayProps.inactiveMothStrStyle ?? EasyTextStyles.monthAsStrStyle;
    final todayMonthStrStyle =
        easyDayProps.todayMonthStrStyle ?? EasyTextStyles.monthAsStrStyle;
    return DayInfoText(
      text: EasyDateFormatter.shortMonthName(date, locale).toUpperCase(),
      textStyle: isSelected
          ? activeMothStrStyle
          : (isToday ? todayMonthStrStyle : inactiveMothStrStyle),
    );
  }

  /// Builds a `DayInfoText` widget for the day number.
  ///
  /// This method returns a `DayInfoText` widget that displays the day number of the current date.
  /// The `textStyle` property of the widget is determined based on the `isSelected` boolean value and the `easyDayProps` object.
  DayInfoText _buildDayNumber(bool isToday) {
    final activeDayNumStyle = easyDayProps.activeDayNumStyle ??
        EasyTextStyles.dayAsNumStyle.copyWith(
          color: activeTextColor,
        );
    final inactiveDayNumStyle =
        easyDayProps.inactiveDayNumStyle ?? EasyTextStyles.dayAsNumStyle;
    final todayNumStyle =
        easyDayProps.todayNumStyle ?? EasyTextStyles.dayAsNumStyle;
    return DayInfoText(
      text: date.day.toString(),
      textStyle: isSelected
          ? activeDayNumStyle
          : (isToday ? todayNumStyle : inactiveDayNumStyle),
    );
  }

  /// Builds a `DayInfoText` widget for the day number.
  ///
  /// This method returns a `DayInfoText` widget that displays the day number of the current date.
  /// The `textStyle` property of the widget is determined based on the `isSelected` boolean value and the `easyDayProps` object.

  DayInfoText _buildDayString(bool isToday) {
    final activeDayStrStyle = easyDayProps.activeDayStrStyle ??
        EasyTextStyles.dayAsStrStyle.copyWith(
          color: activeTextColor,
        );
    final inactiveDayStrStyle =
        easyDayProps.inactiveDayStrStyle ?? EasyTextStyles.dayAsStrStyle;
    final todayStrStyle =
        easyDayProps.todayStrStyle ?? EasyTextStyles.dayAsStrStyle;
    return DayInfoText(
      text: EasyDateFormatter.shortDayName(date, locale).toUpperCase(),
      textStyle: isSelected
          ? activeDayStrStyle
          : (isToday ? todayStrStyle : inactiveDayStrStyle),
    );
  }

  /// Builds the structure of a day widget based on the provided `DayStructure`.
  ///
  /// `structure` is an enum value that represents the structure to use for the day widget.
  /// This method returns a `Column` widget that contains the appropriate widgets for the `DayStructure`.
  Widget _buildDayStructure(
      {required DayStructure structure,
      bool isLandScape = false,
      required bool isToday}) {
    List<Widget> items = [];
    switch (structure) {
      case DayStructure.dayNumberOnly:
        items = [
          _buildDayNumber(isToday),
        ];
        break;
      case DayStructure.dayNameOnly:
        items = [
          _buildDayString(isToday),
        ];
        break;
      case DayStructure.dayNumDayStr:
        items = [
          _buildDayNumber(isToday),
          const SizedBox(
            width: EasyConstants.landscapeDayPadding,
          ),
          _buildDayString(isToday),
        ];
        break;
      case DayStructure.dayStrDayNum:
        items = [
          _buildDayString(isToday),
          const SizedBox(
            width: EasyConstants.landscapeDayPadding,
          ),
          _buildDayNumber(isToday),
        ];
        break;
      case DayStructure.dayStrDayNumMonth:
        items = [
          _buildDayString(isToday),
          _buildDayNumber(isToday),
          _buildMonth(isToday),
        ];
        break;
      default:
        items = [
          _buildMonth(isToday),
          _buildDayNumber(isToday),
          _buildDayString(isToday),
        ];
    }

    ///`isCompleteDate` means that the day will contains its name, number and month.
    bool isNotCompleteDate = (structure == DayStructure.dayNumDayStr ||
        structure == DayStructure.dayStrDayNum);
    return isLandScape
        ? Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: _dayItemsMainAxisAlignment(isNotCompleteDate),
            children: items,
          )
        : Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: _dayItemsMainAxisAlignment(isNotCompleteDate),
            children: items,
          );
  }

  MainAxisAlignment _dayItemsMainAxisAlignment(bool isNotCompleteDate) {
    return isNotCompleteDate
        ? MainAxisAlignment.center
        : MainAxisAlignment.spaceEvenly;
  }
}
