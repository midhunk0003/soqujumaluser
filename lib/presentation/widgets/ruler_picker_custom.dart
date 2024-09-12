import 'package:flutter/material.dart';

class RulerPickerScreen extends StatefulWidget {
  @override
  _RulerPickerScreenState createState() => _RulerPickerScreenState();
}

class _RulerPickerScreenState extends State<RulerPickerScreen> {
  double _currentValue = 1; // Starting value at 1

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ruler Picker with Scaling')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 150,
            width: MediaQuery.of(context).size.width * 0.8, // Ruler width
            child: RulerPicker(
              currentValue: _currentValue,
              onValueChanged: (newValue) {
                setState(() {
                  _currentValue = newValue;
                  print(_currentValue.toInt());
                });
              },
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Selected Value: ${_currentValue.toStringAsFixed(0)}',
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}

class RulerPicker extends StatelessWidget {
  final double currentValue;
  final ValueChanged<double> onValueChanged;

  RulerPicker({required this.currentValue, required this.onValueChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        // Adjust sensitivity (how much dragging changes the value)
        double sensitivity = 0.05; // Adjusted for smaller value changes

        // Slide from left to right, clamp value between 1 and 10
        double newValue =
            (currentValue - details.delta.dx * sensitivity).clamp(1.0, 10.0);
        onValueChanged(newValue);
      },
      child: CustomPaint(
        painter: RulerPainter(currentValue: currentValue),
        child: Container(),
      ),
    );
  }
}

class RulerPainter extends CustomPainter {
  final double currentValue;

  RulerPainter({required this.currentValue});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2.0;

    double incrementWidth =
        size.width / 10; // Adjusted tick spacing for 10 values

    // Draw ruler lines and scale with scaling effect
    for (int i = 1; i <= 10; i++) {
      // Range from 1 to 10
      double xPosition = (i - currentValue) * incrementWidth + size.width / 2;

      // Calculate the scale factor based on proximity to the currentValue
      double distance = (i - currentValue).abs();
      double scale = (1.0 - (distance / 5))
          .clamp(0.7, 1.2); // Scale factor (from 0.7 to 1.2)

      double lineHeight =
          i % 1 == 0 ? size.height * 0.5 * scale : size.height * 0.3 * scale;

      if (xPosition >= 0 && xPosition <= size.width) {
        // Draw scaled tick marks
        canvas.drawLine(
          Offset(xPosition, size.height),
          Offset(xPosition, size.height - lineHeight),
          paint,
        );

        // Draw scaled text for each value from 1 to 10
        TextPainter textPainter = TextPainter(
          text: TextSpan(
            text: '$i',
            style: TextStyle(
              color: Colors.black,
              fontSize:
                  14 * scale, // Scale the font size based on the scale factor
            ),
          ),
          textDirection: TextDirection.ltr,
        );
        textPainter.layout();
        textPainter.paint(
            canvas, Offset(xPosition - 10, size.height - lineHeight - 20));
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
