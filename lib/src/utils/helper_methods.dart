import 'package:flutter/material.dart' show ScrollController;

import 'utils.dart';

/// Calculates the horizontal offset between two dates on a timeline.
///
/// This function calculates the horizontal offset between two dates on a timeline,
/// taking into account the width of each day, horizontal padding, and the difference
/// in days between the two dates.
///
/// [firstDate] The first date.
/// [lastDate] The last date.
/// [dayWidth] The width of each day on the timeline.
/// [hPadding] The horizontal padding.
///
/// Returns the horizontal offset between the two dates.
double calculateDateOffsetBetweenDates({
  required DateTime firstDate,
  required DateTime lastDate,
  required double dayWidth,
  required double hPadding,
}) {
  int offset = lastDate.difference(firstDate).inDays;
  double adjustedHPadding = hPadding > EasyConstants.timelinePadding
      ? (hPadding - EasyConstants.timelinePadding)
      : 0.0;
  if (offset == 0) {
    return 0.0;
  }
  return (offset * dayWidth) + adjustedHPadding;
}

/// Calculates the date offset for centering the timeline on a specific date.
/// The date offset is calculated based on the difference between the specified date and the first date in the timeline.
/// The center offset is then adjusted based on the viewport dimension and the horizontal padding of the timeline.
/// The adjusted horizontal padding is calculated by subtracting the timeline padding from the specified horizontal padding.
/// The final center offset is returned.
///
/// This function calculates the horizontal offset needed to center a specific date
/// on a timeline, taking into account the width of each day, horizontal padding,
/// and the difference in days between the first and last dates. It also considers
/// the viewport dimension and the current position of the scroll controller.
///
/// [firstDate] The first date on the timeline.
/// [lastDate] The last date on the timeline.
/// [dayWidth] The width of each day on the timeline.
/// [hPadding] The horizontal padding.
/// [controller] The scroll controller for the timeline.
///
/// Returns the horizontal offset needed to center the date on the timeline.
double calculateDateOffsetForCenter({
  required DateTime firstDate,
  required DateTime lastDate,
  required double dayWidth,
  required double hPadding,
  required ScrollController controller,
}) {
  int daysDifference = lastDate.difference(firstDate).inDays;
  double centerOffset = (daysDifference * dayWidth) -
      (controller.position.viewportDimension / 2) +
      (dayWidth / 2);
  double adjustedHPadding = hPadding > EasyConstants.timelinePadding
      ? hPadding - EasyConstants.timelinePadding
      : 0.0;
  return centerOffset + adjustedHPadding;
}
