import 'package:flutter/material.dart';

import '../../properties/properties.dart';
import '../../utils/utils.dart';

/// Represents a header widget for displaying the name of a month and year.
class SelectedDateWidget extends StatelessWidget {
  const SelectedDateWidget({
    super.key,
    required this.date,
    this.headerProps,
    required this.locale,
  });

  /// Represents the date for the month header.
  final DateTime date;

  /// A `String` that represents the locale code to use for formatting the month name in the header.
  final String locale;

  /// Contains properties for configuring the appearance and behavior of the month header.
  final EasyHeaderProps? headerProps;

  @override
  Widget build(BuildContext context) {
    //  This code conditionally displays the selected date in the header of the EasyDateTimeLineWidget
    //  based on the showSelectedDate property of the headerProps object
    //  and formats it according to the selected date format.
    return Visibility(
      visible:
          (headerProps == null ? true : headerProps!.showSelectedDate == true),
      child: Text(
        _getDateFormat(),
        style:
            headerProps?.selectedDateStyle ?? EasyTextStyles.selectedDateStyle,
      ),
    );
  }

  String _getDateFormat() {
    if (headerProps == null) {
      return EasyDateFormatter.fullDayName(
        date,
        locale,
      );
    } else {
      if (headerProps!.dateFormatter != null) {
        return EasyDateFormatter.customFormat(
          headerProps!.dateFormatter!.format(),
          date,
          locale,
        );
      } else {
        // TODO: Remove this deprecated code after v1.0.2
        return EasyDateFormatter.customFormat(
          headerProps!.selectedDateFormat.formatter,
          date,
          locale,
        );
      }
    }
  }
}
