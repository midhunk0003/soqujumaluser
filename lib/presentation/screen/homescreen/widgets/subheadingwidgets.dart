import 'package:flutter/material.dart';

class subheadingwidget extends StatelessWidget {
  final String heading;
  const subheadingwidget({
    required this.heading,
    super.key,
    required this.isTablet,
  });

  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isTablet = constraints.maxWidth > 600;
        return Padding(
          padding: isTablet
              ? const EdgeInsets.only(left: 50, right: 50)
              : const EdgeInsets.only(left: 25, right: 25),
          child: Text(
            heading,
            style: TextStyle(
              fontSize: isTablet ? 28 : 22,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        );
      },
    );
  }
}
