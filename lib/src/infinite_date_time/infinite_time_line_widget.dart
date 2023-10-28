import 'package:flutter/material.dart';

import '../properties/easy_day_props.dart';
import '../properties/time_line_props.dart';
import '../utils/utils.dart';
import '../widgets/easy_day_widget/easy_day_widget.dart';

part 'easy_infinite_date_timeline_controller.dart';

/// A widget that displays a timeline of days.
class InfiniteTimeLineWidget extends StatefulWidget {
  InfiniteTimeLineWidget({
    super.key,
    this.inactiveDates,
    this.dayProps = const EasyDayProps(),
    this.locale = "en_US",
    this.timeLineProps = const EasyTimeLineProps(),
    this.onDateChange,
    this.itemBuilder,
    required this.firstDate,
    required this.focusedDate,
    required this.activeDayTextColor,
    required this.activeDayColor,
    required this.lastDate,
    this.controller,
  })  : assert(timeLineProps.hPadding > -1,
            "Can't set timeline hPadding less than zero."),
        assert(timeLineProps.separatorPadding > -1,
            "Can't set timeline separatorPadding less than zero."),
        assert(timeLineProps.vPadding > -1,
            "Can't set timeline vPadding less than zero."),
        assert(
          !lastDate.isBefore(firstDate),
          'lastDate $lastDate must be on or after firstDate $firstDate.',
        );

  /// Represents the initial date for the timeline widget.
  /// This is the date that will be displayed as the first day in the timeline.
  final DateTime firstDate;

  /// Represents the last date for the timeline widget.
  /// This is the date that will be displayed as the last day in the timeline.
  final DateTime lastDate;

  /// The currently focused date in the timeline.
  final DateTime? focusedDate;

  /// The color of the text for the selected day.
  final Color activeDayTextColor;

  /// The background color of the selected day.
  final Color activeDayColor;

  /// Represents a list of inactive dates for the timeline widget.
  /// Note that all the dates defined in the inactiveDates list will be deactivated.
  final List<DateTime>? inactiveDates;

  /// Contains properties for configuring the appearance and behavior of the timeline widget.
  /// This object includes properties such as the height of the timeline, the color of the selected day,
  /// and the animation duration for scrolling.
  final EasyTimeLineProps timeLineProps;

  /// Contains properties for configuring the appearance and behavior of the day widgets in the timeline.
  /// This object includes properties such as the width and height of each day widget,
  /// the color of the text and background, and the font size.
  final EasyDayProps dayProps;

  /// Called when the selected date in the timeline changes.
  /// This function takes a `DateTime` object as its parameter, which represents the new selected date.
  final OnDateChangeCallBack? onDateChange;

  /// Called for each day in the timeline, allowing the developer to customize the appearance and behavior of each day widget.
  /// This function takes a `BuildContext` and a `DateTime` object as its parameters, and should return a `Widget` that represents the day.
  final ItemBuilderCallBack? itemBuilder;

  /// A `String` that represents the locale code to use for formatting the dates in the timeline.
  final String locale;

  /// The controller to manage the EasyInfiniteDateTimeline. Allows programmatic control over the timeline,
  /// such as scrolling to a specific date or scrolling to the focus date.
  final EasyInfiniteDateTimelineController? controller;

  @override
  State<InfiniteTimeLineWidget> createState() => _InfiniteTimeLineWidgetState();
}

class _InfiniteTimeLineWidgetState extends State<InfiniteTimeLineWidget> {
  EasyDayProps get _dayProps => widget.dayProps;
  EasyTimeLineProps get _timeLineProps => widget.timeLineProps;
  bool get _isLandscapeMode => _dayProps.landScapeMode;
  double get _dayWidth => _dayProps.width;
  double get _dayHeight => _dayProps.height;
  double get _dayOffsetConstrains =>
      (_isLandscapeMode ? _dayHeight : _dayWidth) +
      _timeLineProps.separatorPadding;
  late int _daysCount;

  late ScrollController _controller;
  DateTime get _focusDate => widget.focusedDate ?? widget.firstDate;

