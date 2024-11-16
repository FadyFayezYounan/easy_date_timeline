import 'package:flutter/material.dart';

import '../enums/enums.exports.dart';
import '../utils/utils.exports.dart';

class MonthYearPickerOptions {
  /// A class that defines the options for the MonthYearPicker widget.
  ///
  /// The [MonthYearPickerOptions] class allows customization of various aspects
  /// of the MonthYearPicker widget, including initial calendar mode, button texts
  /// and styles, barrier properties, and more.
  ///
  /// The following properties can be customized:
  ///
  /// * [initialCalendarMode]: The initial mode of the calendar (month or year).
  /// * [cancelText]: The text for the cancel button.
  /// * [confirmText]: The text for the confirm button.
  /// * [cancelTextStyle]: The text style for the cancel button.
  /// * [confirmTextStyle]: The text style for the confirm button.
  /// * [cancelButtonBuilder]: A custom builder for the cancel button.
  /// * [confirmButtonBuilder]: A custom builder for the confirm button.
  /// * [barrierDismissible]: Whether the picker can be dismissed by tapping outside.
  /// * [barrierColor]: The color of the modal barrier.
  /// * [barrierLabel]: The semantic label for the modal barrier.
  /// * [useRootNavigator]: Whether to use the root navigator.
  /// * [routeSettings]: The settings for the route.
  /// * [textDirection]: The text direction for the picker.
  /// * [builder]: A custom builder for the picker.
  ///
  /// Example usage:
  /// ```dart
  /// MonthYearPickerOptions(
  ///   initialCalendarMode: EasyDatePickerMode.month,
  ///   cancelText: 'Cancel',
  ///   confirmText: 'Confirm',
  ///   cancelTextStyle: TextStyle(color: Colors.red),
  ///   confirmTextStyle: TextStyle(color: Colors.green),
  ///   barrierDismissible: true,
  ///   barrierColor: Colors.black54,
  ///   useRootNavigator: true,
  /// );
  /// ```
  const MonthYearPickerOptions({
    this.initialCalendarMode = EasyDatePickerMode.month,
    this.cancelText,
    this.confirmText,
    this.cancelTextStyle,
    this.confirmTextStyle,
    this.cancelButtonBuilder,
    this.confirmButtonBuilder,
    this.barrierDismissible = true,
    this.barrierColor,
    this.barrierLabel,
    this.useRootNavigator = true,
    this.routeSettings,
    this.textDirection,
    this.builder,
  });
  final EasyDatePickerMode initialCalendarMode;
  final String? cancelText;
  final String? confirmText;
  final TextStyle? cancelTextStyle;
  final TextStyle? confirmTextStyle;
  final MonthYearPickerCancelButtonBuilder? cancelButtonBuilder;
  final MonthYearPickerConfirmButtonBuilder? confirmButtonBuilder;
  final bool barrierDismissible;
  final Color? barrierColor;
  final String? barrierLabel;
  final bool useRootNavigator;
  final RouteSettings? routeSettings;
  final TextDirection? textDirection;
  final TransitionBuilder? builder;

  @override
  String toString() {
    return 'MonthYearPickerOptions(initialCalendarMode: $initialCalendarMode, cancelText: $cancelText, confirmText: $confirmText, cancelTextStyle: $cancelTextStyle, confirmTextStyle: $confirmTextStyle, cancelButtonBuilder: $cancelButtonBuilder, confirmButtonBuilder: $confirmButtonBuilder, barrierDismissible: $barrierDismissible, barrierColor: $barrierColor, barrierLabel: $barrierLabel, useRootNavigator: $useRootNavigator, routeSettings: $routeSettings, textDirection: $textDirection, builder: $builder)';
  }

  @override
  bool operator ==(covariant MonthYearPickerOptions other) {
    if (identical(this, other)) return true;

    return other.initialCalendarMode == initialCalendarMode &&
        other.cancelText == cancelText &&
        other.confirmText == confirmText &&
        other.cancelTextStyle == cancelTextStyle &&
        other.confirmTextStyle == confirmTextStyle &&
        other.cancelButtonBuilder == cancelButtonBuilder &&
        other.confirmButtonBuilder == confirmButtonBuilder &&
        other.barrierDismissible == barrierDismissible &&
        other.barrierColor == barrierColor &&
        other.barrierLabel == barrierLabel &&
        other.useRootNavigator == useRootNavigator &&
        other.routeSettings == routeSettings &&
        other.textDirection == textDirection &&
        other.builder == builder;
  }

  @override
  int get hashCode {
    return initialCalendarMode.hashCode ^
        cancelText.hashCode ^
        confirmText.hashCode ^
        cancelTextStyle.hashCode ^
        confirmTextStyle.hashCode ^
        cancelButtonBuilder.hashCode ^
        confirmButtonBuilder.hashCode ^
        barrierDismissible.hashCode ^
        barrierColor.hashCode ^
        barrierLabel.hashCode ^
        useRootNavigator.hashCode ^
        routeSettings.hashCode ^
        textDirection.hashCode ^
        builder.hashCode;
  }
}
