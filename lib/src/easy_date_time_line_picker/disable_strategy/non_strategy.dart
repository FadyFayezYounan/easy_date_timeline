import 'base_disable_strategy.dart';

final class DisableStrategyNone implements DisableStrategy {
  /// A strategy class that disables no dates.
  ///
  /// This class implements the [DisableStrategy] interface and never disables any
  /// date, always returning `false` from the [isDisabled] method.
  const DisableStrategyNone();

  /// Determines if the given [date] should be disabled.
  ///
  /// Always returns `false`, meaning that no dates are disabled.
  @override
  bool isDisabled(DateTime date) => false;

  /// Returns a string representation of this strategy.
  @override
  String toString() => 'DisableStrategyNone()';
}
