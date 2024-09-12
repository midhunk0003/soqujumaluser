import 'package:customersouqjumla/data/core/failure.dart';
import 'package:customersouqjumla/data/core/success.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

abstract class CartRepositories {
  Future<Either<Failure, Success>> addToCart(
    BuildContext context,
    String? loginToken,
    String? storeId,
    String? productId,
    String? quantity,
  );
}
