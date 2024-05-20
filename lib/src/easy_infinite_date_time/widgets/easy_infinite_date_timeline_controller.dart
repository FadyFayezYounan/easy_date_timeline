part of 'infinite_time_line_widget.dart';

/// Controller for the EasyInfiniteDateTimeline.
/// This controller is responsible for managing the state and behavior of the timeline.
class EasyInfiniteDateTimelineController {
  _InfiniteTimeLineWidgetState? _infiniteTimeLineState;

  /// Attaches the controller to the given EasyInfiniteDateTimeline state.
  void _attachEasyDateState(_InfiniteTimeLineWidgetState state) {
    _infiniteTimeLineState = state;
  }

  /// Detaches the controller from the EasyInfiniteDateTimeline state.
  void _detachEasyDateState() {
    _infiniteTimeLineState = null;
  }

  _InfiniteTimeLineWidgetState get _state {
    assert(
      _infiniteTimeLineState != null,
      'EasyInfiniteDateTimelineController is not attached to any EasyInfiniteDateTimeline View.',
    );
    return _infiniteTimeLineState!;
  }

  /// Jumps to the focus date on the timeline.
  /// Throws an assertion error if the controller is not attached to any EasyInfiniteDateTimeline view.
  void jumpToFocusDate() {
    final offset = _state._getScrollOffset(_state._focusDate);
    _state._controller.jumpTo(offset);
  }

  /// Animates to the focus date on the timeline.
  /// Throws an assertion error if the controller is not attached to any EasyInfiniteDateTimeline view.
  void animateToFocusDate({
    duration = const Duration(milliseconds: 300),
    curve = Curves.linear,
  }) {
    final offset = _state._getScrollOffset(_state._focusDate);
    _state._controller.animateTo(
      offset,
      duration: duration,
      curve: curve,
    );
  }

  /// Animates to the specified date on the timeline.
  /// Throws an assertion error if the controller is not attached to any EasyInfiniteDateTimeline view.
  void animateToDate(
    DateTime date, {
    duration = const Duration(milliseconds: 300),
    curve = Curves.linear,
  }) {
    final offset = _state._getScrollOffset(date);
    _state._controller.animateTo(
      offset,
      duration: duration,
      curve: curve,
    );
  }

  /// Animates to the current date on the timeline.
  /// Throws an assertion error if the controller is not attached to any EasyInfiniteDateTimeline view.
  void animateToCurrentData({
    duration = const Duration(milliseconds: 300),
    curve = Curves.linear,
  }) {
    final offset = _state._getScrollOffset(DateTime.now());
    _state._controller.animateTo(
      offset,
      duration: duration,
      curve: curve,
    );
  }

  /// Jumps to the specified date on the timeline.
  /// Throws an assertion error if the controller is not attached to any EasyInfiniteDateTimeline view.
  void jumpToDate(DateTime date) {
    final offset = _state._getScrollOffset(date);
    _state._controller.jumpTo(offset);
  }
}
