import '../utils/date_time_extensions.dart';

import 'base_disable_strategy.dart';

final class DisableStrategyBefore implements DisableStrategy {
  /// A strategy class that disables dates before a specified [dateTime].
  ///
  /// This class implements the [DisableStrategy] interface and determines whether
  /// a date should be disabled based on whether it comes before a predefined [dateTime].
  const DisableStrategyBefore(this.dateTime);

  /// The [DateTime] before which dates should be disabled.
  final DateTime dateTime;

  /// Determines if the given [date] should be disabled.
  ///
  /// Returns `true` if the [date] is before the specified [dateTime] (ignoring time).
  /// Uses the `toDateOnly()` method to compare only the date part of the [DateTime].
  @override
  bool isDisabled(DateTime date) {
    return date.toDateOnly().isBefore(dateTime.toDateOnly());
  }

  /// Returns a string representation of this strategy, including the [dateTime].
  @override
  String toString() => 'DisabledStrategyBefore($dateTime)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DisableStrategyBefore &&
          runtimeType == other.runtimeType &&
          dateTime == other.dateTime;

  @override
  int get hashCode => dateTime.hashCode;
}

final class DisableStrategyBeforeToday implements DisableStrategy {
  /// A strategy class that disables dates before today's date.
  ///
  /// This class implements the [DisableStrategy] interface and determines whether
  /// a date should be disabled if it comes before today's date.
  const DisableStrategyBeforeToday();

  /// Determines if the given [date] should be disabled.
  ///
  /// Returns `true` if the [date] is before today's date (ignoring time).
  /// Uses the `toDateOnly()` method to compare only the date part of the [DateTime].
  @override
  bool isDisabled(DateTime date) {
    final today = DateTime.now().toDateOnly();
    return date.toDateOnly().isBefore(today);
  }

  /// Returns a string representation of this strategy.
  @override
  String toString() => 'DisabledStrategyBeforeToday()';
}
