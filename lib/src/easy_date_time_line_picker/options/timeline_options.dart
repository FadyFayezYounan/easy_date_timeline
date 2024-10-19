import 'package:flutter/material.dart';

import '../utils/constants.dart';

final class TimelineOptions {
  /// Configuration options for a timeline widget.
  ///
  /// The `TimelineOptions` class provides customizable options for configuring the appearance and behavior
  /// of a timeline widget, such as its height and padding.
  ///
  /// - Parameters:
  ///   - `height`: The height of the timeline. Defaults to `defaultTimelineHeight`.
  ///   - `padding`: The padding around the timeline. Defaults to `defaultTimelinePadding`.
  ///
  /// This class includes methods for equality comparison and generating a string representation of the options.
  const TimelineOptions({
    this.height = defaultTimelineHeight,
    this.padding = defaultTimelinePadding,
  });

  /// The height of the timeline.
  final double height;

  /// The padding around the timeline.
  final EdgeInsets padding;

  @override
  String toString() {
    return 'TimelineOptions(height: $height, padding: $padding)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TimelineOptions &&
        other.height == height &&
        other.padding == padding;
  }

  @override
  int get hashCode => height.hashCode ^ padding.hashCode;
}
