part of 'infinite_time_line_widget.dart';

/// Controller for the EasyInfiniteDateTimeline.
/// This controller is responsible for managing the state and behavior of the timeline.
final class EasyInfiniteDateTimelineController {
  _InfiniteTimeLineWidgetState? _infiniteTimeLineState;

  /// Attaches the controller to the given EasyInfiniteDateTimeline state.
  void _attachEasyDateState(_InfiniteTimeLineWidgetState state) {
    _infiniteTimeLineState = state;
  }

  /// Detaches the controller from the EasyInfiniteDateTimeline state.
  void _detachEasyDateState() {
    _infiniteTimeLineState = null;
  }

  /// Jumps to the focus date on the timeline.
  /// Throws an assertion error if the controller is not attached to any EasyInfiniteDateTimeline view.
  void jumpToFocusDate() {
    assert(
      _infiniteTimeLineState != null,
      'EasyInfiniteDateTimelineController is not attached to any EasyInfiniteDateTimeline View.',
    );

    final offset = _infiniteTimeLineState!
        ._getScrollOffset(_infiniteTimeLineState!._focusDate);
    _infiniteTimeLineState!._controller.jumpTo(offset);
  }

  /// Animates to the focus date on the timeline.
  /// Throws an assertion error if the controller is not attached to any EasyInfiniteDateTimeline view.
  void animateToFocusDate({
    duration = const Duration(milliseconds: 300),
    curve = Curves.linear,
  }) {
    assert(
      _infiniteTimeLineState != null,
      'EasyInfiniteDateTimelineController is not attached to any EasyInfiniteDateTimeline View.',
    );

    final offset = _infiniteTimeLineState!
        ._getScrollOffset(_infiniteTimeLineState!._focusDate);
    _infiniteTimeLineState!._controller.animateTo(
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
    assert(
      _infiniteTimeLineState != null,
      'EasyInfiniteDateTimelineController is not attached to any EasyInfiniteDateTimeline View.',
    );
    final offset = _infiniteTimeLineState!._getScrollOffset(date);
    _infiniteTimeLineState!._controller.animateTo(
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
    assert(
      _infiniteTimeLineState != null,
      'EasyInfiniteDateTimelineController is not attached to any EasyInfiniteDateTimeline View.',
    );
    final offset = _infiniteTimeLineState!._getScrollOffset(DateTime.now());
    _infiniteTimeLineState!._controller.animateTo(
      offset,
      duration: duration,
      curve: curve,
    );
  }

  /// Jumps to the specified date on the timeline.
  /// Throws an assertion error if the controller is not attached to any EasyInfiniteDateTimeline view.
  void jumpToDate(
    DateTime date,
  ) {
    assert(
      _infiniteTimeLineState != null,
      'EasyInfiniteDateTimelineController is not attached to any EasyInfiniteDateTimeline View.',
    );
    final offset = _infiniteTimeLineState!._getScrollOffset(date);
    _infiniteTimeLineState!._controller.jumpTo(
      offset,
    );
  }
}
