import 'package:customersouqjumla/data/model/myordersmodel/myordersmodel.dart';
import 'package:customersouqjumla/data/model/ordersummarymodel/ordersummarymodel.dart';
import 'package:customersouqjumla/domain/repositories/place_order_repositories.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class Placeorderprovider extends ChangeNotifier {
  final PlaceOrderRepositories placeOrderRepositories;

  Placeorderprovider({required this.placeOrderRepositories});

  bool _isLoading = false;
  bool _isGetLoading = false;
  bool _isCancelLoading = false;
  bool _isOrderSummaryloading = false;
  List<bool> _isCancelLoading2 = [];

  String? _errorMessage;
  bool _isSave = false;
  String? _messageSuccess;
  List<OrderResponse>? _myOrder;
  OrderResponse? _myorderWithOrderId;
  List<OrderproductSummaryModel>? _orderSummaryList;
  String? _totalExpanses;
  String? _totalDiscount;
  String? _grandTotal;
  // List<bool>? _isCancelLoading;

  bool get isLoading => _isLoading;
  bool get isGetLoading => _isGetLoading;
  bool get isCancelLoading => _isCancelLoading;
  bool get isOrderSummaryloading => _isOrderSummaryloading;
  List<bool> get isCancelLoading2 => _isCancelLoading2;
  String? get errorMessage => _errorMessage;
  String? get messageSuccess => _messageSuccess;
  List<OrderResponse>? get myOrder => _myOrder;
  OrderResponse? get myorderWithOrderId => _myorderWithOrderId;
  List<OrderproductSummaryModel>? get orderSummaryList => _orderSummaryList;
  String? get totalExpanses => _totalExpanses;
  String? get totalDiscount => _totalDiscount;
  String? get grandTotal => _grandTotal;

  // void setLoading(int index, bool value) {
  //   _isCancelLoading2[index] = value;
  //   notifyListeners();
  // }

  // Initialize the list with false values corresponding to each order
  void initializeLoadingState(int orderCount) {
    _isCancelLoading2 = List.generate(orderCount, (index) => false);
  }

  // bool isLoadingForOrder(int index) => _isCancelLoading[index];

  Future<void> placeOrder(
    String? storeId,
    bool? issave,
    String? housename,
    String? addressline1,
    String? phone,
    String? addressline2,
    String? floor,
    String? apartment,
    String? firstname,
    String? lastname,
    String? paymenttype,
    String? date,
  ) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    _isSave = issave!;

    final pref = await SharedPreferences.getInstance();
    final String? loginToken = pref.getString('auth_token');

    print("data : $loginToken");
    print("data : $storeId");
    print("data : $issave");
    print("data : $housename");
    print("data : $addressline1");
    print("data : $phone");
    print("data : $addressline2");
    print("data : $floor");
    print("data : $apartment");
    print("data : $firstname");
    print("data : $lastname");
    print("data : $paymenttype");
    print("data : $date");
    // print("data : $storeId");

    final result = await placeOrderRepositories.placeOrder(
      loginToken,
      storeId,
      issave.toString(),
      housename,
      addressline1,
      phone,
      addressline2,
      floor,
      apartment,
      firstname,
      lastname,
      paymenttype,
      date,
    );

    result.fold(
      (failure) {
        _errorMessage = failure.message;
        _isLoading = false;
        notifyListeners();
      },
      (placeOrderSuccess) {
        _messageSuccess = placeOrderSuccess.message;
        _isLoading = false;
        notifyListeners();
      },
    );
  }

  //get the data from my orders
  Future<void> getMyOrders() async {
    _isGetLoading = true;
    _errorMessage = null;
    notifyListeners();

    final pref = await SharedPreferences.getInstance();
    final String? loginToken = pref.getString('auth_token');

    final result = await placeOrderRepositories.getMyOrder(loginToken);

    print("my order data in provider class  : ${result}");

    result.fold(
      (failure) {
        _errorMessage = failure.message;
        _isGetLoading = false;
        notifyListeners();
      },
      (getMyorderSuccess) {
        _myOrder = getMyorderSuccess;
        _isGetLoading = false;
        notifyListeners();
      },
    );
  }

  //get the data from my orders
  Future<void> getMyOrdersWithOrderId(String? orderId) async {
    print("Order Id : $orderId");
    _isGetLoading = true;
    _errorMessage = null;
    notifyListeners();

    final pref = await SharedPreferences.getInstance();
    final String? loginToken = pref.getString('auth_token');

    final result = await placeOrderRepositories.getMyOrder(loginToken);

    print("my orderbyorderId data in provider classasasasasas  : ${result}");

    result.fold(
      (failure) {
        _errorMessage = failure.message;
        _isGetLoading = false;
        notifyListeners();
      },
      (getMyorderSuccess) {
        _myorderWithOrderId = getMyorderSuccess
            .where((order) => order.orderid == int.parse(orderId!))
            .single;
        print(
            "sasasasasasasasasassa,njbsdjfhfhjgjkdf : ${myorderWithOrderId!.orderDetails}");
        _isGetLoading = false;
        notifyListeners();
      },
    );
  }

  //cancle order
  Future<void> cancelOrder(String? orderId, int index) async {
    print("index id in provider class : $index");
    _isGetLoading = true;
    // _isCancelLoading2[index] = true;
    _errorMessage = null;
    notifyListeners();

    // await Future.delayed(Duration(seconds: 2));

    // _isGetLoading = false;
    // // _isCancelLoading2[index] = false;
    // notifyListeners();
    // // setLoading(index, false);

    final pref = await SharedPreferences.getInstance();
    final String? loginToken = pref.getString('auth_token');

    final result =
        await placeOrderRepositories.cancelOrder(loginToken, orderId);

    result.fold(
      (failure) {
        _errorMessage = failure.message;
        // setLoading(index, false);
        _isGetLoading = false;
        notifyListeners();
      },
      (cancelSuccess) {
        _messageSuccess = cancelSuccess.message;
        // setLoading(index, false);
        _isGetLoading = false;
        getMyOrders();
        notifyListeners();
      },
    );
  }

  // get order summary

  Future<void> getOrderSummary(String? orderId) async {
    _isOrderSummaryloading = true;
    _errorMessage = null;
    notifyListeners();
    final pref = await SharedPreferences.getInstance();
    final String? loginToken = pref.getString('auth_token');

    final result =
        await placeOrderRepositories.getOrderSummary(loginToken, orderId);

    print("order summary data in provider class  : ${result}");

    result.fold(
      (failure) {
        _errorMessage = failure.message;
        _isOrderSummaryloading = false;
        notifyListeners();
      },
      (getOrderSummarysuccess) {
        _orderSummaryList = getOrderSummarysuccess;
        totalExpansesfunction(orderSummaryList!);
        _isOrderSummaryloading = false;
        notifyListeners();
      },
    );
  }

  Future<void> totalExpansesfunction(
      List<OrderproductSummaryModel> orderSummaryamounttotal) async {
    print(
        "total amount  expenses in provider data list : ${orderSummaryamounttotal}");
    double? totalExpense = 0.0;
    double totalDiscount = 0.0;
    for (int i = 0; i < orderSummaryamounttotal.length; i++) {
      final ordersummaryItem = orderSummaryamounttotal[i];
      if (ordersummaryItem.amount != null &&
          ordersummaryItem.amount!.isNotEmpty) {
        totalExpense =
            double.parse(ordersummaryItem.amount!) + totalExpense!.toDouble();
      }
    }
    _totalExpanses = totalExpense!.toStringAsFixed(2);
    _totalDiscount = totalDiscount.toStringAsFixed(2);
    _grandTotal = (totalExpense - totalDiscount).toStringAsFixed(2);

    print("totoal expense : ${totalExpense}");
  }
}
