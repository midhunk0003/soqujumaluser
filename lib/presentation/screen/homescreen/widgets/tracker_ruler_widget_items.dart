import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TrackerRulerWidgetItem extends StatelessWidget {
  const TrackerRulerWidgetItem({
    Key? key,
    required this.value,
    required this.index,
    required this.isLast,
  }) : super(key: key);

  final int value;
  final int index;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    // Determine screen width
    final screenWidth = MediaQuery.of(context).size.width;

    // Adjust divider width based on screen size
    final dividerWidth = screenWidth > 600 ? 16.0 : 8.0;
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = constraints.maxWidth > 600;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              children: [
                SizedBox(
                  height: isTablet ? 80 : 40,
                  child: VerticalDivider(
                    width: 1,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            for (int i = 0; i < 4; i++)
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: isTablet ? 40 : 20,
                    child: VerticalDivider(
                      width: 1,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ],
              ),
            SizedBox(
              width: 10,
            ),
            SizedBox(
              height: isTablet ? 60 : 30,
              child: VerticalDivider(
                width: 1,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            for (int i = 0; i < 4; i++)
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: isTablet ? 40 : 20,
                    child: VerticalDivider(
                      width: 1,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ],
              ),
            const SizedBox(
              width: 10,
            ),
            if (isLast)
              const Column(
                children: [
                  SizedBox(
                    width: 1.5,
                    height: 40,
                    child: VerticalDivider(
                      width: .9,
                      color: Color.fromARGB(255, 29, 28, 22),
                    ),
                  )
                ],
              ),
          ],
        );
      },
    );
  }
}
