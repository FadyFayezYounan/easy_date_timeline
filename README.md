# EasyDateTimeline

<!-- [![Pub](https://img.shields.io/pub/v/date_picker_timeline?color=%232bb6f6)](https://pub.dev/packages/date_picker_timeline) -->

The "easy_date_timeline" package is a customizable Flutter library that displays a timeline of dates in a horizontal timeline.

<p>
 <img src=""/>
</p>

## How To Use

Import the following package in your dart file

```dart
import 'package:easy_date_timeline/easy_date_timeline.dart';
```

## Usage

This version is breaking backwards compatibility

Use the `EasyDateTimeLine` Widget

```dart
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        EasyDateTimeLine(
          initialDate: DateTime.now(),
        ),
      ],
    )
```

##### Constructor:

```dart
  EasyDateTimeLine({
    super.key,
    required this.initialDate,
    this.activeColor,
    this.headerProps,
    this.timeLineProps,
    this.dayProps,
    this.onDateChange,
    this.itemBuilder,
    this.locale = "en_US",
  });
```

Author
------

* [Fady Fayez](https://github.com/FadyFayezYounan)
