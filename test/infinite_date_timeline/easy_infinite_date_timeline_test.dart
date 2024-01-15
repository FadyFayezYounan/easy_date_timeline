import 'package:easy_date_timeline/src/easy_infinite_date_time/easy_infinite_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../testable_widget.dart';

void main() {
  group('EasyInfiniteDateTimeLine', () {
    testWidgets('Renders EasyInfiniteDateTimeLine widget',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        TestableWidget(
          child: EasyInfiniteDateTimeLine(
            firstDate: DateTime(2022, 1, 1),
            focusDate: DateTime(2022, 1, 15),
            lastDate: DateTime(2022, 12, 31),
          ),
        ),
      );

      expect(find.byType(EasyInfiniteDateTimeLine), findsOneWidget);
    });

    testWidgets('Calls onDateChange when selected date changes',
        (WidgetTester tester) async {
      DateTime? selectedDate;

      await tester.pumpWidget(
        TestableWidget(
          child: EasyInfiniteDateTimeLine(
            firstDate: DateTime(2022, 1, 1),
            lastDate: DateTime(2022, 1, 7),
            focusDate: DateTime(2022, 1, 3),
            onDateChange: (DateTime date) {
              selectedDate = date;
            },
          ),
        ),
      );

      await tester.tap(find.text('3'));
      expect(selectedDate, DateTime(2022, 1, 3));

      await tester.tap(find.text('5'));
      expect(selectedDate, DateTime(2022, 1, 5));
    });

    testWidgets('Renders custom header using headerBuilder',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        TestableWidget(
          child: EasyInfiniteDateTimeLine(
            firstDate: DateTime(2022, 1, 1),
            focusDate: DateTime(2022, 1, 15),
            lastDate: DateTime(2022, 12, 31),
            headerBuilder: (BuildContext context, DateTime date) {
              return SizedBox(
                height: 50,
                child: Text(date.day.toString()),
              );
            },
          ),
        ),
      );

      expect(find.byType(SizedBox), findsOneWidget);
      // one for the header and one for the selected date
      expect(find.text('15'), findsExactly(2));
    });
  });
}
