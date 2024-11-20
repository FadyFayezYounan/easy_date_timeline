import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../../easy_infinite_date_time/widgets/web_scroll_behavior.dart';
import '../../utils/locale_from_language_tag.dart';
import '../controllers/infinite_time_line_scroll_mixin.dart';
import '../disable_strategy/strategies.dart';
import '../enums/enums.exports.dart';
import '../options/options.exports.dart';
import '../sealed_classes/sealed_classes.exports.dart';
import '../utils/utils.exports.dart';
import 'day_widget/day_widget.dart';
import '../picker/month_year_picker.dart';
import '../picker/picker_button/picker_button.dart';
import '../picker/picker_button/picker_button_view_only.dart';
part '../controllers/easy_date_picker_controller.dart';

class DayTimeLinePickerWidget extends StatefulWidget {
  /// A widget that displays a horizontal timeline of days, allowing for date selection.
  ///
  /// This widget creates a scrollable timeline of days, with customizable appearance
  /// and behavior for date selection.
  const DayTimeLinePickerWidget({
    super.key,
    required this.controller,
    required this.firstDate,
    required this.lastDate,
    required this.focusedDate,
    required this.currentDate,
    required this.itemExtent,
    required this.separatorPadding,
    required this.itemBuilder,
    required this.headerBuilder,
    required this.onDateChange,
    required this.selectionMode,
    required this.locale,
    required this.physics,
    required this.disableStrategy,
    required this.ignoreUserInteractionOnAnimating,
    required this.timelineOptions,
    required this.dayPartsOrder,
    required this.headerType,
    required this.monthYearPickerOptions,
  });

  ///{@macro controller}
  final EasyDatePickerController? controller;

  /// {@macro first_date}
  final DateTime firstDate;

  /// {@macro last_date}
  final DateTime lastDate;

  /// {@macro current_date}
  final DateTime currentDate;

  /// {@macro focused_date}
  final DateTime focusedDate;

  /// {@macro item_extent}
  final double itemExtent;

  /// {@macro day_separator_padding}
  final double separatorPadding;

  /// {@macro item_builder}
  final ItemBuilderPickerCallBack? itemBuilder;

  /// {@macro header_builder}
  final EasyPickerHeaderBuilderCallBack? headerBuilder;

  /// {@macro on_date_change}
  final OnDateChangeCallBack? onDateChange;

  /// {@macro selection_mode}
  final SelectionMode selectionMode;

  /// {@macro locale}
  final String locale;

  /// {@macro physics}
  final ScrollPhysics? physics;

  /// {@macro disable_strategy}
  final DisableStrategy disableStrategy;

  /// {@macro day_parts_order}
  final List<DayElement> dayPartsOrder;

  /// {@macro ignore_user_interaction_on_animating}
  final bool ignoreUserInteractionOnAnimating;

  /// {@macro timeline_options}
  final TimelineOptions timelineOptions;

  /// {@macro header_type}
  final HeaderType headerType;

  /// {@macro month_year_picker_options}
  final MonthYearPickerOptions monthYearPickerOptions;

  @override
  State<DayTimeLinePickerWidget> createState() =>
      _DayTimeLinePickerWidgetState();
}

