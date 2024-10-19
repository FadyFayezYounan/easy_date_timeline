import 'package:flutter/material.dart' show DateTimeRange;

import 'after_strategy.dart';
import 'all_strategy.dart';
import 'before_strategy.dart';
import 'compose_strategy.dart';
import 'list_strategy.dart';
import 'non_strategy.dart';
import 'range_strategy.dart';

abstract class DisableStrategy {
  /// An abstract class that defines a strategy for disabling dates.
  ///
  /// This class provides a common interface for various date disabling strategies
  /// and includes factory constructors for different disabling behaviors.
  const DisableStrategy();

  /// Determines if a given date should be disabled.
  ///
  /// [date] The date to check.
  /// Returns true if the date should be disabled, false otherwise.
  bool isDisabled(DateTime date);

  @override
  String toString() => 'DisableStrategy()';

  /// Creates a strategy that doesn't disable any dates.
  const factory DisableStrategy.none() = DisableStrategyNone;

  /// Creates a strategy that disables all dates.
  const factory DisableStrategy.all() = DisableStrategyAll;

  /// Creates a strategy that combines multiple disabling strategies.
  ///
  /// [strategies] A list of DisableStrategy objects to be composed.
  const factory DisableStrategy.compose(List<DisableStrategy> strategies) =
      DisableStrategyCompose;

  /// Creates a strategy that disables all dates before a specified date.
  ///
  /// [dateTime] The cutoff date.
  const factory DisableStrategy.before(DateTime dateTime) =
      DisableStrategyBefore;

  /// Creates a strategy that disables all dates before today.
  const factory DisableStrategy.beforeToday() = DisableStrategyBeforeToday;

  /// Creates a strategy that disables all dates after a specified date.
  ///
  /// [dateTime] The cutoff date.
  const factory DisableStrategy.after(DateTime dateTime) = DisableStrategyAfter;

  /// Creates a strategy that disables all dates after today.
  const factory DisableStrategy.afterToday() = DisableStrategyAfterToday;

  /// Creates a strategy that disables dates within a specified range.
  ///
  /// [range] The DateTimeRange to disable.
  /// [includeStartAndEndDates] If true, includes the start and end dates of the range.
  const factory DisableStrategy.inRange(
    DateTimeRange range, {
    bool includeStartAndEndDates,
  }) = DisableStrategyInRange;

  /// Creates a strategy that disables dates within multiple specified ranges.
  ///
  /// [ranges] A list of DateTimeRange objects to disable.
  /// [includeRange] If true, includes the start and end dates of each range.
  const factory DisableStrategy.ranges(
    List<DateTimeRange> ranges, {
    bool includeRange,
  }) = DisableStrategyInRanges;

  /// Creates a strategy that disables a specific list of dates.
  ///
  /// [dates] A list of DateTime objects to disable.
  const factory DisableStrategy.list(List<DateTime> dates) =
      DisableStrategyList;
}
