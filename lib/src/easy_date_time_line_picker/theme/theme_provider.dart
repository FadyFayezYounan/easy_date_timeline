import 'package:flutter/foundation.dart'
    show DiagnosticPropertiesBuilder, DiagnosticsProperty;
import 'package:flutter/material.dart';

import 'easy_date_picker_defaults_m2.dart';
import 'easy_date_picker_defaults_m3.dart';
import 'easy_theme_data.dart';

/// A widget that provides theme data to its descendants.
class EasyTheme extends StatelessWidget {
  /// Creates an [EasyTheme] widget.
  ///
  /// The [data] and [child] arguments must not be null.
  const EasyTheme({
    super.key,
    required this.data,
    required this.child,
  });

  /// The theme data to use for descendant widgets.
  final EasyThemeData data;

  /// The widget below this widget in the tree.
  final Widget child;

  /// Retrieves the nearest [EasyThemeData] instance from the given build context.
  ///
  /// If no [EasyTheme] is found in the widget tree, it returns the default theme.
  static EasyThemeData of(BuildContext context) {
    return maybeOf(context) ?? defaultsOf(context);
  }

  /// Retrieves the nearest [EasyThemeData] instance from the given build context.
  ///
  /// Returns null if no [EasyTheme] is found in the widget tree.
  static EasyThemeData? maybeOf(BuildContext context) {
    final _EasyInheritedTheme? inheritedTheme =
        context.dependOnInheritedWidgetOfExactType<_EasyInheritedTheme>();
    return inheritedTheme?.theme.data;
  }

  /// Returns the default [EasyThemeData] for the given context.
  static EasyThemeData defaultsOf(BuildContext context) {
    return Theme.of(context).useMaterial3
        ? EasyDatePickerDefaultsM3(context)
        : EasyDatePickerDefaultsM2(context);
  }

  @override
  Widget build(BuildContext context) {
    return _EasyInheritedTheme(
      theme: this,
      child: child,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<EasyThemeData>('data', data, showName: false));
  }
}

/// An inherited widget that defines the configuration for [EasyTheme] widgets.
final class _EasyInheritedTheme extends InheritedTheme {
  /// Creates an [_EasyInheritedTheme].
  ///
  /// The [theme] and [child] arguments must not be null.
  const _EasyInheritedTheme({
    required this.theme,
    required super.child,
  });

  /// The theme data provided by this inherited widget.
  final EasyTheme theme;

  @override
  bool updateShouldNotify(covariant _EasyInheritedTheme oldWidget) =>
      theme.data != oldWidget.theme.data;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return EasyTheme(data: theme.data, child: child);
  }
}
