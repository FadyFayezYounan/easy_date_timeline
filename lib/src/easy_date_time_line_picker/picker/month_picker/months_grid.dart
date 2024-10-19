import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'month_widget.dart';

const int _monthsCount = 12;
const int _monthPickerColumnCount = 3;
const double _monthPickerPadding = 16.0;
const double _monthPickerRowSpacing = 8.0;

/// A widget that displays a grid of months for selection.
///
/// The [MonthsGrid] widget is used to display a grid of months within a given
/// date range. It allows users to select a month, and it handles various states
/// such as the current month, selected month, and disabled months.
///
/// The widget requires several parameters:
///
/// * [currentPageIndex]: The index of the current page in the date picker.
/// * [firstDate]: The earliest date that can be selected.
/// * [lastDate]: The latest date that can be selected.
/// * [focusedDate]: The currently focused date.
/// * [currentDate]: The current date.
/// * [onChanged]: A callback that is called when a month is selected.
/// * [locale]: The locale to use for formatting dates.
/// * [disableStrategy]: A strategy for determining whether a date should be disabled.
///
/// The widget uses a [GridView.builder] to create the grid of months. Each month
/// is represented by a [MonthWidget], which handles the display and interaction
/// for a single month.
///
/// The [_handleMonthTap] method is used to handle taps on a month. It ensures
/// that the selected date is within the valid range and calls the [onChanged]
/// callback with the selected date.

class MonthsGrid extends StatelessWidget {
  MonthsGrid({
    super.key,
    required this.currentPageIndex,
    required this.firstDate,
    required this.lastDate,
    required this.focusedDate,
    required this.currentDate,
    required this.onChanged,
    required this.locale,
    required this.disableStrategy,
  }) : assert(!firstDate.isAfter(lastDate));

  /// The index of the current page in the date picker.
  final int currentPageIndex;

  /// The earliest date that can be selected.
  final DateTime firstDate;

  /// The latest date that can be selected.
  final DateTime lastDate;

  /// The currently focused date.
  final DateTime? focusedDate;

  /// A callback that is called when a month is selected.
  final DateTime currentDate;

  /// The locale to use for formatting dates.
  final ValueChanged<DateTime> onChanged;

  /// The locale to use for formatting dates.
  final String? locale;

  /// A strategy for determining whether a date should be disabled.
  final DisableStrategy disableStrategy;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(), // Disable scrolling
      gridDelegate: _monthPickerGridDelegate,
      itemBuilder: (context, index) {
        final year = firstDate.year + currentPageIndex;
        final date = DateTime(year, index + 1);
        final bool isSelected =
            date.month == focusedDate?.month && date.year == focusedDate?.year;
        final bool isCurrentMonth =
            date.year == currentDate.year && date.month == currentDate.month;
        final bool isMonthBeforeFirstDate =
            DateTime(date.year, date.month + 1, 1).isBefore(firstDate);
        final bool isMonthAfterLastDate =
            DateTime(date.year, date.month, 1).isAfter(lastDate);
        final bool isDisabled = disableStrategy.isDisabled(date) ||
            isMonthBeforeFirstDate ||
            isMonthAfterLastDate;
        return MonthWidget(
          date: date,
          isDisabled: isDisabled,
          isSelected: isSelected,
          isCurrentMonth: isCurrentMonth,
          onMonthSelected: _handleMonthTap,
          locale: locale,
        );
      },
      itemCount: _monthsCount,
      padding: const EdgeInsets.symmetric(horizontal: _monthPickerPadding),
    );
  }

  void _handleMonthTap(DateTime date) {
    DateTime selectedDate;

    if (date.year == firstDate.year && date.month == firstDate.month) {
      // If it's the first month, use firstDate's day
      selectedDate = DateTime(date.year, date.month, firstDate.day);
    } else if (date.year == lastDate.year && date.month == lastDate.month) {
      // If it's the last month, use lastDate's day
      selectedDate = DateTime(date.year, date.month, lastDate.day);
    } else {
      // For any other month, use the first day of the month
      selectedDate = DateTime(date.year, date.month, 1);
    }

    // Ensure the selected date is within the valid range
    if (selectedDate.isBefore(firstDate)) {
      selectedDate = firstDate;
    } else if (selectedDate.isAfter(lastDate)) {
      selectedDate = lastDate;
    }
    onChanged(selectedDate);
  }
}

