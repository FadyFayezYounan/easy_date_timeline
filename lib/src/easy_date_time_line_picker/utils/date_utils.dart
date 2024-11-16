import 'package:flutter/material.dart';

/// Generates an iterable sequence of `DateTime` objects representing each day
/// in the month of the given `date`.
///
/// The function uses a synchronous generator to yield each day in the month
/// one by one.
///
/// Example:
/// ```dart
/// DateTime date = DateTime(2023, 10, 1);
/// Iterable<DateTime> days = generateMonthDays(date);
/// for (DateTime day in days) {
///   print(day);
/// }
/// ```
///
/// - Parameter date: The `DateTime` object representing the month and year
///   for which the days are to be generated.
/// - Returns: An iterable sequence of `DateTime` objects for each day in the
///   specified month.
Iterable<DateTime> generateMonthDays(DateTime date) sync* {
  final daysInMonth = DateUtils.getDaysInMonth(date.year, date.month);
  for (int day = 1; day <= daysInMonth; day++) {
    yield DateTime(date.year, date.month, day);
  }
}

/// Generates an iterable sequence of `DateTime` objects representing each day
/// in the year of the given `date`.
///
/// The function uses a synchronous generator to yield each day in the year
/// one by one.
///
/// Example:
/// ```dart
/// DateTime date = DateTime(2023, 1, 1);
/// Iterable<DateTime> days = generateYearDays(date);
/// for (DateTime day in days) {
///  print(day);
/// }
/// ```
///
/// - Parameter date: The `DateTime` object representing the year for which the
///  days are to be generated.
/// - Returns: An iterable sequence of `DateTime` objects for each day in the
Iterable<DateTime> generateYearDays(DateTime date) sync* {
  for (int month = 1; month <= 12; month++) {
    yield* generateMonthDays(DateTime(date.year, month));
  }
}
