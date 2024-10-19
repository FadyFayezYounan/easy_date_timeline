import 'base_disable_strategy.dart';

final class DisableStrategyCompose implements DisableStrategy {
  /// A strategy class that combines multiple disable strategies.
  ///
  /// This class implements the [DisableStrategy] interface and disables a date if
  /// any of the provided strategies in [strategies] disables the date.
  const DisableStrategyCompose(this.strategies);

  /// A list of [DisableStrategy] instances to be combined.
  ///
  /// The date will be disabled if any of the strategies in this list disables it.
  final List<DisableStrategy> strategies;

  /// Determines if the given [date] should be disabled.
  ///
  /// Iterates through the list of [strategies] and returns `true` if any of the strategies
  /// disables the [date]. If none of the strategies disable the date, returns `false`.
  @override
  bool isDisabled(DateTime date) {
    for (final strategy in strategies) {
      if (strategy.isDisabled(date)) {
        return true;
      }
    }
    return false;
  }

  /// Returns a string representation of this strategy, including the [strategies].
  @override
  String toString() => 'DisabledStrategyCompose($strategies)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DisableStrategyCompose &&
          runtimeType == other.runtimeType &&
          strategies == other.strategies;

  @override
  int get hashCode => strategies.hashCode;
}
