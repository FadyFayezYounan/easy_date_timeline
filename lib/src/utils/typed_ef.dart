import 'package:flutter/material.dart';

import '../models/models.dart';

/// A function that detects when a tap is occurred.
///
/// Used by [EasyDateTimeLine] for tap detection.
typedef OnDateSelectCallback = void Function(DateTime selectedDate);

/// A function that is called when selected date is changed
///
/// Used by [EasyDateTimeLine] for tap detection.
typedef OnDateChangeCallBack = void Function(DateTime selectedDate);

/// A function that is called when the user set item builder
///
/// Used by [EasyDateTimeLine] for tap detection.

typedef ItemBuilderCallBack = Widget Function(
  BuildContext context,
  String dayNumber,
  String dayName,
  String monthName,
  DateTime fullDate,
  bool isSelected,
);

/// A function that is called when selected month is changed
///
/// Used by [EasyDateTimeLine] for tap detection.

typedef OnMonthChangeCallBack = void Function(EasyMonth? month);
