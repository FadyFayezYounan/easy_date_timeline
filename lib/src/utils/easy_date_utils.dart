import 'package:flutter/material.dart' show DateUtils;

import '../models/models.dart';
import 'utils.dart';

abstract final class EasyDateUtils {
  static int getDaysInMonth(DateTime date) {
    return DateUtils.getDaysInMonth(date.year, date.month);
  }

  static bool isCurrentMonth(DateTime date) {
    final now = DateTime.now();
    return DateUtils.isSameMonth(date, now);
  }

  static bool isSameDay(DateTime dateA, DateTime dateB) {
    return DateUtils.isSameDay(dateA, dateB);
  }

  static List<EasyMonth> getYearMonths(DateTime date, String locale) {
    final List<EasyMonth> months = [];
    //DateTime date = DateTime(_date.year);
    for (int month = 1; month <= 12; month++) {
      months.add(EasyMonth(
        name: EasyDateFormatter.shortMonthName(
            DateTime(date.year, month), locale),
        vale: month,
      ));
    }
    return months;
  }

  static EasyMonth convertDateToEasyMonth(DateTime date, String locale) {
    return EasyMonth(
      name: EasyDateFormatter.shortMonthName(
          DateTime(date.year, date.month), locale),
      vale: date.month,
    );
  }
}
