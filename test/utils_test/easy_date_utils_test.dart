import 'package:easy_date_timeline/src/utils/easy_date_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EasyDateUtils', () {
    test('getDaysInMonth returns correct number of days', () {
      final date = DateTime(2022, 1, 1);
      final daysInMonth = EasyDateUtils.getDaysInMonth(date);
      expect(daysInMonth, 31);
    });

    test('isSameDay returns true for same day', () {
      final dateA = DateTime(2022, 1, 1);
      final dateB = DateTime(2022, 1, 1);
      final isSameDay = EasyDateUtils.isSameDay(dateA, dateB);
      expect(isSameDay, true);
    });

    test('isSameDay returns false for different days', () {
      final dateA = DateTime(2022, 1, 1);
      final dateB = DateTime(2022, 1, 2);
      final isSameDay = EasyDateUtils.isSameDay(dateA, dateB);
      expect(isSameDay, false);
    });

    test('getYearMonths returns list of EasyMonth objects', () {
      final date = DateTime(2022, 1, 1);
      const locale = 'en_US';
      final yearMonths = EasyDateUtils.getYearMonths(date, locale);
      expect(yearMonths.length, 12);
      expect(yearMonths[0].name, 'Jan');
      expect(yearMonths[0].vale, 1);
      expect(yearMonths[11].name, 'Dec');
      expect(yearMonths[11].vale, 12);
    });

    test('convertDateToEasyMonth returns EasyMonth object', () {
      final date = DateTime(2022, 1, 1);
      const locale = 'en_US';
      final easyMonth = EasyDateUtils.convertDateToEasyMonth(date, locale);
      expect(easyMonth.name, 'Jan');
      expect(easyMonth.vale, 1);
    });

    test('isToday returns true for current date', () {
      final date = DateTime.now();
      final isToday = EasyDateUtils.isToday(date);
      expect(isToday, true);
    });

    test('isToday returns false for non-current date', () {
      final date = DateTime(2022, 1, 1);
      final isToday = EasyDateUtils.isToday(date);
      expect(isToday, false);
    });

    test('calculateDaysCount returns correct count of days', () {
      final firstDate = DateTime(2022, 1, 1);
      final lastDate = DateTime(2022, 1, 7);
      final daysCount = EasyDateUtils.calculateDaysCount(firstDate, lastDate);
      expect(daysCount, 7);
    });
  });
}
