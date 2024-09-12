import 'package:flutter/material.dart';

void showsnakebarfunc(BuildContext context, content, color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('$content'),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      backgroundColor: color, // Optional: Set background color
      duration: Duration(
        seconds: 2,
      ), // Optional: Set duration
    ),
  );
}
