import 'package:flutter/material.dart' show DateUtils;

import '../utils/date_time_extensions.dart';

import 'base_disable_strategy.dart';

final class DisableStrategyList implements DisableStrategy {
  /// A strategy class that disables specific dates from a provided list.
  ///
  /// This class implements the [DisableStrategy] interface and disables dates that
  /// match any of the dates in the [dates] list.
  const DisableStrategyList(this.dates);

  /// A list of [DateTime] objects representing the dates to be disabled.
  final List<DateTime> dates;

  /// Determines if the given [date] should be disabled.
  ///
  /// Returns `true` if the [date] (compared by date only, ignoring time) is present
  /// in the [dates] list. Uses the `toDateOnly()` method for date comparison.
  @override
  bool isDisabled(DateTime date) {
    return dates.map(DateUtils.dateOnly).contains(date.toDateOnly());
  }

  /// Returns a string representation of this strategy, including the [dates].
  @override
  String toString() => 'DisableStrategyList( $dates )';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DisableStrategyList &&
          runtimeType == other.runtimeType &&
          dates == other.dates;

  @override
  int get hashCode => dates.hashCode;
}
