<p align="center">
<a href="https://pub.dev/packages/easy_date_timeline"><img src="https://img.shields.io/pub/v/easy_date_timeline.svg" alt="Pub"></a>
<a href="https://github.com/FadyFayezYounan/easy_date_timeline/stargazers"><img src="https://img.shields.io/github/stars/FadyFayezYounan/easy_date_timeline?style=social" alt="GitHub stars"></a>
<a href="https://pub.dev/packages/easy_date_timeline/score"><img src="https://img.shields.io/pub/likes/easy_date_timeline?logo=flutter" alt="Pub likes"></a>
<a href="https://pub.dev/packages/easy_date_timeline/score"><img src="https://img.shields.io/pub/popularity/easy_date_timeline?logo=flutter" alt="Pub popularity"></a>
<a href="https://pub.dev/packages/easy_date_timeline/score"><img src="https://img.shields.io/pub/points/easy_date_timeline?logo=flutter" alt="Pub points"></a>
</p>

# EasyDateTimelinePicker

`EasyDateTimeLinePicker` is a customizable date and time picker widget for Flutter applications. It provides a horizontal timeline interface for selecting dates, with various customization options for appearance and behavior.

![Easy Date Timeline Picker](https://raw.githubusercontent.com/FadyFayezYounan/easy_date_timeline/master/screenshots/easy_date_timeline_picker.png)

## Contents

- [EasyDateTimelinePicker](#easydatetimelinepicker)
  - [Contents](#contents)
  - [Getting Started](#getting-started)
  - [Basic Usage](#basic-usage)
  - [Constructors](#constructors)
    - [Default Constructor](#default-constructor)
    - [Custom Item Builder](#custom-item-builder)
  - [Properties](#properties)
  - [Examples](#examples)
    - [Selection Modes](#selection-modes)
    - [Localization](#localization)
    - [Disable Strategy](#disable-strategy)
    - [Day Parts Customization](#day-parts-customization)
    - [Header Options](#header-options)
    - [Timeline Options](#timeline-options)
    - [MonthYearPicker Options](#monthyearpicker-options)
    - [Controller](#controller)
  - [Themes](#themes)
    - [Change primary color](#change-primary-color)
    - [Change day backgroundColor](#change-day-backgroundcolor)
      - [First way Using `copyWith`](#first-way-using-copywith)
      - [Second way Using `copyWithState`](#second-way-using-copywithstate)
    - [Change current day backgroundColor](#change-current-day-backgroundcolor)
    - [Change border color](#change-border-color)
    - [How to use Theme with EasyTheme](#how-to-use-theme-with-easytheme)
    - [EasyThemeData class](#easythemedata-class)

## Getting Started

Add the `easy_date_timeline` package to `pubspec.yaml`:

`flutter pub add easy_date_timeline`

Import the package to use it:

```dart
import 'package:easy_date_timeline/easy_date_timeline.dart';
```

## Basic Usage

Use the `EasyDateTimeLinePicker` widget to display the date and time picker:

```dart
EasyDateTimeLinePicker(
  focusedDate: _selectedDate,
  firstDate: DateTime(2024, 3, 18),
  lastDate: DateTime(2030, 3, 18),
  onDateChange: (date) {
    // Handle the selected date.
  },
);
```

## Constructors

### Default Constructor

The default constructor provides a pre-defined layout with three day parts (top, middle, and bottom), which can be reordered or customized.

```dart
EasyDateTimeLinePicker(
  firstDate: DateTime(2025, 1, 1),
  lastDate: DateTime(2030, 3, 18),
  focusedDate: DateTime(2025, 6, 15),
  onDateChange: (date) {
    // Handle the selected date.
  },
);
```

### Custom Item Builder

The `itemBuilder` constructor allows you to fully customize each day item in the picker.

```dart
EasyDateTimeLinePicker.itemBuilder(
  firstDate: DateTime(2025, 1, 1),
  lastDate: DateTime(2030, 3, 18),
  focusedDate: _selectedDate,
  itemExtent: 64.0,
  itemBuilder: (context, date, isSelected, isDisabled, isToday, onTap) {
    return InkResponse(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: isSelected ? Colors.blue : null,
        child: Text(date.day.toString()),
      ),
    );
  },
  onDateChange: (date) {
    setState(() {
      _selectedDate = date;
    });
  },
)

```

## Properties

| Property                           | Type                               | Description                                                                                     |
| ---------------------------------- | ---------------------------------- | ----------------------------------------------------------------------------------------------- |
| `controller`                       | `EasyDatePickerController?`        | Controller for the date picker. Can be used to programmatically control the picker.             |
| `firstDate`                        | `DateTime`                         | The earliest date the user is permitted to pick.                                                |
| `lastDate`                         | `DateTime`                         | The latest date the user is permitted to pick.                                                  |
| `focusedDate`                      | `DateTime?`                        | The date to focus on when the picker is first displayed.                                        |
| `currentDate`                      | `DateTime`                         | The current date. Defaults to today's date if not provided.                                     |
| `itemExtent`                       | `double`                           | The width of each day item in the picker.                                                       |
| `daySeparatorPadding`              | `double`                           | The padding between day separators.                                                             |
| `_itemBuilder`                     | `ItemBuilderPickerCallBack?`       | Custom builder for day items. Only used when created with `EasyDateTimeLinePicker.itemBuilder`. |
| `headerBuilder`                    | `EasyPickerHeaderBuilderCallBack?` | Custom builder for the header of the picker.                                                    |
| `onDateChange`                     | `OnDateChangeCallBack?`            | Callback that is called when the selected date changes.                                         |
| `selectionMode`                    | `SelectionMode?`                   | Determines how the selected date is positioned in the picker.                                   |
| `locale`                           | `Locale?`                          | The locale to use for formatting dates, default locale is `en_US`.                              |
| `physics`                          | `ScrollPhysics?`                   | The scroll physics to use for the picker.                                                       |
| `disableStrategy`                  | `DisableStrategy`                  | Strategy for disabling certain dates in the picker.                                             |
| `dayPartsOrder`                    | `List<DayParts>`                   | The order of day parts to display. Only used when created with the default constructor.         |
| `ignoreUserInteractionOnAnimating` | `bool?`                            | Whether to ignore user interaction while the picker is animating, default is `true`.            |
| `timelineOptions`                  | `TimelineOptions?`                 | Additional options for customizing the timeline appearance.                                     |
| `headerType`                       | `HeaderType`                       | Defines the behavior and display of the header in the date timeline picker.                     |
| `monthYearPickerOptions`           | `MonthYearPickerOptions`           | Defines the options for the MonthYearPicker widget.                                             |

## Examples

### Selection Modes

The `selectionMode` property determines how the selected date is positioned in the picker.

```dart
EasyDateTimeLinePicker(
  // ... other properties
  selectionMode: SelectionMode.autoCenter(),
);
```

The available selection modes are:

- `SelectionMode.autoCenter()`: Automatically centers the selected date in the picker.

- `SelectionMode.alwaysFirst()`: Always displays the selected date as the first item in the picker.

- `SelectionMode.none()`: The timeline does not animate the selection.

### Localization

The `locale` property allows you to specify the locale to use for formatting dates in the picker.

```dart
EasyDateTimeLinePicker(
  // ... other properties
  locale: Locale('ar'), // Arabic locale
);
```

### Disable Strategy

The `disableStrategy` property allows you to define a strategy for disabling certain dates in the picker.

```dart
EasyDateTimeLinePicker(
  // ... other properties
  disableStrategy: DisableStrategy.beforeToday(),
);
```

The available disable strategies are:

1. `DisableStrategy.after(dateTime)`: Disable dates after the specified date.
2. `DisableStrategy.afterToday()`: Disable dates after today.
3. `DisableStrategy.before(dateTime)`: Disable dates before the specified date.
4. `DisableStrategy.beforeToday()`: Disable dates before today.
5. `DisableStrategy.all()`: Disable all dates.
6. `DisableStrategy.none()`: Disable no dates.
7. `DisableStrategy.list(List<DateTime>)`: Disable specific dates.
8. `DisableStrategy.inRange(dateTimeRange)`: Disable dates between two dates.
9. `DisableStrategy.ranges(ranges)`: Disable dates in a list of ranges.
10. `DisableStrategy.compose([DisableStrategy, DisableStrategy])`: Disable dates using multiple strategies.

> **Note that:**
>
> You can make your own custom `DisableStrategy` by extending the `DisableStrategy` class and implementing the `isDisabled` method.
>
> ```dart
> class CustomDisableStrategy extends DisableStrategy {
>   @override
>   bool isDisabled(DateTime date) {
>     // Your custom logic here
>     return false;
>   }
> }
> ```

### Day Parts Customization

The `dayPartsOrder` property allows you to customize the order of day parts in the picker.

```dart
EasyDateTimeLinePicker(
  // ... other properties
  dayPartsOrder: const [DayParts.top(), DayParts.middle()],
);
```

The available day parts are:

- `DayParts.top()`: The top part of the day item.
- `DayParts.middle()`: The middle part of the day item.
- `DayParts.bottom()`: The bottom part of the day item.

> **Note that:**
> You can change the format of the day part by passing the format to the `DayParts` constructor.
>
> ```dart
> DayParts.top('EEE') // Displays the day name abbreviation.
> ```

### Header Options

The `headerOptions` property allows you to customize the header of the picker.

```dart
EasyDateTimeLinePicker(
  // ... other properties
  headerOptions: HeaderOptions(
    headerType: HeaderType.picker, // default
  ),
);
```

The available header types are:

- `HeaderType.picker`: A clickable header that opens a month/year picker.
- `HeaderType.viewOnly`: A non-interactive header that just displays the date.
- `HeaderType.none`: No header is displayed.

You can also provide a custom header builder using the `headerBuilder` property:

```dart
EasyDateTimeLinePicker(
  // ... other properties
  headerOptions: HeaderOptions(
    headerBuilder: (context, date, onTap){
      return InkWell(onTap: onTap, child: Text(DateFormat.yMMMM().format(date)));
    }
  ),
);
```

> **Note that:**
> If you provide a custom header builder, the `headerType` property will be ignored.

### Timeline Options

The `timelineOptions` property allows you to customize the timeline of the picker.

```dart
EasyDateTimeLinePicker(
  // ... other properties
  timelineOptions: TimelineOptions(
    height: 200, // the height of the timeline
  ),
);
```

### MonthYearPicker Options

The `monthYearPickerOptions` property allows you to customize the monthYearPicker dialog.

```dart
EasyDateTimeLinePicker(
  // ... other properties
  monthYearPickerOptions: MonthYearPickerOptions(
    initialCalendarMode: EasyDatePickerMode.month, // default
    cancelText: 'Cancel',
    confirmText: 'Confirm',
    // ... other properties
  ),
);
```

### Controller

The `controller` property allows you to programmatically control the picker.

```dart
EasyDatePickerController controller = EasyDatePickerController();

EasyDateTimeLinePicker(
  // ... other properties
  controller: controller,
);

// Don't forget to dispose the controller when it's no longer needed.
@override
void dispose() {
  controller.dispose();
  super.dispose();
}
```

- controller methods:
  - `controller.jumpToDate()`: Jumps to a specific date.
  - `controller.animateToDate()`: Animates to a specific date.
  - `controller.jumpToFocusDate()`: Jumps to the focused date.
  - `controller.animateToFocusDate()`: Animates to the focused date.
  - `controller.jumpToCurrentDate()`: Jumps to the current date.
  - `controller.animateToCurrentDate()`: Animates to the current date.

## Themes

The `EasyDateTimeLinePicker` widget supports theming to customize the appearance of the picker.

### Change primary color

The primary color of the picker can be changed by wrapping the widget with a `Theme` widget and setting the `primaryColor` property.

```dart
Theme(
  data: Theme.of(context).copyWith(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
  ),
  child: EasyDateTimeLinePicker(
    // ... other properties
  ),
);
```

### Change day backgroundColor

#### First way Using `copyWith`

The background color of the day items can be customized using the `EasyTheme` widget. You can provide different colors for different widget states (selected, disabled, normal) using `WidgetStateProperty`:

```dart
EasyTheme(
  data: EasyTheme.of(context).copyWith(
    dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        // return the background color of the selected day
        return Colors.teal;
      } else if (states.contains(WidgetState.disabled)) {
        // return the background color of the disabled day
        return Colors.grey.shade100;
      }
      // return the background color of the normal day
      return Colors.white;
    }),
  ),
  child: EasyDateTimeLinePicker(
    // ... other properties
  ),
);
```

For more information about `WidgetStateProperty` and how to use it effectively, see:

- [WidgetStateProperty class documentation](https://api.flutter.dev/flutter/widgets/WidgetStateProperty-class.html)

> **Note that:**
> You can change the background color of day in a different way by using the `copyWithState` method.

#### Second way Using `copyWithState`

```dart
EasyTheme(
 data: EasyTheme.of(context).copyWithState(
    selectedDayTheme: const DayThemeData(
      backgroundColor: Colors.teal,
    ),
    unselectedDayTheme: const DayThemeData(
      backgroundColor: Colors.white,
    ),
    disabledDayTheme: DayThemeData(
      backgroundColor: Colors.grey.shade100,
    ),
  ),
  child: EasyDateTimeLinePicker(
    // ... other properties
  ),
);
```

> **Note that:**
> The `dayBackgroundColor` does not apply to the current day.
> to change the current day background color, use the `currentDayBackgroundColor` property.
> in the example below:

### Change current day backgroundColor

- First way Using `copyWith`

```dart
EasyTheme(
  data: EasyTheme.of(context).copyWith(
    currentDayBackgroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        // return the background color of the selected current day
        return Colors.teal;
      } else if (states.contains(WidgetState.disabled)) {
        // return the background color of the disabled day
        return Colors.grey.shade100;
      }
      // return the background color of the normal current day
      return Colors.white;
    }),
  ),
  child: EasyDateTimeLinePicker(
    // ... other properties
  ),
);
```

- Second way Using `copyWithState`

```dart
EasyTheme(
  data: EasyTheme.of(context).copyWithState(
    selectedCurrentDayTheme: const DayThemeData(
      backgroundColor: Colors.teal,
    ),
    unselectedCurrentDayTheme: const DayThemeData(
      backgroundColor: Colors.white,
    ),
    disabledCurrentDayTheme: DayThemeData(
      backgroundColor: Colors.grey.shade100,
    ),
  child: EasyDateTimeLinePicker(
    // ... other properties
    ),
  ),
);
```

### Change border color

- First way Using `copyWith`
  The border color of the picker can be changed by wrapping the widget with a `Theme` widget and setting the `dividerColor` property.

```dart
EasyTheme(
  data: EasyTheme.of(context).copyWith(
    dayBorder: WidgetStatePropertyAll(
      BorderSide(color: Colors.grey.shade100),
    ),
  ),
  child: EasyDateTimeLinePicker(
    // ... other properties
  ),
);
```

- Second way Using `copyWithState`

```dart
EasyTheme(
  data: EasyTheme.of(context).copyWithState(
     selectedCurrentDayTheme: DayThemeData(
       border: BorderSide(color: Colors.grey.shade100),
     ),
     unselectedCurrentDayTheme: DayThemeData(
       border: BorderSide(color: Colors.grey.shade100),
     ),
     disabledCurrentDayTheme: DayThemeData(
       border: BorderSide(color: Colors.grey.shade100),
     ),
  ),
  child: EasyDateTimeLinePicker(
    // ... other properties
  ),
);
```

### How to use Theme with EasyTheme

In case you want to use `Theme` with `EasyTheme`, here's an example:

```dart
Theme(
  data: Theme.of(context).copyWith(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
  ),
  child: Builder( // Don't forget to wrap the EasyTheme with Builder
    builder: (context) => EasyTheme(
      data: EasyTheme.of(context).copyWithState(
        // ... other properties
      ),
      child: EasyDateTimeLinePicker(
        // ... other properties
      ),
    ),
  ),
);
```

### EasyThemeData class

The `EasyThemeData` class contains many properties to customize the appearance of the date picker. Here's a comprehensive list:

| Property                           | Type                                   | Description                                    |
| ---------------------------------- | -------------------------------------- | ---------------------------------------------- |
| `dayBackgroundColor`               | `WidgetStateProperty<Color?>`          | Background color for regular days              |
| `currentDayBackgroundColor`        | `WidgetStateProperty<Color?>`          | Background color for the current day           |
| `monthBackgroundColor`             | `WidgetStateProperty<Color?>`          | Background color for month items               |
| `currentMonthBackgroundColor`      | `WidgetStateProperty<Color?>`          | Background color for current month             |
| `yearBackgroundColor`              | `WidgetStateProperty<Color?>`          | Background color for year items                |
| `currentYearBackgroundColor`       | `WidgetStateProperty<Color?>`          | Background color for current year              |
| `dayForegroundColor`               | `WidgetStateProperty<Color?>`          | Text color for regular days                    |
| `currentDayForegroundColor`        | `WidgetStateProperty<Color?>`          | Text color for current day                     |
| `monthForegroundColor`             | `WidgetStateProperty<Color?>`          | Text color for months                          |
| `currentMonthForegroundColor`      | `WidgetStateProperty<Color?>`          | Text color for current month                   |
| `yearForegroundColor`              | `WidgetStateProperty<Color?>`          | Text color for years                           |
| `currentYearForegroundColor`       | `WidgetStateProperty<Color?>`          | Text color for current year                    |
| `dayShape`                         | `WidgetStateProperty<OutlinedBorder?>` | Shape of day items                             |
| `currentDayShape`                  | `WidgetStateProperty<OutlinedBorder?>` | Shape of current day item                      |
| `monthShape`                       | `WidgetStateProperty<OutlinedBorder?>` | Shape of month items                           |
| `currentMonthShape`                | `WidgetStateProperty<OutlinedBorder?>` | Shape of current month item                    |
| `yearShape`                        | `WidgetStateProperty<OutlinedBorder?>` | Shape of year items                            |
| `currentYearShape`                 | `WidgetStateProperty<OutlinedBorder?>` | Shape of current year item                     |
| `overlayColor`                     | `WidgetStateProperty<Color?>`          | Color of the overlay effect on interaction     |
| `dayBorder`                        | `WidgetStateProperty<BorderSide?>`     | Border style for regular days                  |
| `currentDayBorder`                 | `WidgetStateProperty<BorderSide?>`     | Border style for current day                   |
| `monthBorder`                      | `WidgetStateProperty<BorderSide?>`     | Border style for months                        |
| `currentMonthBorder`               | `WidgetStateProperty<BorderSide?>`     | Border style for current month                 |
| `yearBorder`                       | `WidgetStateProperty<BorderSide?>`     | Border style for years                         |
| `currentYearBorder`                | `WidgetStateProperty<BorderSide?>`     | Border style for current year                  |
| `dayMiddlePartStyle`               | `WidgetStateProperty<TextStyle?>`      | Text style for middle part of days             |
| `currentDayMiddlePartStyle`        | `WidgetStateProperty<TextStyle?>`      | Text style for middle part of current day      |
| `dayTopPartStyle`                  | `WidgetStateProperty<TextStyle?>`      | Text style for top part of days                |
| `currentDayTopPartStyle`           | `WidgetStateProperty<TextStyle?>`      | Text style for top part of current day         |
| `dayBottomPartStyle`               | `WidgetStateProperty<TextStyle?>`      | Text style for bottom part of days             |
| `currentDayBottomPartStyle`        | `WidgetStateProperty<TextStyle?>`      | Text style for bottom part of current day      |
| `monthStyle`                       | `WidgetStateProperty<TextStyle?>`      | Text style for months                          |
| `currentMonthStyle`                | `WidgetStateProperty<TextStyle?>`      | Text style for current month                   |
| `yearStyle`                        | `WidgetStateProperty<TextStyle?>`      | Text style for years                           |
| `currentYearStyle`                 | `WidgetStateProperty<TextStyle?>`      | Text style for current year                    |
| `locale`                           | `Locale`                               | Localization settings                          |
| `selectionMode`                    | `SelectionMode`                        | Mode for date selection behavior               |
| `ignoreUserInteractionOnAnimating` | `bool`                                 | Whether to ignore user input during animations |
| `timelineOptions`                  | `TimelineOptions`                      | Configuration options for timeline display     |
