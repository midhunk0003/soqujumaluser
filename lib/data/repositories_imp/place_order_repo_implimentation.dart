import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:customersouqjumla/data/core/failure.dart';
import 'package:customersouqjumla/data/core/success.dart';
import 'package:customersouqjumla/data/model/myordersmodel/myordersmodel.dart';
import 'package:customersouqjumla/data/model/ordersummarymodel/ordersummarymodel.dart';
import 'package:customersouqjumla/domain/repositories/place_order_repositories.dart';
import 'package:customersouqjumla/presentation/screen/profilescreen/ordersummary.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@LazySingleton(as: PlaceOrderRepositories)
class PlaceOrderRepoImplimentation implements PlaceOrderRepositories {
  @override
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
      String? date) async {
    final client = http.Client();

    try {
      final response = await client.post(
        Uri.parse('https://souq-jumla.noviindusdemosites.in/users/placeorder'),
        headers: {
          'Authorization': 'Bearer $loginToken',
        },
        body: {
          'store': storeId,
          'issave': issave,
          'housename': housename,
          'addressline1': addressline1,
          'phone': phone,
          'addressline2': addressline2,
          'floor': floor,
          'apartment': apartment,
          'firstname': firstname,
          'paymenttype': paymenttype,
          'date': date,
        },
      );

      print("place order response in repo implimentation : ${response.body}");

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        if (responseData['status'] == true) {
          return Right(Success(message: "Order Successfully Placed"));
        } else {
          return Left(ServerFailure(responseData['message']));
        }
      } else {
        return Left(ServerFailure("Server Failure ${response.statusCode}"));
      }
    } on SocketException {
      return Left(
        NetworkFailure('No internet connection'),
      );
    } catch (e) {
      return Left(ServerFailure("Server Error : ${e.toString()}"));
    } finally {
      client.close();
    }
  }

  @override
  Future<Either<Failure, List<OrderResponse>>> getMyOrder(
      String? loginToken) async {
    final client = http.Client();
    try {
      final response = await client.get(
        Uri.parse('https://souq-jumla.noviindusdemosites.in/users/myorders'),
        headers: {
          'Authorization': 'Bearer $loginToken',
        },
      );

      log("get my orders response in repo implimentation : ${response.body}");

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['orders'];
        final responseData =
            data.map((items) => OrderResponse.fromJson(items)).toList();
        print("responseData : ${responseData.toList()}");
        // print("responseData : $responseData");
        return Right(responseData);
      } else {
        return Left(ServerFailure("Server Failure ${response.statusCode}"));
      }
    } on SocketException {
      return Left(
        NetworkFailure('No internet connection'),
      );
    } catch (e) {
      return Left(ServerFailure("Server Error : ${e.toString()}"));
    } finally {
      client.close();
    }
  }

  @override
  Future<Either<Failure, Success>> cancelOrder(
      String? loginToken, String? orderId) async {
    final client = http.Client();

    try {
      final response = await client.post(
        Uri.parse('https://souq-jumla.noviindusdemosites.in/users/ordercancel'),
        headers: {
          'Authorization': 'Bearer $loginToken',
        },
        body: {'orderid': orderId},
      );

      print("cancel order response in repo implimentation : ${response.body}");
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        if (responseData['status'] == true) {
          return Right(Success(message: "Order Canceled Successfully"));
        } else {
          return Left(ServerFailure(responseData['message']));
        }
      } else {
        return Left(ServerFailure("Server Failure ${response.statusCode}"));
      }
    } on SocketException {
      return Left(
        NetworkFailure('No internet connection'),
      );
    } catch (e) {
      return Left(ServerFailure("Server Error : ${e.toString()}"));
    } finally {
      client.close();
    }
  }

  @override
  Future<Either<Failure, List<OrderproductSummaryModel>>> getOrderSummary(
      String? loginToken, String? orderId) async {
    final client = http.Client();

    try {
      final response = await client.get(
          Uri.parse(
                  'https://souq-jumla.noviindusdemosites.in/users/ordersummery')
              .replace(
            queryParameters: {'id': orderId},
          ),
          headers: {
            'Authorization': 'Bearer $loginToken',
          });

      print(
          "get order summary response in repo implimentation : ${response.body}");

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['orderproducts'];
        final responseData = data
            .map((items) => OrderproductSummaryModel.fromJson(items))
            .toList();
        return Right(responseData);
      } else {
        return Left(ServerFailure("Server Failure ${response.statusCode}"));
      }
    } on SocketException {
      return Left(
        NetworkFailure('No internet connection'),
      );
    } catch (e) {
      return Left(ServerFailure("Server Error : ${e.toString()}"));
    } finally {
      client.close();
    }
  }
}
