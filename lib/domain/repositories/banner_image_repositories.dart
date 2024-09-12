import 'package:customersouqjumla/data/core/failure.dart';
import 'package:customersouqjumla/data/model/banner_image_model/banner_image_model.dart';
import 'package:dartz/dartz.dart';

abstract class BannerImageRepositories {
  Future<Either<Failure, List<TypeBannerList>>> getBannerImage(String? loginToken);
}
