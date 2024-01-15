import 'package:easy_date_timeline/src/properties/date_formatter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DateFormatter', () {
    test('DayOnlyFormatter format returns "EEEE"', () {
      const formatter = DayOnlyFormatter();
      final result = formatter.format();
      expect(result, "EEEE");
    });

    test('MonthOnlyFormatter format returns "MMMM"', () {
      const formatter = MonthOnlyFormatter();
      final result = formatter.format();
      expect(result, "MMMM");
    });

    test('FullDateDMYFormatter format returns "dd/MM/yyyy"', () {
      const formatter = FullDateDMYFormatter();
      final result = formatter.format();
      expect(result, "dd/MM/yyyy");
    });

    test('FullDateMDYFormatter format returns "MM/dd/yyyy"', () {
      const formatter = FullDateMDYFormatter();
      final result = formatter.format();
      expect(result, "MM/dd/yyyy");
    });

    test('FullDateDayAsStrMYFormatter format returns "EEEE M,y"', () {
      const formatter = FullDateDayAsStrMYFormatter();
      final result = formatter.format();
      expect(result, "EEEE M,y");
    });

    test('FullDateDMonthAsStrYFormatter format returns "d MMMM, yyyy"', () {
      const formatter = FullDateDMonthAsStrYFormatter();
      final result = formatter.format();
      expect(result, "d MMMM, yyyy");
    });

    test('FullDateMonthAsStrDYFormatter format returns "MMMM d, yyyy"', () {
      const formatter = FullDateMonthAsStrDYFormatter();
      final result = formatter.format();
      expect(result, "MMMM d, yyyy");
    });

    test('CustomFormatter format returns the specified formatter', () {
      const formatter = CustomFormatter("EEEE M,y");
      final result = formatter.format();
      expect(result, "EEEE M,y");
    });
  });
}
