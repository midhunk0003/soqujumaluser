import 'dart:convert';

import 'package:customersouqjumla/data/core/failure.dart';
import 'package:customersouqjumla/data/model/login_response_model/login_response_model.dart';
import 'package:customersouqjumla/domain/repositories/login_with_phone_number_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class LoginProvider extends ChangeNotifier {
  final LoginRepositories loginRepositories;

  LoginProvider(this.loginRepositories);
  bool _isLoading = false;
  String? _errorMessage;
  LoginResponseModel? _loginResponse;

  bool get isloading => _isLoading;
  String? get errormessage => _errorMessage;
  LoginResponseModel? get loginResponse => _loginResponse;

  // Future<void> LoginWithphonenumber(String? phonenumber, String? fcm) async {
  //   _isLoading = true;
  //   _errorMessage = null;
  //   notifyListeners();

  //   print('phonenumber : $phonenumber');
  //   print('fcm : $fcm');

  //   final client = http.Client();
  //   try {
  //     final response = await client.post(
  //       Uri.parse('https://souq-jumla.noviindusdemosites.in/users/Login'),
  //       // headers: 'application/json',
  //       body: {
  //         'phone': phonenumber,
  //         'fcm': fcm,
  //       },
  //     );

  //     print("response : ${response.body}");

  //     if (response.statusCode == 200) {
  //       final data = json.decode(response.body);
  //       final _user = LoginResponseModel.fromJson(data);
  //       _loginResponse = _user;
  //     } else {
  //       print('Failed with status: ${response.statusCode}');
  //       print('Response body: ${response.body}');
  //       _errorMessage = response.statusCode.toString();
  //     }
  //   } catch (e) {
  //     _errorMessage = e.toString();
  //     print('error message :${_errorMessage}');
  //   } finally {
  //     _isLoading = false;
  //     notifyListeners();
  //   }
  // }

  Future<void> loginWithphonenumber(String? phonenumber, String? fcm) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    final result =
        await loginRepositories.loginWithMobileNumber(phonenumber, fcm);

    print('result : $result');
    result.fold(
      (failure) {
        _errorMessage = failure.message;
        print('error message :${_errorMessage}');
        _isLoading = false;
        notifyListeners();
      },
      (loginresponse) {
        _loginResponse = loginresponse;
        _isLoading = false;
        notifyListeners();
      },
    );
  }
}
