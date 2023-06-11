import 'package:flutter/material.dart';

import '../../models/easy_month.dart';
import '../../utils/utils.dart';

class EasyMonthDropDown extends StatelessWidget {
  const EasyMonthDropDown({
    super.key,
    this.value,
    this.onMonthChange,
    required this.locale,
  });
  final EasyMonth? value;
  final OnMonthChangeCallBack? onMonthChange;
  final String locale;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<EasyMonth>(
        borderRadius: const BorderRadius.all(
          Radius.circular(
            EasyConstants.monthDropDownRadius,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        elevation: EasyConstants.monthDropDownElevation,
        value: value,
        items: EasyDateUtils.getYearMonths(DateTime.now(), locale)
            .map(
              (month) => DropdownMenuItem<EasyMonth>(
                value: month,
                child: Text(month.name),
              ),
            )
            .toList(),
        onChanged: onMonthChange,
      ),
    );
  }
}
