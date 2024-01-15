import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:easy_date_timeline/src/widgets/easy_day_widget/easy_day_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EasyDayWidget', () {
    testWidgets('EasyDayWidget renders correctly with default props',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: EasyDayWidget(
              date: DateTime(2022, 1, 1),
              locale: 'en_US',
              isSelected: false,
              isDisabled: false,
              onDayPressed: () {},
              activeTextColor: Colors.black,
              activeDayColor: Colors.blue,
            ),
          ),
        ),
      );

      expect(find.byType(EasyDayWidget), findsOneWidget);
      expect(find.byType(Text), findsExactly(3));
      expect(find.text('1'), findsOneWidget);
      expect(find.text('SAT'), findsOneWidget);
      expect(find.text('JAN'), findsOneWidget);
    });

    // New test case
    testWidgets('EasyDayWidget calls onDayPressed callback when pressed',
        (WidgetTester tester) async {
      bool callbackCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: EasyDayWidget(
              date: DateTime(2022, 1, 1),
              locale: 'en_US',
              isSelected: false,
              isDisabled: false,
              onDayPressed: () {
                callbackCalled = true;
              },
              activeTextColor: Colors.black,
              activeDayColor: Colors.blue,
            ),
          ),
        ),
      );
      final dayWidget = find.byType(EasyDayWidget);
      await tester.tap(dayWidget);
      expect(callbackCalled, true);
    });

    // New test case
    testWidgets(
        'EasyDayWidget renders correctly when selected and dayStructure is dayNumberOnly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: EasyDayWidget(
              easyDayProps: const EasyDayProps(
                dayStructure: DayStructure.dayNumberOnly,
              ),
              date: DateTime(2022, 1, 1),
              locale: 'en_US',
              isSelected: true,
              isDisabled: false,
              onDayPressed: () {},
              activeTextColor: Colors.black,
              activeDayColor: Colors.blue,
            ),
          ),
        ),
      );

      expect(find.byType(EasyDayWidget), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);
      expect(find.text('1'), findsOneWidget);
    });

    // New test case
    testWidgets(
        'EasyDayWidget renders correctly when disabled and dayStructure is dayStrDayNum',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: EasyDayWidget(
              easyDayProps: const EasyDayProps(
                dayStructure: DayStructure.dayStrDayNum,
              ),
              date: DateTime(2022, 1, 1),
              locale: 'en_US',
              isSelected: false,
              isDisabled: true,
              onDayPressed: () {},
              activeTextColor: Colors.black,
              activeDayColor: Colors.blue,
            ),
          ),
        ),
      );

      expect(find.byType(EasyDayWidget), findsOneWidget);
      expect(find.byType(Text), findsExactly(2));
      expect(find.text('1'), findsOneWidget);
      expect(find.text('SAT'), findsOneWidget);
    });
  });
}
