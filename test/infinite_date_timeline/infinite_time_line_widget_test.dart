import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:easy_date_timeline/src/easy_infinite_date_time/widgets/infinite_time_line_widget.dart';
import 'package:easy_date_timeline/src/utils/easy_constants.dart';
import 'package:easy_date_timeline/src/widgets/easy_day_widget/easy_day_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../testable_widget.dart';

void main() {
  group('InfiniteTimeLineWidget', () {
    testWidgets('Renders correctly with default props',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        TestableWidget(
          child: InfiniteTimeLineWidget(
            firstDate: DateTime(2022, 1, 1),
            lastDate: DateTime(2022, 1, 7),
            focusedDate: DateTime(2022, 1, 3),
            activeDayTextColor: Colors.black,
            activeDayColor: Colors.blue,
            selectionMode: const SelectionMode.autoCenter(),
          ),
        ),
      );
      expect(find.byType(InfiniteTimeLineWidget), findsOneWidget);

      // Find the Scrollable
      final listViewFinder = find.descendant(
        of: find.byType(CustomScrollView),
        matching: find.byType(Scrollable),
      );

      // Find the last Container in the list
      final lastEasyDayFinder = find.byWidgetPredicate(
        (Widget widget) =>
            widget is EasyDayWidget && widget.date == DateTime(2022, 1, 7),
      );

      // Scroll through the list until the last EasyDayWidget is visible
      await tester.scrollUntilVisible(
          lastEasyDayFinder, (7 * EasyConstants.dayWidgetHeight),
          scrollable: listViewFinder);
      await tester.pumpAndSettle();
      expect(find.byType(InfiniteTimeLineWidget), findsOneWidget);
      expect(find.byType(CustomScrollView), findsOneWidget);
      expect(find.byType(SliverFixedExtentList), findsOneWidget);
      expect(find.byType(InfiniteTimeLineWidget), findsOneWidget);
      expect(find.byType(EasyDayWidget), findsExactly(7));
    });

    testWidgets('Calls onDateChange callback when a day is pressed',
        (WidgetTester tester) async {
      DateTime? selectedDate;

      await tester.pumpWidget(
        TestableWidget(
          child: InfiniteTimeLineWidget(
            firstDate: DateTime(2022, 1, 1),
            lastDate: DateTime(2022, 1, 7),
            focusedDate: DateTime(2022, 1, 3),
            activeDayTextColor: Colors.black,
            activeDayColor: Colors.blue,
            onDateChange: (date) {
              selectedDate = date;
            },
            selectionMode: const SelectionMode.autoCenter(),
          ),
        ),
      );

      await tester.tap(find.text('3'));
      expect(selectedDate, DateTime(2022, 1, 3));

      await tester.tap(find.text('5'));
      expect(selectedDate, DateTime(2022, 1, 5));
    });

    testWidgets('Renders custom day widgets when itemBuilder is provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        TestableWidget(
          child: InfiniteTimeLineWidget(
            firstDate: DateTime(2022, 1, 1),
            lastDate: DateTime(2022, 1, 7),
            focusedDate: DateTime(2022, 1, 3),
            activeDayTextColor: Colors.black,
            activeDayColor: Colors.blue,
            itemBuilder: (
              context,
              date,
              isSelected,
              onTap,
            ) {
              return Container(
                key: ValueKey('Container ${date.day}'),
                width: 50,
                height: 50,
                color: isSelected ? Colors.blue : Colors.transparent,
                child: Center(
                  child: Text(
                    date.day.toString(),
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              );
            },
            selectionMode: const SelectionMode.autoCenter(),
          ),
        ),
      );
      expect(find.byType(InfiniteTimeLineWidget), findsOneWidget);
      // Find the Scrollable
      final listViewFinder = find.descendant(
        of: find.byType(CustomScrollView),
        matching: find.byType(Scrollable),
      );

      // Find the last Container in the list
      final lastContainerFinder = find.byWidgetPredicate(
        (Widget widget) =>
            widget is Container && widget.key == const ValueKey('Container 7'),
      );

      // Scroll through the list until the last Container is visible
      await tester.scrollUntilVisible(lastContainerFinder, 350,
          scrollable: listViewFinder);
      await tester.pumpAndSettle();

      expect(find.byType(Center), findsNWidgets(7));
      expect(find.byType(Text), findsNWidgets(7));
      expect(find.text('1'), findsOneWidget);
      expect(find.text('2'), findsOneWidget);
      expect(find.text('3'), findsOneWidget);
      expect(find.text('4'), findsOneWidget);
      expect(find.text('5'), findsOneWidget);
      expect(find.text('6'), findsOneWidget);
      expect(find.text('7'), findsOneWidget);
    });
  });
}
