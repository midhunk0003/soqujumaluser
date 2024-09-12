import 'package:customersouqjumla/data/core/failure.dart';
import 'package:customersouqjumla/data/model/categoeylist_model/categoeylist_model.dart';
import 'package:dartz/dartz.dart';

abstract class CategoryListRepositories {
  Future<Either<Failure, List<Category>>> getCategoryList(
    String? loginToken,
    String? storeId,
  );
}
