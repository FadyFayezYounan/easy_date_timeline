import 'dart:ui' show Color;

final class TimeLineProps {
  const TimeLineProps({
    this.padding,
    this.separatorPadding,
    this.backgroundColor,
  });

  /// The padding applied to the date timeline widget.
  final double? padding;

  /// The padding applied to the separators between days in the timeline widget.
  final double? separatorPadding;

  /// The background color of the timeline widget.
  final Color? backgroundColor;
}
