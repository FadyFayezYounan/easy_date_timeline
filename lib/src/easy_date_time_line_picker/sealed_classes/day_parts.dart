sealed class DayParts {
  /// A sealed class representing different parts of a day, allowing customizable formatting.
  ///
  /// The `DayParts` class is sealed, meaning it has a fixed number of subclasses
  /// that represent different parts of the day: top, middle, and bottom.
  ///
  /// Each subclass can take an optional `format` string that defines how
  /// the part of the day should be formatted (e.g., month, day, or day of the week).
  const DayParts(this.format);

  /// The format used to display the part of the day.
  final String format;

  @override
  String toString() => 'DayParts($format)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DayParts &&
          runtimeType == other.runtimeType &&
          format == other.format;

  @override
  int get hashCode => format.hashCode;

  /// Creates a `TopDayPart` instance representing the top part of the day.
  ///
  /// The default format is `"MMM"` (month abbreviation).
  const factory DayParts.top([String format]) = TopDayPart;

  /// Creates a `BottomDayPart` instance representing the bottom part of the day.
  ///
  /// The default format is `"E"` (day of the week abbreviation).
  const factory DayParts.bottom([String format]) = BottomDayPart;

  /// Creates a `MiddleDayPart` instance representing the middle part of the day.
  ///
  /// The default format is `"d"` (day number).
  const factory DayParts.middle([String format]) = MiddleDayPart;
}

/// Represents the top part of the day, formatted by default as the month abbreviation.
final class TopDayPart extends DayParts {
  /// Constructs a `TopDayPart` with an optional `format` string.
  ///
  /// The default format is `"MMM"` (month abbreviation).
  const TopDayPart([String format = 'MMM']) : super(format);
}

/// Represents the middle part of the day, formatted by default as the day number.
final class MiddleDayPart extends DayParts {
  /// Constructs a `MiddleDayPart` with an optional `format` string.
  ///
  /// The default format is `"d"` (day number).
  const MiddleDayPart([String format = 'd']) : super(format);
}

/// Represents the bottom part of the day, formatted by default as the day of the week.
final class BottomDayPart extends DayParts {
  /// Constructs a `BottomDayPart` with an optional `format` string.
  ///
  /// The default format is `"E"` (day of the week abbreviation).
  const BottomDayPart([String format = 'E']) : super(format);
}
