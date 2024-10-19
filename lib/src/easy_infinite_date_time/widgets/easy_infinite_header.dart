import 'package:flutter/material.dart';

import '../../easy_date_time_line_picker/utils/typed_ahead.dart';
import '../../widgets/easy_date_timeline_widget/selected_date_widget.dart';
import 'selected_full_date.dart';

class EasyInfiniteHeaderWidget extends StatelessWidget {
  /// A widget that displays the header of the EasyInfiniteDateTimeline.
  ///
  /// The header consists of two components: SelectedDateWidget and SelectedFullDateWidget.
  /// The SelectedDateWidget displays the selected date, while the SelectedFullDateWidget
  /// displays the selected date in a more detailed format.
  const EasyInfiniteHeaderWidget({
    super.key,
    this.focusDate,
    required this.firstDate,
    required this.locale,
    required this.hPadding,
    this.headerBuilder,
  });

  /// The [focusDate] parameter represents the currently focused date, which is the date
  /// that is currently selected. If no date is selected, it defaults to [firstDate].
  final DateTime? focusDate;

  /// The [firstDate] parameter represents the first date in the timeline.
  final DateTime firstDate;

  /// The [locale] parameter represents the locale used for formatting the date.
  final String locale;

  /// The [hPadding] parameter represents the horizontal padding for the header.
  final double hPadding;

  final HeaderBuilderCallBack? headerBuilder;

  @override
  Widget build(BuildContext context) {
    if (headerBuilder != null) {
      return headerBuilder!(context, (focusDate ?? firstDate));
    }
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: hPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FittedBox(
            child: SelectedDateWidget(
              date: focusDate ?? firstDate,
              locale: locale,
            ),
          ),
          FittedBox(
            child: SelectedFullDateWidget(
              date: focusDate ?? firstDate,
              locale: locale,
            ),
          ),
        ],
      ),
    );
  }
}
