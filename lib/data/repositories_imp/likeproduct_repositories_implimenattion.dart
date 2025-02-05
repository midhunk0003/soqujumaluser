import 'dart:convert';
import 'dart:io';

import 'package:customersouqjumla/data/core/failure.dart';
import 'package:customersouqjumla/data/core/success.dart';
import 'package:customersouqjumla/data/model/liked_product_model/liked_product_model.dart';
import 'package:customersouqjumla/domain/repositories/likeproduct_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@LazySingleton(as: LikeproductRepositories)
class LikeproductRepositoriesImplimenattion implements LikeproductRepositories {
  @override
  Future<Either<Failure, Success>> postProduct(
    BuildContext context,
    String? loginToken,
    String? storeId,
    String? productId,
    String? likeorremoveMessage,
  ) async {
    showSnackbar(context, likeorremoveMessage);
    final client = http.Client();
    print(storeId);
    print(productId);
    try {
      final response = await client.post(
        Uri.parse('https://souq-jumla.noviindusdemosites.in/users/likeproduct'),
        headers: {
          'Authorization': 'Bearer $loginToken',
        },
        body: {
          'store': storeId,
          'product': productId,
        },
      );
      print('2222222222222222222222222222');
      print("response of store liked product add or not : ${response.body}");

      if (response.statusCode == 200) {
        print(11111111111111111);
        final responseData = json.decode(response.body);

        if (responseData['status'] == true) {
          final suuccesmessage = responseData['message'];

          return Right(Success(message: responseData['message']));
        } else {
          return Left(ServerFailure(responseData['message']));
        }
      } else {
        return Left(ServerFailure('Server error: ${response.statusCode}'));
      }
    } on SocketException {
      return Left(
        NetworkFailure('No internet connection'),
      );
    } catch (e) {
      return Left(
        ServerFailure(
          e.toString(),
        ),
      );
    } finally {
      client.close();
    }
  }

  @override
  Future<Either<Failure, List<LikedProduct>>> getLikedProduct(
      String? loginToken, String? storeId) async {
    final client = http.Client();
    print("token 999999999999999 $loginToken");
    try {
      final response = await client.get(
        Uri.parse('https://souq-jumla.noviindusdemosites.in/users/likeproduct')
            .replace(queryParameters: {'store': storeId}),
        headers: {
          'Authorization': 'Bearer $loginToken',
        },
      );
      print('555555555555555555555');
      print("response of store liked product list : ${response.body}");

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body)['products'];
        final responseData =
            data.map((items) => LikedProduct.fromJson(items)).toList();
        print('inside the response : $responseData');
        return Right(responseData);
      } else {
        return Left(ServerFailure('Server error: ${response.statusCode}'));
      }
    } on SocketException {
      return Left(
        NetworkFailure('No internet connection'),
      );
    } catch (e) {
      return Left(
        ServerFailure(
          e.toString(),
        ),
      );
    } finally {
      client.close();
    }
  }
}

void showSnackbar(BuildContext context, suuccesmessage) {
  // Show the snackbar
  final snackBar = SnackBar(
    duration: const Duration(seconds: 2), // Duration snackbar is shown
    content: Text('$suuccesmessage'),
    behavior: SnackBarBehavior.floating, // To float snackbar over content
    backgroundColor: const Color.fromARGB(
      225,
      76,
      175,
      79,
    ), // Customize the background color
  );
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
