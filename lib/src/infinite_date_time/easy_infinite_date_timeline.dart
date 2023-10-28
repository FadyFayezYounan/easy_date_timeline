import 'package:easy_date_timeline/src/widgets/easy_date_timeline_widget/selected_date_widget.dart';
import 'package:flutter/material.dart';

import '../../easy_date_timeline.dart';
import '../utils/easy_colors.dart';
import '../utils/typed_ahead.dart';
import 'infinite_time_line_widget.dart';
import 'selected_full_date.dart';

class EasyInfiniteDateTimeLine extends StatefulWidget {
  const EasyInfiniteDateTimeLine({
    super.key,
    this.disabledDates,
    this.timeLineProps = const EasyTimeLineProps(),
    this.dayProps = const EasyDayProps(),
    this.onDateChange,
    this.itemBuilder,
    this.activeColor,
    this.locale = "en_US",
    required this.firstDate,
    required this.focusDate,
    required this.lastDate,
    this.controller,
    this.showTimelineHeader = true,
  });

  /// Represents the initial date for the timeline widget.
  /// This is the date that will be displayed as the first day in the timeline.
  final DateTime firstDate;

  /// Represents the focus date for the timeline widget.
  /// This is the date that will be displayed as the activated day in the timeline.
  final DateTime? focusDate;

  /// Represents the last date for the timeline widget.
  /// This is the date that will be displayed as the last day in the timeline.
  final DateTime lastDate;

  /// Represents a list of inactive dates for the timeline widget.
  /// Note that all the dates defined in the `disabledDates` list will be deactivated.
  final List<DateTime>? disabledDates;

  /// The color for the active day.
  final Color? activeColor;

  /// Contains properties for configuring the appearance and behavior of the timeline widget.
  final EasyTimeLineProps timeLineProps;

  /// Contains properties for configuring the appearance and behavior of the day widgets in the timeline.
  /// This includes properties such as the width and height of each day widget,
  /// the color of the text and background, and the font size.
  final EasyDayProps dayProps;

  /// Called when the selected date in the timeline changes.
  /// This function takes a `DateTime` object as its parameter, which represents the new selected date.
  final OnDateChangeCallBack? onDateChange;

  /// > **NOTE:**
  /// > When utilizing the `itemBuilder`, it is essential to provide the width of each day for the date timeline widget.
  /// >
  ///
  /// For example:
  /// ```dart
  /// dayProps: const EasyDayProps(
  ///  // You must specify the width in this case.
  ///  width: 124.0,
  /// )
  /// ```

  final ItemBuilderCallBack? itemBuilder;

  /// A `String` that represents the locale code to use for formatting the dates in the timeline.
  final String locale;

  /// The controller to manage the EasyInfiniteDateTimeline. Allows programmatic control over the timeline,
  /// such as scrolling to a specific date or scrolling to the focus date.
  final EasyInfiniteDateTimelineController? controller;

  /// Represents whether the timeline header should be displayed or not.
  final bool showTimelineHeader;

  @override
  State<EasyInfiniteDateTimeLine> createState() =>
      _EasyInfiniteDateTimeLineState();
}

class _EasyInfiniteDateTimeLineState extends State<EasyInfiniteDateTimeLine> {
  @override
  Widget build(BuildContext context) {
    /// activeDayColor is initialized to the value of widget.activeColor if it is not null,
    /// or to the primary color of the current theme if widget.activeColor is null.
    /// This provides a fallback color if no active color is explicitly provided.
    final activeDayColor = widget.activeColor ?? Theme.of(context).primaryColor;

    /// brightness is initialized to the brightness of the active color or the fallback color,
    /// using the ThemeData.estimateBrightnessForColor method.
    /// This method returns Brightness.dark if the color is closer to black,
    ///  and Brightness.light if the color is closer to white.
    final brightness = ThemeData.estimateBrightnessForColor(
      widget.activeColor ?? activeDayColor,
    );

    /// activeDayTextColor is initialized to EasyColors.dayAsNumColor if the brightness is Brightness.light,
    ///  indicating that the active color is light, or to Colors.white if the brightness is Brightness.dark,
    /// indicating that the active color is dark.
    final activeDayTextColor = brightness == Brightness.light
        ? EasyColors.dayAsNumColor
        : Colors.white;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.showTimelineHeader)
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: widget.timeLineProps.hPadding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FittedBox(
                  child: SelectedDateWidget(
                    date: widget.focusDate ?? widget.firstDate,
                    locale: widget.locale,
                  ),
                ),
                FittedBox(
                  child: SelectedFullDateWidget(
                    date: widget.focusDate ?? widget.firstDate,
                    locale: widget.locale,
                  ),
                ),
              ],
            ),
          ),
        if (widget.showTimelineHeader)
          const SizedBox(
            height: 12.0,
          ),
        InfiniteTimeLineWidget(
          controller: widget.controller,
          firstDate: widget.firstDate,
          lastDate: widget.lastDate,
          focusedDate: widget.focusDate,
          inactiveDates: widget.disabledDates,
          onDateChange: widget.onDateChange,
          timeLineProps: widget.timeLineProps,
          dayProps: widget.dayProps,
          itemBuilder: widget.itemBuilder,
          activeDayTextColor: activeDayTextColor,
          activeDayColor: activeDayColor,
          locale: widget.locale,
        ),
      ],
    );
  }
}
