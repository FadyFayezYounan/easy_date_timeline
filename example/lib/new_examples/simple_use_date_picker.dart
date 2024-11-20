import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

class SimpleUseExample extends StatefulWidget {
  const SimpleUseExample({super.key});

  @override
  State<SimpleUseExample> createState() => _NewWidgetExampleState();
}

class _NewWidgetExampleState extends State<SimpleUseExample> {
  final _now = DateTime.now();
  DateTime _selectedDate = DateTime(2024, 3, 18);
  late final EasyDatePickerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = EasyDatePickerController();
  }

  @override
  void dispose() {
    // do not forget to dispose the controller
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        EasyDateTimeLinePicker(
          controller: _controller,
          firstDate: DateTime(2024, 3, 18),
          lastDate: DateTime(2030, 3, 18),
          focusedDate: _selectedDate,
          onDateChange: (selectedDate) {
            setState(() {
              _selectedDate = selectedDate;
            });
          },
        ),
        const SizedBox(height: 32.0),
        ElevatedButton(
          onPressed: () {
            _controller.animateToFocusDate();
          },
          child: const Text('Animate To Focus Date'),
        ),
        const SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () {
            _controller.animateToCurrentDate();
          },
          child: const Text('Animate To Current Date'),
        ),
        const SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () {
            _controller.animateToDate(DateTime(_now.year + 1, 6, 5));
          },
          child: Text('Animate To ${_now.year + 1}-6-5 '),
        ),
      ],
    );
  }
}
