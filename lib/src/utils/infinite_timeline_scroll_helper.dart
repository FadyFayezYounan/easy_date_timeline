final class InfiniteTimelineScrollHelper {
  /// A utility class that provides methods to calculate the scroll position
  /// for the [EasyInfiniteDateTimeLine] widget.
  ///
  /// The [InfiniteTimelineScrollHelper] class provides methods to calculate
  /// the scroll position for the [EasyInfiniteDateTimeLine] widget based on the
  /// first and last dates, the day width, the maximum scroll extent, and the
  /// screen width.
  InfiniteTimelineScrollHelper({
    required this.firstDate,
    required this.lastDate,
    required this.dayWidth,
    required this.maxScrollExtent,
    required this.screenWidth,
  });

  /// The first date of the timeline.
  final DateTime firstDate;

  /// The last date of the timeline.
  final DateTime lastDate;

  /// The width of a day widget.
  final double dayWidth;

  /// The maximum scroll extent of the timeline.
  final double maxScrollExtent;

  /// The width of the screen.
  final double screenWidth;

  /// Calculates the scroll position to place the selected date at the leftmost
  /// position of the timeline.
  ///
  /// The calculation is based on the first and last dates, the day width,
  /// the maximum scroll extent, and the screen width.
  ///
  /// Returns the scroll position to place the selected date at the leftmost
  /// position. If the calculated scroll position is greater than the maximum
  /// scroll extent, the maximum scroll extent is returned instead.
  double getScrollPositionForFirstDate() {
    // Calculate the number of days between the first and last dates
    final dayIndex = lastDate.difference(firstDate).inDays;

    // Calculate the target scroll position to place the first date at the
    // leftmost position
    final targetScrollPosition = dayIndex * dayWidth;

    // Check if the target scroll position is within the valid range
    final canApplyAutoFirst = targetScrollPosition <= maxScrollExtent;

    // Calculate and return the horizontal offset to place the first date at
    // the leftmost position. If the target scroll position is out of range,
    // return the maximum scroll extent.
    return canApplyAutoFirst ? targetScrollPosition : maxScrollExtent;
  }

  /// Calculates the scroll position to center the date.
  ///
  /// The calculation is based on the first and last dates, the day width,
  /// the maximum scroll extent, and the screen width.
  ///
  /// Returns the scroll position to center the date.
  double getScrollPositionForCenterDate() {
    // Calculate the number of days between the first and last dates
    final dayIndex = lastDate.difference(firstDate).inDays;

    // Calculate the half of the screen width
    final halfScreenWidth = screenWidth / 2;

    // Calculate the half of the width of a day widget
    final halfItemWidth = dayWidth / 2;

    // Calculate the total width of all day widgets
    final totalDaysWidth = dayIndex * dayWidth;

    // Calculate the target scroll position to center the date
    final targetScrollPosition =
        totalDaysWidth - halfScreenWidth + halfItemWidth;

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
}
