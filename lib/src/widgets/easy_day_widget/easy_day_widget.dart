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
    final isLandScapeMode = easyDayProps?.landScapeMode ?? false;
    final width = isLandScapeMode ? easyDayProps?.height : easyDayProps?.width;
    final height = isLandScapeMode ? easyDayProps?.width : easyDayProps?.height;
    // final activeDayDecoration = (easyDayProps?.activeDayDecoration ??
    //     _buildDayDefaultDecoration(activeDayColor));
    return InkWell(
      onTap: onDayPressed,
      borderRadius: _dayBorderRadius,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: EasyConstants.animationDuration),
        width: width ?? EasyConstants.dayWidgetWidth,
        height: height ?? EasyConstants.dayWidgetHeight,
        decoration: isSelected ? _activeDayDecoration : _inactiveDayDecoration,
        child: _buildDayStructure(
          structure: easyDayProps?.dayStructure,
          isLandScape: isLandScapeMode,
          //  easyDayProps?.dayStructure,
          // easyDayProps?.landScapeMode,
        ),
      ),
    );
  }

  BoxDecoration get _inactiveDayDecoration {
    return (easyDayProps?.inactiveDayDecoration ??
        _buildDayDefaultDecoration(activeDayColor));
  }

  BoxDecoration get _activeDayDecoration {
    return (easyDayProps?.activeDayDecoration ??
        _buildDayDefaultDecoration(activeDayColor));
  }

  /// Builds the default decoration for the day widget.
  ///
  /// This method returns a `BoxDecoration` object with the appropriate properties based on the `isSelected` boolean value and the `easyDayProps` object.
  BoxDecoration _buildDayDefaultDecoration(Color color) {
    final isCurrentDay = EasyDateUtils.isCurrentDay(date);
    final showCurrentDayHighlightColor =
        easyDayProps?.highlightCurrentDay ?? true;
    final currantDayColorOrNull = showCurrentDayHighlightColor
        ? (easyDayProps?.currentDateHighlightColor ?? color.withOpacity(0.2))
        : null;
    final currentDayBackgroundColor =
        isCurrentDay ? currantDayColorOrNull : null;

    return BoxDecoration(
      color: isSelected ? color : currentDayBackgroundColor,
      borderRadius: _dayBorderRadius,

      /// Hide the day border if the day is selected or is the current day.
      border: isSelected || showCurrentDayHighlightColor
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
    final activeBorderRadius =
        easyDayProps?.activeBorderRadius ?? EasyConstants.dayWidgetBorderRadius;
    final inactiveBorderRadius = easyDayProps?.inactiveBorderRadius ??
        EasyConstants.dayWidgetBorderRadius;
    return BorderRadius.all(
      Radius.circular(
        isSelected ? activeBorderRadius : inactiveBorderRadius,
      ),
    );
  }

  /// Builds a `DayInfoText` widget for the month.
  ///
  /// This method returns a `DayInfoText` widget that displays the short name of the month of the current date, in uppercase.
  /// The `textStyle` property of the widget is determined based on the `isSelected` boolean value and the `easyDayProps` object.

  DayInfoText _buildMonth() {
    final activeMothStrStyle = easyDayProps?.activeMothStrStyle ??
        EasyTextStyles.monthAsStrStyle.copyWith(
          color: activeTextColor,
        );
    final inactiveMothStrStyle =
        easyDayProps?.inactiveMothStrStyle ?? EasyTextStyles.monthAsStrStyle;
    return DayInfoText(
      text: EasyDateFormatter.shortMonthName(date, locale).toUpperCase(),
      textStyle: isSelected ? activeMothStrStyle : inactiveMothStrStyle,
    );
  }

  /// Builds a `DayInfoText` widget for the day number.
  ///
  /// This method returns a `DayInfoText` widget that displays the day number of the current date.
  /// The `textStyle` property of the widget is determined based on the `isSelected` boolean value and the `easyDayProps` object.
  DayInfoText _buildDayNumber() {
    final activeDayNumStyle = easyDayProps?.activeDayNumStyle ??
        EasyTextStyles.dayAsNumStyle.copyWith(
          color: activeTextColor,
        );
    final inactiveDayNumStyle =
        easyDayProps?.inactiveDayNumStyle ?? EasyTextStyles.dayAsNumStyle;
    return DayInfoText(
      text: date.day.toString(),
      textStyle: isSelected ? activeDayNumStyle : inactiveDayNumStyle,
    );
  }

  /// Builds a `DayInfoText` widget for the day number.
  ///
  /// This method returns a `DayInfoText` widget that displays the day number of the current date.
  /// The `textStyle` property of the widget is determined based on the `isSelected` boolean value and the `easyDayProps` object.

  DayInfoText _buildDayString() {
    final activeDayStrStyle = easyDayProps?.activeDayStrStyle ??
        EasyTextStyles.dayAsStrStyle.copyWith(
          color: activeTextColor,
        );
    final inactiveDayStrStyle =
        easyDayProps?.inactiveDayStrStyle ?? EasyTextStyles.dayAsStrStyle;
    return DayInfoText(
      text: EasyDateFormatter.shortDayName(date, locale).toUpperCase(),
      textStyle: isSelected ? activeDayStrStyle : inactiveDayStrStyle,
    );
  }

  /// Builds the structure of a day widget based on the provided `DayStructure`.
  ///
  /// `structure` is an enum value that represents the structure to use for the day widget.
  /// This method returns a `Column` widget that contains the appropriate widgets for the `DayStructure`.
  Widget _buildDayStructure(
      {DayStructure? structure, bool isLandScape = false}) {
    List<Widget> items = [];
    switch (structure) {
      case DayStructure.dayNumberOnly:
        items = [
          _buildDayNumber(),
        ];
        break;
      case DayStructure.dayNameOnly:
        items = [
          _buildDayString(),
        ];
        break;
      case DayStructure.dayNumDayStr:
        items = [
          _buildDayNumber(),
          const SizedBox(
            width: EasyConstants.landscapeDayPadding,
          ),
          _buildDayString(),
        ];
        break;
      case DayStructure.dayStrDayNum:
        items = [
          _buildDayString(),
          const SizedBox(
            width: EasyConstants.landscapeDayPadding,
          ),
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
