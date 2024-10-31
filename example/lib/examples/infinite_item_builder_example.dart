import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

class InfiniteItemBuilderExample extends StatefulWidget {
  const InfiniteItemBuilderExample({super.key});

  @override
  State<InfiniteItemBuilderExample> createState() =>
      _InfiniteItemBuilderExampleState();
}

class _InfiniteItemBuilderExampleState
    extends State<InfiniteItemBuilderExample> {
  final EasyInfiniteDateTimelineController _controller =
      EasyInfiniteDateTimelineController();
  DateTime? _focusDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final fillColor = Theme.of(context).colorScheme.primary;
    return EasyInfiniteDateTimeLine(
      selectionMode: const SelectionMode.autoCenter(),
      controller: _controller,
      firstDate: DateTime(2024),
      focusDate: _focusDate,
      lastDate: DateTime(2024, 12, 31),
      onDateChange: (selectedDate) {
        setState(() {
          _focusDate = selectedDate;
        });
      },
      dayProps: const EasyDayProps(
        // You must specify the width in this case.
        width: 64.0,
        // The height is not required in this case.
        height: 64.0,
      ),
      itemBuilder: (
        BuildContext context,
        DateTime date,
        bool isSelected,
        VoidCallback onTap,
      ) {
        return InkResponse(
          // You can use `InkResponse` to make your widget clickable.
          // The `onTap` callback responsible for triggering the `onDateChange`
          // callback and animating to the selected date if the `selectionMode` is
          // SelectionMode.autoCenter() or SelectionMode.alwaysFirst().
          onTap: onTap,
          child: CircleAvatar(
            // use `isSelected` to specify whether the widget is selected or not.
            backgroundColor:
                isSelected ? fillColor : fillColor.withOpacity(0.1),
            radius: 32.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    date.day.toString(),
                    style: TextStyle(
                      color: isSelected ? Colors.white : null,
                    ),
                  ),
                ),
                Flexible(
                  child: Text(
                    EasyDateFormatter.shortDayName(date, "en_US"),
                    style: TextStyle(
                      color: isSelected ? Colors.white : null,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
