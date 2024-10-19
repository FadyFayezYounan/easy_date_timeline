import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'dart:math' as math show max;

import '../../utils/utils.exports.dart';

const double _innerPadding = 4.0;

class PickerButton extends StatefulWidget {
  const PickerButton({
    super.key,
    required this.date,
    required this.local,
    required this.timelinePadding,
    required this.onPressed,
  });
  final DateTime date;
  final String local;
  final EdgeInsets timelinePadding;
  final Future Function() onPressed;

  @override
  State<PickerButton> createState() => _PickerButtonState();
}

class _PickerButtonState extends State<PickerButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isDialogOpen = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleRotation() {
    setState(() {
      _isDialogOpen = !_isDialogOpen;
      _isDialogOpen ? _controller.forward() : _controller.reverse();
    });
  }

  Future<void> _showPickerDialog() async {
    _toggleRotation();
    await widget.onPressed();
    _toggleRotation();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color controlColor = colorScheme.onSurface.withOpacity(0.60);
    final double effectiveHorizontalPadding =
        math.max(0, widget.timelinePadding.horizontal - _innerPadding);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: effectiveHorizontalPadding,
        vertical: 4.0,
      ),
      child: SizedBox(
        height: pickerHeaderHeight,
        child: InkWell(
          onTap: _showPickerDialog,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: _innerPadding),
            child: Center(
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      DateFormat(DateFormatUtils.dMonthY, widget.local)
                          .format(widget.date),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  RotationTransition(
                    turns: Tween(begin: 0.0, end: 0.5).animate(_controller),
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: controlColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
