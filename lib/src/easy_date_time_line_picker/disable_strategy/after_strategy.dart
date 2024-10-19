import '../utils/date_time_extensions.dart';

import 'base_disable_strategy.dart';

final class DisableStrategyAfter implements DisableStrategy {
  /// A strategy class that disables a date after a specified [dateTime].
  ///
  /// This class implements the [DisableStrategy] interface and determines whether
  /// a date should be disabled based on whether it comes after a predefined [dateTime].
  const DisableStrategyAfter(this.dateTime);

  /// The [DateTime] after which dates should be disabled.
  final DateTime dateTime;

  /// Determines if the given [date] should be disabled.
  ///
  /// Returns `true` if the [date] is after the specified [dateTime] (ignoring time).
  /// Uses the `toDateOnly()` method to compare only the date part of the [DateTime].
  @override
  bool isDisabled(DateTime date) {
    return date.toDateOnly().isAfter(dateTime.toDateOnly());
  }

  /// Returns a string representation of this strategy, including the [dateTime].
  @override
  String toString() => 'DisableStrategyAfter($dateTime)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DisableStrategyAfter &&
          runtimeType == other.runtimeType &&
          dateTime == other.dateTime;

  @override
  int get hashCode => dateTime.hashCode;
}

final class DisableStrategyAfterToday implements DisableStrategy {
  /// A strategy class that disables dates after the current date.
  ///
  /// This class implements the [DisableStrategy] interface and determines whether
  /// a date should be disabled if it comes after the current date.
  const DisableStrategyAfterToday();

  /// Determines if the given [date] should be disabled.
  ///
  /// Returns `true` if the [date] is after today's date (ignoring time).
  /// Uses the `toDateOnly()` method to compare only the date part of the [DateTime].
  @override
  bool isDisabled(DateTime date) {
    final today = DateTime.now().toDateOnly();
    return date.toDateOnly().isAfter(today);
  }

  /// Returns a string representation of this strategy.
  @override
  String toString() => 'DisableStrategyAfterToday()';
}
