import 'dart:convert';
import 'dart:io';

import 'package:customersouqjumla/data/core/failure.dart';
import 'package:customersouqjumla/data/core/success.dart';
import 'package:customersouqjumla/domain/repositories/cart_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../../main.dart';

@LazySingleton(as: CartRepositories)
class CartRepositoryImplimentation implements CartRepositories {
  @override
  Future<Either<Failure, Success>> addToCart(
    BuildContext context,
    String? loginToken,
    String? storeId,
    String? productId,
    String? quantity,
  ) async {
    final client = http.Client();

    try {
      final response = await client.post(
        Uri.parse('https://souq-jumla.noviindusdemosites.in/users/addtocart'),
        headers: {
          'Authorization': 'Bearer $loginToken',
        },
        body: {
          'store': storeId,
          'product': productId,
          'quantity': quantity,
        },
      );

      print(
        "cart post successfully in repo implimentation : ${response.body}",
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        if (responseData['status'] == true) {
          final successMessage = responseData['message'];
          print("Success message: $successMessage");
          showSnackbar(navigatorKey.currentContext!, successMessage.toString());

          return Right(Success(message: successMessage));
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
}

void showSnackbar(BuildContext context, suuccesmessage) {
  final snackBar = SnackBar(
    content: Padding(
      padding:
          const EdgeInsets.all(8.0), // This adds the margin inside the Snackbar
      child: Container(
        padding: const EdgeInsets.all(
            16.0), // This can be used for additional padding inside the Snackbar
        color: Colors.black.withOpacity(0.6),
        child: Text(
          '$suuccesmessage',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
    behavior: SnackBarBehavior
        .floating, // Makes the Snackbar float above other content
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
