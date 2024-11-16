import 'package:flutter/gestures.dart' show DragStartBehavior;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../disable_strategy/strategies.dart';
import '../../utils/constants.dart';
import 'year_widget.dart';

const int _yearPickerColumnCount = 3;
const double _yearPickerPadding = 16.0;
const double _yearPickerRowHeight = 52.0;
const double _yearPickerRowSpacing = 8.0;

class EasyYearPicker extends StatefulWidget {
  /// A widget that allows users to select a year from a scrollable grid.
  /// Implements a material design year picker as part of a date picker dialog.
  ///
  /// Example usage:
  /// ```dart
  /// EasyYearPicker(
  ///   firstDate: DateTime(2020),
  ///   lastDate: DateTime(2030),
  ///   focusedDate: DateTime.now(),
  ///   currentDate: DateTime.now(),
  ///   onChanged: (DateTime date) {
  ///     print('Selected year: ${date.year}');
  ///   },
  ///   dragStartBehavior: DragStartBehavior.start,
  /// )
  /// ```
  EasyYearPicker({
    super.key,
    required this.firstDate,
    required this.lastDate,
    required this.focusedDate,
    required this.currentDate,
    required this.onChanged,
    required this.dragStartBehavior,
    required this.disableStrategy,
  }) : assert(!firstDate.isAfter(lastDate));

  /// The earliest date the user is permitted to pick.
  final DateTime firstDate;

  /// The latest date the user is permitted to pick.
  final DateTime lastDate;

  /// The currently focused date (if any).
  /// This date is highlighted in the picker.
  final DateTime? focusedDate;

  /// The current date (typically today's date).
  /// Used for highlighting the current year.
  final DateTime currentDate;

  /// Called when the user picks a year.
  final ValueChanged<DateTime> onChanged;

  final DisableStrategy disableStrategy;

  /// Determines the way that drag start behavior is handled.
  /// Defaults to DragStartBehavior.start.
  final DragStartBehavior dragStartBehavior;

  @override
  State<EasyYearPicker> createState() => _EasyYearPickerState();
}

/// The private State class for EasyYearPicker.
class _EasyYearPickerState extends State<EasyYearPicker> {
  /// Controller for the grid scroll position.
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    // Initialize scroll controller with the focused date's position
    _scrollController = ScrollController(
        initialScrollOffset:
            _scrollOffsetForYear(widget.focusedDate ?? widget.currentDate));
  }

  @override
  void didUpdateWidget(covariant EasyYearPicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update scroll position when focused date changes
    if (widget.focusedDate != oldWidget.focusedDate &&
        widget.focusedDate != null) {
      _scrollController!.jumpTo(_scrollOffsetForYear(widget.focusedDate!));
    }
  }

  /// Calculates the scroll offset for a given year to center it in the view.
  ///
  /// [date] The date whose year should be centered.
  /// Returns the scroll offset that will center the year in the view.
  double _scrollOffsetForYear(DateTime date) {
    final int initialYearIndex = date.year - widget.firstDate.year;
    final int initialYearRow = initialYearIndex ~/ _yearPickerColumnCount;
    // Move the offset down by 2 rows to approximately center it.
    final int centeredYearRow = initialYearRow - 2;
    return centeredYearRow * _yearPickerRowHeight;
  }

  /// The total number of years to display in the picker.
  int get _itemCount => widget.lastDate.year - widget.firstDate.year + 1;

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;
    final DatePickerThemeData datePickerTheme = DatePickerTheme.of(context);

    return Column(
      children: [
        const SizedBox(height: pickerHeaderHeight),
        if (useMaterial3)
          Divider(height: 0, color: datePickerTheme.dividerColor),
        Expanded(
          child: GridView.builder(
            controller: _scrollController,
            dragStartBehavior: widget.dragStartBehavior,
            gridDelegate: _yearPickerGridDelegate,
            itemBuilder: (context, index) {
              return YearWidget(
                index: index,
                firstDate: widget.firstDate,
                lastDate: widget.lastDate,
                focusedDate: widget.focusedDate,
                currentDate: widget.currentDate,
                isDisabled: false,
                onChanged: widget.onChanged,
                disableStrategy: widget.disableStrategy,
              );
            },
            itemCount: _itemCount,
            padding: const EdgeInsets.symmetric(horizontal: _yearPickerPadding),
          ),
        ),
        if (useMaterial3)
          Divider(height: 0, color: datePickerTheme.dividerColor),
      ],
    );
  }
}

/// A custom SliverGridDelegate that creates a grid layout for the year picker.
///
/// This delegate creates a grid with fixed dimensions and spacing for year items.
class _YearPickerGridDelegate extends SliverGridDelegate {
  const _YearPickerGridDelegate();

  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    // Calculate the width of each tile based on the available width and spacing
    final double tileWidth = (constraints.crossAxisExtent -
            (_yearPickerColumnCount - 1) * _yearPickerRowSpacing) /
        _yearPickerColumnCount;
    return SliverGridRegularTileLayout(
      childCrossAxisExtent: tileWidth,
      childMainAxisExtent: _yearPickerRowHeight,
      crossAxisCount: _yearPickerColumnCount,
      crossAxisStride: tileWidth + _yearPickerRowSpacing,
      mainAxisStride: _yearPickerRowHeight,
      reverseCrossAxis: axisDirectionIsReversed(constraints.crossAxisDirection),
    );
  }

  @override
  bool shouldRelayout(_YearPickerGridDelegate oldDelegate) => false;
}

/// A singleton instance of _YearPickerGridDelegate to avoid unnecessary object creation.
const _YearPickerGridDelegate _yearPickerGridDelegate =
    _YearPickerGridDelegate();
