import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

class EasyInfiniteDateTimeLineMarkedExample extends StatefulWidget {
  const EasyInfiniteDateTimeLineMarkedExample({super.key});

  @override
  State<EasyInfiniteDateTimeLineMarkedExample> createState() =>
      _EasyInfiniteDateTimeLineMarkedExampleState();
}

class _EasyInfiniteDateTimeLineMarkedExampleState
    extends State<EasyInfiniteDateTimeLineMarkedExample> {
  ///
  static final List<DateTime> _firstMarkedDates = [
    DateTime.now().add(const Duration(days: 1)),
    DateTime.now().add(const Duration(days: -1)),
  ];

  ///
  static final MarkedDaysProps _fisrtMarkedDays = MarkedDaysProps(
    dates: _firstMarkedDates,
    style: const DayStyle(
      backgroundColor: Colors.green,
    ),
  );

  ///
  static final List<DateTime> _secondMarkedDates = [
    DateTime.now().add(const Duration(days: 3)),
    DateTime.now().add(const Duration(days: -5)),
  ];

  ///
  static final MarkedDaysProps _secondMarkedDays = MarkedDaysProps(
    dates: _secondMarkedDates,
    style: DayStyle(
      decoration: BoxDecoration(
        color: Colors.red,
        border: Border.all(color: Colors.purple),
        borderRadius: BorderRadius.circular(80),
      ),
    ),
  );


  DateTime? _focusDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EasyInfiniteDateTimeLine(
          selectionMode: const SelectionMode.autoCenter(),
          firstDate: DateTime(2024),
          focusDate: _focusDate,
          lastDate: DateTime(2024, 12, 31),
          markedDatesList: [_fisrtMarkedDays, _secondMarkedDays],
          onDateChange: (selectedDate) {
            setState(() {
              _focusDate = selectedDate;
            });
          },
        ),
      ],
    );
  }
}
