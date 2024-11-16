sealed class DayElement {
  /// A sealed class representing different parts of a day, allowing customizable formatting.
  ///
  /// The `DayParts` class is sealed, meaning it has a fixed number of subclasses
  /// that represent different parts of the day: top, middle, and bottom.
  ///
  /// Each subclass can take an optional `format` string that defines how
  /// the part of the day should be formatted (e.g., month, day, or day of the week).
  const DayElement(this.format);

  /// The format used to display the part of the day.
  final String format;

  @override
  String toString() => 'DayElement($format)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DayElement &&
          runtimeType == other.runtimeType &&
          format == other.format;

  @override
  int get hashCode => format.hashCode;

  /// Creates a `TopDayPart` instance representing the top part of the day.
  ///
  /// The default format is `"MMM"` (month abbreviation).
  const factory DayElement.top([String format]) = TopDayElement;

  /// Creates a `BottomDayPart` instance representing the bottom part of the day.
  ///
  /// The default format is `"E"` (day of the week abbreviation).
  const factory DayElement.bottom([String format]) = BottomDayElement;

  /// Creates a `MiddleDayPart` instance representing the middle part of the day.
  ///
  /// The default format is `"d"` (day number).
  const factory DayElement.middle([String format]) = MiddleDayElement;
}

/// Represents the top part of the day, formatted by default as the month abbreviation.
final class TopDayElement extends DayElement {
  /// Constructs a `TopDayPart` with an optional `format` string.
  ///
  /// The default format is `"MMM"` (month abbreviation).
  const TopDayElement([String format = 'MMM']) : super(format);
}

/// Represents the middle part of the day, formatted by default as the day number.
final class MiddleDayElement extends DayElement {
  /// Constructs a `MiddleDayPart` with an optional `format` string.
  ///
  /// The default format is `"d"` (day number).
  const MiddleDayElement([String format = 'd']) : super(format);
}

/// Represents the bottom part of the day, formatted by default as the day of the week.
final class BottomDayElement extends DayElement {
  /// Constructs a `BottomDayPart` with an optional `format` string.
  ///
  /// The default format is `"E"` (day of the week abbreviation).
  const BottomDayElement([String format = 'E']) : super(format);
}
