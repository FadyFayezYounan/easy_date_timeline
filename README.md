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
## Features
* `Dynamic Text Color` : The "easy_date_timeline" package automatically adjusts the text color of the active day based on the active color. If the active color is a dark color, the text color will be light, and if the active color is a light color, the text color will be dark. This ensures that the text is always easy to read and contrasts well with the background color.
* `Customizable Item Builder` : The "easy_date_timeline" package provides an item builder that allows for full customization of the timeline items. With the item builder, developers can customize the appearance and behavior of each date item in the timeline, including the text, background color,etc..
* `Locale Support` : The "easy_date_timeline" package supports locale, allowing developers to display the timeline in different languages and formats based on the user's device settings. This feature ensures that the package can be used in a variety of international contexts and provides a seamless user experience for users around the world.

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
* `DayStructure.dayNumDayStr` : show the current day number then current day name.
* `DayStructure.dayStrDayNum` : show the current name then current day number.
* `DayStructure.monthDayNumDayStr` : show current month name then the current day number finally current day name.
* `DayStructure.dayStrDayNumMonth` : show current day name then the current day number finally current moth name.

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
## Change header appearance

In the `headerProps` change the `monthPickerType` to:
* `MonthPickerType.switcher` : show the month and you can change month by clicking the arrow buttons.
* `MonthPickerType.dropDown` : show the month and you can change month from a dropdown menu.
also in the `headerProps` change the `selectedDateFormat` to:
* `SelectedDateFormat.fullDateDMY` : show the data as:`11/7/2023`
* `SelectedDateFormat.fullDateDayAsStrMY` : show the data as:`Sunday 6,2023`
* `SelectedDateFormat.fullDateDMonthAsStrY` : show the data as:`11 June,2023`
* `SelectedDateFormat.fullDateDMonthAsStrY` : show the data as:`11 June,2023`
* `SelectedDateFormat.dayOnly` : show the only the selected day as:`Sunday`
* `SelectedDateFormat.monthOnly` : show the only the selected month as:`June`

<p>
 <img src="https://github.com/FadyFayezYounan/easy_date_timeline/blob/master/screenshots/example_4.jpg"/>
</p>

```dart
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EasyDateTimeLine(
            initialDate: DateTime.now(),
            activeColor: const Color(0xff37306B),
            headerProps: const EasyHeaderProps(
              monthPickerType: MonthPickerType.switcher,
              selectedDateFormat: SelectedDateFormat.fullDateDMY,
            ),
            dayProps: const EasyDayProps(
              activeBorderRadius: 32.0,
              inactiveBorderRadius: 32.0,
            ),
            timeLineProps: const TimeLineProps(
              padding: 16.0, // padding from left and right
              separatorPadding: 16.0, // padding between days
            ),
          ),
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
