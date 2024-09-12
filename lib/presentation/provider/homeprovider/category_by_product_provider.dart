import 'package:customersouqjumla/data/model/category_product_list_model/category_product_list_model.dart';
import 'package:customersouqjumla/domain/repositories/category_by_product.repositories.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class CategoryByProductProvider extends ChangeNotifier {
  CategoryByProductRepositories categoryByProductRepositories;

  CategoryByProductProvider({required this.categoryByProductRepositories});

  bool _isLoading = false;
  bool is_loadingLiked = false;
  String? _errorMessage;
  List<CategoryByProduct>? _categoryByProductList;

  //getter
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  List<CategoryByProduct>? get categoryByProductList => _categoryByProductList;

  Future<void> getcategoryByproduct(
      String? storeId, String? categoryId, bool isLoadingliked) async {
    print('isLoadingliked : $isLoadingliked');
    _isLoading = isLoadingliked;
    // is_loadingLiked = isLoadingliked;
    _errorMessage = null;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    final String? loginToken = prefs.getString('auth_token');

    final result = await categoryByProductRepositories.getCategoryByProduct(
      loginToken,
      storeId,
      categoryId,
    );

    print('result in provider class 1212122222222222222: $result');

    result.fold(
      (failure) {
        _errorMessage = failure.message;
        _isLoading = false;
        notifyListeners();
      },
      (categorybyproductsuccess) {
        _categoryByProductList = categorybyproductsuccess;
        _isLoading = false;
        notifyListeners();
      },
    );
  }
}
