import 'package:customersouqjumla/data/core/failure.dart';
import 'package:customersouqjumla/data/core/success.dart';
import 'package:customersouqjumla/domain/repositories/cart_repositories.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class CartProvider extends ChangeNotifier {
  final CartRepositories cartRepositories;

  CartProvider({required this.cartRepositories});

  bool _isLoading = false;
  String? _errorMessage;
  String? _messagerespons;

  //getter
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  String? get messageResponse => _messagerespons;

  Future<void> addToCart(
      int? storeId, int? productId, int? quantity, BuildContext context,) async {
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
        _isLoading = false;
        notifyListeners();
      },
    );
  }
}
