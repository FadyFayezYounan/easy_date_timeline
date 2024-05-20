import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

class ChangeTodyHighlightColorExample extends StatelessWidget {
  const ChangeTodyHighlightColorExample({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyDateTimeLine(
      initialDate: DateTime.now(),
      onDateChange: (selectedDate) {
        //`selectedDate` the new date selected.
      },
      activeColor: const Color(0xff85A389),
      dayProps: const EasyDayProps(
        todayHighlightStyle: TodayHighlightStyle.withBackground,
        todayHighlightColor: Color(0xffE1ECC8),
      ),
    );
  }
}
