import 'dart:convert';
import 'dart:io';

import 'package:customersouqjumla/data/core/failure.dart';
import 'package:customersouqjumla/data/core/success.dart';
import 'package:customersouqjumla/domain/repositories/deleteaccount_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';


@LazySingleton(as: DeleteaccountRepositories)
class DeleteaccountImplimentation implements DeleteaccountRepositories {
  @override
  Future<Either<Failure, Success>> deleteAccount(
    String? loginToken,
    String? reason,
    String? description,
  ) async {
    final client = http.Client();
    try {
      final response = await client.post(
        Uri.parse(
          'https://souq-jumla.noviindusdemosites.in/users/deleteaccount',
        ),
        headers: {
          'Authorization': 'Bearer $loginToken',
        },
        body: {
          'reason': reason,
          'description': description,
        },
      );

      print(
        " delete account response in repo inmplimentation : ${response.body}",
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        if (responseData['status'] == true) {
          return Right(Success(message: "Delete Account Successfull"));
        } else {
          return Left(ServerFailure("Server Failure ${response.statusCode}"));
        }
      } else {
        return Left(ServerFailure("Server failure ${response.statusCode}"));
      }
    } on SocketException {
      return Left(
        NetworkFailure("no internet connection"),
      );
    } catch (e) {
      return Left(
        ServerFailure("Server Failure ${e.toString()}"),
      );
    } finally {
      client.close();
    }
  }
}
