import 'package:flutter/material.dart';

import '../../properties/easy_day_props.dart';
import '../../utils/utils.dart';
import 'day_info_text.dart';

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
  final EasyDayProps? easyDayProps;
  final DateTime date;
  final String locale;
  final bool isSelected;
  final VoidCallback onDayPressed;
  final Color activeTextColor;
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
