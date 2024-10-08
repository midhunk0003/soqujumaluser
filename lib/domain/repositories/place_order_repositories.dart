import 'package:customersouqjumla/data/core/failure.dart';
import 'package:customersouqjumla/data/core/success.dart';
import 'package:customersouqjumla/data/model/myordersmodel/myordersmodel.dart';
import 'package:customersouqjumla/data/model/ordersummarymodel/ordersummarymodel.dart';
import 'package:customersouqjumla/presentation/screen/profilescreen/ordersummary.dart';
import 'package:dartz/dartz.dart';

abstract class PlaceOrderRepositories {
  Future<Either<Failure, Success>> placeOrder(
    String? loginToken,
    String? storeId,
    String? issave,
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
  );

  Future<Either<Failure, List<OrderResponse>>> getMyOrder(
    String? loginToken,
  );

  Future<Either<Failure, Success>> cancelOrder(
    String? loginToken,
    String? orderId,
  );

  Future<Either<Failure, List<OrderproductSummaryModel>>> getOrderSummary(
    String? loginToken,
    String? orderId,
  );
}
