part of '../widgets/day_time_line_picker_widget.dart';

/// A custom scroll controller for a day timeline picker widget.
final class EasyDatePickerController extends ScrollController
    with InfiniteTimeLineScrollMixin {
  /// Reference to the state of the DayTimeLinePickerWidget.
  _DayTimeLinePickerWidgetState? _timelineState;

  /// Notifier to control animation states.
  /// this is used to detect if the animation is in progress or not.
  late final ValueNotifier<bool> _animateToController = ValueNotifier(false);

  /// Attaches the controller to a [_DayTimeLinePickerWidgetState].
  ///
  /// This method is typically called internally by the widget.
  ///
  /// [anchor] The state to attach to this controller.
  void _attach(_DayTimeLinePickerWidgetState anchor) {
    _timelineState = anchor;
  }

  /// Detaches the controller from a [_DayTimeLinePickerWidgetState].
  ///
  /// This method is typically called internally by the widget when it's being disposed.
  ///
  /// [anchor] The state to detach from this controller.
  void _detach(_DayTimeLinePickerWidgetState anchor) {
    if (_timelineState == anchor) {
      _timelineState = null;
    }
  }

  DayTimeLinePickerWidget get _widget => _timelineState!.widget;

  /// Calculates the scroll offset for a given date and executes a callback with that offset.
  ///
  /// [date] The target DateTime.
  /// [callback] A function that takes a double offset as an argument.
  void _goToDate(
    DateTime date,
    void Function(double offset) callback,
  ) {
    final offset = getScrollOffsetFromSelectionMode(
      itemExtent: _timelineState!._itemExtent,
      firstDate: _widget.firstDate,
      lastDate: date,
      selectionMode: _widget.selectionMode,
      timelinePadding: _widget.timelineOptions.padding,
    );
    callback(offset);
  }

  /// Jumps to the specified date without animation.
  ///
  /// [date] The target DateTime.
  void jumpToDate(DateTime date) => _goToDate(date, jumpTo);

  /// Jumps to the focused date or the first date if no focused date is set.
  void jumpToFocusDate() => jumpToDate(_widget.focusedDate);

  /// Jumps to the current date without animation.
  void jumpToCurrentDate() => jumpToDate(_widget.currentDate);

  /// Animates the scroll to the specified date.
  ///
  /// [date] The target DateTime.
  /// [duration] The duration of the animation.
  /// [curve] The curve of the animation.
  void animateToDate(
    DateTime date, {
    Duration duration = const Duration(milliseconds: 400),
    Curve curve = Curves.easeInOut,
  }) {
    _animateToController.value = true;
    _goToDate(
      date,
      (offset) {
        animateTo(
          offset,
          duration: duration,
          curve: curve,
        ).then((_) => _animateToController.value = false);
      },
    );
  }

  /// Animates the scroll to the current date.
  ///
  /// [duration] The duration of the animation.
  /// [curve] The curve of the animation.
  void animateToCurrentDate({
    Duration duration = const Duration(milliseconds: 400),
    Curve curve = Curves.easeInOut,
  }) =>
      animateToDate(_widget.currentDate, duration: duration, curve: curve);

  /// Animates the scroll to the focused date or the first date if no focused date is set.
  ///
  /// [duration] The duration of the animation.
  /// [curve] The curve of the animation.
  void animateToFocusDate({
    Duration duration = const Duration(milliseconds: 400),
    Curve curve = Curves.easeInOut,
  }) =>
      animateToDate(_widget.focusedDate, duration: duration, curve: curve);

  @override
  void dispose() {
    _animateToController.dispose();
    clearCache();
    super.dispose();
  }
}
