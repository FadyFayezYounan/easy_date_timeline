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

    final offset = _calculateDateOffset(_infiniteTimeLineState!._focusDate);
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

    final offset = _calculateDateOffset(_infiniteTimeLineState!._focusDate);
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
    final offset = _calculateDateOffset(date);
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
    final offset = _calculateDateOffset(DateTime.now());
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
    final offset = _calculateDateOffset(date);
    _infiniteTimeLineState!._controller.jumpTo(
      offset,
    );
  }

  /// the method calculates the number of days between startDate and lastDate using the difference() method
  /// of the Duration class. This value is stored in the offset variable.
  /// If offset is equal to 0, the method returns 0.0.
  /// Otherwise, the method calculates the horizontal offset of the day
  /// by multiplying the offset value by the width of a day widget
  /// (which is either the value of widget.easyDayProps.width or a default value of EasyConstants.dayWidgetWidth).
  /// It then adds to this value the product of offset and [EasyConstants.separatorPadding] (which represents the width of the space between each day widget)
  double _calculateDateOffset(DateTime lastDate) {
    final firstDate = _infiniteTimeLineState!.widget.firstDate;
    int offset = lastDate.difference(firstDate).inDays;
    double adjustedHPadding = _infiniteTimeLineState!._timeLineProps.hPadding >
            EasyConstants.timelinePadding
        ? (_infiniteTimeLineState!._timeLineProps.hPadding -
            EasyConstants.timelinePadding)
        : 0.0;
    if (offset == 0) {
      return 0.0;
    }
    return (offset * _infiniteTimeLineState!._dayOffsetConstrains) +
        adjustedHPadding;
  }
}
