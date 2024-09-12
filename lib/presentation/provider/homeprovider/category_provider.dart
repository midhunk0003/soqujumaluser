import 'package:customersouqjumla/data/model/categoeylist_model/categoeylist_model.dart';
import 'package:customersouqjumla/domain/repositories/category_list_repositories.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class CategoryProvider extends ChangeNotifier {
  final CategoryListRepositories categoryListRepositories;

  CategoryProvider({required this.categoryListRepositories});

  bool _isLoading = false;
  String? _errorMessage;

  List<Category>? _categotyList = [];

  //********geter********** */
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  List<Category>? get categoryList => _categotyList;

  //********functions provider ********* *//

  Future<void> getCategory(String? storeId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    final String? loginToken = prefs.getString('auth_token');

    final result =
        await categoryListRepositories.getCategoryList(loginToken, storeId);

    print('category list in provider response : $result');

    result.fold(
      (failure) {
        _errorMessage = failure.message;
        _isLoading = false;
        notifyListeners();
      },
      (categoryListsuccess) {
        _categotyList = categoryListsuccess;
        _isLoading = false;
        notifyListeners();
      },
    );
  }
}
