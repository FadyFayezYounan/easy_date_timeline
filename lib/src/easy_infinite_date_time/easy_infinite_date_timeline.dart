import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../easy_date_time_line_picker/sealed_classes/sealed_classes.exports.dart';
import '../easy_date_time_line_picker/utils/typed_ahead.dart';
import '../properties/properties.dart';
import '../utils/utils.dart';
import 'widgets/easy_infinite_header.dart';
import 'widgets/infinite_time_line_widget.dart';

class EasyInfiniteDateTimeLine extends StatefulWidget {
  /// A widget that displays an infinite date timeline.
  ///
  /// The timeline widget allows users to scroll through a range of dates and select a specific date.
  /// It provides a visual representation of the dates, with each day displayed as a separate widget.
  /// The timeline can be customized with various properties to control its appearance and behavior.
  ///
  /// The [EasyInfiniteDateTimeLine] widget requires the following parameters:
  /// - [firstDate]: Represents the initial date for the timeline widget.
  /// - [focusDate]: Represents the focus date for the timeline widget.
  /// - [lastDate]: Represents the last date for the timeline widget.
  ///
  /// Optional parameters include:
  /// - [disabledDates]: Represents a list of inactive dates for the timeline widget.
  /// - [activeColor]: The color for the active day.
  /// - [timeLineProps]: Contains properties for configuring the appearance and behavior of the timeline widget.
  /// - [dayProps]: Contains properties for configuring the appearance and behavior of the day widgets in the timeline.
  /// - [onDateChange]: Called when the selected date in the timeline changes.
  /// - [itemBuilder]: A callback function that builds the custom day widgets for the timeline.
  /// - [locale]: A `String` that represents the locale code to use for formatting the dates in the timeline.
  /// - [controller]: The controller to manage the EasyInfiniteDateTimeline.
  /// - [showTimelineHeader]: Represents whether the timeline header should be displayed or not.
  /// - [headerBuilder]: The callback function used to build the header of the infinite date timeline.
  /// - [autoCenter]: Automatically centers the selected day in the timeline.
  ///
  /// Example usage:
  /// ```dart
  /// EasyInfiniteDateTimeLine(
  ///   firstDate: DateTime(2022, 1, 1),
  ///   focusDate: DateTime(2022, 1, 15),
  ///   lastDate: DateTime(2022, 12, 31),
  ///   disabledDates: [DateTime(2022, 1, 10), DateTime(2022, 1, 20)],
  ///   activeColor: Colors.blue,
  ///   timeLineProps: EasyTimeLineProps(),
  ///   dayProps: EasyDayProps(),
  ///   onDateChange: (DateTime selectedDate) {
  ///     // Handle selected date change
  ///   },
  ///   locale: "en_US",
  ///   controller: EasyInfiniteDateTimelineController(),
  ///   showTimelineHeader: true,
  /// )
  /// ```
  const EasyInfiniteDateTimeLine({
    super.key,
    this.disabledDates,
    this.timeLineProps = const EasyTimeLineProps(),
    this.dayProps = const EasyDayProps(),
    this.onDateChange,
    this.itemBuilder,
    this.activeColor,
    this.locale = "en_US",
    this.controller,
    this.showTimelineHeader = true,
    this.headerBuilder,
    this.selectionMode = const SelectionMode.autoCenter(),
    this.physics,
    required this.firstDate,
    required this.focusDate,
    required this.lastDate,
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

  /// The callback function used to build the header of the infinite date timeline.
  ///
  /// The [headerBuilder] function takes in a [BuildContext] and returns a widget
  /// that represents the header of the timeline. It can be used to customize the
  /// appearance and behavior of the header.
  ///
  /// If no [headerBuilder] is provided, a default header will be used.
  final HeaderBuilderCallBack? headerBuilder;

  /// Determines the selection mode of the infinite date timeline.
  ///
  /// The [selectionMode] specifies how the timeline should behave when the selected date changes.
  /// It can be set to one of the following values:
  /// - [SelectionMode.none]: The timeline does not animate the selection.
  /// - [SelectionMode.autoCenter]: The timeline automatically centers the selected date.
  /// - [SelectionMode.alwaysFirst]: The timeline always positions the selected date at the first visible day of the timeline.
  ///
  /// By default, the selection mode is set to [SelectionMode.autoCenter].
  ///
  /// This property is used to customize the behavior of the timeline when the selected date changes.
  /// For example, if you set it to `SelectionMode.alwaysFirst()`, the timeline will always position the selected date at the first visible day of the timeline.
  final SelectionMode selectionMode;

  final ScrollPhysics? physics;

  @override
  State<EasyInfiniteDateTimeLine> createState() =>
      _EasyInfiniteDateTimeLineState();
}

class _EasyInfiniteDateTimeLineState extends State<EasyInfiniteDateTimeLine> {
  @override
  void initState() {
    initializeDateFormatting(widget.locale, null);
    super.initState();
  }

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
          EasyInfiniteHeaderWidget(
            focusDate: widget.focusDate,
            firstDate: widget.firstDate,
            locale: widget.locale,
            hPadding: widget.timeLineProps.hPadding,
            headerBuilder: widget.headerBuilder,
          ),
        if (widget.showTimelineHeader && widget.headerBuilder == null)
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
          selectionMode: widget.selectionMode,
          physics: widget.physics,
        )
      ],
    );
  }
}
