library ruler_slider;

import 'package:flutter/material.dart';

/// Enum to specify the orientation of the ruler slider.
enum RulerOrientation {
  horizontal,
  vertical,
}

/// A customizable ruler slider with optional custom labels, colors, tick spacing,
/// snapping behavior, and a callback that returns the selected value.
///
/// This widget allows users to scroll horizontally or vertically and select a value on a ruler-like
/// interface with customizable features such as:
/// - The color of the selected and unselected tick marks.
/// - Spacing between the ticks.
/// - Custom labels for specific tick intervals.
/// - The appearance of the fixed slider and the label.
/// - Snapping behavior for smooth scrolling.
/// - Horizontal or vertical orientation.
///
/// ## Parameters
///
/// - `minValue`: The minimum value of the slider.
/// - `maxValue`: The maximum value of the slider.
/// - `initialValue`: The initial value of the slider, default is set to the midpoint of the min and max values.
/// - `rulerWidth`: The width of the ruler (slider).
/// - `rulerHeight`: The height of the ruler (slider).
/// - `selectedBarColor`: The color of the tick marks that are active or selected.
/// - `unselectedBarColor`: The color of the tick marks that are unselected or inactive.
/// - `tickSpacing`: The space between each tick on the ruler.
/// - `valueTextStyle`: The text style for the label that displays the current value.
/// - `customLabels`: Optional custom labels for specific intervals on the ruler.
/// - `onChanged`: A callback function that returns the selected value as the user interacts with the ruler.
/// - `showFixedBar`: A boolean indicating whether to show a fixed bar in the center.
/// - `fixedBarColor`: The color of the fixed bar that indicates the current value.
/// - `fixedBarWidth`: The width of the fixed bar.
/// - `fixedBarHeight`: The height of the fixed bar.
/// - `showFixedLabel`: A boolean indicating whether to show the current value as a fixed label.
/// - `fixedLabelColor`: The color of the fixed label that displays the current value.
/// - `scrollSensitivity`: Adjusts how sensitive the ruler is to user scroll/drag.
/// - `enableSnapping`: A boolean to control whether the ruler snaps to specific values after the user stops dragging.
/// - `majorTickInterval`: Controls how often major tick marks appear (e.g., every 5th or 10th tick).
/// - `labelInterval`: Controls how often labels appear (e.g., every 5th or 10th tick).
/// - `labelOffset`: Controls the position of the labels relative to the ruler (vertical offset for horizontal, horizontal offset for vertical).
/// - `showLabels`: A boolean to show or hide labels.
/// - `labelTextStyle`: A custom text style for labels.
/// - `majorTickLength`: The length of the major ticks.
/// - `minorTickLength`: The length of the minor ticks.
/// - `orientation`: The orientation of the ruler (horizontal or vertical).
///
/// ## Example (Horizontal)
/// ```dart
/// RulerSlider(
///   minValue: 0.0,
///   maxValue: 100.0,
///   initialValue: 50.0,
///   rulerWidth: 300.0,
///   rulerHeight: 100.0,
///   selectedBarColor: Colors.blue,
///   unselectedBarColor: Colors.grey,
///   tickSpacing: 10.0,
///   valueTextStyle: TextStyle(color: Colors.red, fontSize: 18),
///   customLabels: ['Start', '10', '20', '30', '40', 'Middle', '60', '70', '80', '90', 'End'],
///   onChanged: (double value) {
///     print("Current value: ${value.toStringAsFixed(1)}");
///   },
///   showFixedBar: true,
///   fixedBarColor: Colors.red,
///   fixedBarWidth: 3.0,
///   fixedBarHeight: 40.0,
///   showFixedLabel: true,
///   fixedLabelColor: Colors.red,
///   scrollSensitivity: 1.0,
///   enableSnapping: true,
///   majorTickInterval: 5,
///   labelInterval: 10,
///   labelOffset: 30.0,
///   showLabels: true,
///   labelTextStyle: TextStyle(color: Colors.black, fontSize: 12),
///   majorTickLength: 20.0,
///   minorTickLength: 10.0,
///   orientation: RulerOrientation.horizontal,
/// )
/// ```
///
/// ## Example (Vertical)
/// ```dart
/// RulerSlider(
///   minValue: 0.0,
///   maxValue: 100.0,
///   initialValue: 50.0,
///   rulerWidth: 100.0,
///   rulerHeight: 300.0,
///   selectedBarColor: Colors.blue,
///   unselectedBarColor: Colors.grey,
///   tickSpacing: 10.0,
///   onChanged: (double value) {
///     print("Current value: ${value.toStringAsFixed(1)}");
///   },
///   orientation: RulerOrientation.vertical,
/// )
/// ```
///
/// This example shows how to configure the `RulerSlider` with:
/// - A min value of 0 and a max value of 100.
/// - Custom colors for the selected and unselected tick marks.
/// - Custom labels at specific intervals.
/// - Snapping enabled, so the slider snaps to the nearest label or tick.
/// - The ability to customize the appearance of the fixed bar and labels.
/// - Support for both horizontal and vertical orientations.
///

