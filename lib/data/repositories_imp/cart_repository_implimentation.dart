import 'dart:convert';
import 'dart:io';

import 'package:customersouqjumla/data/core/failure.dart';
import 'package:customersouqjumla/data/core/success.dart';
import 'package:customersouqjumla/data/model/cart_get_response_model/cart_get_response_model.dart';
import 'package:customersouqjumla/domain/repositories/cart_repositories.dart';
import 'package:customersouqjumla/presentation/widgets/animatedsnakebar.dart';
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
    dynamic messagefromscreen,
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
          showAnimatedSnackbar(navigatorKey.currentContext!, messagefromscreen);
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

  @override
  Future<Either<Failure, List<Cart>>> getCart(
      String? loginToken, String? storeId) async {
    print("loginToken get cart : $loginToken");
    print("storeId get cart : $storeId");

    final client = http.Client();
    try {
      final response = await client.get(
          Uri.parse('https://souq-jumla.noviindusdemosites.in/users/addtocart')
              .replace(
            queryParameters: ({'store': storeId}),
          ),
          headers: {
            'Authorization': 'Bearer $loginToken',
          });

      print("response of get cart : ${response.body}");
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['cart'];
        final cartListResponse =
            data.map((items) => Cart.fromJson(items)).toList();
        print("cart list response : $cartListResponse");
        return Right(cartListResponse);
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
  Future<Either<Failure, Success>> deleteCartItem(
    String? loginToken,
    String? cartId,
    String? messagefromscreen,
  ) async {
    final client = http.Client();

    try {
      final response = await client.post(
        Uri.parse('https://souq-jumla.noviindusdemosites.in/users/removecart'),
        headers: {
          'Authorization': 'Bearer $loginToken',
        },
        body: {'cartid': cartId},
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        if (responseData['status'] == true) {
          final successMessage = responseData['message'];
          print("Success message: $successMessage");
          showAnimatedSnackbar(navigatorKey.currentContext!, messagefromscreen);
          return Right(Success(message: "delete Cart Successfullt"));
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
      return Left(ServerFailure(e.toString()));
    } finally {
      client.close();
    }
  }
}

// void showSnackbar(BuildContext context, suuccesmessage) {
//   final snackBar = SnackBar(
//     content: Padding(
//       padding:
//           const EdgeInsets.all(8.0), // This adds the margin inside the Snackbar
//       child: Container(
//         padding: const EdgeInsets.all(
//             16.0), // This can be used for additional padding inside the Snackbar
//         color: const Color.fromARGB(176, 6, 192, 31).withOpacity(0.6),
//         child: Text(
//           '$suuccesmessage',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//     ),
//     behavior: SnackBarBehavior
//         .floating, // Makes the Snackbar float above other content
//   );

//   ScaffoldMessenger.of(context).showSnackBar(snackBar);
// }

void showAnimatedSnackbar(BuildContext context, suuccesmessage) {
  // Show the snackbar
  final snackBar = SnackBar(
    content: Text('$suuccesmessage'),
    duration: const Duration(seconds: 3), // Duration snackbar is shown
    behavior: SnackBarBehavior.floating, // To float snackbar over content
    backgroundColor: Colors.green, // Customize the background color
  );

  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
