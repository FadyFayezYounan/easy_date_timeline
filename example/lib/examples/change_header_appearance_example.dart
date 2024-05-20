import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

class ChangeHeaderAppearanceExample extends StatelessWidget {
  const ChangeHeaderAppearanceExample({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyDateTimeLine(
      initialDate: DateTime.now(),
      onDateChange: (selectedDate) {
        //`selectedDate` the new date selected.
      },
      activeColor: const Color(0xff37306B),
      headerProps: const EasyHeaderProps(
        monthPickerType: MonthPickerType.switcher,
        dateFormatter: DateFormatter.fullDateDayAsStrMY(),
      ),
      dayProps: const EasyDayProps(
        activeDayStyle: DayStyle(
          borderRadius: 32.0,
        ),
        inactiveDayStyle: DayStyle(
          borderRadius: 32.0,
        ),
      ),
      timeLineProps: const EasyTimeLineProps(
        hPadding: 16.0, // padding from left and right
        separatorPadding: 16.0, // padding between days
      ),
    );
  }
}
