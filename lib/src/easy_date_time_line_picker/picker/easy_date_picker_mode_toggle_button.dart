import 'package:flutter/material.dart';

import '../enums/enums.exports.dart';

const double _subHeaderHeight = 52.0;
const double _monthNavButtonsWidth = 108.0;

class EasyDatePickerModeToggleButton extends StatefulWidget {
  /// A toggle button widget for switching between different modes of the
  /// EasyDatePicker (e.g., month view and year view).
  ///
  /// The [EasyDatePickerModeToggleButton] widget displays a title and an
  /// arrow icon that rotates based on the current mode. When the title is
  /// pressed, a callback is triggered.
  ///
  /// The widget requires the following parameters:
  /// - [mode]: The current display mode of the calendar picker.
  /// - [title]: The text that displays the current month/year being viewed.
  /// - [onTitlePressed]: The callback function when the title is pressed.
  ///
  /// The widget uses an [AnimationController] to animate the rotation of the
  /// arrow icon when the mode changes.
  ///
  /// Example usage:
  /// ```dart
  /// EasyDatePickerModeToggleButton(
  ///   mode: EasyDatePickerMode.month,
  ///   title: 'January 2023',
  ///   onTitlePressed: () {
  ///     // Handle title pressed
  ///   },
  /// );
  /// ```
  const EasyDatePickerModeToggleButton({
    super.key,
    required this.mode,
    required this.title,
    required this.onTitlePressed,
  });

  /// The current display of the calendar picker.
  final EasyDatePickerMode mode;

  /// The text that displays the current month/year being viewed.
  final String title;

  /// The callback when the title is pressed.
  final VoidCallback? onTitlePressed;

  @override
  State<StatefulWidget> createState() => _EasyDatePickerModeToggleButtonState();
}

class _EasyDatePickerModeToggleButtonState
    extends State<EasyDatePickerModeToggleButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      value: widget.mode == EasyDatePickerMode.year ? 0.5 : 0,
      upperBound: 0.5,
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
  }

  @override
  void didUpdateWidget(EasyDatePickerModeToggleButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.mode == widget.mode) {
      return;
    }

    if (widget.mode == EasyDatePickerMode.year) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Color controlColor = colorScheme.onSurface.withOpacity(0.60);

    return SizedBox(
      height: _subHeaderHeight,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 16, end: 4),
        child: Row(
          children: <Widget>[
            Flexible(
              child: Semantics(
                excludeSemantics: true,
                button: true,
                container: true,
                child: SizedBox(
                  height: _subHeaderHeight,
                  child: InkWell(
                    onTap: widget.onTitlePressed,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              widget.title,
                              overflow: TextOverflow.ellipsis,
                              style: textTheme.titleSmall?.copyWith(
                                color: controlColor,
                              ),
                            ),
                          ),
                          RotationTransition(
                            turns: _controller,
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
            ),
            if (widget.mode == EasyDatePickerMode.month)
              // Give space for the prev/next month buttons that are underneath this row
              const SizedBox(width: _monthNavButtonsWidth),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
