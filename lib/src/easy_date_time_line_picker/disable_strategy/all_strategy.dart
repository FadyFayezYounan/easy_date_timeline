import 'base_disable_strategy.dart';

final class DisableStrategyAll implements DisableStrategy {
  /// A strategy class that disables all dates.
  ///
  /// This class implements the [DisableStrategy] interface and disables every
  /// date by always returning `true` from the [isDisabled] method.
  const DisableStrategyAll();

  /// Determines if the given [date] should be disabled.
  ///
  /// Always returns `true`, meaning that all dates are considered disabled.
  @override
  bool isDisabled(DateTime date) => true;

  /// Returns a string representation of this strategy.
  @override
  String toString() => 'DisableStrategyAll()';
}
