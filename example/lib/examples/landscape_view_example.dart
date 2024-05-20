import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

class LandscapeViewExample extends StatelessWidget {
  const LandscapeViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyDateTimeLine(
      initialDate: DateTime.now(),
      onDateChange: (selectedDate) {
        //`selectedDate` the new date selected.
      },
      activeColor: const Color(0xff116A7B),
      dayProps: const EasyDayProps(
        landScapeMode: true,
        activeDayStyle: DayStyle(
          borderRadius: 48.0,
        ),
        dayStructure: DayStructure.dayStrDayNum,
      ),
      headerProps: const EasyHeaderProps(
        dateFormatter: DateFormatter.fullDateDMonthAsStrY(),
      ),
    );
  }
}
