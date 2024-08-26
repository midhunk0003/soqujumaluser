import 'package:flutter/material.dart';

class WheelTickHSlider extends StatefulWidget {
  final double min;
  final double max;
  final double divisions;
  final double initialValue;
  final double tickSpacing;

  WheelTickHSlider({
    required this.min,
    required this.max,
    required this.divisions,
    required this.initialValue,
    required this.tickSpacing,
  });

  @override
  _WheelTickHSliderState createState() => _WheelTickHSliderState();
}

class _WheelTickHSliderState extends State<WheelTickHSlider> {
  double? _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomPaint(
          size: Size(double.infinity, 50),
          painter: RulerPainter(
            min: widget.min,
            max: widget.max,
            divisions: widget.divisions,
            tickSpacing: widget.tickSpacing,
          ),
        ),
        Slider(
          value: _currentValue!,
          min: widget.min,
          max: widget.max,
          divisions: (widget.max - widget.min) ~/ widget.divisions,
          label: _currentValue!.toStringAsFixed(1),
          onChanged: (value) {
            setState(() {
              _currentValue = value;
            });
          },
        ),
        Text(
          '${_currentValue!.toStringAsFixed(1)} kg',
          style: TextStyle(fontSize: 24),
        ),
      ],
    );
  }
}

class RulerPainter extends CustomPainter {
  final double min;
  final double max;
  final double divisions;
  final double tickSpacing;

  RulerPainter({
    required this.min,
    required this.max,
    required this.divisions,
    required this.tickSpacing,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double tickHeight = 10.0;
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2.0;

    double totalTicks = (max - min) / divisions;
    double tickGap = size.width / totalTicks;

    for (double i = 0; i <= totalTicks; i++) {
      double x = i * tickGap;
      double tickStartY = 0;
      double tickEndY = tickHeight;

      if (i % tickSpacing == 0) {
        tickEndY *= 2; // Make some ticks longer
        TextSpan span = TextSpan(
          style: TextStyle(color: Colors.black, fontSize: 12),
          text: '${(min + i * divisions).toStringAsFixed(1)}',
        );
        TextPainter tp = TextPainter(
          text: span,
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
        );
        tp.layout();
        tp.paint(canvas, Offset(x - (tp.width / 2), tickEndY + 4));
      }

      canvas.drawLine(Offset(x, tickStartY), Offset(x, tickEndY), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
