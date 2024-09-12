import 'dart:convert';

import 'package:customersouqjumla/data/core/failure.dart';
import 'package:customersouqjumla/data/model/enterlocation_model/block_list_model/block_list_model.dart';
import 'package:customersouqjumla/data/model/enterlocation_model/city_list_model/city_list_model.dart';
import 'package:customersouqjumla/data/model/enterlocation_model/country_list_model/country_list_model.dart';
import 'package:customersouqjumla/data/model/enterlocation_model/governerlist/governerlist.dart';
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

  ///*********************functions *************************** */

  // get country repo
  Future<void> getCountries() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    final String? loginToken = prefs.getString('auth_token');
    print("repo country login  token : $loginToken");
    final result = await enterlocationRepositories.getCountryList(loginToken);

    print("country result in repo : $result");

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
    final prefs = await SharedPreferences.getInstance();
    final String? loginToken = prefs.getString('auth_token');
    print("country id $countryId");
    print("token is in govlist : $loginToken");
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    print("123 gov");
    final client2 = http.Client();
    print("123 gov2");
    try {
      print("123 gov3");
      final response = await client2.post(
        Uri.parse(
            'https://souq-jumla.noviindusdemosites.in/users/governoratelist'),
        headers: {
          'Authorization': 'Bearer $loginToken',
        },
        body: {
          'id': countryId,
        },
      );

      print("response govlist  :  ${response.body}");

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body)['governorate'];
        // _countryListModel = CountryListModel.fromJson(data);
        _listgov = data.map((item) => Governorate.fromJson(item)).toList();
        print("all gov list : $_listgov");
        _errorMessage = null;
        notifyListeners();
      }
    } catch (e) {
      _errorMessage = e.toString();
      print("error : $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  //future city;

  Future<void> getcitylist(String? governateId) async {
    final prefs = await SharedPreferences.getInstance();
    final String? loginToken = prefs.getString('auth_token');
    print("token for citylist : $loginToken");
    print("governateId id :$governateId ");
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    final client = http.Client();

    try {
      final response = await client.post(
        Uri.parse('https://souq-jumla.noviindusdemosites.in/users/citylist'),
        headers: {
          'Authorization': 'Bearer $loginToken',
        },
        body: {
          'id': governateId,
        },
      );

      print("response of citys : ${response.body}");

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body)['city'];
        _cityList = data.map((item) => City.fromJson(item)).toList();
        print("city of list : $cityList ");
        notifyListeners();
      }
    } catch (e) {
      _errorMessage = e.toString();
      print('$errorMesage');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  //futureblock

  Future<void> getcityBloc(String? cityId) async {
    final prefs = await SharedPreferences.getInstance();
    final String? loginToken = prefs.getString('auth_token');
    print("city bloc token : $loginToken");
    print("city id in citybloc : $cityId");

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    final client = http.Client();
    try {
      final response = await client.post(
        Uri.parse('https://souq-jumla.noviindusdemosites.in/users/blocklist'),
        headers: {
          'Authorization': 'Bearer $loginToken',
        },
        body: {
          'id': cityId,
        },
      );

      print("response city block list : ${response.body}");

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body)['city'];
        _cityBlocList = data.map((items) => CityBlock.fromJson(items)).toList();
        _errorMessage = null;
        notifyListeners();
      }
    } catch (e) {
      _errorMessage = e.toString();
      print('$errorMesage');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
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
