import 'package:customersouqjumla/data/core/failure.dart';
import 'package:customersouqjumla/data/core/success.dart';
import 'package:customersouqjumla/data/model/cart_get_response_model/cart_get_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

abstract class CartRepositories {
  Future<Either<Failure, Success>> addToCart(
    BuildContext context,
    String? loginToken,
    String? storeId,
    String? productId,
    String? quantity,
    dynamic messagefromscreen,
  );
  Future<Either<Failure, Success>> deleteCartItem(
    String? loginToken,
    String? cartId,
    String? messagefromscreen,
  );
  Future<Either<Failure, List<Cart>>> getCart(
    String? loginToken,
    String? storeId,
  );
}
