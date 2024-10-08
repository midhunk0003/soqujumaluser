import 'package:customersouqjumla/domain/repositories/deleteaccount_repositories.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class DeleteAccountprovider extends ChangeNotifier {
  final DeleteaccountRepositories deleteaccountRepositories;

  DeleteAccountprovider({required this.deleteaccountRepositories});

  List<String> dropReason = [
    'reason 1',
    'reason 2',
    'reason 3',
    'reason 4',
    'reason 5',
    'reason 6',
  ];

  String? _selectedReason;

  bool _isLoading = false;
  String? _errormessage;
  String? _successMessage;

  String? get selectedReason => _selectedReason;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errormessage;
  String? get successMessage => _successMessage;

  Future<void> setSelectedReason(String? value) async {
    _selectedReason = value;
    notifyListeners();
  }

  Future<void> deleteAccount(String? reason, String? description) async {
    _isLoading = true;
    _errormessage = null;
    notifyListeners();
    final pref = await SharedPreferences.getInstance();
    final String? loginToken = pref.getString('auth_token');

    final result = await deleteaccountRepositories.deleteAccount(
      loginToken,
      reason,
      description,
    );

    print("delete response in provider ${result}");

    result.fold(
      (failure) {
        _errormessage = failure.message;
        _isLoading = false;
        notifyListeners();
      },
      (success) {
        _successMessage = success.message;
        _isLoading = false;
        notifyListeners();
      },
    );
  }
}
