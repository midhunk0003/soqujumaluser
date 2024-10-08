import 'package:customersouqjumla/data/core/failure.dart';
import 'package:customersouqjumla/data/core/success.dart';
import 'package:customersouqjumla/data/model/cart_get_response_model/cart_get_response_model.dart';
import 'package:customersouqjumla/domain/repositories/cart_repositories.dart';
import 'package:customersouqjumla/main.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class CartProvider extends ChangeNotifier {
  final CartRepositories cartRepositories;

  CartProvider({required this.cartRepositories});

  bool _isLoading = false;
  bool _deleteLoading = false;
  String? _errorMessage;
  String? _messagerespons;
  List<Cart>? _cartList = [];
  String? _totalExpenses;
  String? _totalDiscount;
  double? _grandTotal;

  //getter
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  String? get messageResponse => _messagerespons;
  List<Cart>? get cartList => _cartList;
  String? get totalExpenses => _totalExpenses;
  String? get totalDiscount => _totalDiscount;
  double? get grandTotal => _grandTotal;
  bool get deleteLoading => _deleteLoading;

  Future<void> addToCart(
    int? storeId,
    int? productId,
    int? quantity,
    BuildContext context,
    dynamic messagefromscreen,
  ) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    print("storeId in provider class cart :  $storeId");
    print("productId in provider class cart :  $productId");
    print("quantity in provider class cart :  $quantity");
    final prefs = await SharedPreferences.getInstance();
    final String? loginToken = prefs.getString('auth_token');
    print("token in cart : $loginToken ");

    final result = await cartRepositories.addToCart(
      context,
      loginToken,
      storeId.toString(),
      productId.toString(),
      quantity.toString(),
      messagefromscreen,
    );

    print("result i provider class cart :  $result");

    result.fold(
      (failure) {
        _errorMessage = failure.message;
        print("1233232323232323232323");
        _isLoading = false;
        notifyListeners();
      },
      (successmessage) {
        _messagerespons = successmessage.message;
        print("787877878787878787");
        getCartprov(
          storeId.toString(),
        );
        _isLoading = false;
        Navigator.pop(context);
        notifyListeners();
      },
    );
  }

  Future<void> getCartprov(String? storeId) async {
    final prefs = await SharedPreferences.getInstance();
    final String? loginToken = prefs.getString('auth_token');
    print("token in cart : $loginToken");

    final result = await cartRepositories.getCart(
      loginToken,
      storeId,
    );

    print("result in provider get cart : $result");

    result.fold(
      (failure) {
        _errorMessage = failure.message;
        _isLoading = false;
        notifyListeners();
      },
      (getCartsuccess) {
        _cartList = getCartsuccess;
        getTotalExpanses(getCartsuccess);
        _isLoading = false;
        notifyListeners();
      },
    );
  }

  Future<void> deleteCartItem(String? cartId, BuildContext context,
      String? storeId, messagefromscreen) async {
    print("cart id : $cartId");
    _deleteLoading = true;
    _errorMessage = null;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    final String? loginToken = prefs.getString('auth_token');
    print("loginToken in provider class cart : $loginToken");

    final result = await cartRepositories.deleteCartItem(
        loginToken, cartId, messagefromscreen);

    print('response delete cart success : $result');

    result.fold(
      (failure) {
        _errorMessage = failure.message;
        _deleteLoading = false;
        notifyListeners();
      },
      (deleteSuccess) {
        _messagerespons = deleteSuccess.message;
        _deleteLoading = false;
        getCartprov(
          storeId.toString(),
        );
        Navigator.pop(context);
        notifyListeners();
      },
    );
  }

  Future<void> getTotalExpanses(List<Cart> getCartsuccess) async {
    print(
        "getTotalExpanses as276487638461846326487264872634832684 in provider class cart :  $getCartsuccess");
    double totalExpenses = 0.0;
    double totalDiscount = 0.0;
    for (int i = 0; i < getCartsuccess.length; i++) {
      Cart cartItem = getCartsuccess[i];
      print('32323232323232323111111111111 : ${cartItem.totalprice}');
      totalExpenses = cartItem.totalprice! + totalExpenses;
      totalDiscount = cartItem.totalofferprice! + totalDiscount;
    }
    _totalExpenses = totalExpenses.toStringAsFixed(2);
    _totalDiscount = totalDiscount.toStringAsFixed(2);
    // _grandTotal = totalExpenses - totalDiscount;
    _grandTotal = totalExpenses;
    print("totalExpenses in provider class cart :  $_totalExpenses");
    print("totalDiscount in provider class cart :  $totalDiscount");
    print("grandTotal in provider class cart :  $_grandTotal");
  }
}
