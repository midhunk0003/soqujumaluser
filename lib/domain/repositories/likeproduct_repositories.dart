import 'package:customersouqjumla/data/core/failure.dart';
import 'package:customersouqjumla/data/core/success.dart';
import 'package:customersouqjumla/data/model/liked_product_model/liked_product_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

abstract class LikeproductRepositories {
  Future<Either<Failure, Success>> postProduct(
    BuildContext context,
    String? loginToken,
    String? storeId,
    String? productId,
  );
  Future<Either<Failure, List<LikedProduct>>> getLikedProduct(
    String? loginToken,
    String? storeId,
  );
}
