import 'package:flutter/material.dart';

import 'disable_strategy/strategies.dart';
import 'enums/enums.exports.dart';
import 'options/options.exports.dart';
import 'sealed_classes/sealed_classes.exports.dart';
import 'theme/theme.exports.dart';
import 'utils/utils.exports.dart';
import 'widgets/day_time_line_picker_widget.dart';

/// A customizable date and time picker widget for Flutter applications.
///
/// This widget provides a horizontal timeline interface for selecting dates,
/// with various customization options for appearance and behavior.
class EasyDateTimeLinePicker extends StatelessWidget {
  /// Creates an [EasyDateTimeLinePicker] with default day parts.
  ///
  /// Use this constructor when you want to use the default day parts (top, middle, bottom)
  /// or customize the order of these parts.
  ///
  /// [firstDate] is the earliest selectable date.
  /// [lastDate] is the latest selectable date.
  /// [focusedDate] is the initial date to focus on when the picker is first displayed.
  /// [onDateChange] is called when the selected date changes.
  EasyDateTimeLinePicker({
    super.key,
    this.controller,
    required DateTime firstDate,
    required DateTime lastDate,
    required DateTime? focusedDate,
    required this.onDateChange,
    DateTime? currentDate,
    this.headerBuilder,
    this.itemExtent = defaultDayItemExtent,
    this.daySeparatorPadding = defaultDaySeparatorPadding,
    this.selectionMode,
    this.locale,
    this.physics,
    this.disableStrategy = const DisableStrategy.none(),
    List<DayParts> dayPartsOrder = const [
      DayParts.top(),
      DayParts.middle(),
      DayParts.bottom(),
    ],
    this.ignoreUserInteractionOnAnimating,
    this.timelineOptions,
    this.headerType = HeaderType.picker,
  })  : _itemBuilder = null,
        firstDate = firstDate.toDateOnly(),
        lastDate = lastDate.toDateOnly(),
        focusedDate = focusedDate?.toDateOnly(),
        currentDate = DateUtils.dateOnly(currentDate ?? DateTime.now()),
        _dayPartsOrder = dayPartsOrder,
        assert(
          dayPartsOrder.isNotEmpty,
          'dayPartsOrder must not be empty.',
        ),
        assert(
          !lastDate.isBefore(firstDate),
          'lastDate $lastDate must be on or after firstDate $firstDate.',
        );

  /// Creates an [EasyDateTimeLinePicker] with a custom item builder.
  ///
  /// Use this constructor when you want to completely customize the appearance
  /// of each day item in the picker.
  ///
  /// [itemBuilder] is a callback that builds the widget for each day.
  /// [itemExtent] defines the width of each day item.
  EasyDateTimeLinePicker.itemBuilder({
    super.key,
    this.controller,
    required DateTime firstDate,
    required DateTime lastDate,
    required DateTime? focusedDate,
    DateTime? currentDate,
    required this.itemExtent,
    required ItemBuilderPickerCallBack itemBuilder,
    this.headerBuilder,
    this.daySeparatorPadding = defaultDaySeparatorPadding,
    required this.onDateChange,
    this.selectionMode = const SelectionMode.autoCenter(),
    this.locale,
    this.physics,
    this.disableStrategy = const DisableStrategy.none(),
    this.ignoreUserInteractionOnAnimating = true,
    this.timelineOptions = const TimelineOptions(),
    this.headerType = HeaderType.picker,
  })  : _itemBuilder = itemBuilder,
        _dayPartsOrder = const [],
        firstDate = firstDate.toDateOnly(),
        lastDate = lastDate.toDateOnly(),
        focusedDate = focusedDate?.toDateOnly(),
        currentDate = DateUtils.dateOnly(currentDate ?? DateTime.now()),
        assert(
          !lastDate.isBefore(firstDate),
          'lastDate $lastDate must be on or after firstDate $firstDate.',
        );

  /// {@template controller}
  /// Controller for the date picker. Can be used to programmatically control the picker.
  /// ```dart
  /// final EasyDatePickerController controller = EasyDatePickerController();
  /// EasyDateTimeLinePicker(
  ///   controller: controller,
  ///   ...
  /// ),
  /// // then use it in your code
  /// controller.animateToDate(DateTime.now());
  /// // don`t forget to dispose of the controller when you are done with it.
  /// controller.dispose();
  /// ```
  /// {@endtemplate}
  final EasyDatePickerController? controller;

  /// {@template first_date}
  /// The earliest date the user is permitted to pick.
  /// ```dart
  /// EasyDateTimeLinePicker(
  ///   firstDate: DateTime(2020, 1, 1),
  ///   lastDate: DateTime(2020, 12, 31),
  ///   focusedDate: _focusedDate,
  ///   onDateChange: _onDateChange,
  /// )
  /// ```
  /// {@endtemplate}
  final DateTime firstDate;