/// A custom [SliverGridDelegate] that defines the layout for a month picker grid.
///
/// This delegate arranges the grid tiles with a fixed number of columns and
/// calculates the tile width and height based on the available constraints.
///
/// The layout is defined by:
/// - A fixed number of columns specified by `_monthPickerColumnCount`.
/// - A fixed row spacing specified by `_monthPickerRowSpacing`.
/// - Tile width calculated based on the cross axis extent and row spacing.
/// - Tile height calculated as one-fourth of the viewport main axis extent.
class _MonthPickerGridDelegate extends SliverGridDelegate {
  const _MonthPickerGridDelegate();

  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    final double tileWidth = (constraints.crossAxisExtent -
            (_monthPickerColumnCount - 1) * _monthPickerRowSpacing) /
        _monthPickerColumnCount;
    final double tileHeight = constraints.viewportMainAxisExtent / 4;
    return SliverGridRegularTileLayout(
      childCrossAxisExtent: tileWidth,
      childMainAxisExtent: tileHeight,
      crossAxisCount: _monthPickerColumnCount,
      crossAxisStride: tileWidth + _monthPickerRowSpacing,
      mainAxisStride: tileHeight,
      reverseCrossAxis: axisDirectionIsReversed(constraints.crossAxisDirection),
    );
  }

  @override
  bool shouldRelayout(_MonthPickerGridDelegate oldDelegate) => false;
}

const _MonthPickerGridDelegate _monthPickerGridDelegate =
    _MonthPickerGridDelegate();

// import 'package:easy_date_timeline/easy_date_timeline.dart';
// import 'package:flutter/gestures.dart' show DragStartBehavior;
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

// import 'month_widget.dart';

// const int _monthsCount = 12;
// const int _monthPickerColumnCount = 3;
// const double _monthPickerPadding = 16.0;
// const double _monthPickerRowSpacing = 8.0;

// class MonthsGrid extends StatelessWidget {
//   MonthsGrid({
//     super.key,
//     required this.currentPageIndex,
//     required this.firstDate,
//     required this.lastDate,
//     required this.focusedDate,
//     required this.currentDate,
//     required this.onChanged,
//     required this.dragStartBehavior,
//     required this.locale,
//     required this.disableStrategy,
//   }) : assert(!firstDate.isAfter(lastDate));
//   final int currentPageIndex;
//   final DateTime firstDate;
//   final DateTime lastDate;
//   final DateTime? focusedDate;
//   final DateTime currentDate;
//   final ValueChanged<DateTime> onChanged;
//   final DragStartBehavior dragStartBehavior;
//   final String? locale;
//   final DisableStrategy disableStrategy;

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       dragStartBehavior: dragStartBehavior,
//       physics: const NeverScrollableScrollPhysics(), // Disable scrolling
//       gridDelegate: _monthPickerGridDelegate,
//       itemBuilder: (context, index) {
//         final year = firstDate.year + currentPageIndex;
//         final date = DateTime(year, index + 1);
//         final bool isSelected =
//             date.month == focusedDate?.month && date.year == focusedDate?.year;
//         final bool isCurrentMonth =
//             date.year == currentDate.year && date.month == currentDate.month;
//         final bool isDisabled = disableStrategy.isDisabled(date) ||
//             date.isBefore(firstDate) ||
//             date.isAfter(lastDate);
//         return MonthWidget(
//           date: date,
//           isDisabled: isDisabled,
//           isSelected: isSelected,
//           isCurrentMonth: isCurrentMonth,
//           onMonthSelected: onChanged,
//           locale: locale,
//         );
//       },
//       itemCount: _monthsCount,
//       padding: const EdgeInsets.symmetric(horizontal: _monthPickerPadding),
//     );
//   }
// }

