import 'package:flutter/material.dart';

import '../models/models.dart';

/// A function type that takes a `DateTime` object representing the selected date as a parameter and returns no result.
///
/// Used by `EasyDateTimeLine` for detecting changes in the selected date.
typedef OnDateChangeCallBack = void Function(DateTime selectedDate);

/// A function type that takes the necessary information for building an item in the date-time line as parameters and returns a `Widget` object.
///
/// Used by `EasyDateTimeLine` for setting the item builder.
typedef ItemBuilderCallBack = Widget Function(
  BuildContext context,
  String dayNumber,
  String dayName,
  String monthName,
  DateTime fullDate,
  bool isSelected,
);

/// A function type that takes an `EasyMonth` object representing the selected month as a parameter and returns no result.
///
/// Used by `EasyDateTimeLine` for detecting changes in the selected month.
typedef OnMonthChangeCallBack = void Function(EasyMonth? month);