  /// {@template last_date}
  /// The latest date the user is permitted to pick.
  /// ```dart
  /// EasyDateTimeLinePicker(
  ///   firstDate: DateTime(2020, 1, 1),
  ///   lastDate: DateTime(2020, 12, 31),
  ///   focusedDate: _focusedDate,
  ///   onDateChange: _onDateChange,
  /// )
  /// ```
  /// {@endtemplate}
  final DateTime lastDate;

  /// {@template focused_date}
  /// The date to focus on when the picker is first displayed.
  /// ```dart
  /// EasyDateTimeLinePicker(
  ///   firstDate: DateTime(2020, 1, 1),
  ///   lastDate: DateTime(2020, 12, 31),
  ///   focusedDate: _focusedDate,
  ///   onDateChange: _onDateChange,
  /// )
  /// ```
  /// {@endtemplate}
  final DateTime? focusedDate;

  /// {@template current_date}
  /// The current date. Defaults to today's date if not provided.
  /// ```dart
  /// EasyDateTimeLinePicker(
  ///   firstDate: DateTime(2020, 1, 1),
  ///   lastDate: DateTime(2020, 12, 31),
  ///   focusedDate: _focusedDate,
  ///   onDateChange: _onDateChange,
  /// )
  /// ```
  /// {@endtemplate}
  final DateTime currentDate;

  /// {@template item_extent}
  /// The width of each day item in the picker.
  /// {@endtemplate}
  final double itemExtent;

  /// {@template day_separator_padding}
  /// The padding between day separators.
  /// {@endtemplate}
  final double daySeparatorPadding;

  /// {@template item_builder}
  /// Custom builder for day items. Only used when created with [EasyDateTimeLinePicker.itemBuilder].
  /// ```dart
  /// EasyDateTimeLinePicker.itemBuilder(
  ///   itemExtent: 64.0,
  ///   itemBuilder: (context, date, isSelected, onTap) {
  ///     return InkResponse(
  ///       onTap: onTap,
  ///       child: Center(
  ///         child: Text(date.day.toString()),
  ///       ),
  ///     );
  ///   },
  /// )
  /// ```
  /// {@endtemplate}

  final ItemBuilderPickerCallBack? _itemBuilder;

  /// {@template header_builder}
  /// Custom builder for the header of the picker.
  /// ```dart
  /// EasyDateTimeLinePicker(
  ///  ...
  /// headerBuilder: (context, date, onTap) {
  ///  return InkWell(
  ///   onTap: onTap,
  ///  child: Text(
  ///   DateFormat.yMMMM().format(date),
  /// ),
  /// );
  /// ```
  /// {@endtemplate}
  final EasyPickerHeaderBuilderCallBack? headerBuilder;

  /// {@template on_date_change}
  /// Callback that is called when the selected date changes.
  /// ```dart
  /// EasyDateTimeLinePicker(
  ///   ...
  ///   onDateChange: (date) {
  ///     setState(() {
  ///       _selectedDate = date;
  ///     });
  ///   },
  /// )
  /// ```
  /// {@endtemplate}
  final OnDateChangeCallBack? onDateChange;

  /// {@template selection_mode}
  /// Determines how the selected date is positioned in the picker.
  ///
  /// The [selectionMode] specifies how the timeline should behave when the selected date changes.
  /// It can be set to one of the following values:
  /// - [SelectionMode.none()]: The timeline does not animate the selection.
  /// - [SelectionMode.autoCenter()]: The timeline automatically centers the selected date.
  /// - [SelectionMode.alwaysFirst()]: The timeline always positions the selected date at the first visible day of the timeline.
  ///
  /// By default, the selection mode is set to [SelectionMode.autoCenter()].
  /// ```dart
  /// EasyDateTimeLinePicker(
  ///   ...
  ///   selectionMode: SelectionMode.alwaysFirst(),
  /// )
  /// ```
  /// {@endtemplate}
  final SelectionMode? selectionMode;

  /// {@template locale}
  /// The locale to use for formatting dates default locale is `en_US`.
  /// ```dart
  /// EasyDateTimeLinePicker(
  ///   ...
  ///   locale: Locale('ar_EG'),
  /// )
  /// ```
  /// {@endtemplate}
  final Locale? locale;

  /// {@template physics}
  /// The scroll physics to use for the picker.
  /// ```dart
  /// EasyDateTimeLinePicker(
  ///   ...
  ///   physics: BouncingScrollPhysics(),
  /// )
  /// ```
  /// {@endtemplate}
  final ScrollPhysics? physics;

