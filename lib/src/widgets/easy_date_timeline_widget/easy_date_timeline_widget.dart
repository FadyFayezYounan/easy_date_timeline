import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../../models/models.dart';
import '../../properties/properties.dart';
import '../../utils/utils.dart';
import '../easy_month_picker/easy_month_picker.dart';
import '../timeline_widget.dart';
import 'selected_text_widget.dart';

class EasyDateTimeLine extends StatefulWidget {
  const EasyDateTimeLine({
    super.key,
    required this.initialDate,
    this.locale = "en_US",
    this.headerProps,
    this.timeLineProps,
    this.dayProps,
    this.onDateChange,
    this.itemBuilder,
    this.primaryColor,
  });

  ///Represents the initial date for the timeline widget.
  ///This is the date that will be displayed as the first day in the timeline.
  final DateTime initialDate;

  /// The color for the active day
  final Color? primaryColor;

  ///Contains properties for configuring the appearance and behavior of the timeline header.
  final EasyHeaderProps? headerProps;

  ///Contains properties for configuring the appearance and behavior of the timeline widget.
  final TimeLineProps? timeLineProps;

  ///contains properties for configuring the appearance and behavior of the day widgets in the timeline.
  ///This includes properties such as the width and height of each day widget,
  ///the color of the text and background, and the font size.
  final EasyDayProps? dayProps;

  ///Called when the selected date in the timeline changes. This function takes a DateTime object as its parameter,
  ///which represents the new selected date.
  final OnDateChangeCallBack? onDateChange;

  ///Called for each day in the timeline, allowing to customize the appearance and behavior of each day widget.
  final ItemBuilderCallBack? itemBuilder;

  ///A String that represents the locale code to use for formatting the dates in the timeline.
  final String locale;

  @override
  State<EasyDateTimeLine> createState() => _EasyDateTimeLineState();
}

class _EasyDateTimeLineState extends State<EasyDateTimeLine> {
  late EasyMonth _easyMonth;

  late ValueNotifier<DateTime?> _focusedDateListener;

  DateTime get initialDate => widget.initialDate;
  @override
  void initState() {
    // Init easy date timeline locale
    initializeDateFormatting(widget.locale, null);
    super.initState();
    _easyMonth =
        EasyDateUtils.convertDateToEasyMonth(widget.initialDate, widget.locale);
    _focusedDateListener = ValueNotifier(initialDate);
  }

  void _onFocusedDateChanged(DateTime date) {
    _focusedDateListener.value = date;
    widget.onDateChange?.call(date);
  }

  @override
  void dispose() {
    _focusedDateListener.dispose();
    super.dispose();
  }

  EasyHeaderProps? get _headerProps => widget.headerProps;

  @override
  Widget build(BuildContext context) {
    final activeDayColor =
        widget.primaryColor ?? Theme.of(context).primaryColor;
    final brightness = ThemeData.estimateBrightnessForColor(
        widget.primaryColor ?? activeDayColor);
    final activeDayTextColor = brightness == Brightness.light
        ? EasyColors.dayAsNumColor
        : Colors.white;
    return ValueListenableBuilder(
      valueListenable: _focusedDateListener,
      builder: (context, focusedDate, child) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_headerProps != null ? _headerProps!.showHeader == true : true)
            Padding(
              padding: const EdgeInsets.only(
                left: EasyConstants.timelinePadding * 2,
                right: EasyConstants.timelinePadding,
                bottom: EasyConstants.timelinePadding,
              ),
              child: Row(
                mainAxisAlignment: _headerProps?.centerHeader == true
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.spaceBetween,
                children: [
                  SelectedTextWidget(
                    date: focusedDate ?? initialDate,
                    locale: widget.locale,
                    headerProps: _headerProps,
                  ),
                  if (_showMonthPicker(
                      pickerType: MonthPickerType.dropDown,
                      isDefaultPicker: true))
                    child!,
                  if (_showMonthPicker(pickerType: MonthPickerType.switcher))
                    EasyMonthSwitcher(
                      locale: 'en',
                      value: _easyMonth,
                      onMonthChange: (month) {
                        setState(() {
                          _easyMonth = month!;
                        });
                      },
                    ),
                ],
              ),
            ),
          TimeLineWidget(
            initialDate: initialDate.copyWith(
              month: _easyMonth.vale,
            ),
            focusedDate: focusedDate,
            onDateChange: _onFocusedDateChanged,
            timeLineProps: widget.timeLineProps,
            easyDayProps: widget.dayProps,
            itemBuilder: widget.itemBuilder,
            activeDayTextColor: activeDayTextColor,
            activeDayColor: activeDayColor,
          ),
        ],
      ),
      child: EasyMonthDropDown(
        value: _easyMonth,
        locale: 'en',
        onMonthChange: (month) {
          setState(() {
            _easyMonth = month!;
          });
        },
      ),
    );
  }

  bool _showMonthPicker(
      {required MonthPickerType pickerType, bool isDefaultPicker = false}) {
    return _headerProps?.monthPickerType == pickerType ||
        (_headerProps == null && isDefaultPicker) &&
            (_headerProps != null
                ? _headerProps!.showMonthPicker == true
                : true);
  }
}
