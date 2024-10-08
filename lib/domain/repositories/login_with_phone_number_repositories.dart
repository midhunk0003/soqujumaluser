import 'package:customersouqjumla/data/core/failure.dart';
import 'package:customersouqjumla/data/model/login_response_model/login_response_model.dart';
import 'package:dartz/dartz.dart';



abstract class LoginRepositories {
  Future<Either<Failure, LoginResponseModel>> loginWithMobileNumber(
      String? phonenumber, String? fcmToken);
      
}