  /// {@template disable_strategy}
  /// Strategy for disabling certain dates in the picker.
  /// for example: to disable dates before today.
  /// ```dart
  /// EasyDateTimeLinePicker(
  ///   ...
  ///   disableStrategy: DisableStrategy.before(DateTime.now()), // or DisableStrategy.beforeToday()
  /// )
  /// ```
  /// all available options:
  /// 1. [DisableStrategy.after(dateTime)]: disable dates after the specified date.
  /// 2. [DisableStrategy.afterToday()]: disable dates after today.
  /// 3. [DisableStrategy.before(dateTime)]: disable dates before the specified date.
  /// 4. [DisableStrategy.beforeToday()]: disable dates before today.
  /// 5. [DisableStrategy.all()]: disable all dates.
  /// 6. [DisableStrategy.none()]: disable no dates.
  /// 7. [DisableStrategy.list(List<DateTime>)]: disable specific dates.
  /// 8. [DisableStrategy.inRange(dateTimeRange)]: disable dates between two dates.
  /// 9. [DisableStrategy.ranges(ranges)]: disable dates in a list of ranges.
  /// 10.[DisableStrategy.compose([DisableStrategy, DisableStrategy])]: disable dates using multiple strategies.
  /// {@endtemplate}
  final DisableStrategy disableStrategy;

  /// {@template day_parts_order}
  /// The order of day parts to display. Only used when created with the default constructor.
  /// ```dart
  /// EasyDateTimeLinePicker(
  ///   ...
  ///   dayPartsOrder: const [DayParts.top(), DayParts.middle()],
  /// )
  /// ```
  /// in the example above, the top part will be displayed first and the middle part second.
  /// The default order is [DayParts.top(), DayParts.middle(), DayParts.bottom()].
  /// {@endtemplate}
  final List<DayParts> _dayPartsOrder;

  /// {@template ignore_user_interaction_on_animating}
  /// Whether to ignore user interaction while the picker is animating default is true.
  /// ```dart
  /// EasyDateTimeLinePicker(
  ///   ...
  ///   ignoreUserInteractionOnAnimating: true, // default is true
  /// )
  ///   ```
  /// {@endtemplate}
  final bool? ignoreUserInteractionOnAnimating;

  /// {@template timeline_options}
  /// Additional options for customizing the timeline appearance.
  /// ```dart
  /// EasyDateTimeLinePicker(
  ///   ...
  ///   timelineOptions: TimelineOptions(
  ///     height: 200.0,
  ///     padding: EdgeInsets.all(16.0),
  ///   ),
  /// )
  /// ```
  /// {@endtemplate}
  final TimelineOptions? timelineOptions;

  /// {@template header_type}
  /// An enumeration representing the different types of header behaviors
  /// that can be applied in the date timeline picker.
  ///
  /// This enum is used to define how the header of the date timeline picker
  /// should behave or be displayed. Each value in this enum corresponds to
  /// a specific behavior or display type for the header.
  /// ```dart
  /// EasyDateTimeLinePicker(
  ///   ...
  ///   headerType: HeaderType.picker,
  /// )
  ///   ```
  /// The available header types are:
  ///
  /// - `viewOnly`: A header that is used for display purposes only.
  /// - `picker`: A header that allows the user to pick a date.
  /// - `none`: No header is displayed.
  /// {@endtemplate}
  final HeaderType headerType;

  @override
  Widget build(BuildContext context) {
    final easyTheme = EasyTheme.of(context);
    final effectiveSelectionMode = selectionMode ?? easyTheme.selectionMode!;
    final effectiveIgnoreUserInteractionOnAnimating =
        ignoreUserInteractionOnAnimating ??
            easyTheme.ignoreUserInteractionOnAnimating!;
    final effectiveTimelineOptions =
        timelineOptions ?? easyTheme.timelineOptions!;
    final effectiveLocale = (locale ?? easyTheme.locale!).toLanguageTag();

    return DayTimeLinePickerWidget(
      controller: controller,
      firstDate: firstDate,
      lastDate: lastDate,
      focusedDate: focusedDate ?? firstDate,
      currentDate: currentDate,
      separatorPadding: daySeparatorPadding,
      onDateChange: onDateChange,
      itemBuilder: _itemBuilder,
      headerBuilder: headerBuilder,
      selectionMode: effectiveSelectionMode,
      locale: effectiveLocale,
      itemExtent: itemExtent,
      physics: physics,
      disableStrategy: disableStrategy,
      dayPartsOrder: _dayPartsOrder,
      ignoreUserInteractionOnAnimating:
          effectiveIgnoreUserInteractionOnAnimating,
      timelineOptions: effectiveTimelineOptions,
      headerType: headerType,
    );
  }
}
