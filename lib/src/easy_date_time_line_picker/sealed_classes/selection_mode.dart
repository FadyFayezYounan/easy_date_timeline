import 'package:flutter/material.dart' show Curve;

sealed class SelectionMode {
  /// Defines different selection modes for a timeline.
  ///
  /// SelectionMode allows specifying different behaviors when selecting an item
  /// on a timeline, such as animation duration and curve.
  ///
  /// [duration] The duration of the selection animation.
  /// [curve] The curve of the selection animation.
  const SelectionMode({
    @Deprecated('duration and curve are deprecated.') required this.duration,
    @Deprecated('duration and curve are deprecated.') required this.curve,
  });

  /// The duration of the selection animation.
  final Duration? duration;

  /// The curve of the selection animation.
  final Curve? curve;

  /// Represents a SelectionMode where no animation is applied.
  const factory SelectionMode.none() = SelectionModeNone;

  /// Represents a SelectionMode where auto-centering animation is applied.
  const factory SelectionMode.autoCenter({
    @Deprecated('duration and curve are deprecated.') Duration? duration,
    @Deprecated('duration and curve are deprecated.') Curve? curve,
  }) = SelectionModeAutoCenter;

  /// Represents a SelectionMode where the selected date is always the first
  /// visible day of the timeline.
  const factory SelectionMode.alwaysFirst({
    @Deprecated('duration and curve are deprecated.') Duration? duration,
    @Deprecated('duration and curve are deprecated.') Curve? curve,
  }) = SelectionModeAlwaysFirst;

  @override
  String toString() => 'SelectionMode(duration: $duration, curve: $curve)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SelectionMode &&
          duration == other.duration &&
          curve == other.curve;

  @override
  int get hashCode => duration.hashCode ^ curve.hashCode;
}

/// A selection mode that doesn't animate the selection.
///
/// This selection mode has no duration and no curve, so it doesn't animate the selection.
final class SelectionModeNone extends SelectionMode {
  /// Constructs a [SelectionModeNone].
  ///
  /// This constructor sets the [duration] to `null` and the [curve] to `null`,
  /// which means that the selection doesn't animate.
  const SelectionModeNone()
      : super(
          duration: null,
          curve: null,
        );

  @override
  String toString() => 'SelectionModeNone()';
}

/// A selection mode that automatically centers the selected date.
///
/// When a date is selected, this mode animates the scroll position of the
/// timeline so that the selected date is centered.
///
/// The [duration] and [curve] of the animation can be customized.
final class SelectionModeAutoCenter extends SelectionMode {
  /// Constructs a [SelectionModeAutoCenter].
  ///
  /// The [duration] and [curve] parameters control the animation properties
  /// when the selected date is centered.
  ///
  /// If [duration] is `null`, a default duration of 300ms is used.
  /// If [curve] is `null`, a default curve of [Curves.linear] is used.
  const SelectionModeAutoCenter({
    super.duration,
    super.curve,
  });

  @override
  String toString() =>
      'SelectionModeAutoCenter(duration: $duration, curve: $curve)';
}

/// A selection mode that always positions the selected date at the first
/// visible day of the timeline.
///
/// This selection mode animates the scroll position of the timeline so that the
/// selected date is always the first visible day.
///
/// The [duration] and [curve] of the animation can be customized.
///
/// The [duration] parameter controls the duration of the scroll animation.
/// If it is `null`, a default duration of 300ms is used.
///
/// The [curve] parameter controls the animation curve. If it is `null`, a
/// default curve of [Curves.linear] is used.
final class SelectionModeAlwaysFirst extends SelectionMode {
  /// Constructs a [SelectionModeAlwaysFirst].
  ///
  /// The [duration] and [curve] parameters control the animation properties
  /// when the selected date is always the first visible day.
  ///
  /// If [duration] is `null`, a default duration of 300ms is used.
  /// If [curve] is `null`, a default curve of [Curves.linear] is used.
  const SelectionModeAlwaysFirst({
    super.duration,
    super.curve,
  });

  @override
  String toString() =>
      'SelectionModeAlwaysFirst(duration: $duration, curve: $curve)';
}

/// Extension methods for the [SelectionMode] class.
///
/// This extension provides convenience methods to check the type of the
/// [SelectionMode] object.
extension SelectionModeExtension on SelectionMode {
  /// Returns `true` if this [SelectionMode] is of type [SelectionModeNone].
  ///
  /// It returns `false` otherwise.
  bool get isNone => this is SelectionModeNone;

  /// Returns `true` if this [SelectionMode] is of type [SelectionModeAutoCenter].
  ///
  /// It returns `false` otherwise.
  bool get isAutoCenter => this is SelectionModeAutoCenter;

  /// Returns `true` if this [SelectionMode] is of type [SelectionModeAlwaysFirst].
  ///
  /// It returns `false` otherwise.
  bool get isAlwaysFirst => this is SelectionModeAlwaysFirst;

  /// Returns `true` if this [SelectionMode] is of type [SelectionModeAutoCenter] or
  /// [SelectionModeAlwaysFirst].
  ///
  /// It returns `false` otherwise.
  bool get isCenterOrFirst => isAutoCenter || isAlwaysFirst;
}
