import 'package:customersouqjumla/data/core/failure.dart';
import 'package:customersouqjumla/data/model/userdatamodel/userdatamodel.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepositories {
  Future<Either<Failure, UserData>> getUserProfile(String? loginToken);
}
