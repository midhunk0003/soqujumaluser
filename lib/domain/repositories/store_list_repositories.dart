import 'package:customersouqjumla/data/core/failure.dart';
import 'package:customersouqjumla/data/model/store_detail_model/store_detail_model.dart';
import 'package:dartz/dartz.dart';

abstract class StoreListRepositories {
  Future<Either<Failure, List<StoreList>>> getStoreList(String? loginToken);
}
