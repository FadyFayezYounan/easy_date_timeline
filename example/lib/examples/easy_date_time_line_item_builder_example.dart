import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

class EasyDateTimeLineItemBuilderExample extends StatelessWidget {
  const EasyDateTimeLineItemBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyDateTimeLine(
      initialDate: DateTime.now(),
      onDateChange: (selectedDate) {
        //`selectedDate` the new date selected.
      },
      dayProps: const EasyDayProps(
        height: 56.0,
        // You must specify the width in this case.
        width: 124.0,
      ),
      headerProps: const EasyHeaderProps(
        dateFormatter: DateFormatter.fullDateMonthAsStrDY(),
      ),
      itemBuilder: (BuildContext context, String dayNumber, dayName, monthName,
          fullDate, isSelected) {
        return Container(
          //the same width that provided previously.
          width: 124.0,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xffFF6D60) : null,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                monthName,
                style: TextStyle(
                  fontSize: 12,
                  color: isSelected ? Colors.white : const Color(0xff6D5D6E),
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Text(
                dayNumber,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : const Color(0xff393646),
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Text(
                dayName,
                style: TextStyle(
                  fontSize: 12,
                  color: isSelected ? Colors.white : const Color(0xff6D5D6E),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