// class _MonthPickerGridDelegate extends SliverGridDelegate {
//   const _MonthPickerGridDelegate();

//   @override
//   SliverGridLayout getLayout(SliverConstraints constraints) {
//     final double tileWidth = (constraints.crossAxisExtent -
//             (_monthPickerColumnCount - 1) * _monthPickerRowSpacing) /
//         _monthPickerColumnCount;
//     final double tileHeight = constraints.viewportMainAxisExtent / 4;
//     return SliverGridRegularTileLayout(
//       childCrossAxisExtent: tileWidth,
//       childMainAxisExtent: tileHeight,
//       crossAxisCount: _monthPickerColumnCount,
//       crossAxisStride: tileWidth + _monthPickerRowSpacing,
//       mainAxisStride: tileHeight,
//       reverseCrossAxis: axisDirectionIsReversed(constraints.crossAxisDirection),
//     );
//   }

//   @override
//   bool shouldRelayout(_MonthPickerGridDelegate oldDelegate) => false;
// }

// const _MonthPickerGridDelegate _monthPickerGridDelegate =
//     _MonthPickerGridDelegate();

// import 'package:easy_date_timeline/easy_date_timeline.dart';
// import 'package:flutter/gestures.dart' show DragStartBehavior;
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

// import 'month_widget.dart';

// const int _monthsCount = 12;
// const int _monthPickerColumnCount = 3;
// const double _monthPickerPadding = 16.0;
// const double _monthPickerRowSpacing = 8.0;

// class MonthsGrid extends StatelessWidget {
//   MonthsGrid({
//     super.key,
//     required this.currentPageIndex,
//     required this.firstDate,
//     required this.lastDate,
//     required this.focusedDate,
//     required this.currentDate,
//     required this.onChanged,
//     required this.dragStartBehavior,
//     required this.locale,
//     required this.disableStrategy,
//   }) : assert(!firstDate.isAfter(lastDate));
//   final int currentPageIndex;
//   final DateTime firstDate;
//   final DateTime lastDate;
//   final DateTime? focusedDate;
//   final DateTime currentDate;
//   final ValueChanged<DateTime> onChanged;
//   final DragStartBehavior dragStartBehavior;
//   final String? locale;
//   final DisableStrategy disableStrategy;

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       dragStartBehavior: dragStartBehavior,
//       physics: const NeverScrollableScrollPhysics(), // Disable scrolling
//       gridDelegate: _monthPickerGridDelegate,
//       itemBuilder: (context, index) {
//         final year = firstDate.year + currentPageIndex;
//         final date = DateTime(
//           year,
//           index + 1,
//         );
//         final bool isSelected =
//             date.month == focusedDate?.month && date.year == focusedDate?.year;
//         final bool isCurrentMonth =
//             date.year == currentDate.year && date.month == currentDate.month;
//         final bool isDisabled = disableStrategy.isDisabled(date) ||
//             date.isBefore(firstDate) ||
//             date.isAfter(lastDate);
//         return MonthWidget(
//           date: date,
//           isDisabled: isDisabled,
//           isSelected: isSelected,
//           isCurrentMonth: isCurrentMonth,
//           onMonthSelected: onChanged,
//           locale: locale,
//         );
//       },
//       itemCount: _monthsCount,
//       padding: const EdgeInsets.symmetric(horizontal: _monthPickerPadding),
//     );
//   }
// }

// class _MonthPickerGridDelegate extends SliverGridDelegate {
//   const _MonthPickerGridDelegate();

//   @override
//   SliverGridLayout getLayout(SliverConstraints constraints) {
//     final double tileWidth = (constraints.crossAxisExtent -
//             (_monthPickerColumnCount - 1) * _monthPickerRowSpacing) /
//         _monthPickerColumnCount;
//     final double tileHeight = constraints.viewportMainAxisExtent / 4;
//     return SliverGridRegularTileLayout(
//       childCrossAxisExtent: tileWidth,
//       childMainAxisExtent: tileHeight,
//       crossAxisCount: _monthPickerColumnCount,
//       crossAxisStride: tileWidth + _monthPickerRowSpacing,
//       mainAxisStride: tileHeight,
//       reverseCrossAxis: axisDirectionIsReversed(constraints.crossAxisDirection),
//     );
//   }

