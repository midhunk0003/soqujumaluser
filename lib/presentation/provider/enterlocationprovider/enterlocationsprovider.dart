import 'dart:convert';

import 'package:customersouqjumla/data/core/failure.dart';
import 'package:customersouqjumla/data/model/enterlocation_model/block_list_model/block_list_model.dart';
import 'package:customersouqjumla/data/model/enterlocation_model/city_list_model/city_list_model.dart';
import 'package:customersouqjumla/data/model/enterlocation_model/country_list_model/country_list_model.dart';
import 'package:customersouqjumla/data/model/enterlocation_model/governerlist/governerlist.dart';
import 'package:customersouqjumla/data/model/enterlocation_model/profile_post_location_model/profile_post_location_model.dart';
import 'package:customersouqjumla/domain/repositories/enter_your_location_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class Enterlocationsprovider extends ChangeNotifier {
  final EnterlocationRepositories enterlocationRepositories;

  Enterlocationsprovider({required this.enterlocationRepositories});

  bool _isLoading = false;
  String? _errorMessage;

  ///***************************************** */
  // Country, Governorate, City models and lists
  //country model
  CountryListModel? _countryListModel;
  List<Country>? _countries = [];
  //govlistmodel
  Governerlist? _governerlist;
  List<Governorate>? _listgov = [];
  //city list
  CityListModel? _cityListModel;
  List<City>? _cityList = [];
  //citybloclist
  List<CityBlock>? _cityBlocList = [];
  //details fron location
  Details? _details;

  ///***************************************** */
  int? _selectedCountryId;
  int? _selectedGovernorateId;
  int? _selectedCityId;
  int? _selectedCityBlocId;

  ///******************getter***************************////

  bool get isLoading => _isLoading;
  String? get errorMesage => _errorMessage;