class RulerSlider extends StatefulWidget {
  final double minValue;
  final double maxValue;
  final double initialValue;
  final double rulerWidth;
  final double rulerHeight;
  final Color selectedBarColor;
  final Color unselectedBarColor;
  final double tickSpacing;
  final TextStyle valueTextStyle;
  final ValueChanged<double>? onChanged;
  final List<String>? customLabels;
  final bool showFixedBar;
  final Color fixedBarColor;
  final double fixedBarWidth;
  final double fixedBarHeight;
  final bool showFixedLabel;
  final Color fixedLabelColor;
  final double scrollSensitivity;
  final bool enableSnapping;
  final int majorTickInterval;
  final int labelInterval;
  final double labelOffset;
  final bool showLabels;
  final TextStyle labelTextStyle;
  final double majorTickLength;
  final double minorTickLength;
  final RulerOrientation orientation;

  const RulerSlider({
    super.key,
    this.minValue = 0.0,
    this.maxValue = 100.0,
    this.initialValue = 50.0,
    this.rulerWidth = 300.0,
    this.rulerHeight = 100.0,
    this.selectedBarColor = Colors.green,
    this.unselectedBarColor = Colors.grey,
    this.tickSpacing = 20.0,
    this.valueTextStyle = const TextStyle(color: Colors.black, fontSize: 18),
    this.customLabels,
    this.onChanged,
    this.showFixedBar = true,
    this.fixedBarColor = Colors.red,
    this.fixedBarWidth = 2.0,
    this.fixedBarHeight = 60.0,
    this.showFixedLabel = true,
    this.fixedLabelColor = Colors.red,
    this.scrollSensitivity = 0.5,
    this.enableSnapping = false,
    this.majorTickInterval = 10,
    this.labelInterval = 10,
    this.labelOffset = 25.0,
    this.showLabels = true,
    this.labelTextStyle = const TextStyle(color: Colors.black, fontSize: 12),
    this.majorTickLength = 20.0,
    this.minorTickLength = 10.0,
    this.orientation = RulerOrientation.horizontal,
  });

  @override
  RulerSliderState createState() => RulerSliderState();
}

