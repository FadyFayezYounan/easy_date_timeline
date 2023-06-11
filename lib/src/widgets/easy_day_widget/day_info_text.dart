import 'package:flutter/material.dart';

class DayInfoText extends StatelessWidget {
  const DayInfoText({
    super.key,
    required this.text,
    this.textStyle,
  });

  final String text;
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
