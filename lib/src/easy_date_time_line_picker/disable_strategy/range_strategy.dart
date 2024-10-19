import 'package:flutter/material.dart' show DateTimeRange;

import '../utils/date_time_extensions.dart';

import 'base_disable_strategy.dart';

final class DisableStrategyInRange implements DisableStrategy {
  /// A strategy class that disables dates within a specific date range.
  ///
  /// This class implements the [DisableStrategy] interface and disables dates that fall within
  /// the provided [range]. The inclusion of the start and end dates can be controlled
  /// using the [includeStartAndEndDates] parameter.
  const DisableStrategyInRange(
    this.range, {
    this.includeStartAndEndDates = true,
  });

  /// The date range to check for disabling dates.
  final DateTimeRange range;

  /// A flag to indicate whether the start and end dates of the range should be disabled.
  ///
  /// Defaults to `true`, meaning both the start and end dates are included in the disabled range.
  final bool includeStartAndEndDates;

  /// Determines if the given [date] should be disabled.
  ///
  /// Returns `true` if the [date] is within the [range]. If [includeStartAndEndDates]
  /// is set to `true`, the start and end dates are also disabled.
  @override
  bool isDisabled(DateTime date) {
    final start = range.start.toDateOnly();
    final end = range.end.toDateOnly();
    final dateOnly = date.toDateOnly();

    if (includeStartAndEndDates) {
      return dateOnly.isAfter(start) && dateOnly.isBefore(end) ||
          dateOnly.isAtSameMomentAs(start) ||
          dateOnly.isAtSameMomentAs(end);
    } else {
      return dateOnly.isAfter(start) && dateOnly.isBefore(end);
    }
  }

  /// Returns a string representation of this strategy, including the [range].
  @override
  String toString() => 'DisableStrategyInRange($range)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DisableStrategyInRange &&
          runtimeType == other.runtimeType &&
          range == other.range &&
          includeStartAndEndDates == other.includeStartAndEndDates;

  @override
  int get hashCode => range.hashCode ^ includeStartAndEndDates.hashCode;
}

final class DisableStrategyInRanges implements DisableStrategy {
  /// A strategy class that disables dates within multiple date ranges.
  ///
  /// This class implements the [DisableStrategy] interface and disables dates that fall within
  /// any of the provided [ranges]. The inclusion of the start and end dates of each range
  /// can be controlled using the [includeRange] parameter.
  const DisableStrategyInRanges(
    this.ranges, {
    this.includeRange = true,
  });

  /// A list of [DateTimeRange] objects representing the ranges to check for disabling dates.
  final List<DateTimeRange> ranges;

  /// A flag to indicate whether the start and end dates of each range should be disabled.
  ///
  /// Defaults to `true`, meaning both the start and end dates are included in the disabled ranges.
  final bool includeRange;

  /// Determines if the given [date] should be disabled.
  ///
  /// Returns `true` if the [date] is within any of the [ranges]. If [includeRange]
  /// is set to `true`, the start and end dates of each range are also disabled.
  @override
  bool isDisabled(DateTime date) {
    final dateOnly = date.toDateOnly();
    for (final range in ranges) {
      final start = range.start.toDateOnly();
      final end = range.end.toDateOnly();
      final isInRange = includeRange
          ? (dateOnly.isAfter(start) && dateOnly.isBefore(end)) ||
              dateOnly.isAtSameMomentAs(start) ||
              dateOnly.isAtSameMomentAs(end)
          : dateOnly.isAfter(start) && dateOnly.isBefore(end);

      if (isInRange) {
        return true;
      }
    }
    return false;
  }

  /// Returns a string representation of this strategy, including the [ranges].
  @override
  String toString() => 'DisableStrategyInRanges($ranges)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DisableStrategyInRanges &&
          runtimeType == other.runtimeType &&
          ranges == other.ranges &&
          includeRange == other.includeRange;

  @override
  int get hashCode => ranges.hashCode ^ includeRange.hashCode;
}