  double _getItemExtend = 0.0;

  @override
  void didUpdateWidget(covariant InfiniteTimeLineWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      _attachEasyController();
    } else if (widget.timeLineProps != oldWidget.timeLineProps ||
        widget.dayProps != oldWidget.dayProps) {
      _initItemExtend();
    }
  }

  @override
  void initState() {
    super.initState();
    _initItemExtend();
    _attachEasyController();
    _daysCount = widget.lastDate.difference(widget.firstDate).inDays;
    _controller = ScrollController(
      initialScrollOffset: _calculateDateOffset(),
    );
  }

  void _initItemExtend() {
    _getItemExtend = (_isLandscapeMode ? _dayHeight : _dayWidth) +
        _timeLineProps.separatorPadding;
  }

  void _attachEasyController() => widget.controller?._attachEasyDateState(this);

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
  /// (which is either the value of widget.easyDayProps.width or a default value of EasyConstants.dayWidgetWidth).
  /// It then adds to this value the product of offset and [EasyConstants.separatorPadding] (which represents the width of the space between each day widget)
  double _calculateDateOffset() {
    final initialDate = widget.firstDate;
    final focusedDate = widget.focusedDate;
    int offset = 0;
    if (focusedDate != null) {
      offset = focusedDate.difference(initialDate).inDays;
    }
    double adjustedHPadding =
        _timeLineProps.hPadding > EasyConstants.timelinePadding
            ? (_timeLineProps.hPadding - EasyConstants.timelinePadding)
            : 0.0;
    if (offset == 0) {
      return 0.0;
    }
    return (offset * _dayOffsetConstrains) + adjustedHPadding;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _isLandscapeMode ? _dayWidth : _dayHeight,
      margin: _timeLineProps.margin,
      color: _timeLineProps.decoration == null
          ? _timeLineProps.backgroundColor
          : null,
      decoration: _timeLineProps.decoration,
      child: ClipRRect(
        borderRadius:
            _timeLineProps.decoration?.borderRadius ?? BorderRadius.zero,
        child: CustomScrollView(
          scrollDirection: Axis.horizontal,
          controller: _controller,
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: _timeLineProps.hPadding,
                vertical: _timeLineProps.vPadding,
              ),
              sliver: SliverFixedExtentList.builder(
                itemExtent: _getItemExtend,
                itemBuilder: (context, index) {
                  final currentDate =
                      widget.firstDate.add(Duration(days: index));
                  bool isSelected =
                      EasyDateUtils.isSameDay(_focusDate, currentDate);
                  bool isDisabledDay = false;
                  // Check if this date should be deactivated only for the DeactivatedDates.
                  if (widget.inactiveDates != null) {
                    for (DateTime inactiveDate in widget.inactiveDates!) {
                      if (EasyDateUtils.isSameDay(currentDate, inactiveDate)) {
                        isDisabledDay = true;
                        break;
                      }
                    }
                  }

                  return widget.itemBuilder != null
                      ? Padding(
                          padding: EdgeInsetsDirectional.only(
                            end: _timeLineProps.separatorPadding,
                          ),
                          child: _dayItemBuilder(
                            context,
                            isSelected,
                            currentDate,
                          ),
                        )
                      : Padding(
                          padding: EdgeInsetsDirectional.only(
                            end: _timeLineProps.separatorPadding,
                          ),
                          child: EasyDayWidget(
                            easyDayProps: _dayProps,
                            date: currentDate,
                            locale: widget.locale,
                            isSelected: isSelected,
                            isDisabled: isDisabledDay,
                            onDayPressed: () =>
                                _onDayChanged(isSelected, currentDate),
                            activeTextColor: widget.activeDayTextColor,
                            activeDayColor: widget.activeDayColor,
                          ),
                        );
                },
                itemCount: _daysCount + 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  InkWell _dayItemBuilder(
    BuildContext context,
    bool isSelected,
    DateTime date,
  ) {
    return InkWell(
      onTap: () => _onDayChanged(isSelected, date),
      borderRadius: BorderRadius.circular(_dayProps.activeBorderRadius),
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
