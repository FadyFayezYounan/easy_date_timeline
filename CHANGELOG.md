## 1.1.4

The first release of the fork (github.com/AlexSeednov/easy_date_timeline), cut
from 1.1.3. The original package went on to 2.0.x, whose new
`EasyDateTimeLinePicker` has no marked days either, so the fork stays.

- **Marked days**, already in the fork since 1.1.3 but never written down:
  `EasyInfiniteDateTimeLine.markedDatesList` takes `MarkedDaysProps` — a list of
  dates and the `DayStyle` they are drawn with. A marked day yields to the
  selected, disabled and today styles; a date listed twice takes the first
  style. `DayStyle.backgroundColor` changes only the fill of the default
  decoration, and the text colour of a day follows the brightness of its final
  fill instead of the active colour alone.
- `intl` is a range (`>=0.19.0 <0.21.0`) instead of an exact version:
  `flutter_localizations` pins it to the release its SDK ships, and an exact
  pin here fought that on every Flutter upgrade of an application.
- `Color.withOpacity` replaced with `withValues`, as the original did in 2.0.5.
- FVM pinned to Flutter 3.44.4, the SDK the applications on this stack build
  with.

## 1.1.3

- Update readme file.

## 1.1.2

- Update `EasyDateTimeLine` itemBuilder.

## 1.1.1

- Update readme file.

## 1.1.0

- Update `EasyInfiniteDateTimeLine` itemBuilder.

## 1.0.7

- Enhance `EasyInfiniteDateTimeLine` `autoCenter` and `alwaysFirst` mode scroll behavior.

- Add `physics` property to `EasyInfiniteDateTimeLine` widget.

## 1.0.6

- Add `SelectionMode` to `EasyInfiniteDateTimeLine` widget.
- The `selectionMode` specifies how the timeline should behave when the selected date changes.
  It can be set to one of the following values:
  - `SelectionMode.none()`: The timeline does not animate the selection.
  - `SelectionMode.autoCenter()`: The timeline automatically centers the selected date.
  - `SelectionMode.alwaysFirst()`: The timeline always positions the selected date at the first visible day of the timeline.
  - (Thanks to @yagizdo) for implementing `SelectionMode.autoCenter()`.

## 1.0.5

- Fix easy date timeline widget Scroll Behavior issue on Web (Thanks to @juanccalzadilla).

- Fix EasyInfiniteDateTimeLine locale issue (Thanks to @yagizdo).

## 1.0.4

- update intl package to 0.19.0.

## 1.0.3

- add header builder to `EasyInfiniteDateTimeLine` widget and custom date format for the selected date to `EasyDateTimeLine` header widget.

## 1.0.2

- fix bug with the last day of the current month. (thanks to @Mustafa7Ibrahim and @applegold)

## 1.0.1

- hide 12px gap when the showTimelineHeader is false in EasyInfiniteDateTimeLine widget.

## 1.0.0

- Add new widget: `EasyInfiniteDateTimeLine` , It allows you to define a range of dates with `firstDate` and `lastDate`, specify the initial focus with `focusedDate`, and offers a `controller` for programmatic interactions. This widget is ideal for creating dynamic and interactive date-based interfaces in your Flutter app.

## 0.1.1

- Resolved an issue concerning months that do not have 30 days. (thanks to @RobertoFMBarreto)

## 0.1.0

- New Feature: `EasyDateTimeline` now includes support for disabled days. In addition, some variable names have been updated, and the old ones have been marked as deprecated

## 0.0.7

- add text style for the month picker.

## 0.0.6

- add highlight style for the current day (highlight today border or background color or none).

## 0.0.5

- add highlight color for the current day.

## 0.0.4

- add package screenshot.

## 0.0.3

- add landscape day view and two new day structures.

## 0.0.2

- update package images.

## 0.0.1

- Initial release.
