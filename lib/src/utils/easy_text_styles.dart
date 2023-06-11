import 'package:flutter/material.dart' show TextStyle, FontWeight;

import 'utils.dart';

final class EasyTextStyles {
  EasyTextStyles._();
  static const TextStyle dayAsNumStyle = TextStyle(
    fontSize: EasyConstants.dayAsNumFontSize,
    fontWeight: FontWeight.bold,
    color: EasyColors.dayAsNumColor,
  );
  static const TextStyle dayAsStrStyle = TextStyle(
    fontSize: EasyConstants.dayAsStrFontSize,
    color: EasyColors.dayAsStrColor,
  );
  static const TextStyle monthAsStrStyle = TextStyle(
    fontSize: EasyConstants.monthAsStrFontSize,
    color: EasyColors.monthAsStrColor,
  );
  static const TextStyle selectedDateStyle = TextStyle(
    fontSize: EasyConstants.selectedDateFontSize,
    fontWeight: FontWeight.bold,
    color: EasyColors.dayAsNumColor,
  );
}
