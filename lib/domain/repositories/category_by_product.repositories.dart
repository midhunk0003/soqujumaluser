import 'package:customersouqjumla/data/core/failure.dart';
import 'package:customersouqjumla/data/model/category_product_list_model/category_product_list_model.dart';
import 'package:dartz/dartz.dart';

abstract class CategoryByProductRepositories {
  Future<Either<Failure, List<CategoryByProduct>>> getCategoryByProduct(
    String? loginToken,
    String? storeId,
    String? categoryId,
  );
}
