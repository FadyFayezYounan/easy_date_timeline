# EasyDateTimeline

<!-- [![Pub](https://img.shields.io/pub/v/date_picker_timeline?color=%232bb6f6)](https://pub.dev/packages/date_picker_timeline) -->

The "easy_date_timeline" package is a customizable Flutter library that displays a timeline of dates in a horizontal timeline.

<p>
 <img src="https://github.com/FadyFayezYounan/easy_date_timeline/blob/master/screenshots/example_1.jpg"/>
</p>

## How To Use

Import the following package in your dart file

```dart
import 'package:easy_date_timeline/easy_date_timeline.dart';
```

## Usage

Use the `EasyDateTimeLine` Widget

```dart
   Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EasyDateTimeLine(
            initialDate: DateTime.now(),
            onDateChange: (selectedDate) {
              //[selectedDate] the new date selected.
            },
          ),
        ],
      ),
```
## Custom background

Use the `dayProps` that contains decoration
for both active and inactive day.

<p>
 <img src="https://github.com/FadyFayezYounan/easy_date_timeline/blob/master/screenshots/example_2.jpg"/>
</p>

```dart
 Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EasyDateTimeLine(
            initialDate: DateTime.now(),
            onDateChange: (selectedDate) {
              //[selectedDate] the new date selected.
            },
            dayProps: const EasyDayProps(
              activeDayDecoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff3371FF),
                    Color(0xff8426D6),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
```
## Change day structure

In the `dayProps` change the `dayStructure` to:
* DayStructure.dayNumDayStr : show the current day number then current day name.
* DayStructure.dayStrDayNum : show the current name then current day number.
* DayStructure.monthDayNumDayStr : show current month name then the current day number finally current day name.
* DayStructure.dayStrDayNumMonth : show current day name then the current day number finally current moth name.

<p>
 <img src="https://github.com/FadyFayezYounan/easy_date_timeline/blob/master/screenshots/example_3.jpg"/>
</p>

```dart
       Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EasyDateTimeLine(
            initialDate: DateTime.now(),
            activeColor: const Color(0xffFFBF9B),
            dayProps: const EasyDayProps(
              dayStructure: DayStructure.dayNumDayStr,
              inactiveBorderRadius: 48.0,
              height: 56.0,
              width: 56.0,
              activeDayNumStyle: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              inactiveDayNumStyle: TextStyle(
                fontSize: 18.0,
              ),
            ),
          )
        ],
      ),
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
