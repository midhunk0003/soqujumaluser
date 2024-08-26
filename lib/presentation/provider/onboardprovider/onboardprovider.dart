import 'package:customersouqjumla/data/model/onborddatamodel.dart';
import 'package:flutter/material.dart';

class OnboardingProvider extends ChangeNotifier {
  int _currentIndex = 0;
  final List<OnboardingData> _onboardingData = [
    OnboardingData(
      title: 'Groceries, Delivered\nto Your Doorstep',
      image: 'assets/images/onbord1.jpeg',
    ),
    OnboardingData(
      title: 'Simplify Shopping,\nAmplify Freshness',
      image: 'assets/images/obbord2.jpeg',
    ),
    OnboardingData(
      title: 'Where Quality\nMeets Convenience.',
      image: 'assets/images/onbord3.jpeg',
    ),
  ];

  List<OnboardingData> get onboardingData => _onboardingData;
  int get currentIndex => _currentIndex;

  void nextPage() {
    _currentIndex = (_currentIndex + 1) % _onboardingData.length;
    notifyListeners();
  }

  void reset() {
    _currentIndex = 0;
    notifyListeners();
  }
}
