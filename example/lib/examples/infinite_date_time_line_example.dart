import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

class EasyInfiniteDateTimeLineExample extends StatefulWidget {
  const EasyInfiniteDateTimeLineExample({super.key});

  @override
  State<EasyInfiniteDateTimeLineExample> createState() =>
      _EasyInfiniteDateTimeLineExampleState();
}

class _EasyInfiniteDateTimeLineExampleState
    extends State<EasyInfiniteDateTimeLineExample> {
  /// Controller for the infinite date time line.
  ///
  /// This controller is used to control the infinite date time line. It provides
  /// methods to animate to a specific date and jump to a specific date.
  final EasyInfiniteDateTimelineController _controller =
      EasyInfiniteDateTimelineController();

  DateTime? _focusDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EasyInfiniteDateTimeLine(
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
        ),
        const SizedBox(
          height: 16,
        ),
        Column(
          children: [
            ElevatedButton(
              onPressed: () {
                _controller.animateToFocusDate();
              },
              child: const Text('Animate To Focus Date'),
            ),
            ElevatedButton(
              onPressed: () {
                _controller.animateToCurrentData();
              },
              child: const Text('Animate To Current Date'),
            ),
            ElevatedButton(
              onPressed: () {
                _controller.animateToDate(DateTime(2024, 6, 5));
                setState(() {
                  _focusDate = DateTime(2024, 6, 5);
                });
              },
              child: const Text('Animate To 2024-6-5 '),
            ),
          ],
        ),
      ],
    );
  }
}
