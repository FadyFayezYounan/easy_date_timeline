import 'package:flutter/material.dart' show ScrollController;

/// Calculates the horizontal offset between two dates on a timeline.
///
/// Parameters:
/// - [firstDate]: The start date.
/// - [lastDate]: The end date.
/// - [dayWidth]: The width of each day on the timeline.
/// - [controller]: The scroll controller of the timeline.
///
/// Returns: The horizontal offset between the two dates, or the maximum scroll extent if it exceeds it.
double calculateDateOffsetBetweenDates({
  required DateTime firstDate, // The start date.
  required DateTime lastDate, // The end date.
  required double dayWidth, // The width of each day on the timeline.
  required ScrollController
      controller, // The scroll controller of the timeline.
}) {
  // Calculate the number of days between the first and last dates
  final dayIndex = lastDate.difference(firstDate).inDays;

  // Get the maximum scroll extent of the scroll controller
  final maxScrollExtent = controller.position.maxScrollExtent;

  // Calculate the total width of all day widgets
  final targetScrollPosition = dayIndex * dayWidth;

  // Check if the target scroll position is within the maximum scroll extent
  final canApplyAutoFirst = targetScrollPosition <= maxScrollExtent;

  // Return the target scroll position if it is within the maximum scroll extent, otherwise return the maximum scroll extent
  return canApplyAutoFirst ? targetScrollPosition : maxScrollExtent;
}

/// Calculates the horizontal offset to center a date on a timeline.
///
/// This function calculates the horizontal offset needed to center a date on a timeline.
/// It takes into account the width of each day, horizontal padding, the number of days
/// between the first and last dates, and the size of the screen.
///
/// Parameters:
/// - [firstDate]: The first date.
/// - [lastDate]: The last date.
/// - [dayWidth]: The width of each day on the timeline.
/// - [controller]: The scroll controller of the timeline.
///
/// Returns:
/// The horizontal offset needed to center the date on the timeline.
double calculateDateOffsetForCenter({
  required DateTime firstDate,
  required DateTime lastDate,
  required double dayWidth,
  required ScrollController controller,
}) {
  // Calculate the number of days between the first and last dates
  final dayIndex = lastDate.difference(firstDate).inDays;

  // Get the width of the screen
  final screenWidth = controller.position.viewportDimension;

  // Get the maximum scroll extent of the scroll controller
  final maxScrollExtent = controller.position.maxScrollExtent;

  // Calculate the half of the screen width
  final halfScreenWidth = screenWidth / 2;

  // Calculate the half of the width of a day widget
  final halfItemWidth = dayWidth / 2;

  // Calculate the total width of all day widgets
  final totalDaysWidth = dayIndex * dayWidth;

  // Calculate the target scroll position to center the date
  final targetScrollPosition = totalDaysWidth - halfScreenWidth + halfItemWidth;

  // Check if the target scroll position is within the valid range
  final canApplyAutoCenter =
      targetScrollPosition >= 0 && targetScrollPosition <= maxScrollExtent;

  // Calculate and return the horizontal offset to center the date
  if (canApplyAutoCenter) {
    return targetScrollPosition;
  } else {
    // If the target scroll position is out of range, return the maximum or minimum scroll extent
    return targetScrollPosition <= 0.0 ? 0.0 : maxScrollExtent;
  }
}
