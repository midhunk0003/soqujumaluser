import 'package:customersouqjumla/data/core/success.dart';
import 'package:customersouqjumla/data/model/category_product_list_model/category_product_list_model.dart';
import 'package:customersouqjumla/data/model/liked_product_model/liked_product_model.dart';
import 'package:customersouqjumla/domain/repositories/likeproduct_repositories.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class Likedproductprovider extends ChangeNotifier {
  LikeproductRepositories likeproductRepositories;

  Likedproductprovider({required this.likeproductRepositories});
  bool _isLoading = false;
  String? _errorMessage;
  String? _message;
  bool _isLiked = false;
  List<LikedProduct>? _likedProductList;

  //getter

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  String? get message => _message;
  bool get isLiked => _isLiked;
  List<LikedProduct>? get likedProductList => _likedProductList;

  Future<void> postTolikedProduct(String? storeId, String? productId,
      bool isLikedvalue, context, CategoryByProduct product) async {
    _isLoading = true;
    _isLiked = isLikedvalue;
    product.islike = isLikedvalue;

    _errorMessage = null;
    notifyListeners();

    print("data : $storeId");
    print("data : $productId");
    print("data : $isLikedvalue");

    _isLiked = isLikedvalue;

    final prefs = await SharedPreferences.getInstance();
    final String? loginToken = prefs.getString('auth_token');

    final result = await likeproductRepositories.postProduct(
        context, loginToken, storeId, productId);

    print("add liked product in provider : ${result}");

    result.fold(
      (failure) {
        _errorMessage = failure.message;
        _isLoading = false;
        notifyListeners();
      },
      (success) {
        _message = success.message;
        _isLoading = false;
        notifyListeners();
      },
    );
  }

  //get  product  liked
  Future<void> getLikedProductList(String? storeId) async {
    _isLoading = false;
    _errorMessage = null;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    final String? loginToken = prefs.getString('auth_token');

    final result = await likeproductRepositories.getLikedProduct(
      loginToken,
      storeId,
    );

    result.fold(
      (failure) {
        _errorMessage = failure.message;
        _isLoading = false;
        notifyListeners();
      },
      (likedProductsuccess) {
        _likedProductList = likedProductsuccess;
        _isLoading = false;
        notifyListeners();
      },
    );
  }
}
