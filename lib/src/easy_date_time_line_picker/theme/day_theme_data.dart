import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'
    show Color, BorderSide, OutlinedBorder, TextStyle;

class DayThemeData with Diagnosticable {
  /// A class that defines the visual properties for a Day widget theme.
  ///
  /// This class includes various properties to customize the appearance
  /// of a Day widget, such as background and foreground colors, shape,
  /// border, and text styles for different parts of the widget.
  const DayThemeData({
    this.backgroundColor,
    this.foregroundColor,
    this.shape,
    this.border,
    this.middleElementStyle,
    this.topElementStyle,
    this.bottomElementStyle,
  });

  /// The background color of the Day widget.
  final Color? backgroundColor;

  /// The foreground color of the Day widget, typically used for text or icons.
  final Color? foregroundColor;

  /// The shape of the Day widget, represented as an [OutlinedBorder].
  final OutlinedBorder? shape;

  /// The border of the Day widget, defined as a [BorderSide].
  final BorderSide? border;

  /// The text style for the top element of the Day widget.
  final TextStyle? topElementStyle;

  /// The text style for the middle element of the Day widget.
  final TextStyle? middleElementStyle;

  /// The text style for the bottom element of the Day widget.
  final TextStyle? bottomElementStyle;

  /// Creates a copy of this [DayThemeData] but with the given fields
  /// replaced with new values.
  ///
  /// If any of the parameters are null, the existing values will be retained.
  DayThemeData copyWith({
    Color? backgroundColor,
    Color? foregroundColor,
    OutlinedBorder? shape,
    BorderSide? border,
    TextStyle? topElementStyle,
    TextStyle? middleElementStyle,
    TextStyle? bottomElementStyle,
  }) {
    return DayThemeData(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      shape: shape ?? this.shape,
      border: border ?? this.border,
      topElementStyle: topElementStyle ?? this.topElementStyle,
      middleElementStyle: middleElementStyle ?? this.middleElementStyle,
      bottomElementStyle: bottomElementStyle ?? this.bottomElementStyle,
    );
  }

  @override
  bool operator ==(covariant DayThemeData other) {
    if (identical(this, other)) return true;

    return other.backgroundColor == backgroundColor &&
        other.foregroundColor == foregroundColor &&
        other.shape == shape &&
        other.border == border &&
        other.topElementStyle == topElementStyle &&
        other.middleElementStyle == middleElementStyle &&
        other.bottomElementStyle == bottomElementStyle;
  }

  @override
  int get hashCode {
    return backgroundColor.hashCode ^
        foregroundColor.hashCode ^
        shape.hashCode ^
        border.hashCode ^
        topElementStyle.hashCode ^
        middleElementStyle.hashCode ^
        bottomElementStyle.hashCode;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
        .add(DiagnosticsProperty<Color?>('backgroundColor', backgroundColor));
    properties
        .add(DiagnosticsProperty<Color?>('foregroundColor', foregroundColor));
    properties.add(DiagnosticsProperty<OutlinedBorder?>('shape', shape));
    properties.add(DiagnosticsProperty<BorderSide?>('border', border));
    properties.add(
        DiagnosticsProperty<TextStyle?>('topElementStyle', topElementStyle));
    properties.add(DiagnosticsProperty<TextStyle?>(
        'middleElementStyle', middleElementStyle));
    properties.add(DiagnosticsProperty<TextStyle?>(
        'bottomElementStyle', bottomElementStyle));
    super.debugFillProperties(properties);
  }
}
