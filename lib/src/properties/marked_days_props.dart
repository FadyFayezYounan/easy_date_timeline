import 'package:easy_date_timeline/src/properties/day_style.dart';

final class MarkedDaysProps{
  ///
  MarkedDaysProps({
    required this.dates,
    required this.style,
  });
  
  /// Day list for special style
  final List<DateTime> dates;

  /// Special style for dates from date list
  final DayStyle style;
}