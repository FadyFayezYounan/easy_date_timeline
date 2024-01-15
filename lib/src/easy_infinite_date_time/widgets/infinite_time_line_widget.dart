import 'package:flutter/material.dart';

import '../../properties/properties.dart';
import '../../utils/utils.dart';
import '../../widgets/easy_day_widget/easy_day_widget.dart';

part 'easy_infinite_date_timeline_controller.dart';

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
  /// Returns the [EasyDayProps] associated with the widget.
  EasyDayProps get _dayProps => widget.dayProps;

  /// Returns the [EasyTimeLineProps] associated with this [InfiniteTimeLineWidget].
  EasyTimeLineProps get _timeLineProps => widget.timeLineProps;

  /// Returns a boolean value indicating whether the widget is in landscape mode.
  bool get _isLandscapeMode => _dayProps.landScapeMode;

  /// Returns the width of a single day in the timeline.
  double get _dayWidth => _dayProps.width;

  /// Returns the height of a single day in the timeline.
  double get _dayHeight => _dayProps.height;

  /// Returns the offset constraints for a single day in the timeline.
  /// The offset constraints are calculated based on the orientation of the timeline
  /// (landscape or portrait) and the dimensions of the day (height or width).
  /// The separator padding is also taken into account.
  double get _dayOffsetConstrains =>
      (_isLandscapeMode ? _dayHeight : _dayWidth) +
      _timeLineProps.separatorPadding;

  /// The number of days in the timeline.
  late int _daysCount;

  /// Scroll controller for the infinite timeline widget.
  late ScrollController _controller;

  /// Returns the focus date of the timeline widget.
  /// If the `focusedDate` property is not set, it returns the `firstDate` property.
  DateTime get _focusDate => widget.focusedDate ?? widget.firstDate;

  /// The extent of each item in the infinite timeline widget.
  double _itemExtend = 0.0;

  @override
  void initState() {
    super.initState();
    _initItemExtend();
    _attachEasyController();
    _daysCount =
        EasyDateUtils.calculateDaysCount(widget.firstDate, widget.lastDate);
    _controller = ScrollController(
      initialScrollOffset: _calculateDateOffset(),
    );
  }

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

  /// Attaches the [EasyInfiniteDateTimelineController] to the [InfiniteTimeLineWidget].
  ///
  /// This method is responsible for attaching the [EasyInfiniteDateTimelineController] provided by the widget to the [InfiniteTimeLineWidget].
  /// It calls the `_attachEasyDateState` method on the [EasyInfiniteDateTimelineController] to establish the connection.
  ///
  /// If the [EasyInfiniteDateTimelineController] is not provided, this method does nothing.
  void _attachEasyController() => widget.controller?._attachEasyDateState(this);

  /// Detaches the [EasyInfiniteDateTimelineController] from the [InfiniteTimeLineWidget].
  ///
  /// This method is responsible for detaching the [EasyInfiniteDateTimelineController] provided by the widget from the [InfiniteTimeLineWidget].
  /// It calls the `_detachEasyDateState` method on the [EasyInfiniteDateTimelineController] to remove the connection.
  ///
  /// If the [EasyInfiniteDateTimelineController] is not provided, this method does nothing.
  void _detachEasyController() => widget.controller?._detachEasyDateState();

  @override
  void dispose() {
    _controller.dispose();
    _detachEasyController();
    super.dispose();
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
                itemExtent: _itemExtend,
                itemBuilder: (context, index) {
                  /// Adds a duration of [index] days to the [firstDate] and assigns the result to [currentDate].
                  ///
                  /// The [firstDate] is the starting date from which the duration is added.
                  /// The [index] represents the number of days to be added to the [firstDate].
                  final currentDate =
                      widget.firstDate.add(Duration(days: index));

                  /// Checks if the [_focusDate] is the same day as [currentDate].
                  bool isSelected =
                      EasyDateUtils.isSameDay(_focusDate, currentDate);

                  /// Flag indicating whether the day is disabled or not.
                  bool isDisabledDay = false;

                  /// Checks if the current date [currentDate] is present in the list of inactive dates [widget.inactiveDates].
                  /// If it is found, sets the [isDisabledDay] flag to true, indicating that the day should be disabled.
                  /// Returns void.
                  if (widget.inactiveDates != null) {
                    for (DateTime inactiveDate in widget.inactiveDates!) {
                      if (EasyDateUtils.isSameDay(currentDate, inactiveDate)) {
                        isDisabledDay = true;
                        break;
                      }
                    }
                  }

                  return Padding(
                    key: ValueKey<DateTime>(currentDate),
                    padding: EdgeInsetsDirectional.only(
                      end: _timeLineProps.separatorPadding,
                    ),
                    child: widget.itemBuilder != null
                        ? _dayItemBuilder(
                            context,
                            isSelected,
                            currentDate,
                          )
                        : EasyDayWidget(
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
                itemCount: _daysCount,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds an [InkWell] widget for a day item in the infinite timeline.
  ///
  /// The [context] is the build context.
  /// The [isSelected] indicates whether the day item is selected.
  /// The [date] is the date associated with the day item.
  ///
  /// Returns an [InkWell] widget with the specified properties.
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

  /// Callback function that is called when a day is changed.
  ///
  /// The [isSelected] parameter indicates whether the day is selected or not.
  /// The [currentDate] parameter represents the current selected date.
  void _onDayChanged(bool isSelected, DateTime currentDate) {
    // A date is selected
    widget.onDateChange?.call(currentDate);
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

  /// Initializes the item extend value based on the current orientation and timeline properties.
  /// The item extend value is calculated by adding the day height or day width (depending on the landscape mode)
  /// with the separator padding from the timeline properties.
  void _initItemExtend() {
    _itemExtend = (_isLandscapeMode ? _dayHeight : _dayWidth) +
        _timeLineProps.separatorPadding;
  }
}
