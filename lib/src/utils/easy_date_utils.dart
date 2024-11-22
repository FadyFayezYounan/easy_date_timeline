import 'package:flutter/material.dart' show DateUtils;

import '../models/models.dart';
import 'utils.dart';

/// A utility class that provides easy access to commonly used date-related functions in the `EasyDateTimeLine` widget.
abstract class EasyDateUtils {
  /// Returns the number of days in the month of the given date.
  static int getDaysInMonth(DateTime date) {
    return DateUtils.getDaysInMonth(date.year, date.month);
  }

  /// Returns whether the given two dates represent the same day or not.
  static bool isSameDay(DateTime dateA, DateTime dateB) {
    return DateUtils.isSameDay(dateA, dateB);
  }

  /// Returns a list of `EasyMonth` objects representing the 12 months of the year in the specified locale.
  static List<EasyMonth> getYearMonths(DateTime date, String locale) {
    final List<EasyMonth> months = [];
    for (int month = 1; month <= 12; month++) {
      months.add(
        EasyMonth(
          name: EasyDateFormatter.shortMonthName(
              DateTime(date.year, month), locale),
          vale: month,
        ),
      );
    }
    return months;
  }

  /// Converts the given date to an `EasyMonth` object in the specified locale.
  static EasyMonth convertDateToEasyMonth(DateTime date, String locale) {
    return EasyMonth(
      name: EasyDateFormatter.shortMonthName(
          DateTime(date.year, date.month), locale),
      vale: date.month,
    );
  }

  /// function that takes a DateTime object as input and returns a boolean value
  /// indicating whether it is the current date or not.
  static bool isToday(DateTime date) {
    DateTime now = DateTime.now();
    return isSameDay(now, date);
  }

  /// Calculates the number of days between the [firstDate] and [lastDate] inclusive.
  /// Returns the count of days.
  static int calculateDaysCount(DateTime firstDate, DateTime lastDate) {
    return (lastDate.difference(firstDate).inHours / Duration.hoursPerDay).round() + 1;
  }

  /// Calculates the number of days between the [firstDate] and [lastDate] inclusive.
  /// Returns the count of days.
  static int getDaysBetween(DateTime firstDate, DateTime lastDate) {
    return (lastDate.toDateOnly().difference(firstDate.toDateOnly()).inHours / Duration.hoursPerDay).round() + 1;
  }
}
