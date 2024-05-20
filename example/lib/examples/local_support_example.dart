import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

class LocalSupportExample extends StatelessWidget {
  const LocalSupportExample({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyDateTimeLine(
      initialDate: DateTime.now(),
      onDateChange: (selectedDate) {
        //`selectedDate` the new date selected.
      },
      activeColor: const Color(0xffB04759),
      locale: "ar",
    );
  }
}
