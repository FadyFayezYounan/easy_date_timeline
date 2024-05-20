import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

class ChangeDayStructureExample extends StatelessWidget {
  const ChangeDayStructureExample({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyDateTimeLine(
      initialDate: DateTime.now(),
      onDateChange: (selectedDate) {
        //`selectedDate` the new date selected.
      },
      activeColor: const Color(0xffFFBF9B),
      headerProps: const EasyHeaderProps(
        dateFormatter: DateFormatter.monthOnly(),
      ),
      dayProps: const EasyDayProps(
        height: 56.0,
        width: 56.0,
        dayStructure: DayStructure.dayNumDayStr,
        inactiveDayStyle: DayStyle(
          borderRadius: 48.0,
          dayNumStyle: TextStyle(
            fontSize: 18.0,
          ),
        ),
        activeDayStyle: DayStyle(
          dayNumStyle: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
