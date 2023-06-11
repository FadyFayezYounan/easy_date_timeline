import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../../utils/utils.dart';

class EasyMonthSwitcher extends StatefulWidget {
  const EasyMonthSwitcher({
    super.key,
    required this.locale,
    required this.value,
    this.onMonthChange,
  });
  final String locale;
  final EasyMonth? value;
  final OnMonthChangeCallBack? onMonthChange;

  @override
  State<EasyMonthSwitcher> createState() => _EasyMonthSwitcherState();
}

class _EasyMonthSwitcherState extends State<EasyMonthSwitcher> {
  List<EasyMonth> _yearMonths = [];
  int _currentMonth = 0;
  @override
  void initState() {
    super.initState();
    _yearMonths = EasyDateUtils.getYearMonths(DateTime.now(), widget.locale);
    _currentMonth = widget.value != null ? ((widget.value!.vale - 1)) : 0;
  }

  bool get _isLastMonth => _currentMonth == _yearMonths.length - 1;
  bool get _isFirstMonth => _currentMonth == 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: screenWidth * 0.3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: IconButton(
              onPressed: () {
                if (_isFirstMonth) {
                  return;
                }
                _currentMonth--;
                widget.onMonthChange?.call(_yearMonths[_currentMonth]);
              },
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: _isFirstMonth ? Colors.grey : null,
              ),
            ),
          ),
          Expanded(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                _yearMonths[_currentMonth].name,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Flexible(
            child: IconButton(
              onPressed: () {
                if (_isLastMonth) {
                  return;
                }
                _currentMonth++;
                widget.onMonthChange?.call(_yearMonths[_currentMonth]);
              },
              icon: Icon(
                Icons.arrow_forward_ios_rounded,
                color: _isLastMonth ? Colors.grey : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
