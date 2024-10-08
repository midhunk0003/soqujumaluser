import 'package:customersouqjumla/data/model/banner_image_model/banner_image_model.dart';
import 'package:customersouqjumla/data/model/homecaroselmodel.dart';
import 'package:customersouqjumla/domain/repositories/banner_image_repositories.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class CarouselProvider extends ChangeNotifier {
  final BannerImageRepositories bannerImageRepositories;

  CarouselProvider({required this.bannerImageRepositories});

  bool _isLoading = false;
  String? _errorMessage = null;

  int _currentIndex = 0;
  CarouselController _carouselController = CarouselController();
  List<TypeBannerList> _bannercarouseldatas = [];

  List<TypeBannerList> get bannercarouseldatas => _bannercarouseldatas;
  int get currentIndex => _currentIndex;
  CarouselController get carouselcontroller => _carouselController;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> getImagebanner() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    final String? loginToken = prefs.getString('auth_token');

    final result = await bannerImageRepositories.getBannerImage(loginToken);

    print('12222222222222111111111111111111111111111111111111 : $result');

    result.fold(
      (failure) {
        _errorMessage = failure.message;
        _isLoading = false;
        notifyListeners();
      },
      (bannerListsuccess) {
        _bannercarouseldatas = bannerListsuccess;
        _isLoading = false;
        notifyListeners();
      },
    );
  }

  void nextPage() {
    if (_currentIndex < _bannercarouseldatas.length - 1) {
      _currentIndex++;
    } else {
      _currentIndex = 0;
    }

    _carouselController.animateTo(
      _currentIndex.toDouble(),
      duration: Duration(microseconds: 100),
      curve: Curves.bounceIn,
    ); // Slide to the next page
    notifyListeners();
  }

  void reset() {
    _currentIndex = 0;
    notifyListeners();
  }
}
