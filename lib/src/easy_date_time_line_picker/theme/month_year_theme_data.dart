import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'
    show Color, BorderSide, OutlinedBorder, TextStyle;

class MonthYearThemeData with Diagnosticable {
  /// A class that defines the visual properties for a Month or Year widgets theme.
  ///
  /// This class includes various properties to customize the appearance
  /// of a Month or Year widgets, such as background and foreground colors, shape,
  /// border, and text styles of the widget.
  const MonthYearThemeData({
    this.backgroundColor,
    this.foregroundColor,
    this.shape,
    this.border,
    this.textStyle,
  });

  /// The background color of the Day widget.
  final Color? backgroundColor;

  /// The foreground color of the Day widget, typically used for text or icons.
  final Color? foregroundColor;

  /// The shape of the Day widget, represented as an [OutlinedBorder].
  final OutlinedBorder? shape;

  /// The border of the Day widget, defined as a [BorderSide].
  final BorderSide? border;

  /// The text style for the top part of the Day widget.
  final TextStyle? textStyle;

  /// Creates a copy of this [MonthYearThemeData] but with the given fields
  /// replaced with new values.
  ///
  /// If any of the parameters are null, the existing values will be retained.
  MonthYearThemeData copyWith({
    Color? backgroundColor,
    Color? foregroundColor,
    OutlinedBorder? shape,
    BorderSide? border,
    TextStyle? textStyle,
  }) {
    return MonthYearThemeData(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      shape: shape ?? this.shape,
      border: border ?? this.border,
      textStyle: textStyle ?? this.textStyle,
    );
  }

  @override
  bool operator ==(covariant MonthYearThemeData other) {
    if (identical(this, other)) return true;

    return other.backgroundColor == backgroundColor &&
        other.foregroundColor == foregroundColor &&
        other.shape == shape &&
        other.border == border &&
        other.textStyle == textStyle;
  }

  @override
  int get hashCode {
    return backgroundColor.hashCode ^
        foregroundColor.hashCode ^
        shape.hashCode ^
        border.hashCode ^
        textStyle.hashCode;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
        .add(DiagnosticsProperty<Color?>('backgroundColor', backgroundColor));
    properties
        .add(DiagnosticsProperty<Color?>('foregroundColor', foregroundColor));
    properties.add(DiagnosticsProperty<OutlinedBorder?>('shape', shape));
    properties.add(DiagnosticsProperty<BorderSide?>('border', border));
    properties.add(DiagnosticsProperty<TextStyle?>('topPartStyle', textStyle));
    super.debugFillProperties(properties);
  }
}
