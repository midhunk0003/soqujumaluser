import 'package:customersouqjumla/data/model/homecaroselmodel.dart';
import 'package:flutter/material.dart';

class CarouselProvider extends ChangeNotifier {
  int _currentIndex = 0;
  final CarouselController _carouselController = CarouselController();
  final List<CarouselModel> _carouseldatas = [
    CarouselModel(
      image: "assets/images/homecursoul.png",
      subtitle: "Explore Our Array of Fresh\nand Colorful Vegetables22222",
      title:
          "Unlock Exclusive Deals! Enjoy\na Minimum 10% Discount on\nVegetable Purchases.2222",
    ),
    CarouselModel(
      image: "assets/images/homecursoul.png",
      subtitle: "Explore Our Array of Fresh\nand Colorful Vegetables3333",
      title:
          "Unlock Exclusive Deals! Enjoy\na Minimum 10% Discount on\nVegetable Purchases.33333",
    ),
    CarouselModel(
      image: "assets/images/homecursoul.png",
      subtitle: "Explore Our Array of Fresh\nand Colorful Vegetables4444",
      title:
          "Unlock Exclusive Deals! Enjoy\na Minimum 10% Discount on\nVegetable Purchases.44444",
    ),
  ];

  List<CarouselModel> get carouseldata => _carouseldatas;
  int get currentIndex => _currentIndex;
  CarouselController get carouselcontroller => _carouselController;

  void nextPage() {
    if (_currentIndex < carouseldata.length - 1) {
      _currentIndex++;
    } else {
      _currentIndex = 0;
    }
    _carouselController.animateTo(
      09,
      duration: const Duration(microseconds: 1000),
      curve: Curves.bounceIn,
    ); // Slide to the next page
    notifyListeners();
  }

  void reset() {
    _currentIndex = 0;
    notifyListeners();
  }
}