// Country, Governorate, City models and lists
  //country
  CountryListModel? get countryListModel => _countryListModel;
  List<Country>? get countries => _countries;
  //govlist
  Governerlist? get governerlist => _governerlist;
  List<Governorate>? get listgov => _listgov;
  //city list
  CityListModel? get cityListModel => _cityListModel;
  List<City>? get cityList => _cityList;
  //citybloclist
  List<CityBlock>? get cityBlocList => _cityBlocList;
  //details
  Details? get details => _details;

  //****ids ****/
  int? get selectedCountryId => _selectedCountryId;
  int? get selectedGovernorateId => _selectedGovernorateId;
  int? get selectedCityId => _selectedCityId;
  int? get selectedCityBlocId => _selectedCityBlocId;

  //**************setter******************* */

  void setSelectedCountryId(int? id) {
    _selectedCountryId = id;
    print('selected countery id : $selectedCountryId');
    notifyListeners();
  }

  void setSelectedGovernorateId(int? id) {
    _selectedGovernorateId = id;
    notifyListeners();
  }

  void setSelectedCityId(int? id) {
    _selectedCityId = id;
    notifyListeners();
  }

  void setSelectCityBlocId(int? id) {
    _selectedCityBlocId = id;
    notifyListeners();
  }

  ///*********************functions*************************** */

  // get country repo
  Future<void> getCountries() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    final String? loginToken = prefs.getString('auth_token');
    print("repo country login  token : $loginToken");
    final result = await enterlocationRepositories.getCountryList(loginToken);

    print("country result in repo inprovider function : $result");

    result.fold(
      (failure) {
        _errorMessage = failure.message;
        _isLoading = false;
        notifyListeners();
      },
      (countryList) {
        _countries = countryList;
        _isLoading = false;
        notifyListeners();
      },
    );
  }

  //future govlist

  Future<void> governoratelist(String? countryId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    final String? loginToken = prefs.getString('auth_token');

    final result = await enterlocationRepositories.getGovernorateList(
        loginToken, countryId);
    print("governate  result in repo inprovider function : $result");
    result.fold(
      (failure) {
        _errorMessage = failure.message;
        _isLoading = false;
        notifyListeners();
      },
      (governoratesucc) {
        _listgov = governoratesucc;
        _isLoading = false;
        notifyListeners();
      },
    );
  }

  //future city;

  Future<void> getcitylist(String? governateId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    final String? loginToken = prefs.getString('auth_token');
    print("token for citylist : $loginToken");
    print("governateId id :$governateId ");

    final result =
        await enterlocationRepositories.getCityList(loginToken, governateId);
    print("city  result in repo inprovider function : $result");
    result.fold(
      (failure) {
        _errorMessage = failure.message;
        _isLoading = false;
        notifyListeners();
      },
      (cityListsuccess) {
        _cityList = cityListsuccess;
        _isLoading = false;
        notifyListeners();
      },
    );
  }

  //futureblock

  Future<void> getcityBloc(String? cityId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    final String? loginToken = prefs.getString('auth_token');
    print("token for citybloclist : $loginToken");
    print("governateId id :$cityId");

    final result =
        await enterlocationRepositories.getCityBlocList(loginToken, cityId);
    print("cityBloc  result in repo inprovider function : $result");
    result.fold(
      (failure) {
        _errorMessage = failure.message;
        _isLoading = false;
        notifyListeners();
      },
      (cityBlocListsuccess) {
        _cityBlocList = cityBlocListsuccess;
        _isLoading = false;
        notifyListeners();
      },
    );
  }

  ///post profile data
  Future<void> postTheProfileFromLocation() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    final String? loginToken = prefs.getString('auth_token');

    final result = await enterlocationRepositories.postThedetail(
      selectedCountryId.toString(),
      selectedGovernorateId.toString(),
      selectedCityId.toString(),
      selectedCityBlocId.toString(),
      loginToken,
    );

    print("post details  result in repo inprovider function : $result");

    result.fold(
      (failure) {
        _errorMessage = failure.message;
        _isLoading = false;
        notifyListeners();
      },
      (detilssuccess) {
        _details = detilssuccess;
        _isLoading = false;
        notifyListeners();
      },
    );
  }

  // Future<void> postTheProfileFromLocation() async {
  //   // _isLoading = true;
  //   // _errorMessage = null;
  //   // notifyListeners();
  //   final prefs = await SharedPreferences.getInstance();
  //   final String? loginToken = prefs.getString('auth_token');
  //   print("contry id $selectedCountryId");
  //   print("contry id $selectedGovernorateId");
  //   print("contry id $selectedCityId");
  //   print("contry id $selectedCityBlocId");

  //   final client = http.Client();
  //   final response = await client.post(
  //     Uri.parse('https://souq-jumla.noviindusdemosites.in/users/profile'),
  //     headers: {
  //       'Authorization': 'Bearer $loginToken',
  //     },
  //     body: {
  //       'country': selectedCountryId.toString(),
  //       'governorate': selectedGovernorateId.toString(),
  //       'city': selectedCityId.toString(),
  //       'block': selectedCityBlocId.toString(),
  //     },
  //   );

  //   print("result of details : ${response.body}");
  //   getThestoreList();
  // }

  // after profile data insert then show thow the store list

  Future<void> getThestoreList() async {
    final prefs = await SharedPreferences.getInstance();
    final String? loginToken = prefs.getString('auth_token');
    final client = http.Client();

    final response = await client.post(
      Uri.parse('https://souq-jumla.noviindusdemosites.in/users/storelist'),
      headers: {
        'Authorization': 'Bearer $loginToken',
      },
      body: {
        'type': '4',
      },
    );

    print("result of STORE LIST : ${response.body}");
  }

  //reset function
  void resetGovernorateAndCity() {
    _listgov = [];
    _cityList = [];
    _cityBlocList = [];
    _selectedGovernorateId = null;
    _selectedCityId = null;
    _selectedCityBlocId = null;
    notifyListeners();
  }

  void resetCity() {
    _cityList = [];
    _selectedCityId = null;
    notifyListeners();
  }

  void resetCityBloc() {
    _cityBlocList = [];
    _selectedCityBlocId = null;
    notifyListeners();
  }
}