//   @override
//   bool shouldRelayout(_MonthPickerGridDelegate oldDelegate) => false;
// }

// const _MonthPickerGridDelegate _monthPickerGridDelegate =
//     _MonthPickerGridDelegate();

// // import 'package:easy_date_timeline/easy_date_timeline.dart';
// // import 'package:flutter/gestures.dart' show DragStartBehavior;
// // import 'package:flutter/material.dart';
// // import 'package:flutter/rendering.dart';

// // import 'month_widget.dart';

// // const int _monthsCount = 12;
// // const int _monthPickerColumnCount = 3;
// // const double _monthPickerPadding = 16.0;
// // const double _monthPickerRowSpacing = 8.0;

// // class MonthsGrid extends StatelessWidget {
// //   MonthsGrid({
// //     super.key,
// //     required this.currentPageIndex,
// //     required this.firstDate,
// //     required this.lastDate,
// //     required this.focusedDate,
// //     required this.currentDate,
// //     required this.onChanged,
// //     required this.dragStartBehavior,
// //     required this.locale,
// //     required this.disableStrategy,
// //   }) : assert(!firstDate.isAfter(lastDate));
// //   final int currentPageIndex;
// //   final DateTime firstDate;
// //   final DateTime lastDate;
// //   final DateTime? focusedDate;
// //   final DateTime currentDate;
// //   final ValueChanged<DateTime> onChanged;
// //   final DragStartBehavior dragStartBehavior;
// //   final String? locale;
// //   final DisableStrategy disableStrategy;

// //   @override
// //   Widget build(BuildContext context) {
// //     return GridView.builder(
// //       dragStartBehavior: dragStartBehavior,
// //       physics: const NeverScrollableScrollPhysics(), // Disable scrolling
// //       gridDelegate: _monthPickerGridDelegate,
// //       itemBuilder: (context, index) {
// //         final year = firstDate.year + currentPageIndex;
// //         final date = DateTime(year, index + 1);
// //         final bool isSelected =
// //             date.month == focusedDate?.month && date.year == focusedDate?.year;
// //         final bool isCurrentMonth =
// //             date.year == currentDate.year && date.month == currentDate.month;
// //         final bool isDisabled = disableStrategy.isDisabled(date) ||
// //             date.isBefore(firstDate) ||
// //             date.isAfter(lastDate);
// //         return MonthWidget(
// //           date: date,
// //           isDisabled: isDisabled,
// //           isSelected: isSelected,
// //           isCurrentMonth: isCurrentMonth,
// //           onMonthSelected: onChanged,
// //           locale: locale,
// //         );
// //       },
// //       itemCount: _monthsCount,
// //       padding: const EdgeInsets.symmetric(horizontal: _monthPickerPadding),
// //     );
// //   }
// // }

// // class _MonthPickerGridDelegate extends SliverGridDelegate {
// //   const _MonthPickerGridDelegate();

// //   @override
// //   SliverGridLayout getLayout(SliverConstraints constraints) {
// //     final double tileWidth = (constraints.crossAxisExtent -
// //             (_monthPickerColumnCount - 1) * _monthPickerRowSpacing) /
// //         _monthPickerColumnCount;
// //     final double tileHeight = constraints.viewportMainAxisExtent / 4;
// //     return SliverGridRegularTileLayout(
// //       childCrossAxisExtent: tileWidth,
// //       childMainAxisExtent: tileHeight,
// //       crossAxisCount: _monthPickerColumnCount,
// //       crossAxisStride: tileWidth + _monthPickerRowSpacing,
// //       mainAxisStride: tileHeight,
// //       reverseCrossAxis: axisDirectionIsReversed(constraints.crossAxisDirection),
// //     );
// //   }

// //   @override
// //   bool shouldRelayout(_MonthPickerGridDelegate oldDelegate) => false;
// // }

// // const _MonthPickerGridDelegate _monthPickerGridDelegate =
// //     _MonthPickerGridDelegate();
