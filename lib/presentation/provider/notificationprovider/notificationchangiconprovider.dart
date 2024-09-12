import 'package:flutter/material.dart';

class Notificationchangiconprovider extends ChangeNotifier {
  bool isNotificationIcon = true;

  void changeIcon(bool value) {
    isNotificationIcon = value;
    print(isNotificationIcon);
    notifyListeners();
  }
}
