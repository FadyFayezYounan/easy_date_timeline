import 'package:flutter/material.dart';

import '../properties/easy_day_props.dart';
import '../properties/time_line_props.dart';
import '../utils/utils.dart';
import 'easy_day_widget/easy_day_widget.dart';

/// A widget that displays a timeline of days.
class TimeLineWidget extends StatefulWidget {
  const TimeLineWidget({
    super.key,
    required this.initialDate,
    this.easyDayProps,
    this.locale = "en_US",
    this.timeLineProps,
    this.onDateChange,
    this.itemBuilder,
    required this.focusedDate,
    required this.activeDayTextColor,
    required this.activeDayColor,
  });

  /// Represents the initial date for the timeline widget.
  /// This is the date that will be displayed as the first day in the timeline.
  final DateTime initialDate;

  /// The currently focused date in the timeline.
  final DateTime? focusedDate;

  /// Contains properties for configuring the appearance and behavior of the timeline widget.
  /// This object includes properties such as the height of the timeline, the color of the selected day,
  /// and the animation duration for scrolling.
  final TimeLineProps? timeLineProps;

  /// Contains properties for configuring the appearance and behavior of the day widgets in the timeline.
  /// This object includes properties such as the width and height of each day widget,
  /// the color of the text and background, and the font size.
  final EasyDayProps? easyDayProps;

  /// Called when the selected date in the timeline changes.
  /// This function takes a `DateTime` object as its parameter, which represents the new selected date.
  final OnDateChangeCallBack? onDateChange;

  /// Called for each day in the timeline, allowing the developer to customize the appearance and behavior of each day widget.
  /// This function takes a `BuildContext` and a `DateTime` object as its parameters, and should return a `Widget` that represents the day.
  final ItemBuilderCallBack? itemBuilder;

  /// A `String` that represents the locale code to use for formatting the dates in the timeline.
  final String locale;

  /// The color of the text for the selected day.
  final Color activeDayTextColor;

  /// The background color of the selected day.
  final Color activeDayColor;

  @override
  State<TimeLineWidget> createState() => _TimeLineWidgetState();
}

class _TimeLineWidgetState extends State<TimeLineWidget> {
  EasyDayProps? get _easyDayProps => widget.easyDayProps;
  TimeLineProps? get _timeLineProps => widget.timeLineProps;

  late ScrollController _controller;
  @override
  void initState() {
    super.initState();

    _controller = ScrollController(
      initialScrollOffset: _calculateDateOffset(widget.initialDate),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// the method calculates the number of days between startDate and date using the difference() method
  /// of the Duration class. This value is stored in the offset variable.
  /// If offset is equal to 0, the method returns 0.0.
  /// Otherwise, the method calculates the horizontal offset of the day
  /// by multiplying the offset value by the width of a day widget
  /// (which is either the value of widget.easyDayProps?.width or a default value of EasyConstants.dayWidgetWidth).
  /// It then adds to this value the product of offset and [EasyConstants.timelinePadding] (which represents the width of the space between each day widget)
  double _calculateDateOffset(DateTime date) {
    final startDate = DateTime(date.year, date.month, 1);
    int offset = date.difference(startDate).inDays;
    if (offset == 0) {
      return 0.0;
    }
    return (offset *
            (widget.easyDayProps?.width ?? EasyConstants.dayWidgetWidth)) +
        (offset * (_timeLineProps?.padding ?? EasyConstants.timelinePadding));
  }

  @override
  Widget build(BuildContext context) {
    final initialDate = widget.initialDate;
    return Container(
      color: _timeLineProps?.backgroundColor,
      height: _easyDayProps?.height ?? EasyConstants.dayWidgetHeight,
      child: ListView.separated(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(
          horizontal: _timeLineProps?.padding ?? EasyConstants.timelinePadding,
        ),
        itemBuilder: (context, index) {
          final currentDate = DateTime(initialDate.year, initialDate.month, 1)
              .add(Duration(days: index));
          final isSelected = widget.focusedDate != null
              ? EasyDateUtils.isSameDay(widget.focusedDate!, currentDate)
              : EasyDateUtils.isSameDay(widget.initialDate, currentDate);
          return widget.itemBuilder != null
              ? _dayItemBuilder(isSelected, currentDate, context)
              : EasyDayWidget(
                  easyDayProps: _easyDayProps,
                  date: currentDate,
                  locale: widget.locale,
                  isSelected: isSelected,
                  onDayPressed: () => _onDayChanged(isSelected, currentDate),
                  activeTextColor: widget.activeDayTextColor,
                  activeDayColor: widget.activeDayColor,
                );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: _timeLineProps?.separatorPadding ??
                EasyConstants.separatorPadding,
          );
        },
        itemCount: EasyDateUtils.getDaysInMonth(initialDate),
      ),
    );
  }

  InkWell _dayItemBuilder(
    bool isSelected,
    DateTime date,
    BuildContext context,
  ) {
    return InkWell(
      onTap: () => _onDayChanged(isSelected, date),
      borderRadius: BorderRadius.circular(_easyDayProps?.activeBorderRadius ??
          _easyDayProps?.inactiveBorderRadius ??
          0.0),
      child: widget.itemBuilder!(
        context,
        date.day.toString(),
        EasyDateFormatter.shortDayName(date, widget.locale).toUpperCase(),
        EasyDateFormatter.shortMonthName(date, widget.locale).toUpperCase(),
        date,
        isSelected,
      ),
    );
  }

  void _onDayChanged(bool isSelected, DateTime currentDate) {
    // A date is selected
    widget.onDateChange?.call(currentDate);
  }
}
