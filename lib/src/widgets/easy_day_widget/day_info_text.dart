import 'package:flutter/material.dart';

/// A widget that displays a text string with an optional text style.
class DayInfoText extends StatelessWidget {
  const DayInfoText({
    super.key,
    required this.text,
    this.textStyle,
  });

  /// The text to display.
  final String text;

  /// The style to use for the text.
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: FittedBox(
        alignment: Alignment.center,
        fit: BoxFit.scaleDown,
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}
