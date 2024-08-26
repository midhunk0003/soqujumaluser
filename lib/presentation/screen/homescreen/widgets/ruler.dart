import 'package:flutter/material.dart';

class ScaleRuler extends StatelessWidget {
  final double rulerHeight = 50.0;
  final int numberOfTicks = 20;
  final double tickWidth = 5.0;
  final double tickHeight = 20.0;
  final double longTickWidth = 30.0;
  final Color tickColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: numberOfTicks,
          itemBuilder: (context, index) {
            // Making every 5th tick wider to represent a unit
            bool isLongTick = index % 5 == 0;
            return Container(
              height: tickHeight,
              width: isLongTick ? longTickWidth : tickWidth,
              color: tickColor,
              margin: EdgeInsets.symmetric(vertical: 5.0),
            );
          },
        ),
      ),
    );
  }
}
