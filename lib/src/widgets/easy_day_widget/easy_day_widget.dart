import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';
import 'day_info_text.dart';

/// A widget that displays a single day in the timeline.
class EasyDayWidget extends StatelessWidget {
  const EasyDayWidget({
    super.key,
    this.easyDayProps = const EasyDayProps(),
    this.markedStyle,
    required this.date,
    required this.locale,
    required this.isDisabled,
    this.isSelected = false,
    required this.onDayPressed,
    required this.activeDayColor,
    this.margin,
  });

  /// Contains properties for configuring the appearance and behavior of the day widget.
  final EasyDayProps easyDayProps;

  /// Special day style for marked dates.
  /// 
  /// Lower priority compared to `today`, `disabled` and `selected` day styles.
  final DayStyle? markedStyle;

  /// The date to display in the day widget.
  final DateTime date;

  /// A `String` that represents the locale code to use for formatting the date in the day widget.
  final String locale;

  /// A boolean value that indicates whether the day is selected.
  final bool isSelected;

  /// A boolean value that indicates whether the day is selected.
  final bool isDisabled;

  /// A callback function that is called when the day widget is pressed.
  final VoidCallback onDayPressed;

  /// The background color of the selected day.
  final Color activeDayColor;

  final EdgeInsetsGeometry? margin;

  // Get the inactive day properties from the EasyDayProps object.
  DayStyle get _inactiveDayStyle => easyDayProps.inactiveDayStyle;

  // Get the active day properties from the EasyDayProps object.
  DayStyle get _activeDayStyle => easyDayProps.activeDayStyle;

  // Get the disabled day properties from the EasyDayProps object.
  DayStyle get _disabledDayStyle => easyDayProps.disabledDayStyle;

  // Get the today properties from the EasyDayProps object.
  DayStyle get _todayStyle => easyDayProps.todayStyle;

  @override
  Widget build(BuildContext context) {
    final isLandScapeMode = easyDayProps.landScapeMode;
    final width = isLandScapeMode ? easyDayProps.height : easyDayProps.width;
    final height = isLandScapeMode ? easyDayProps.width : easyDayProps.height;
    // Check if the date is today and if it should be highlighted with a background or a border
    final isToday = EasyDateUtils.isToday(date);

    // Check if the date is marked by special style
    final isMarked = markedStyle != null;

    // This code block assigns the BoxDecoration object dayDecoration with _inactiveDayDecoration by default.
    // It then checks if the day is selected or disabled and updates the dayDecoration object accordingly.
    // If the day is selected, the _activeDayDecoration is used.
    // If the day is disabled, _disabledDayDecoration is used.
    BoxDecoration dayDecoration = _inactiveDayDecoration;
    if (isSelected) {
      dayDecoration = _activeDayDecoration;
    } else if (isDisabled) {
      dayDecoration = _disabledDayDecoration;
    } else if (isToday) {
      dayDecoration = _todayDecoration;
    } else if (isMarked){
      dayDecoration = _markedDecoration;
    }

    /// Get the brightness for final background color
    /// activeDayColor is initialized to the value of widget.activeColor if it is not null,
    /// or to the primary color of the current theme if widget.activeColor is null.
    /// This provides a fallback color if no active color is explicitly provided.
    final brightness = ThemeData.estimateBrightnessForColor(
      dayDecoration.color ?? activeDayColor,
    );

    return InkWell(
      // if the day is disabled then make it not clickable.
      onTap: isDisabled ? null : onDayPressed,
      //borderRadius: _dayBorderRadius(isToday),
      borderRadius: _daySplashBorderRadius(isToday: isToday, isMarked: isMarked),
      child: AnimatedContainer(
        duration: EasyConstants.animationDuration,
        width: width,
        height: height,
        margin: margin,
        decoration: dayDecoration,
        child: _buildDayStructure(
          brightness: brightness,
          structure: easyDayProps.dayStructure,
          isLandScape: isLandScapeMode,
          isToday: isToday,
          isMarked: isMarked,
        ),
      ),
    );
  }

  BoxDecoration get _inactiveDayDecoration {
    //TODO: remove `easyDayProps.inactiveDayDecoration` because it is deprecated.
    return _inactiveDayStyle.decoration ??
        easyDayProps.inactiveDayDecoration ??
        _buildDayDefaultDecoration(activeDayColor);
  }

