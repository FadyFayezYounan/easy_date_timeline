import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

class ThemingExample extends StatefulWidget {
  const ThemingExample({super.key});

  @override
  State<ThemingExample> createState() => _NewWidgetExampleState();
}

class _NewWidgetExampleState extends State<ThemingExample> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context)
          .copyWith(colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal)),
      child: Builder(
        builder: (context) {
          return EasyTheme(
            data: EasyTheme.of(context).copyWith(
              timelineOptions: const TimelineOptions(
                height: 64.0,
              ),
              currentDayShape: const WidgetStatePropertyAll(CircleBorder()),
              dayShape: const WidgetStatePropertyAll(CircleBorder()),
              dayBorder: WidgetStatePropertyAll(
                BorderSide(
                  color: Colors.teal.shade50,
                ),
              ),
            ),
            child: EasyDateTimeLinePicker(
              firstDate: DateTime.now(),
              lastDate: DateTime(2030, 3, 18),
              focusedDate: _selectedDate,
              onDateChange: (selectedDate) {
                setState(() {
                  _selectedDate = selectedDate;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
