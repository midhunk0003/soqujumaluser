import 'package:customersouqjumla/data/model/store_detail_model/store_detail_model.dart';
import 'package:customersouqjumla/domain/repositories/store_list_repositories.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class Selectstoreprovider extends ChangeNotifier {
  final StoreListRepositories storeListRepositories;

  Selectstoreprovider({required this.storeListRepositories});

  bool? _isLoading = false;
  String? _errorMessage;

  //storeList
  List<StoreList> _storeList = [];

  bool? get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  List<StoreList>? get storeList => _storeList;

  //getstore list

  Future<void> getStoreList() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    final String? loginToken = prefs.getString('auth_token');

    final result = await storeListRepositories.getStoreList(loginToken);

    print('store list in provider result response : $result');

    result.fold(
      (failure) {
        _errorMessage = failure.message;
        _isLoading = false;
        notifyListeners();
      },
      (storeListSuccess) {
        _storeList = storeListSuccess;
        _isLoading = false;
        notifyListeners();
      },
    );
  }
}