  BoxDecoration get _activeDayDecoration {
    //TODO: remove `easyDayProps.activeDayDecoration` because it is deprecated.
    return _activeDayStyle.decoration ??
        easyDayProps.activeDayDecoration ??
        _buildDayDefaultDecoration(activeDayColor);
  }

  BoxDecoration get _disabledDayDecoration {
    return _disabledDayStyle.decoration ??
        _buildDayDefaultDecoration(activeDayColor);
  }

  BoxDecoration get _todayDecoration {
    return _todayStyle.decoration ?? _buildDayDefaultDecoration(activeDayColor);
  }

  BoxDecoration get _markedDecoration {    
    return markedStyle?.decoration ??
        _buildDayDefaultDecoration(
          markedStyle?.backgroundColor ?? activeDayColor,
          forceBackgroundColor: markedStyle?.backgroundColor != null,
        );
  }

  /// Builds the default decoration for the day widget.
  ///
  /// This method returns a `BoxDecoration` object with the appropriate properties based on the `isSelected` boolean value and the `easyDayProps` object.

  BoxDecoration _buildDayDefaultDecoration(Color backgroundColor, {bool forceBackgroundColor = false}) {
    // Check if need to apply background color
    final bool applyBackgroundColor = isSelected || forceBackgroundColor;

    // Check if the date is today and if it should be highlighted with a background or a border
    final isToday = EasyDateUtils.isToday(date);

    // Check if the date is marked by special style
    final isMarked = markedStyle != null;

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
    final hideBorder = applyBackgroundColor || hasBackgroundHighlight;
    return BoxDecoration(
      // Use the background color for the selected date or the highlight color for the highlighted date
      color: applyBackgroundColor
          ? backgroundColor
          : (hasBackgroundHighlight ? todayHighlightColor : null),
      borderRadius: _dayBorderRadius(isToday: isToday, isMarked: isMarked),

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
  BorderRadius _dayBorderRadius({required bool isToday, required bool isMarked}) {
    //TODO: remove `easyDayProps.activeBorderRadius` because it is deprecated.
    final activeBorderRadius =
        _activeDayStyle.borderRadius ?? easyDayProps.activeBorderRadius;
    //TODO: remove `easyDayProps.inactiveBorderRadius` because it is deprecated.
    final inactiveBorderRadius =
        _inactiveDayStyle.borderRadius ?? easyDayProps.inactiveBorderRadius;
    final disabledBorderRadius =
        _disabledDayStyle.borderRadius ?? EasyConstants.dayWidgetBorderRadius;
    final todayBorderRadius = _todayStyle.borderRadius;
    double borderRadius = inactiveBorderRadius;
    if (isDisabled) {
      borderRadius = disabledBorderRadius;
    } else if (isSelected) {
      borderRadius = activeBorderRadius;
    } else if (isToday) {
      borderRadius = todayBorderRadius ?? EasyConstants.dayWidgetBorderRadius;
    } else if (isMarked && markedStyle?.borderRadius != null) {
      borderRadius = markedStyle!.borderRadius!;
    }
    return BorderRadius.circular(
      borderRadius,
    );
  }

  /// Determines the border radius to be applied to the day when it's touched (splashed).
  ///
  /// Returns the appropriate [BorderRadius] based on the day's state.
  BorderRadius _daySplashBorderRadius({required bool isToday, required bool isMarked}) {
    if (isDisabled) {
      return _disabledDayStyle.splashBorder;
    } else if (isSelected) {
      return _activeDayStyle.splashBorder;
    } else if (isToday) {
      return _todayStyle.splashBorder;
    } else if (isMarked && markedStyle?.splashBorder != null) {
      return markedStyle!.splashBorder;
    }
    return _inactiveDayStyle.splashBorder;
  }

  /// Builds a `DayInfoText` widget for the month.
  ///
  /// This method returns a `DayInfoText` widget that displays the short name of the month of the current date, in uppercase.
  /// The `textStyle` property of the widget is determined based on the `isSelected` boolean value and the `easyDayProps` object.
  DayInfoText _buildMonth({
    required Color defaultTextColor,
    required bool isToday,
    required bool isMarked,
  }) {        
    //TODO: remove `easyDayProps.activeMothStrStyle` because it is deprecated.
    final activeMothStrStyle = _activeDayStyle.monthStrStyle ??
        easyDayProps.activeMothStrStyle ??
        EasyTextStyles.monthStrStyle.copyWith(
          color: defaultTextColor,
        );
    //TODO: remove `easyDayProps.inactiveMothStrStyle` because it is deprecated.
    final inactiveMonthStrStyle = _inactiveDayStyle.monthStrStyle ??
        easyDayProps.inactiveMothStrStyle ??
        EasyTextStyles.monthStrStyle;
    //TODO: remove `easyDayProps.todayMonthStrStyle` because it is deprecated.
    final todayMonthStrStyle = _todayStyle.monthStrStyle ??
        easyDayProps.todayMonthStrStyle ??
        EasyTextStyles.monthStrStyle;

    final disabledMonthStrStyle = _disabledDayStyle.monthStrStyle ??
        EasyTextStyles.monthStrStyle.copyWith(
          color: EasyColors.disabledDayColor,
        );
    TextStyle monthStyle = inactiveMonthStrStyle;
    if (isSelected) {
      monthStyle = activeMothStrStyle;
    } else if (isDisabled) {
      monthStyle = disabledMonthStrStyle;
    } else if (isToday) {
      monthStyle = todayMonthStrStyle;
    } else if (isMarked) {
      monthStyle = markedStyle?.monthStrStyle ??
        easyDayProps.todayMonthStrStyle ??
        EasyTextStyles.monthStrStyle.copyWith(
          color: defaultTextColor,
        );
    }
    return DayInfoText(
      text: EasyDateFormatter.shortMonthName(date, locale).toUpperCase(),
      textStyle: monthStyle,
    );
  }

  /// Builds a `DayInfoText` widget for the day number.
  ///
  /// This method returns a `DayInfoText` widget that displays the day number of the current date.
  /// The `textStyle` property of the widget is determined based on the `isSelected` boolean value and the `easyDayProps` object.
  DayInfoText _buildDayNumber({
    required Color defaultTextColor,
    required bool isToday,
    required bool isMarked,
  }) {
    //TODO: remove `easyDayProps.activeDayNumStyle` because it is deprecated.
    final activeDayNumStyle = _activeDayStyle.dayNumStyle ??
        easyDayProps.activeDayNumStyle ??
        EasyTextStyles.dayNumStyle.copyWith(
          color: defaultTextColor,
        );
    //TODO: remove `easyDayProps.inactiveDayNumStyle` because it is deprecated.
    final inactiveDayNumStyle = _inactiveDayStyle.dayNumStyle ??
        easyDayProps.inactiveDayNumStyle ??
        EasyTextStyles.dayNumStyle;
    //TODO: remove `easyDayProps.todayNumStyle` because it is deprecated.
    final todayNumStyle = _todayStyle.dayNumStyle ??
        easyDayProps.todayNumStyle ??
        EasyTextStyles.dayNumStyle;
    final disabledNumStyle = _disabledDayStyle.dayNumStyle ??
        EasyTextStyles.dayNumStyle.copyWith(
          color: EasyColors.disabledDayColor,
        );
    TextStyle dayNumStyle = inactiveDayNumStyle;
    if (isSelected) {
      dayNumStyle = activeDayNumStyle;
    } else if (isDisabled) {
      dayNumStyle = disabledNumStyle;
    } else if (isToday) {
      dayNumStyle = todayNumStyle;
    } else if (isMarked) {
      dayNumStyle = markedStyle?.dayNumStyle ??
        easyDayProps.todayNumStyle ??
        EasyTextStyles.dayNumStyle.copyWith(
          color: defaultTextColor,
        );
    }
    return DayInfoText(
      text: date.day.toString(),
      textStyle: dayNumStyle,
    );
  }

  /// Builds a `DayInfoText` widget for the day number.
  ///
  /// This method returns a `DayInfoText` widget that displays the day number of the current date.
  /// The `textStyle` property of the widget is determined based on the `isSelected` boolean value and the `easyDayProps` object.

  DayInfoText _buildDayString({
    required Color defaultTextColor,
    required bool isToday,
    required bool isMarked,
  }) {
    //TODO: remove `easyDayProps.activeDayStrStyle` because it is deprecated.
    final activeDayStrStyle = _activeDayStyle.dayStrStyle ??
        easyDayProps.activeDayStrStyle ??
        EasyTextStyles.dayStrStyle.copyWith(
          color: defaultTextColor,
        );
    //TODO: remove `easyDayProps.inactiveDayStrStyle` because it is deprecated.
    final inactiveDayStrStyle = _inactiveDayStyle.dayStrStyle ??
        easyDayProps.inactiveDayStrStyle ??
        EasyTextStyles.dayStrStyle;
    //TODO: remove `easyDayProps.disabledDayStrStyle` because it is deprecated.
    final todayStrStyle = _todayStyle.dayStrStyle ??
        easyDayProps.todayStrStyle ??
        EasyTextStyles.dayStrStyle;
    final disabledStrStyle = _disabledDayStyle.dayStrStyle ??
        EasyTextStyles.dayStrStyle.copyWith(
          color: EasyColors.disabledDayColor,
        );
    TextStyle dayStrStyle = inactiveDayStrStyle;
    if (isSelected) {
      dayStrStyle = activeDayStrStyle;
    } else if (isDisabled) {
      dayStrStyle = disabledStrStyle;
    } else if (isToday) {
      dayStrStyle = todayStrStyle;
    } else if (isMarked) {
      dayStrStyle = markedStyle?.dayStrStyle ??
        easyDayProps.todayStrStyle ??
        EasyTextStyles.dayStrStyle.copyWith(
          color: defaultTextColor,
        );
    }
    return DayInfoText(
      text: EasyDateFormatter.shortDayName(date, locale).toUpperCase(),
      textStyle: dayStrStyle,
    );
  }

  /// Builds the structure of a day widget based on the provided `DayStructure`.
  ///
  /// `structure` is an enum value that represents the structure to use for the day widget.
  /// This method returns a `Column` widget that contains the appropriate widgets for the `DayStructure`.
  Widget _buildDayStructure({
    required Brightness brightness,
    required DayStructure structure,
    bool isLandScape = false,
    required bool isToday,
    required bool isMarked,
  }) {
    /// defaultTextColor is initialized to EasyColors.dayAsNumColor if the brightness is Brightness.light,
    ///  indicating that the active color is light, or to Colors.white if the brightness is Brightness.dark,
    /// indicating that the active color is dark.
    final defaultTextColor = brightness == Brightness.light
        ? EasyColors.dayAsNumColor
        : Colors.white;

    List<Widget> items = [];
    switch (structure) {
      case DayStructure.dayNumberOnly:
        items = [
          _buildDayNumber(defaultTextColor: defaultTextColor, isToday: isToday, isMarked: isMarked),
        ];
        break;
      case DayStructure.dayNameOnly:
        items = [
          _buildDayString(defaultTextColor: defaultTextColor, isToday: isToday, isMarked: isMarked),
        ];
        break;
      case DayStructure.dayNumDayStr:
        items = [
          _buildDayNumber(defaultTextColor: defaultTextColor, isToday: isToday, isMarked: isMarked),
          const SizedBox(
            width: EasyConstants.landscapeDayPadding,
          ),
          _buildDayString(defaultTextColor: defaultTextColor, isToday: isToday, isMarked: isMarked),
        ];
        break;
      case DayStructure.dayStrDayNum:
        items = [
          _buildDayString(defaultTextColor: defaultTextColor, isToday: isToday, isMarked: isMarked),
          const SizedBox(
            width: EasyConstants.landscapeDayPadding,
          ),
          _buildDayNumber(defaultTextColor: defaultTextColor, isToday: isToday, isMarked: isMarked),
        ];
        break;
      case DayStructure.dayStrDayNumMonth:
        items = [
          _buildDayString(defaultTextColor: defaultTextColor, isToday: isToday, isMarked: isMarked),
          _buildDayNumber(defaultTextColor: defaultTextColor, isToday: isToday, isMarked: isMarked),
          _buildMonth(defaultTextColor: defaultTextColor, isToday: isToday, isMarked: isMarked),
        ];
        break;
      default:
        items = [
          _buildMonth(defaultTextColor: defaultTextColor, isToday: isToday, isMarked: isMarked),
          _buildDayNumber(defaultTextColor: defaultTextColor, isToday: isToday, isMarked: isMarked),
          _buildDayString(defaultTextColor: defaultTextColor, isToday: isToday, isMarked: isMarked),
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
