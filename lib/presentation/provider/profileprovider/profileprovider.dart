import 'package:customersouqjumla/data/model/userdatamodel/userdatamodel.dart';
import 'package:customersouqjumla/domain/repositories/profile_repositories.dart';
import 'package:customersouqjumla/main.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class Profileprovider extends ChangeNotifier {
  final ProfileRepositories profileRepositories;

  Profileprovider({required this.profileRepositories});

  bool _isLoading = false;
  String? _errorMessage;
  UserData? _userData;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  UserData? get userData => _userData;

  Future<void> getUserProfile() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    final pref = await SharedPreferences.getInstance();
    final String? loginToken = pref.getString('auth_token');

    final result = await profileRepositories.getUserProfile(loginToken);

    print("user data in provider class : ${result}");

    result.fold(
      (failuer) {
        _errorMessage = failuer.message;
        _isLoading = false;
        notifyListeners();
      },
      (successUserdata) {
        _userData = successUserdata;
        _isLoading = false;
        notifyListeners();
      },
    );
  }

  Future<void> logOut(BuildContext context) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
    await prefs.remove('storeId_In_sharedpref');
    _isLoading = false;
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    notifyListeners();
  }
}
