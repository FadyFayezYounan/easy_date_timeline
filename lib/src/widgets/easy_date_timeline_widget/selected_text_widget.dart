import 'package:flutter/material.dart';

import '../../properties/properties.dart';
import '../../utils/utils.dart';

class SelectedTextWidget extends StatelessWidget {
  const SelectedTextWidget({
    super.key,
    required this.date,
    this.headerProps,
    required this.locale,
  });

  final DateTime date;
  final String locale;
  final EasyHeaderProps? headerProps;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible:
          (headerProps == null ? true : headerProps!.showSelectedDate == true),
      child: Text(
        headerProps != null
            ? EasyDateFormatter.customFormat(
                headerProps!.selectedDateFormat.formatter, date, locale)
            : EasyDateFormatter.fullDayName(
                date,
                locale,
              ),
        style:
            headerProps?.selectedDateStyle ?? EasyTextStyles.selectedDateStyle,
      ),
    );
  }
}