class _DayTimeLinePickerWidgetState extends State<DayTimeLinePickerWidget> {
  late double _itemExtent;
  late int _itemCount;
  EasyDatePickerController? _internalController;
  EasyDatePickerController get _controller =>
      widget.controller ?? _internalController!;
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    // Initialize date formatting for the specified locale
    initializeDateFormatting(widget.locale);
    // Calculate the total extent of each item including padding
    _itemExtent = widget.itemExtent + widget.separatorPadding;
    // Calculate the total number of days in the date range
    _itemCount = widget.firstDate.daysBetween(widget.lastDate);
    // _itemCount =
    //     EasyDateUtils.getDaysBetween(widget.firstDate, widget.lastDate);
    // Create an internal controller if not provided
    if (widget.controller == null) {
      _internalController = EasyDatePickerController();
    }
    // Attach the controller to this state
    _controller._attach(this);
    // Jump to the initial date after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) => _jumpToInitialOffset());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Update item extent if dependencies change
    _itemExtent = widget.itemExtent + widget.separatorPadding;
  }

  /// Jumps to the initial focused date
  void _jumpToInitialOffset() {
    if (_controller.hasClients) {
      _controller.jumpToFocusDate();
    }
  }

  @override
  void didUpdateWidget(covariant DayTimeLinePickerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Handle controller changes
    if (widget.controller != oldWidget.controller) {
      oldWidget.controller?._detach(this);
      if (widget.controller != null) {
        _internalController?._detach(this);
        _internalController = null;
        widget.controller?._attach(this);
      } else {
        assert(_internalController == null);
        _internalController = EasyDatePickerController();
        _controller._attach(this);
      }
    }
    // Update item extent if necessary
    if (widget.itemExtent != oldWidget.itemExtent ||
        widget.separatorPadding != oldWidget.separatorPadding) {
      _itemExtent = widget.itemExtent + widget.separatorPadding;
    }
    // Update item count if date range changes
    if (widget.firstDate != oldWidget.firstDate ||
        widget.lastDate != oldWidget.lastDate) {
      _itemCount = widget.firstDate.daysBetween(widget.lastDate);
      // _itemCount =
      //     EasyDateUtils.getDaysBetween(widget.firstDate, widget.lastDate);
    }
  }

  @override
  void dispose() {
    // Detach and dispose of the controller
    _controller._detach(this);
    _internalController?.dispose();
    super.dispose();
  }

  Future<void> _showMonthYearPicker(BuildContext context) async {
    final pickedDate = await showMonthYearPickerFromOptions(
      context: context,
      focusDate: widget.focusedDate,
      currentDate: widget.currentDate,
      firstDate: widget.firstDate,
      lastDate: widget.lastDate,
      locale: localeFromLanguageTag(widget.locale),
      disableStrategy: widget.disableStrategy,
      options: widget.monthYearPickerOptions,
    );
    if (pickedDate != null) {
      _controller.jumpToDate(pickedDate);
      widget.onDateChange?.call(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.headerBuilder != null)
          widget.headerBuilder!(
            context,
            widget.focusedDate,
            () => _showMonthYearPicker(context),
          )
        else
          switch (widget.headerType) {
            HeaderType.viewOnly => PickerButtonViewOnly(
                timelinePadding: widget.timelineOptions.padding,
                date: widget.focusedDate,
                local: widget.locale,
              ),
            HeaderType.picker => PickerButton(
                onPressed: () => _showMonthYearPicker(context),
                timelinePadding: widget.timelineOptions.padding,
                date: widget.focusedDate,
                local: widget.locale,
              ),
            HeaderType.none => const SizedBox.shrink(),
          },
        SizedBox(
          height: widget.timelineOptions.height,
          child: ValueListenableBuilder<bool>(
            valueListenable: _controller._animateToController,
            builder: (context, isAnimating, child) => IgnorePointer(
              ignoring:
                  widget.ignoreUserInteractionOnAnimating ? isAnimating : false,
              child: child,
            ),
            child: CustomScrollView(
              scrollDirection: Axis.horizontal,
              scrollBehavior: EasyCustomScrollBehavior(),
              controller: _controller,
              physics: widget.physics,
              slivers: [
                SliverPadding(
                  padding: widget.timelineOptions.padding,
                  sliver: SliverFixedExtentList.builder(
                    itemExtent: _itemExtent,
                    itemBuilder: (context, index) {
                      final date =
                          DateUtils.addDaysToDate(widget.firstDate, index);

                      final isSelected =
                          DateUtils.isSameDay(widget.focusedDate, date);

                      // flag indicating whether the day is disabled or not.
                      final isDisabledDay =
                          widget.disableStrategy.isDisabled(date);

                      // flag indicating whether the day is current day or not.
                      final isToday =
                          DateUtils.isSameDay(widget.currentDate, date);

                      return Padding(
                        key: ValueKey<DateTime>(date.toDateOnly()),
                        padding: EdgeInsets.symmetric(
                          horizontal: widget.separatorPadding / 2,
                        ),
                        child: widget.itemBuilder != null
                            ? widget.itemBuilder!(
                                context,
                                date,
                                isSelected,
                                isDisabledDay,
                                isToday,
                                () => _onDateChanged(date),
                              )
                            : DayWidget(
                                date: date,
                                isDisabled: isDisabledDay,
                                isSelectedDay: isSelected,
                                isToday: isToday,
                                onChanged: _onDateChanged,
                                dayPartsOrder: widget.dayPartsOrder,
                                locale: widget.locale,
                              ),
                      );
                    },
                    itemCount: _itemCount,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// Handles date selection and triggers appropriate callbacks and animations
  void _onDateChanged(date) {
    widget.onDateChange?.call(date);
    if (!DateUtils.isSameDay(_selectedDate, date)) {
      _selectedDate = date;
      if (widget.selectionMode.isCenterOrFirst) {
        _controller.animateToDate(date);
      }
    }
  }
}
