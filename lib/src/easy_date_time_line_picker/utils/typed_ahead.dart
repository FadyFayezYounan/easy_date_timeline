import 'package:flutter/material.dart';

import '../../models/models.dart';

/// A function type that takes a `DateTime` object representing the selected date as a parameter and returns no result.
///
/// Used by `EasyDateTimeLine` for detecting changes in the selected date.
typedef OnDateChangeCallBack = void Function(DateTime date);

typedef ItemBuilderPickerCallBack = Widget Function(
  BuildContext context,
  DateTime date,
  bool isSelected,
  bool isDisabled,
  bool isToday,
  VoidCallback onTap,
);

typedef EasyPickerHeaderBuilderCallBack = Widget Function(
  BuildContext context,
  DateTime date,
  VoidCallback onTap,
);

typedef ItemBuilderCallBack = Widget Function(
  BuildContext context,
  DateTime date,
  bool isSelected,
  VoidCallback onTap,
);

/// A function type that takes an `EasyMonth` object representing the selected month as a parameter and returns no result.
///
/// Used by `EasyDateTimeLine` for detecting changes in the selected month.
typedef OnMonthChangeCallBack = void Function(EasyMonth? month);

/// A typedef representing a callback function that builds a header widget.
///
/// The [HeaderBuilderCallBack] takes a [BuildContext] and a [DateTime] as parameters
/// and returns a [Widget]. It is used to build a header widget for a specific date.
typedef HeaderBuilderCallBack = Widget Function(
  BuildContext context,
  DateTime date,
);

typedef MonthYearPickerCancelButtonBuilder = Widget Function(
  BuildContext context,
  void Function() handleCancel,
  String cancelText,
);

/// A typedef for a function that builds a Confirm button for a month-year picker.
///
/// The function takes a [BuildContext] and a callback function [handleOk]
/// which is called when the Confirm button is pressed.
///
/// Returns a [Widget] that represents the Confirm button.
typedef MonthYearPickerConfirmButtonBuilder = Widget Function(
  BuildContext context,
  void Function() handleConfirm,
  String confirmText,
);
