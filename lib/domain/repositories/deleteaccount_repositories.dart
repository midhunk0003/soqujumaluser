import 'package:customersouqjumla/data/core/failure.dart';
import 'package:customersouqjumla/data/core/success.dart';
import 'package:dartz/dartz.dart';

abstract class DeleteaccountRepositories {
  Future<Either<Failure, Success>> deleteAccount(
    String? loginToken,
    String? reason,
    String? description,
  );
}