class RulerSliderState extends State<RulerSlider>
    with SingleTickerProviderStateMixin {
  late double _value;
  late double _rulerPosition;
  late AnimationController _animationController;
  late Animation<double> _animation;

  bool get _isHorizontal => widget.orientation == RulerOrientation.horizontal;

  double get _rulerMainAxisSize =>
      _isHorizontal ? widget.rulerWidth : widget.rulerHeight;

  @override
  void initState() {
    super.initState();

    // Initialize the value and the ruler position based on the initial value
    _value = widget.initialValue;
    double totalScrollableSize = widget.maxValue * widget.tickSpacing;
    _rulerPosition =
        _rulerMainAxisSize / 2 - (_value / widget.maxValue) * totalScrollableSize;

    // Initialize the AnimationController for snapping animation
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    setState(() {
      final delta =
          _isHorizontal ? details.delta.dx : details.delta.dy;
      _rulerPosition += delta * widget.scrollSensitivity;
      double totalScrollableSize = widget.maxValue * widget.tickSpacing;
      _rulerPosition = _rulerPosition.clamp(
          -totalScrollableSize + _rulerMainAxisSize / 2,
          _rulerMainAxisSize / 2);
      _value = (((_rulerMainAxisSize / 2 - _rulerPosition) /
                  totalScrollableSize) *
              widget.maxValue)
          .clamp(widget.minValue, widget.maxValue);

      if (widget.onChanged != null) {
        widget.onChanged!(_value);
      }
    });
  }

  void _handleDragEnd(DragEndDetails details) {
    if (widget.enableSnapping) {
      setState(() {
        // Snap to the nearest tick/label with animation if snapping is enabled
        double snappedValue = _getNearestSnapValue(_value);
        double totalScrollableSize = widget.maxValue * widget.tickSpacing;

        // Animate the snapping
        _animation = Tween<double>(
                begin: _rulerPosition,
                end: _rulerMainAxisSize / 2 -
                    (snappedValue / widget.maxValue) * totalScrollableSize)
            .animate(CurvedAnimation(
                parent: _animationController, curve: Curves.easeOut))
          ..addListener(() {
            setState(() {
              _rulerPosition = _animation.value;
            });
          });

        // Start the snapping animation
        _animationController.forward(from: 0.0);

        _value = snappedValue;
        if (widget.onChanged != null) {
          widget.onChanged!(_value);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: _isHorizontal ? _handleDragUpdate : null,
      onHorizontalDragEnd: _isHorizontal ? _handleDragEnd : null,
      onVerticalDragUpdate: !_isHorizontal ? _handleDragUpdate : null,
      onVerticalDragEnd: !_isHorizontal ? _handleDragEnd : null,
      child: ClipRect(
        child: SizedBox(
          width: widget.rulerWidth,
          height: widget.rulerHeight,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                size: Size(widget.rulerWidth, widget.rulerHeight),
                painter: RulerPainter(
                  rulerPosition: _rulerPosition,
                  maxValue: widget.maxValue,
                  value: _value,
                  rulerWidth: widget.rulerWidth,
                  rulerHeight: widget.rulerHeight,
                  selectedBarColor: widget.selectedBarColor,
                  unselectedBarColor: widget.unselectedBarColor,
                  tickSpacing: widget.tickSpacing,
                  customLabels: widget.customLabels,
                  majorTickInterval: widget.majorTickInterval,
                  labelInterval: widget.labelInterval,
                  labelOffset: widget.labelOffset,
                  showLabels: widget.showLabels,
                  labelTextStyle: widget.labelTextStyle,
                  majorTickLength: widget.majorTickLength,
                  minorTickLength: widget.minorTickLength,
                  barWidth: widget.fixedBarWidth,
                  orientation: widget.orientation,
                ),
              ),
              if (widget.showFixedLabel) _buildFixedLabel(),
              if (widget.showFixedBar) _buildFixedBar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFixedLabel() {
    final label = Text(
      _value.toStringAsFixed(1),
      style: widget.valueTextStyle.copyWith(color: widget.fixedLabelColor),
    );

    if (_isHorizontal) {
      return Positioned(
        top: 0,
        child: label,
      );
    } else {
      // For vertical, position label to the left of the fixed bar
      return Positioned(
        left: widget.rulerWidth / 2 - widget.fixedBarHeight / 2 - 40,
        child: label,
      );
    }
  }

  Widget _buildFixedBar() {
    if (_isHorizontal) {
      return Positioned(
        child: Container(
          height: widget.fixedBarHeight,
          width: widget.fixedBarWidth,
          color: widget.fixedBarColor,
        ),
      );
    } else {
      return Positioned(
        child: Container(
          height: widget.fixedBarWidth,
          width: widget.fixedBarHeight,
          color: widget.fixedBarColor,
        ),
      );
    }
  }

  /// Get the nearest value to snap to based on the current value
  double _getNearestSnapValue(double value) {
    if (widget.customLabels != null) {
      // Snap to the nearest custom label
      double stepSize = widget.maxValue / (widget.customLabels!.length - 1);
      return (value / stepSize).round() * stepSize;
    } else {
      // Snap to the nearest multiple of 10 (or adjust based on your snap interval)
      double snapInterval = 10.0;
      return (value / snapInterval).round() * snapInterval;
    }
  }
}

class RulerPainter extends CustomPainter {
  final double rulerPosition;
  final double maxValue;
  final double value;
  final double rulerWidth;
  final double rulerHeight;
  final Color selectedBarColor;
  final Color unselectedBarColor;
  final double tickSpacing;
  final List<String>? customLabels;
  final int majorTickInterval;
  final int labelInterval;
  final double labelOffset;
  final bool showLabels;
  final TextStyle labelTextStyle;
  final double majorTickLength;
  final double minorTickLength;
  final double barWidth;
  final RulerOrientation orientation;

  RulerPainter({
    required this.rulerPosition,
    required this.maxValue,
    required this.value,
    required this.rulerWidth,
    required this.rulerHeight,
    required this.selectedBarColor,
    required this.unselectedBarColor,
    required this.tickSpacing,
    required this.customLabels,
    required this.majorTickInterval,
    required this.labelInterval,
    required this.labelOffset,
    required this.showLabels,
    required this.labelTextStyle,
    required this.majorTickLength,
    required this.minorTickLength,
    required this.barWidth,
    required this.orientation,
  });

  bool get _isHorizontal => orientation == RulerOrientation.horizontal;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint unselectedTickPaint = Paint()
      ..color = unselectedBarColor
      ..strokeWidth = barWidth;
    final Paint selectedTickPaint = Paint()
      ..color = selectedBarColor
      ..strokeWidth = barWidth;

    if (_isHorizontal) {
      _paintHorizontal(canvas, size, selectedTickPaint, unselectedTickPaint);
    } else {
      _paintVertical(canvas, size, selectedTickPaint, unselectedTickPaint);
    }
  }

  void _paintHorizontal(
      Canvas canvas, Size size, Paint selectedPaint, Paint unselectedPaint) {
    canvas.translate(rulerPosition, 0);

    for (double i = 0; i <= maxValue; i += 1) {
      double xPos = i * tickSpacing;
      double tickLength =
          (i % majorTickInterval == 0) ? majorTickLength : minorTickLength;

      if (xPos <= rulerPosition.abs() + size.width / 2) {
        canvas.drawLine(
          Offset(xPos, size.height / 2 - tickLength),
          Offset(xPos, size.height / 2 + tickLength),
          selectedPaint,
        );
      } else {
        canvas.drawLine(
          Offset(xPos, size.height / 2 - tickLength),
          Offset(xPos, size.height / 2 + tickLength),
          unselectedPaint,
        );
      }

      if (showLabels) {
        if (i % labelInterval == 0) {
          String label = customLabels != null &&
                  i ~/ labelInterval < customLabels!.length
              ? customLabels![i ~/ labelInterval]
              : i.toStringAsFixed(0);

          TextPainter textPainter = TextPainter(
            text: TextSpan(
              text: label,
              style: labelTextStyle,
            ),
            textDirection: TextDirection.ltr,
          );
          textPainter.layout();
          textPainter.paint(canvas,
              Offset(xPos - textPainter.width / 2, size.height / 2 + labelOffset));
        }
      }
    }
  }

  void _paintVertical(
      Canvas canvas, Size size, Paint selectedPaint, Paint unselectedPaint) {
    canvas.translate(0, rulerPosition);

    // For vertical orientation, draw ticks from center extending to the right
    // Labels will be on the right side
    final double tickStartX = size.width / 2;

    for (double i = 0; i <= maxValue; i += 1) {
      double yPos = i * tickSpacing;
      double tickLength =
          (i % majorTickInterval == 0) ? majorTickLength : minorTickLength;

      if (yPos <= rulerPosition.abs() + size.height / 2) {
        canvas.drawLine(
          Offset(tickStartX - tickLength, yPos),
          Offset(tickStartX + tickLength, yPos),
          selectedPaint,
        );
      } else {
        canvas.drawLine(
          Offset(tickStartX - tickLength, yPos),
          Offset(tickStartX + tickLength, yPos),
          unselectedPaint,
        );
      }

      if (showLabels) {
        if (i % labelInterval == 0) {
          String label = customLabels != null &&
                  i ~/ labelInterval < customLabels!.length
              ? customLabels![i ~/ labelInterval]
              : i.toStringAsFixed(0);

          TextPainter textPainter = TextPainter(
            text: TextSpan(
              text: label,
              style: labelTextStyle,
            ),
            textDirection: TextDirection.ltr,
          );
          textPainter.layout();
          textPainter.paint(
              canvas,
              Offset(tickStartX + tickLength + labelOffset,
                  yPos - textPainter.height / 2));
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
