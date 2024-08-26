import 'package:flutter/material.dart';

class BottomSheetQtyProvider extends ChangeNotifier {
  num _selectedValue = 0.0;
  num _savedValue = 22.0;
  num _calculatedAmount = 0.0;

  num get selectedValue => _selectedValue;
  num get savedValue => _savedValue;
  num get calculatedAmount => _calculatedAmount;

  void updateValue(num newValue) {
    _selectedValue = newValue;
    calculateAmount(newValue);
    print("$calculatedAmount");
    notifyListeners();
  }

  void calculateAmount(newValue) {
    _calculatedAmount = newValue * 14.50;
    print(_calculatedAmount);
    notifyListeners();
  }

  void addToCart(num calculatedquantity, num selectedkg) {
    print('add tocart total : ${calculatedquantity}');
    print('add to cart kg : ${selectedkg}');
    notifyListeners();
  }
}
