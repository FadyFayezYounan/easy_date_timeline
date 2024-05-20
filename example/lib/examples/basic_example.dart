import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

class BasicExample extends StatelessWidget {
  const BasicExample({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyDateTimeLine(
      initialDate: DateTime.now(),
      onDateChange: (selectedDate) {
        //`selectedDate` the new date selected.
      },
    );
  }
}
