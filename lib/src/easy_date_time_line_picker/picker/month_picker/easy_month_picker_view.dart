import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../disable_strategy/strategies.dart';
import 'months_grid.dart';

class EasyMonthPickerView extends StatefulWidget {
  /// A stateful widget that implements a month picker view with year navigation capabilities.
  /// This widget displays a grid of months for a specific year and allows navigation between years.
  ///
  /// The view consists of:
  /// - A header with year navigation controls (previous/next year buttons)
  /// - A PageView containing grids of months for each year
  ///
  /// Example usage:
  /// ```dart
  /// EasyMonthPickerView(
  ///   firstDate: DateTime(2020),
  ///   lastDate: DateTime(2025),
  ///   focusedDate: DateTime.now(),
  ///   currentDate: DateTime.now(),
  ///   onChanged: (DateTime date) {
  ///     print('Selected date: $date');
  ///   },
  ///   onYearPageChanged: (DateTime date) {
  ///     print('Year changed to: ${date.year}');
  ///   },
  ///   locale: 'en_US',
  ///   disableStrategy: CustomDisableStrategy(),
  /// )
  /// ```
  EasyMonthPickerView({
    super.key,
    required this.firstDate,
    required this.lastDate,
    required this.focusedDate,
    required this.currentDate,
    required this.onChanged,
    required this.onYearPageChanged,
    required this.locale,
    required this.disableStrategy,
  }) : assert(!firstDate.isAfter(lastDate));

  /// The earliest date the user is permitted to pick.
  final DateTime firstDate;

  /// The latest date the user is permitted to pick.
  final DateTime lastDate;

  /// The current focused date of the picker.
  final DateTime focusedDate;

  /// The current date (typically today's date).
  final DateTime currentDate;

  /// Called when the user picks a month.
  final ValueChanged<DateTime> onChanged;

  /// Called when the user changes the year page.
  final ValueChanged<DateTime> onYearPageChanged;

  /// The locale to use for formatting (optional).
  final String? locale;

  /// Strategy to determine which dates should be disabled.
  final DisableStrategy disableStrategy;

  @override
  State<EasyMonthPickerView> createState() => _EasyMonthPickerViewState();
}

/// The private State class for EasyMonthPickerView.
class _EasyMonthPickerViewState extends State<EasyMonthPickerView> {
  /// Key for the PageView widget.
  final GlobalKey _pageViewKey = GlobalKey();

  /// Controller for handling page transitions.
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    // Calculate initial page based on the focused date's year
    final initialPage = widget.focusedDate.year - widget.firstDate.year;
    _pageController = PageController(initialPage: initialPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// Returns true if the currently displayed year is the first available year.
  bool get _isDisplayingFirstYear =>
      widget.focusedDate.year == widget.firstDate.year;

  /// Returns true if the currently displayed year is the last available year.
  bool get _isDisplayingLastYear =>
      widget.focusedDate.year == widget.lastDate.year;

  /// Calculates the total number of years available for selection.
  int get _yearCount => widget.lastDate.year - widget.firstDate.year + 1;

  /// Handles page change events in the year PageView.
  ///
  /// [page] represents the index of the new page.
  void _onPageChanged(int page) {
    var newDate = DateTime(
      widget.firstDate.year + page,
      widget.focusedDate.month,
    );

    // Ensure newDate does not exceed widget.lastDate
    if (newDate.isAfter(widget.lastDate)) {
      newDate = widget.lastDate;
    }

    widget.onYearPageChanged(newDate);
  }

  @override
  Widget build(BuildContext context) {
    final Color controlColor =
        Theme.of(context).colorScheme.onSurface.withOpacity(0.60);
    return Semantics(
      child: Column(
        children: [
          SizedBox(
            height: pickerHeaderHeight,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 16, end: 4),
              child: Row(
                children: <Widget>[
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.chevron_left),
                    color: controlColor,
                    onPressed:
                        _isDisplayingFirstYear ? null : _handlePreviousYear,
                  ),
                  IconButton(
                    icon: const Icon(Icons.chevron_right),
                    color: controlColor,
                    onPressed: _isDisplayingLastYear ? null : _handleNextYear,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: PageView.builder(
              key: _pageViewKey,
              controller: _pageController,
              onPageChanged: _onPageChanged,
              itemCount: _yearCount,
              itemBuilder: (context, index) {
                return MonthsGrid(
                  currentPageIndex: index,
                  firstDate: widget.firstDate,
                  lastDate: widget.lastDate,
                  focusedDate: widget.focusedDate,
                  currentDate: widget.currentDate,
                  onChanged: widget.onChanged,
                  locale: widget.locale,
                  disableStrategy: widget.disableStrategy,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Handles navigation to the next year if not already displaying the last year.
  /// Animates the page transition with a duration of 300ms.
  Future<void> _handleNextYear() async {
    if (!_isDisplayingLastYear) {
      await _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  /// Handles navigation to the previous year if not already displaying the first year.
  /// Animates the page transition with a duration of 300ms.
  Future<void> _handlePreviousYear() async {
    if (!_isDisplayingFirstYear) {
      await _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}
