import 'package:easy_date_timeline/src/easy_infinite_date_time/widgets/easy_infinite_header.dart';
import 'package:easy_date_timeline/src/easy_infinite_date_time/widgets/selected_full_date.dart';
import 'package:easy_date_timeline/src/widgets/easy_date_timeline_widget/selected_date_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../testable_widget.dart';

void main() {
  group('EasyInfiniteHeaderWidget', () {
    final firstDate = DateTime(2022, 1, 1);
    const locale = 'en_US';
    const hPadding = 16.0;

    testWidgets('renders SelectedDateWidget and SelectedFullDateWidget',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        TestableWidget(
          child: EasyInfiniteHeaderWidget(
            firstDate: firstDate,
            locale: locale,
            hPadding: hPadding,
          ),
        ),
      );

      expect(find.byType(SelectedDateWidget), findsOneWidget);
      expect(find.byType(SelectedFullDateWidget), findsOneWidget);
    });

    testWidgets('uses focusDate if provided', (WidgetTester tester) async {
      final focusDate = DateTime(2022, 1, 15);

      await tester.pumpWidget(
        TestableWidget(
          child: EasyInfiniteHeaderWidget(
            focusDate: focusDate,
            firstDate: firstDate,
            locale: locale,
            hPadding: hPadding,
          ),
        ),
      );
      expect(find.byType(EasyInfiniteHeaderWidget), findsOneWidget);
      expect(find.text('Saturday'), findsOneWidget);
      expect(find.text('15/01/2022'), findsOneWidget);
    });

    testWidgets('uses firstDate if focusDate is null',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        TestableWidget(
          child: EasyInfiniteHeaderWidget(
            firstDate: firstDate,
            locale: locale,
            hPadding: hPadding,
          ),
        ),
      );

      expect(find.text('Saturday'), findsOneWidget);
      expect(find.text('01/01/2022'), findsOneWidget);
    });

    testWidgets('uses custom headerBuilder if provided',
        (WidgetTester tester) async {
      final focusDate = DateTime(2022, 1, 15);

      await tester.pumpWidget(
        TestableWidget(
          child: EasyInfiniteHeaderWidget(
            focusDate: focusDate,
            firstDate: firstDate,
            locale: locale,
            hPadding: hPadding,
            headerBuilder: (context, date) {
              return Text('Custom Header: ${date.day}');
            },
          ),
        ),
      );
      expect(find.byType(EasyInfiniteHeaderWidget), findsOneWidget);
      expect(find.text('Custom Header: 15'), findsOneWidget);
    });
  });
}
