import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        EasyDateTimeLine(
          initialDate: DateTime.now(),
        ),
      ],
    );
  }
}
